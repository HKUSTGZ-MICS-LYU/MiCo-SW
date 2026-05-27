#ifdef RISCV_VEXII
#include "sim_stdlib.h"
#else
#include <stdio.h>
#endif

#include <math.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

#include "nn.h"
#include "profile.h"
#include "mico_nn.h"
#include "mico_quant.h"

#include "llama2_config.h"

#ifndef LLAMA2_BIN
#define LLAMA2_BIN "./llama2/llama_model.bin"
#endif

#ifndef PREFILL_LEN
#define PREFILL_LEN 128
#endif

#ifndef DECODE_STEPS
#define DECODE_STEPS 1
#endif

#ifndef DECODE_CONTEXT_LEN
#define DECODE_CONTEXT_LEN PREFILL_LEN
#endif

#ifndef PREFILL_LM_HEADS
#define PREFILL_LM_HEADS 1
#endif

#ifndef PROFILE_REPEATS
#define PROFILE_REPEATS 1
#endif

#ifndef USE_HOST
INCLUDE_FILE(".rodata", LLAMA2_BIN, llama_model);
extern uint8_t llama_model_data[];
extern size_t llama_model_start[];
extern size_t llama_model_end[];
#endif

typedef struct {
    int dim;
    int hidden_dim;
    int n_layers;
    int n_heads;
    int n_kv_heads;
    int vocab_size;
    int seq_len;
} Config;

enum {
    OP_WQ = 0,
    OP_WK,
    OP_WV,
    OP_WO,
    OP_W1,
    OP_W2,
    OP_W3,
    OP_COUNT
};

typedef struct {
    qtype *ops[OP_COUNT];
} QScheme;

typedef struct {
    unsigned long total;
    unsigned long qmatmul;
    unsigned long quant;
    unsigned long fmatmul;
    unsigned long attention;
    unsigned long softmax;
    unsigned long rmsnorm;
    unsigned long rope;
    unsigned long kv_quant;
    unsigned long swiglu;
    unsigned long residual;
    unsigned long lm_head;
} Profile;

typedef struct {
    int used;
    int n;
    int d;
    qtype wq;
    qtype aq;
    Profile profile;
} MatmulCacheEntry;

#define MAX_MATMUL_CACHE 64

static MatmulCacheEntry matmul_cache[MAX_MATMUL_CACHE];
static volatile float profile_sink = 0.0f;

static unsigned long profile_time(void) {
    return (unsigned long)MiCo_time();
}

static void die(const char *msg) {
    printf("%s\n", msg);
    exit(EXIT_FAILURE);
}

static int clamp_pos(int pos, int seq_len) {
    if (pos < 0) {
        return 0;
    }
    if (pos >= seq_len) {
        return seq_len - 1;
    }
    return pos;
}

static qtype sanitize_qtype(qtype q) {
    if (q == 1 || q == 2 || q == 4 || q == 8) {
        return q;
    }
    return 8;
}

static size_t packed_bytes(size_t elems, qtype bits) {
    return (elems * (size_t)sanitize_qtype(bits) + 7) / 8;
}

static void fill_float(float *x, size_t n) {
    for (size_t i = 0; i < n; i++) {
        x[i] = ((float)((i * 13) % 31) - 15.0f) / 16.0f;
    }
}

static void fill_qbytes(qbyte *x, size_t n) {
    for (size_t i = 0; i < n; i++) {
        x[i] = (qbyte)((int)((i * 17) % 127) - 63);
    }
}

static void profile_zero(Profile *p) {
    memset(p, 0, sizeof(*p));
}

static void profile_add_scaled(Profile *dst, const Profile *src, unsigned long scale) {
    dst->total += src->total * scale;
    dst->qmatmul += src->qmatmul * scale;
    dst->quant += src->quant * scale;
    dst->fmatmul += src->fmatmul * scale;
    dst->attention += src->attention * scale;
    dst->softmax += src->softmax * scale;
    dst->rmsnorm += src->rmsnorm * scale;
    dst->rope += src->rope * scale;
    dst->kv_quant += src->kv_quant * scale;
    dst->swiglu += src->swiglu * scale;
    dst->residual += src->residual * scale;
    dst->lm_head += src->lm_head * scale;
}

