#ifdef RISCV_VEXII
#include "sim_stdlib.h"
#else
#include <stdio.h>
#include <stdlib.h>
#endif

#include <math.h>
#include <stdint.h>
#include <string.h>

#include "nn.h"
#include "profile.h"
#include "mico_quant.h"

#ifndef LLAMA_ATT_SEQ
#define LLAMA_ATT_SEQ 64
#endif
#ifndef LLAMA_ATT_HEADS
#define LLAMA_ATT_HEADS 8
#endif
#ifndef LLAMA_ATT_KV_HEADS
#define LLAMA_ATT_KV_HEADS 4
#endif
#ifndef LLAMA_ATT_HEAD_SIZE
#define LLAMA_ATT_HEAD_SIZE 64
#endif

#define SEQ_LEN LLAMA_ATT_SEQ
#define N_HEADS LLAMA_ATT_HEADS
#define N_KV_HEADS LLAMA_ATT_KV_HEADS
#define HEAD_SIZE LLAMA_ATT_HEAD_SIZE
#define KV_MUL (N_HEADS / N_KV_HEADS)
#define DIM (N_HEADS * HEAD_SIZE)
#define KV_DIM (N_KV_HEADS * HEAD_SIZE)

static float compute_max_abs_error(const float *a, const float *b, size_t n) {
    float max_err = 0.0f;
    for (size_t i = 0; i < n; i++) {
        float err = fabsf(a[i] - b[i]);
        if (err > max_err) max_err = err;
    }
    return max_err;
}

static float compute_mse(const float *a, const float *b, size_t n) {
    double sum_sq = 0.0;
    for (size_t i = 0; i < n; i++) {
        float diff = a[i] - b[i];
        sum_sq += (double)diff * (double)diff;
    }
    return (float)(sum_sq / (double)n);
}

static float compute_cosine_similarity(const float *a, const float *b, size_t n) {
    double dot = 0.0;
    double norm_a = 0.0;
    double norm_b = 0.0;
    for (size_t i = 0; i < n; i++) {
        dot += (double)a[i] * (double)b[i];
        norm_a += (double)a[i] * (double)a[i];
        norm_b += (double)b[i] * (double)b[i];
    }
    return (float)(dot / (sqrt(norm_a) * sqrt(norm_b) + 1e-8));
}

static void print_tensor_range(const char *name, const float *data, size_t n) {
    float vmin = data[0];
    float vmax = data[0];
    for (size_t i = 1; i < n; i++) {
        if (data[i] < vmin) vmin = data[i];
        if (data[i] > vmax) vmax = data[i];
    }
    printf("  %s: [%+.6f, %+.6f] (first=%f, last=%f)\n",
           name, vmin, vmax, data[0], data[n - 1]);
}

static void fill_data(float *data, size_t n, int mul, int add) {
    for (size_t i = 0; i < n; i++) {
        data[i] = (float)((int)((i * (size_t)mul + (size_t)add) % 2048) - 1024) / 2048.0f;
    }
}

