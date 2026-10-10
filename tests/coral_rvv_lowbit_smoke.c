/* Functional smoke for production OPT=rvv kernels, NOT a benchmark.
 * Default layout X[B,K], W[M,K]: low bits first, padding per packed row.
 * The int64 oracle uses neither MiCo reference kernels nor decode macros.
 * Compile with -fno-tree-vectorize/-fno-tree-slp-vectorize for a scalar oracle.
 * On-chip buffers avoid sparse-memory data access; CRT and stack stay Vexii.
 */
#include "mico_qnn.h"
#include <limits.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include "coral_rvv_bench_trap.h"

#ifdef USE_ALT_LAYOUT
#error "This smoke validates the model's default W[M,K] layout"
#endif
#if !defined(MICO_RVV) || !defined(MICO_RVV_HAS_REDUCTION) || !MICO_RVV_HAS_REDUCTION
#error "Build with TARGET=vexii_soc OPT=rvv and hardware reductions"
#endif
#ifndef __riscv_zve32x
#error "Keep the real Zve32x compiler ISA feature macro enabled"
#endif

enum { MAX_K = 257, MAX_M = 256, MAX_B = 3, WEIGHT_BYTES = MAX_K * MAX_M };
#define ONCHIP __attribute__((section(".onchip"), aligned(64)))
static uint8_t x_storage[MAX_B * MAX_K] ONCHIP;
static uint8_t w_storage[WEIGHT_BYTES] ONCHIP;
static int32_t output[MAX_B * MAX_M + 2] ONCHIP;
static unsigned kernel_calls, checks, failures;
#ifdef MICO_RVV_PROFILE
extern uint32_t mico_rvv_q8_calls, mico_rvv_q8x2_calls;
static uint32_t expected_q8_calls, expected_q8x2_calls;
#endif

typedef void (*Kernel)(int32_t *, const Tensor2D_Q8 *, const Tensor2D_Q8 *);

static size_t row_bytes(size_t k, unsigned bits) {
    return (k * bits + 7u) / 8u;
}

/* Mixed full range, negative extremes, positive extremes, or raw zero.
 * true2={-2,-1,0,1}; ternary={0,1,-1}, never live code2. */
static int sample(size_t r, size_t k, unsigned bits, int ternary, unsigned pattern) {
    static const int raw[] = {-128, 127, -127, 126, 0, 1, -1, 64, -64};
    static const int true2[] = {-2, -1, 0, 1};
    static const int tern[] = {0, 1, -1};
    const size_t i = k * 5u + r * 7u + k / 3u;
    if (pattern == 1) return bits == 8 ? -128 : bits == 4 ? -8 :
                             bits == 2 ? (ternary ? -1 : -2) : -1;
    if (pattern == 2) return bits == 8 ? 127 : bits == 4 ? 7 : 1;
    if (pattern == 3) return bits == 1 ? ((i & 1u) ? -1 : 1) : 0;
    if (bits == 8) return raw[i % (sizeof(raw) / sizeof(raw[0]))];
    if (bits == 4) return (int)(i % 16u) - 8;
    if (bits == 2) return ternary ? tern[i % 3u] : true2[i % 4u];
    return (i & 1u) ? -1 : 1;
}

static void pack(uint8_t *dst, size_t rows, size_t k, unsigned bits,
                 int ternary, unsigned pattern) {
    const size_t bytes = row_bytes(k, bits);
    /* Nonzero unused slots expose bad tails. 0xff has no code2, including
     * ternary padding; unused Q1 slots encode -1 rather than zero. */
    memset(dst, 0xff, rows * bytes);
    for (size_t r = 0; r < rows; ++r) {
        for (size_t c = 0; c < k; ++c) {
            const int value = sample(r, c, bits, ternary, pattern);
            if (bits == 8) {
                dst[r * bytes + c] = (uint8_t)value;
            } else {
                const size_t bit_index = c * bits;
                const unsigned shift = (unsigned)bit_index & 7u;
                const unsigned mask = (1u << bits) - 1u;
                const unsigned code = bits == 1 ? (value < 0) : ((unsigned)value & mask);
                uint8_t *p = dst + r * bytes + bit_index / 8u;
                *p = (uint8_t)((*p & ~(mask << shift)) | (code << shift));
            }
        }
    }
}

/* Independent signed decode: true2 code2=-2; Q1 zero-bit=+1. */
static int scalar_value(const uint8_t *row, size_t k, unsigned bits) {
    if (bits == 8) return row[k] < 128u ? row[k] : (int)row[k] - 256;
    const unsigned bit_index = (unsigned)(k * bits);
    const unsigned code = (row[bit_index / 8u] >> (bit_index % 8u)) & ((1u << bits) - 1u);
    if (bits == 1) return code ? -1 : 1;
    return code < (1u << (bits - 1u)) ? (int)code : (int)code - (1 << bits);
}