static Profile profile_div(const Profile *src, unsigned long divisor) {
    Profile out;
    profile_zero(&out);
    if (divisor == 0) {
        return out;
    }
    out.total = src->total / divisor;
    out.qmatmul = src->qmatmul / divisor;
    out.quant = src->quant / divisor;
    out.fmatmul = src->fmatmul / divisor;
    out.attention = src->attention / divisor;
    out.softmax = src->softmax / divisor;
    out.rmsnorm = src->rmsnorm / divisor;
    out.rope = src->rope / divisor;
    out.kv_quant = src->kv_quant / divisor;
    out.swiglu = src->swiglu / divisor;
    out.residual = src->residual / divisor;
    out.lm_head = src->lm_head / divisor;
    return out;
}

static void print_profile(const char *name, const Profile *p) {
    printf("%s total=%lu qmatmul=%lu quant=%lu fmatmul=%lu attention=%lu softmax=%lu rmsnorm=%lu rope=%lu kv_quant=%lu swiglu=%lu residual=%lu lm_head=%lu\n",
           name,
           p->total,
           p->qmatmul,
           p->quant,
           p->fmatmul,
           p->attention,
           p->softmax,
           p->rmsnorm,
           p->rope,
           p->kv_quant,
           p->swiglu,
           p->residual,
           p->lm_head);
}

static void qscheme_alloc(QScheme *q, int n_layers) {
    for (int i = 0; i < OP_COUNT; i++) {
        q->ops[i] = (qtype *)calloc((size_t)n_layers * 2, sizeof(qtype));
        if (!q->ops[i]) {
            die("qscheme allocation failed");
        }
    }
}

static void qscheme_free(QScheme *q) {
    for (int i = 0; i < OP_COUNT; i++) {
        free(q->ops[i]);
        q->ops[i] = NULL;
    }
}

static void read_qscheme_arrays(QScheme *q, const unsigned char *src, int n_layers) {
    for (int op = 0; op < OP_COUNT; op++) {
        memcpy(q->ops[op], src, (size_t)n_layers * 2 * sizeof(qtype));
        src += (size_t)n_layers * 2 * sizeof(qtype);
        for (int l = 0; l < n_layers; l++) {
            q->ops[op][2 * l] = sanitize_qtype(q->ops[op][2 * l]);
            q->ops[op][2 * l + 1] = sanitize_qtype(q->ops[op][2 * l + 1]);
        }
    }
}

static void load_model_meta(Config *cfg, QScheme *qscheme) {
#ifdef USE_HOST
    FILE *f = fopen(LLAMA2_BIN, "rb");
    if (!f) {
        die("failed to open LLAMA2_BIN");
    }
    uint32_t magic = 0;
    int version = 0;
    if (fread(&magic, sizeof(magic), 1, f) != 1 || magic != 0x616b3432) {
        die("bad model magic number");
    }
    if (fread(&version, sizeof(version), 1, f) != 1 || version != 1) {
        die("bad model version");
    }
    if (fread(cfg, sizeof(*cfg), 1, f) != 1) {
        die("failed to read model config");
    }
    cfg->vocab_size = abs(cfg->vocab_size);
    if (cfg->n_layers <= 0 || cfg->dim <= 0 || cfg->n_heads <= 0 || cfg->seq_len <= 0) {
        die("invalid model config");
    }
    qscheme_alloc(qscheme, cfg->n_layers);
#ifdef QUANTIZED
    const long float_params = ((long)cfg->n_layers * cfg->dim * 2 + cfg->dim) * (long)sizeof(float);
    if (fseek(f, 256 + float_params, SEEK_SET) != 0) {
        die("failed to seek qscheme");
    }
    for (int op = 0; op < OP_COUNT; op++) {
        if (fread(qscheme->ops[op], sizeof(qtype), (size_t)cfg->n_layers * 2, f) != (size_t)cfg->n_layers * 2) {
            die("failed to read qscheme");
        }
        for (int l = 0; l < cfg->n_layers; l++) {
            qscheme->ops[op][2 * l] = sanitize_qtype(qscheme->ops[op][2 * l]);
            qscheme->ops[op][2 * l + 1] = sanitize_qtype(qscheme->ops[op][2 * l + 1]);
        }
    }
#else
    for (int op = 0; op < OP_COUNT; op++) {
        for (int l = 0; l < cfg->n_layers; l++) {
            qscheme->ops[op][2 * l] = 8;
            qscheme->ops[op][2 * l + 1] = 8;
        }
    }
#endif
    fclose(f);
#else
    unsigned char *ptr = (unsigned char *)llama_model_start;
    uint32_t magic = *(uint32_t *)ptr;
    ptr += sizeof(uint32_t);
    int version = *(int *)ptr;
    ptr += sizeof(int);
    if (magic != 0x616b3432 || version != 1) {
        die("bad embedded model metadata");
    }
    memcpy(cfg, ptr, sizeof(*cfg));
    cfg->vocab_size = abs(cfg->vocab_size);
    qscheme_alloc(qscheme, cfg->n_layers);
#ifdef QUANTIZED
    ptr = (unsigned char *)llama_model_start + 256;
    ptr += ((size_t)cfg->n_layers * cfg->dim * 2 + cfg->dim) * sizeof(float);
    read_qscheme_arrays(qscheme, ptr, cfg->n_layers);
#else
    for (int op = 0; op < OP_COUNT; op++) {
        for (int l = 0; l < cfg->n_layers; l++) {
            qscheme->ops[op][2 * l] = 8;
            qscheme->ops[op][2 * l + 1] = 8;
        }
    }
#endif
#endif
}