int main(void) {
    printf("=== LLaMa Group-wise KIVI Attention Comparison ===\n");
    printf("Shape: seq=%d n_heads=%d n_kv_heads=%d head_size=%d kv_mul=%d group_size=%d\n",
           SEQ_LEN, N_HEADS, N_KV_HEADS, HEAD_SIZE, KV_MUL, MICO_LLAMA_KV_GROUP_SIZE);

    if (N_HEADS % N_KV_HEADS != 0) {
        printf("ERROR: LLAMA_ATT_HEADS must be divisible by LLAMA_ATT_KV_HEADS\n");
        return 1;
    }

    const size_t q_size = (size_t)SEQ_LEN * DIM;
    const size_t kv_size = (size_t)SEQ_LEN * KV_DIM;
    const size_t y_size = (size_t)SEQ_LEN * DIM;
    const size_t att_size = (size_t)N_HEADS * SEQ_LEN;
    const int n_groups = (SEQ_LEN + MICO_LLAMA_KV_GROUP_SIZE - 1) / MICO_LLAMA_KV_GROUP_SIZE;
    const size_t packed_group_bytes = MICO_LLAMA_KV_PACKED_GROUP_BYTES(HEAD_SIZE);
    const size_t packed_cache_bytes = (size_t)n_groups * N_KV_HEADS * packed_group_bytes;
    const size_t k_scale_count = (size_t)n_groups * N_KV_HEADS * HEAD_SIZE;
    const size_t v_scale_count = (size_t)n_groups * N_KV_HEADS * MICO_LLAMA_KV_GROUP_SIZE;

    float *query_cache = (float *)malloc(q_size * sizeof(float));
    float *key_cache = (float *)malloc(kv_size * sizeof(float));
    float *value_cache = (float *)malloc(kv_size * sizeof(float));
    float *y_ref = (float *)malloc(y_size * sizeof(float));
    float *y_kivi = (float *)malloc(y_size * sizeof(float));
    float *key_group_cache = (float *)malloc((size_t)MICO_LLAMA_KV_GROUP_SIZE * KV_DIM * sizeof(float));
    float *value_group_cache = (float *)malloc((size_t)MICO_LLAMA_KV_GROUP_SIZE * KV_DIM * sizeof(float));
    float *att_ref = (float *)malloc(att_size * sizeof(float));
    float *att_kivi = (float *)malloc(att_size * sizeof(float));
    int8_t *key_q2t = (int8_t *)malloc(packed_cache_bytes);
    int8_t *value_q2t = (int8_t *)malloc(packed_cache_bytes);
    float *key_scales = (float *)malloc(k_scale_count * sizeof(float));
    float *value_scales = (float *)malloc(v_scale_count * sizeof(float));

    if (!query_cache || !key_cache || !value_cache || !y_ref || !y_kivi ||
        !key_group_cache || !value_group_cache ||
        !att_ref || !att_kivi || !key_q2t || !value_q2t || !key_scales || !value_scales) {
        printf("ERROR: malloc failed\n");
        return 1;
    }

    fill_data(query_cache, q_size, 131, 17);
    fill_data(key_cache, kv_size, 257, 31);
    fill_data(value_cache, kv_size, 59, 73);
    memset(y_ref, 0, y_size * sizeof(float));
    memset(y_kivi, 0, y_size * sizeof(float));
    memset(key_q2t, 0, packed_cache_bytes);
    memset(value_q2t, 0, packed_cache_bytes);
    memset(key_scales, 0, k_scale_count * sizeof(float));
    memset(value_scales, 0, v_scale_count * sizeof(float));

    MiCo_MHA_Config cfg = {
        .n_heads = N_HEADS,
        .head_size = HEAD_SIZE,
        .kv_dim = KV_DIM,
        .kv_mul = KV_MUL,
        .seq_len = SEQ_LEN
    };

    printf("Input statistics:\n");
    print_tensor_range("Q", query_cache, q_size);
    print_tensor_range("K", key_cache, kv_size);
    print_tensor_range("V", value_cache, kv_size);
    printf("Packed cache bytes per K/V: %zu\n\n", packed_cache_bytes);

    for (int group = 0; group < n_groups; group++) {
        memset(key_group_cache, 0, (size_t)MICO_LLAMA_KV_GROUP_SIZE * KV_DIM * sizeof(float));
        memset(value_group_cache, 0, (size_t)MICO_LLAMA_KV_GROUP_SIZE * KV_DIM * sizeof(float));
        for (int local_t = 0; local_t < MICO_LLAMA_KV_GROUP_SIZE; local_t++) {
            int token = group * MICO_LLAMA_KV_GROUP_SIZE + local_t;
            if (token < SEQ_LEN) {
                memcpy(key_group_cache + (size_t)local_t * KV_DIM,
                       key_cache + (size_t)token * KV_DIM,
                       KV_DIM * sizeof(float));
                memcpy(value_group_cache + (size_t)local_t * KV_DIM,
                       value_cache + (size_t)token * KV_DIM,
                       KV_DIM * sizeof(float));
            }
        }
        MiCo_llama_pack_kv_group_q2t(
            key_group_cache,
            value_group_cache,
            key_q2t,
            value_q2t,
            key_scales,
            value_scales,
            group,
            &cfg
        );
    }

    Tensor2D_F32 output = { .shape = {N_HEADS, HEAD_SIZE}, .data = NULL };
    Tensor2D_F32 query = { .shape = {N_HEADS, HEAD_SIZE}, .data = NULL };

    MiCo_reset_profilers();
    long start = MiCo_time();
    for (int pos = 0; pos < SEQ_LEN; pos++) {
        output.data = y_ref + (size_t)pos * DIM;
        query.data = query_cache + (size_t)pos * DIM;
        MiCo_multihead_attention_f32(
            &output,
            &query,
            key_cache,
            value_cache,
            att_ref,
            pos,
            &cfg
        );
    }
    long ref_time = MiCo_time() - start;
    long ref_attn_time = ATTN_TIMER;

    printf("Reference FP32 LLaMa MHA:\n");
    printf("  Time: %ld cycles\n", ref_time);
    printf("  ATTN_TIMER: %ld cycles\n", ref_attn_time);
    print_tensor_range("Y_ref", y_ref, y_size);
    MiCo_print_profilers();
    printf("\n");

    MiCo_reset_profilers();
    start = MiCo_time();
    for (int pos = 0; pos < SEQ_LEN; pos++) {
        int group = pos / MICO_LLAMA_KV_GROUP_SIZE;
        memset(key_group_cache, 0, (size_t)MICO_LLAMA_KV_GROUP_SIZE * KV_DIM * sizeof(float));
        memset(value_group_cache, 0, (size_t)MICO_LLAMA_KV_GROUP_SIZE * KV_DIM * sizeof(float));
        for (int local_t = 0; local_t < MICO_LLAMA_KV_GROUP_SIZE; local_t++) {
            int token = group * MICO_LLAMA_KV_GROUP_SIZE + local_t;
            if (token <= pos && token < SEQ_LEN) {
                memcpy(key_group_cache + (size_t)local_t * KV_DIM,
                       key_cache + (size_t)token * KV_DIM,
                       KV_DIM * sizeof(float));
                memcpy(value_group_cache + (size_t)local_t * KV_DIM,
                       value_cache + (size_t)token * KV_DIM,
                       KV_DIM * sizeof(float));
            }
        }
        output.data = y_kivi + (size_t)pos * DIM;
        query.data = query_cache + (size_t)pos * DIM;
        MiCo_llama_kivi_attention_f32(
            &output,
            &query,
            key_group_cache,
            value_group_cache,
            key_q2t,
            value_q2t,
            key_scales,
            value_scales,
            att_kivi,
            pos,
            &cfg
        );
    }
    long kivi_time = MiCo_time() - start;
    long kivi_attn_time = ATTN_TIMER;

    printf("Group-wise KIVI LLaMa MHA:\n");
    printf("  Time: %ld cycles\n", kivi_time);
    printf("  ATTN_TIMER: %ld cycles\n", kivi_attn_time);
    print_tensor_range("Y_kivi", y_kivi, y_size);
    MiCo_print_profilers();
    printf("\n");

    printf("=== First 8 output elements ===\n");
    printf("  %-12s %-12s %-12s\n", "Ref", "KIVI", "Diff");
    for (size_t i = 0; i < 8 && i < y_size; i++) {
        printf("  %+12.6f %+12.6f %+12.6f\n", y_ref[i], y_kivi[i], y_ref[i] - y_kivi[i]);
    }
    printf("\n");

    float max_err = compute_max_abs_error(y_ref, y_kivi, y_size);
    float mse = compute_mse(y_ref, y_kivi, y_size);
    float rmse = sqrtf(mse);
    float cos_sim = compute_cosine_similarity(y_ref, y_kivi, y_size);
    long speedup_milli = 0;
    if (kivi_attn_time > 0) {
        speedup_milli = (long)(((long long)ref_attn_time * 1000LL) / (long long)kivi_attn_time);
    }

    printf("=== Numeric Analysis ===\n");
    printf("LLAMA_KIVI_NUMERIC max_abs_error=%f mse=%f rmse=%f cosine=%f\n",
           max_err, mse, rmse, cos_sim);
    printf("\n");

    printf("=== Speed Analysis ===\n");
    printf("LLAMA_KIVI_SPEED ref_total=%ld kivi_total=%ld ref_attn=%ld kivi_attn=%ld speedup=%f speedup_milli=%ld faster=%d\n",
           ref_time,
           kivi_time,
           ref_attn_time,
           kivi_attn_time,
           kivi_attn_time > 0 ? (float)ref_attn_time / (float)kivi_attn_time : 0.0f,
           speedup_milli,
           kivi_attn_time > 0 && kivi_attn_time < ref_attn_time);
    printf("\n");

    size_t fp32_kv_bytes = 2 * kv_size * sizeof(float);
    size_t kivi_kv_bytes = 2 * packed_cache_bytes +
        k_scale_count * sizeof(float) +
        v_scale_count * sizeof(float);
    printf("=== Memory Analysis ===\n");
    printf("LLAMA_KIVI_MEMORY fp32_kv_bytes=%zu kivi_kv_bytes=%zu compression=%f\n",
           fp32_kv_bytes,
           kivi_kv_bytes,
           (float)fp32_kv_bytes / (float)kivi_kv_bytes);

    free(query_cache);
    free(key_cache);
    free(value_cache);
    free(y_ref);
    free(y_kivi);
    free(key_group_cache);
    free(value_group_cache);
    free(att_ref);
    free(att_kivi);
    free(key_q2t);
    free(value_q2t);
    free(key_scales);
    free(value_scales);

    return 0;
}