static void run_case(const char *name, Kernel fn, size_t b, size_t k, size_t m,
                     unsigned abits, unsigned wbits, int ternary, unsigned pattern) {
    const size_t xb = row_bytes(k, abits), wb = row_bytes(k, wbits);
    if (b > MAX_B || k > MAX_K || m > MAX_M || m * wb > WEIGHT_BYTES) {
        printf("FAIL capacity %s B=%u K=%u M=%u\n", name, (unsigned)b, (unsigned)k, (unsigned)m);
        ++failures;
        return;
    }
    pack(x_storage, b, k, abits, ternary, pattern);
    pack(w_storage, m, k, wbits, ternary, pattern);
    Tensor2D_Q8 x = {.shape = {b, k}, .data = (qbyte *)x_storage, .scale = 1.0f, .wq = abits};
    Tensor2D_Q8 w = {.shape = {m, k}, .data = (qbyte *)w_storage, .scale = 1.0f, .wq = wbits};
    const int32_t guard = 0x5a3cc3a5;
    const size_t output_words = sizeof(output) / sizeof(output[0]);
    for (size_t i = 0; i < output_words; ++i) output[i] = guard;
#ifdef CORAL_RVV_TRACE_CASES
    printf("CORAL_RVV_CASE BEGIN name=%s B=%u K=%u M=%u\n",
           name, (unsigned)b, (unsigned)k, (unsigned)m);
#endif
    fn(output + 1, &x, &w);
#ifdef CORAL_RVV_TRACE_CASES
    printf("CORAL_RVV_CASE RETURN name=%s B=%u K=%u M=%u\n",
           name, (unsigned)b, (unsigned)k, (unsigned)m);
#endif
    ++kernel_calls;
#ifdef MICO_RVV_PROFILE
    expected_q8_calls += fn == MiCo_Q8_MatMul;
    expected_q8x2_calls += fn == MiCo_Q8x2_MatMul;
#endif
    /* Check every word outside the result, including the entire unused tail:
     * a stray vector store must not escape detection by skipping the first guard. */
    for (size_t i = 0; i < output_words; ++i) {
        if (i >= 1 && i <= b * m) continue;
        ++checks;
        if (output[i] != guard) {
            if (failures < 8)
                printf("FAIL output guard %s word=%u\n", name, (unsigned)i);
            ++failures;
        }
    }
    for (size_t r = 0; r < b; ++r) {
        for (size_t o = 0; o < m; ++o) {
            int64_t ref = 0;
            for (size_t c = 0; c < k; ++c) {
                ref += (int64_t)scalar_value(x_storage + r * xb, c, abits) *
                       scalar_value(w_storage + o * wb, c, wbits);
            }
            ++checks;
            if (ref < INT32_MIN || ref > INT32_MAX || output[1 + r * m + o] != ref) {
                if (failures < 8) printf("FAIL %s B=%u K=%u M=%u p=%u at=%u,%u got=%ld ref=%ld\n",
                    name, (unsigned)b, (unsigned)k, (unsigned)m, pattern,
                    (unsigned)r, (unsigned)o, (long)output[1 + r * m + o], (long)ref);
                ++failures;
            }
        }
    }
}

typedef struct {
    const char *name;
    Kernel kernel;
    size_t b, k, m;
    unsigned abits, wbits, ternary, pattern;
} Case;

/* One correctness suite, not a separate short/model or extended mode.
 * Distribute boundaries across kernels instead of taking their Cartesian product:
 * Q2 rows include partial 1/3/7/15/17/31/33 and full 16/256 packing; Q1 rows
 * straddle packed-byte boundaries at 7/15/16/17 and 31/32. M and K both cover
 * 15/16/17 and 31/32/33, B=2/3 checks row strides, and padding stays nonzero.
 * The model's K=M=256 is retained without a huge vocabulary matrix.
 * Q8 K<32 uses single dots; K>=32 covers a four-output batch and its tail.
 * Q8x4/Q4x8 exercise the packed-K reduction path rather than direct bit planes.
 */