static Profile profile_rmsnorm(int size) {
    Profile p;
    profile_zero(&p);
    float *x = (float *)malloc((size_t)size * sizeof(float));
    float *w = (float *)malloc((size_t)size * sizeof(float));
    float *o = (float *)malloc((size_t)size * sizeof(float));
    if (!x || !w || !o) {
        die("rmsnorm allocation failed");
    }
    fill_float(x, (size_t)size);
    fill_float(w, (size_t)size);
    unsigned long start = profile_time();
    for (int r = 0; r < PROFILE_REPEATS; r++) {
        float ss = 0.0f;
        for (int j = 0; j < size; j++) {
            ss += x[j] * x[j];
        }
        ss /= size;
        ss += 1e-5f;
        ss = 1.0f / sqrtf(ss);
        for (int j = 0; j < size; j++) {
            o[j] = w[j] * (ss * x[j]);
        }
    }
    p.total = (profile_time() - start) / PROFILE_REPEATS;
    p.rmsnorm = p.total;
    profile_sink += o[0];
    free(x);
    free(w);
    free(o);
    return p;
}

static Profile profile_rope(int dim, int kv_dim, int head_size) {
    Profile p;
    profile_zero(&p);
    int head_pairs = head_size / 2;
    float *q = (float *)malloc((size_t)dim * sizeof(float));
    float *k = (float *)malloc((size_t)kv_dim * sizeof(float));
    float *cos_tbl = (float *)malloc((size_t)head_pairs * sizeof(float));
    float *sin_tbl = (float *)malloc((size_t)head_pairs * sizeof(float));
    if (!q || !k || !cos_tbl || !sin_tbl) {
        die("rope allocation failed");
    }
    fill_float(q, (size_t)dim);
    fill_float(k, (size_t)kv_dim);
    for (int i = 0; i < head_pairs; i++) {
        cos_tbl[i] = cosf((float)i * 0.001f);
        sin_tbl[i] = sinf((float)i * 0.001f);
    }
    unsigned long start = profile_time();
    for (int r = 0; r < PROFILE_REPEATS; r++) {
        for (int i = 0; i < dim; i += 2) {
            int kpair = (i % head_size) >> 1;
            float fcr = cos_tbl[kpair];
            float fci = sin_tbl[kpair];
            int rotn = i < kv_dim ? 2 : 1;
            for (int v = 0; v < rotn; v++) {
                float *vec = v == 0 ? q : k;
                float v0 = vec[i];
                float v1 = vec[i + 1];
                vec[i] = v0 * fcr - v1 * fci;
                vec[i + 1] = v0 * fci + v1 * fcr;
            }
        }
    }
    p.total = (profile_time() - start) / PROFILE_REPEATS;
    p.rope = p.total;
    profile_sink += q[0] + k[0];
    free(q);
    free(k);
    free(cos_tbl);
    free(sin_tbl);
    return p;
}

static Profile profile_kv_quant(int kv_dim) {
    Profile p;
    profile_zero(&p);
#ifdef USE_INT8_KV
    float *k = (float *)malloc((size_t)kv_dim * sizeof(float));
    float *v = (float *)malloc((size_t)kv_dim * sizeof(float));
    qbyte *qk = (qbyte *)malloc((size_t)kv_dim * sizeof(qbyte));
    qbyte *qv = (qbyte *)malloc((size_t)kv_dim * sizeof(qbyte));
    if (!k || !v || !qk || !qv) {
        die("kv quant allocation failed");
    }
    fill_float(k, (size_t)kv_dim);
    fill_float(v, (size_t)kv_dim);
    unsigned long start = profile_time();
    for (int r = 0; r < PROFILE_REPEATS; r++) {
        float ks = __FP32toQ8(qk, k, (size_t)kv_dim);
        float vs = __FP32toQ8(qv, v, (size_t)kv_dim);
        profile_sink += ks + vs;
    }
    p.total = (profile_time() - start) / PROFILE_REPEATS;
    p.kv_quant = p.total;
    p.quant = p.total;
    profile_sink += (float)qk[0] + (float)qv[0];
    free(k);
    free(v);
    free(qk);
    free(qv);
#endif
    return p;
}

static Profile profile_swiglu(int hidden_dim) {
    Profile p;
    profile_zero(&p);
    float *hb = (float *)malloc((size_t)hidden_dim * sizeof(float));
    float *hb2 = (float *)malloc((size_t)hidden_dim * sizeof(float));
    if (!hb || !hb2) {
        die("swiglu allocation failed");
    }
    fill_float(hb, (size_t)hidden_dim);
    fill_float(hb2, (size_t)hidden_dim);
    unsigned long start = profile_time();
    for (int r = 0; r < PROFILE_REPEATS; r++) {
        for (int i = 0; i < hidden_dim; i++) {
            float val = hb[i];
            val *= (1.0f / (1.0f + expf(-val)));
            val *= hb2[i];
            hb[i] = val;
        }
    }
    p.total = (profile_time() - start) / PROFILE_REPEATS;
    p.swiglu = p.total;
    profile_sink += hb[0];
    free(hb);
    free(hb2);
    return p;
}

static Profile profile_residual(int dim) {
    Profile p;
    profile_zero(&p);
    float *x = (float *)malloc((size_t)dim * sizeof(float));
    float *y = (float *)malloc((size_t)dim * sizeof(float));
    if (!x || !y) {
        die("residual allocation failed");
    }
    fill_float(x, (size_t)dim);
    fill_float(y, (size_t)dim);
    unsigned long start = profile_time();
    for (int r = 0; r < PROFILE_REPEATS; r++) {
        for (int i = 0; i < dim; i++) {
            x[i] += y[i];
        }
    }
    p.total = (profile_time() - start) / PROFILE_REPEATS;
    p.residual = p.total;
    profile_sink += x[0];
    free(x);
    free(y);
    return p;
}