static const Case cases[] = {
    {"Q8x8 small", MiCo_Q8_MatMul, 1, 3, 5, 8, 8, 0, 0},
    {"Q8x8 small positive", MiCo_Q8_MatMul, 1, 31, 5, 8, 8, 0, 2},
    {"Q8x8 batch4 tail", MiCo_Q8_MatMul, 2, 32, 7, 8, 8, 0, 0},
    {"Q8x8 Ktail extreme", MiCo_Q8_MatMul, 3, 257, 5, 8, 8, 0, 1},

    {"Q8x2 true2 model", MiCo_Q8x2_MatMul, 1, 256, 256, 8, 2, 0, 0},
    {"Q8x2 ternary full", MiCo_Q8x2_MatMul, 2, 16, 16, 8, 2, 1, 0},
    {"Q8x2 zero tiny", MiCo_Q8x2_MatMul, 1, 1, 1, 8, 2, 0, 3},
    {"Q8x2 true2 short tail", MiCo_Q8x2_MatMul, 2, 3, 15, 8, 2, 0, 0},
    {"Q8x2 true2 tail extreme", MiCo_Q8x2_MatMul, 3, 17, 17, 8, 2, 0, 1},
    {"Q8x2 ternary long tail", MiCo_Q8x2_MatMul, 2, 33, 33, 8, 2, 1, 0},
    {"Q8x2 true2 boundary15", MiCo_Q8x2_MatMul, 2, 15, 31, 8, 2, 0, 0},

    {"Q2x8 true2 model", MiCo_Q2x8_MatMul, 1, 256, 32, 2, 8, 0, 0},
    {"Q2x8 ternary Ktail", MiCo_Q2x8_MatMul, 3, 31, 16, 2, 8, 1, 0},
    {"Q2x8 true2 short extreme", MiCo_Q2x8_MatMul, 2, 7, 3, 2, 8, 0, 1},
    {"Q2x8 ternary zero tail", MiCo_Q2x8_MatMul, 2, 17, 17, 2, 8, 1, 3},
    {"Q2x8 true2 boundary16", MiCo_Q2x8_MatMul, 3, 16, 32, 2, 8, 0, 0},
    {"Q2x8 true2 boundary33", MiCo_Q2x8_MatMul, 2, 33, 33, 2, 8, 0, 0},

    {"Q8x1 model", MiCo_Q8x1_MatMul, 1, 256, 32, 8, 1, 0, 0},
    {"Q8x1 short tail", MiCo_Q8x1_MatMul, 3, 7, 15, 8, 1, 0, 0},
    {"Q8x1 tail extreme", MiCo_Q8x1_MatMul, 2, 15, 16, 8, 1, 0, 1},
    {"Q8x1 zero activation tail", MiCo_Q8x1_MatMul, 3, 17, 33, 8, 1, 0, 3},
    {"Q8x1 boundary16", MiCo_Q8x1_MatMul, 2, 16, 17, 8, 1, 0, 0},
    {"Q8x1 boundary31 positive", MiCo_Q8x1_MatMul, 2, 31, 31, 8, 1, 0, 2},
    {"Q8x1 boundary32", MiCo_Q8x1_MatMul, 2, 32, 32, 8, 1, 0, 0},

    {"Q8x4 reduce tail", MiCo_Q8x4_MatMul, 3, 257, 7, 8, 4, 0, 0},
    {"Q4x8 reduce tail extreme", MiCo_Q4x8_MatMul, 3, 257, 7, 4, 8, 0, 1}
};

int main(void) {
    coral_rvv_install_trap();
    /* CRT initializes FS, not VS. Explicitly set mstatus.VS=Initial before
     * any vector instruction, independent of the runner's startup state. */
    const uintptr_t vs_mask = (uintptr_t)3u << 9;
    const uintptr_t vs_initial = (uintptr_t)1u << 9;
    __asm__ volatile("csrc mstatus, %0\n\tcsrs mstatus, %1" :: "r"(vs_mask), "r"(vs_initial) : "memory");
    uintptr_t vlenb;
    __asm__ volatile("csrr %0, vlenb" : "=r"(vlenb));
    printf("CORAL_RVV_LOWBIT_SMOKE BEGIN vlenb=%u reduction=hardware layout=default\n", (unsigned)vlenb);

#ifdef MICO_RVV_PROFILE
    const uint32_t q8_base = mico_rvv_q8_calls;
    const uint32_t q8x2_base = mico_rvv_q8x2_calls;
#endif
    for (size_t i = 0; i < sizeof(cases) / sizeof(cases[0]); ++i) {
        const Case *test = &cases[i];
        printf("CASE %u\n", (unsigned)i);
        run_case(test->name, test->kernel, test->b, test->k, test->m,
                 test->abits, test->wbits, test->ternary, test->pattern);
    }
    ++checks;
    if (kernel_calls != sizeof(cases) / sizeof(cases[0])) ++failures;
#ifdef MICO_RVV_PROFILE
    const uint32_t q8_calls = mico_rvv_q8_calls - q8_base;
    const uint32_t q8x2_calls = mico_rvv_q8x2_calls - q8x2_base;
    checks += 2;
    if (q8_calls != expected_q8_calls || q8x2_calls != expected_q8x2_calls)
        ++failures;
    printf("CORAL_RVV_LOWBIT_PROFILE q8_calls=%u q8x2_calls=%u\n",
           (unsigned)q8_calls, (unsigned)q8x2_calls);
#endif
    printf("CORAL_RVV_LOWBIT_SMOKE %s kernel_calls=%u checks=%u failures=%u\n",
           failures ? "FAIL" : "PASS", kernel_calls, checks, failures);
    return failures ? 1 : 0;
}