static Profile profile_attention(const Config *cfg, int pos) {
    Profile p;
    profile_zero(&p);
    int dim = cfg->dim;
    int head_size = dim / cfg->n_heads;
    int kv_dim = (cfg->dim * cfg->n_kv_heads) / cfg->n_heads;
    int kv_mul = cfg->n_heads / cfg->n_kv_heads;
    int profile_seq_len = pos + 1;
    float *out = (float *)calloc((size_t)dim, sizeof(float));
    float *query = (float *)malloc((size_t)dim * sizeof(float));
    float *att = (float *)calloc((size_t)cfg->n_heads * profile_seq_len, sizeof(float));
    if (!out || !query || !att) {
        die("attention allocation failed");
    }
    fill_float(query, (size_t)dim);
    MiCo_MHA_Config mha_cfg = {
        .n_heads = cfg->n_heads,
        .head_size = head_size,
        .kv_dim = kv_dim,
        .kv_mul = kv_mul,
        .seq_len = profile_seq_len
    };
    Tensor2D_F32 output = { .shape = {(size_t)cfg->n_heads, (size_t)head_size}, .data = out };
    Tensor2D_F32 q = { .shape = {(size_t)cfg->n_heads, (size_t)head_size}, .data = query };
#ifdef USE_INT8_KV
    int8_t *key_cache = (int8_t *)malloc((size_t)profile_seq_len * kv_dim * sizeof(int8_t));
    int8_t *value_cache = (int8_t *)malloc((size_t)profile_seq_len * kv_dim * sizeof(int8_t));
    float *key_scales = (float *)malloc((size_t)profile_seq_len * sizeof(float));
    float *value_scales = (float *)malloc((size_t)profile_seq_len * sizeof(float));
    if (!key_cache || !value_cache || !key_scales || !value_scales) {
        die("int8 attention allocation failed");
    }
    for (int i = 0; i < profile_seq_len * kv_dim; i++) {
        key_cache[i] = (int8_t)((i * 7) % 63);
        value_cache[i] = (int8_t)((i * 11) % 63);
    }
    for (int i = 0; i < profile_seq_len; i++) {
        key_scales[i] = 0.01f;
        value_scales[i] = 0.01f;
    }
#else
    float *key_cache = (float *)malloc((size_t)profile_seq_len * kv_dim * sizeof(float));
    float *value_cache = (float *)malloc((size_t)profile_seq_len * kv_dim * sizeof(float));
    if (!key_cache || !value_cache) {
        die("attention cache allocation failed");
    }
    fill_float(key_cache, (size_t)profile_seq_len * kv_dim);
    fill_float(value_cache, (size_t)profile_seq_len * kv_dim);
#endif
    MiCo_reset_profilers();
    unsigned long start = profile_time();
    for (int r = 0; r < PROFILE_REPEATS; r++) {
#ifdef USE_INT8_KV
        MiCo_multihead_attention_f32_kv8(
            &output, &q, key_cache, value_cache, key_scales, value_scales, att, pos, &mha_cfg);
#else
        MiCo_multihead_attention_f32(&output, &q, key_cache, value_cache, att, pos, &mha_cfg);
#endif
    }
    p.total = (profile_time() - start) / PROFILE_REPEATS;
    p.attention = (unsigned long)ATTN_TIMER / PROFILE_REPEATS;
    p.softmax = (unsigned long)SOFTMAX_TIMER / PROFILE_REPEATS;
    profile_sink += out[0];
#ifdef USE_INT8_KV
    free(key_cache);
    free(value_cache);
    free(key_scales);
    free(value_scales);
#else
    free(key_cache);
    free(value_cache);
#endif
    free(out);
    free(query);
    free(att);
    return p;
}

static Profile profile_matmul_uncached(int n, int d, qtype wq, qtype aq) {
    Profile p;
    profile_zero(&p);
    float *x_data = (float *)malloc((size_t)n * sizeof(float));
    float *y_data = (float *)malloc((size_t)d * sizeof(float));
    if (!x_data || !y_data) {
        die("matmul activation allocation failed");
    }
    fill_float(x_data, (size_t)n);
    Tensor2D_F32 x = { .shape = {1, (size_t)n}, .data = x_data };
    Tensor2D_F32 y = { .shape = {1, (size_t)d}, .data = y_data };
    Tensor1D_F32 bias = { .shape = {0}, .data = NULL };

#ifdef QUANTIZED
    qtype safe_wq = sanitize_qtype(wq);
    qtype safe_aq = sanitize_qtype(aq);
    size_t weight_size = packed_bytes((size_t)n * d, safe_wq);
    qbyte *w_data = (qbyte *)malloc(weight_size);
    if (!w_data) {
        die("quantized weight allocation failed");
    }
    fill_qbytes(w_data, weight_size);
    Tensor2D_Q8 weight = {
        .shape = {(size_t)d, (size_t)n},
        .data = w_data,
        .scale = 0.02f,
        .wq = safe_wq
    };
    MiCo_reset_profilers();
    unsigned long start = profile_time();
    for (int r = 0; r < PROFILE_REPEATS; r++) {
        MiCo_bitlinear_f32(&y, &x, &weight, &bias, safe_wq, safe_aq, 1);
    }
    p.qmatmul = (unsigned long)QMATMUL_TIMER / PROFILE_REPEATS;
    p.quant = (unsigned long)QUANT_TIMER / PROFILE_REPEATS;
    free(w_data);
#else
    float *w_data = (float *)malloc((size_t)n * d * sizeof(float));
    if (!w_data) {
        die("float weight allocation failed");
    }
    fill_float(w_data, (size_t)n * d);
    Tensor2D_F32 weight = { .shape = {(size_t)d, (size_t)n}, .data = w_data };
    MiCo_reset_profilers();
    unsigned long start = profile_time();
    for (int r = 0; r < PROFILE_REPEATS; r++) {
        MiCo_linear_f32(&y, &x, &weight, &bias);
    }
    free(w_data);
#endif
    p.total = (profile_time() - start) / PROFILE_REPEATS;
#ifndef QUANTIZED
    p.fmatmul = p.total;
#endif
    profile_sink += y_data[0];
    free(x_data);
    free(y_data);
    return p;
}

static const Profile *profile_matmul(int n, int d, qtype wq, qtype aq) {
    qtype safe_wq = sanitize_qtype(wq);
    qtype safe_aq = sanitize_qtype(aq);
    for (int i = 0; i < MAX_MATMUL_CACHE; i++) {
        if (matmul_cache[i].used &&
            matmul_cache[i].n == n &&
            matmul_cache[i].d == d &&
            matmul_cache[i].wq == safe_wq &&
            matmul_cache[i].aq == safe_aq) {
            return &matmul_cache[i].profile;
        }
    }
    for (int i = 0; i < MAX_MATMUL_CACHE; i++) {
        if (!matmul_cache[i].used) {
            matmul_cache[i].used = 1;
            matmul_cache[i].n = n;
            matmul_cache[i].d = d;
            matmul_cache[i].wq = safe_wq;
            matmul_cache[i].aq = safe_aq;
            matmul_cache[i].profile = profile_matmul_uncached(n, d, safe_wq, safe_aq);
            printf("MATMUL_SAMPLE n=%d d=%d wq=%u aq=%u total=%lu qmatmul=%lu quant=%lu fmatmul=%lu\n",
                   n,
                   d,
                   (unsigned)safe_wq,
                   (unsigned)safe_aq,
                   matmul_cache[i].profile.total,
                   matmul_cache[i].profile.qmatmul,
                   matmul_cache[i].profile.quant,
                   matmul_cache[i].profile.fmatmul);
            return &matmul_cache[i].profile;
        }
    }
    die("matmul profile cache overflow");
    return NULL;
}

static void add_layer_matmuls(Profile *phase, const Config *cfg, const QScheme *qscheme, unsigned long token_scale) {
    int dim = cfg->dim;
    int hidden_dim = cfg->hidden_dim;
    int head_size = dim / cfg->n_heads;
    int kv_dim = (cfg->dim * cfg->n_kv_heads) / cfg->n_heads;

    for (int l = 0; l < cfg->n_layers; l++) {
        const Profile *wq = profile_matmul(dim, dim, qscheme->ops[OP_WQ][2 * l], qscheme->ops[OP_WQ][2 * l + 1]);
        const Profile *wk = profile_matmul(dim, kv_dim, qscheme->ops[OP_WK][2 * l], qscheme->ops[OP_WK][2 * l + 1]);
        const Profile *wv = profile_matmul(dim, kv_dim, qscheme->ops[OP_WV][2 * l], qscheme->ops[OP_WV][2 * l + 1]);
        const Profile *wo = profile_matmul(dim, cfg->n_heads * head_size, qscheme->ops[OP_WO][2 * l], qscheme->ops[OP_WO][2 * l + 1]);
        const Profile *w1 = profile_matmul(dim, hidden_dim, qscheme->ops[OP_W1][2 * l], qscheme->ops[OP_W1][2 * l + 1]);
        const Profile *w3 = profile_matmul(dim, hidden_dim, qscheme->ops[OP_W3][2 * l], qscheme->ops[OP_W3][2 * l + 1]);
        const Profile *w2 = profile_matmul(hidden_dim, dim, qscheme->ops[OP_W2][2 * l], qscheme->ops[OP_W2][2 * l + 1]);

        profile_add_scaled(phase, wq, token_scale);
        profile_add_scaled(phase, wk, token_scale);
        profile_add_scaled(phase, wv, token_scale);
        profile_add_scaled(phase, wo, token_scale);
        profile_add_scaled(phase, w1, token_scale);
        profile_add_scaled(phase, w3, token_scale);
        profile_add_scaled(phase, w2, token_scale);
    }
}

static Profile estimate_phase(const char *name, const Config *cfg, const QScheme *qscheme, int tokens, int attention_pos, int lm_heads) {
    Profile phase;
    profile_zero(&phase);

    int dim = cfg->dim;
    int hidden_dim = cfg->hidden_dim;
    int head_size = dim / cfg->n_heads;
    int kv_dim = (cfg->dim * cfg->n_kv_heads) / cfg->n_heads;
    int pos = clamp_pos(attention_pos, cfg->seq_len);
    unsigned long layer_token_scale = (unsigned long)tokens;
    unsigned long layer_total_scale = (unsigned long)tokens * (unsigned long)cfg->n_layers;

    Profile rms = profile_rmsnorm(dim);
    Profile rope = profile_rope(dim, kv_dim, head_size);
    Profile kvq = profile_kv_quant(kv_dim);
    Profile swiglu = profile_swiglu(hidden_dim);
    Profile residual = profile_residual(dim);
    Profile attention = profile_attention(cfg, pos);

    add_layer_matmuls(&phase, cfg, qscheme, layer_token_scale);
    profile_add_scaled(&phase, &rms, 2 * layer_total_scale);
    profile_add_scaled(&phase, &rope, layer_total_scale);
    profile_add_scaled(&phase, &kvq, layer_total_scale);
    profile_add_scaled(&phase, &attention, layer_total_scale);
    profile_add_scaled(&phase, &swiglu, layer_total_scale);
    profile_add_scaled(&phase, &residual, 2 * layer_total_scale);
    profile_add_scaled(&phase, &rms, (unsigned long)lm_heads);

    const Profile *lm_head = profile_matmul(dim, cfg->vocab_size, 8, 8);
    Profile lm_head_only = *lm_head;
    lm_head_only.lm_head = lm_head_only.total;
    profile_add_scaled(&phase, &lm_head_only, (unsigned long)lm_heads);

    printf("%s_RAW tokens=%d attention_pos=%d lm_heads=%d layer_count=%d\n",
           name, tokens, pos, lm_heads, cfg->n_layers);
    return phase;
}

int main(void) {
    printf("MiCo LLaMa Performance Estimate\n");
    printf("LLAMA2_BIN=%s\n", LLAMA2_BIN);
    printf("PREFILL_LEN=%d DECODE_STEPS=%d DECODE_CONTEXT_LEN=%d PREFILL_LM_HEADS=%d PROFILE_REPEATS=%d\n",
           PREFILL_LEN, DECODE_STEPS, DECODE_CONTEXT_LEN, PREFILL_LM_HEADS, PROFILE_REPEATS);

    Config cfg;
    QScheme qscheme;
    memset(&cfg, 0, sizeof(cfg));
    memset(&qscheme, 0, sizeof(qscheme));
    load_model_meta(&cfg, &qscheme);
    printf("MODEL_CONFIG dim=%d hidden_dim=%d n_layers=%d n_heads=%d n_kv_heads=%d vocab_size=%d seq_len=%d\n",
           cfg.dim, cfg.hidden_dim, cfg.n_layers, cfg.n_heads, cfg.n_kv_heads, cfg.vocab_size, cfg.seq_len);

    int prefill_tokens = PREFILL_LEN;
    if (prefill_tokens > cfg.seq_len) {
        prefill_tokens = cfg.seq_len;
    }
    if (prefill_tokens < 1) {
        prefill_tokens = 1;
    }
    int prefill_pos = prefill_tokens / 2;
    if (prefill_pos > 0) {
        prefill_pos -= 1;
    }

    int decode_context = DECODE_CONTEXT_LEN;
    if (decode_context < 1) {
        decode_context = prefill_tokens;
    }
    int decode_pos = clamp_pos(decode_context - 1, cfg.seq_len);

    int decode_steps = DECODE_STEPS;
    if (decode_steps < 1) {
        decode_steps = 1;
    }
    int prefill_lm_heads = PREFILL_LM_HEADS;
    if (prefill_lm_heads < 0) {
        prefill_lm_heads = 0;
    }

    Profile prefill = estimate_phase("PREFILL", &cfg, &qscheme, prefill_tokens, prefill_pos, prefill_lm_heads);
    Profile decode = estimate_phase("DECODE", &cfg, &qscheme, decode_steps, decode_pos, decode_steps);
    Profile prefill_per_token = profile_div(&prefill, (unsigned long)prefill_tokens);
    Profile decode_per_token = profile_div(&decode, (unsigned long)decode_steps);
    Profile total;
    profile_zero(&total);
    profile_add_scaled(&total, &prefill, 1);
    profile_add_scaled(&total, &decode, 1);

    print_profile("PREFILL_PROFILE", &prefill);
    print_profile("PREFILL_PER_TOKEN_PROFILE", &prefill_per_token);
    print_profile("DECODE_PROFILE", &decode);
    print_profile("DECODE_PER_TOKEN_PROFILE", &decode_per_token);
    print_profile("TOTAL_ESTIMATE", &total);
    printf("PROFILE_SINK=%f\n", profile_sink);

    qscheme_free(&qscheme);
    return 0;
}
