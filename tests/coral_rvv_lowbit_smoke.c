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
                const unsigned shift = (unsigned)(c % (8u / bits)) * bits;
                const unsigned mask = (1u << bits) - 1u;
                const unsigned code = bits == 1 ? (value < 0) : ((unsigned)value & mask);
                uint8_t *p = dst + r * bytes + c / (8u / bits);
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
    for (size_t i = 0; i < b * m + 2; ++i) output[i] = guard;
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
    checks += 2;
    if (output[0] != guard || output[b * m + 1] != guard) {
        printf("FAIL output guard %s\n", name);
        ++failures;
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

static void model_calls(size_t b, size_t k, size_t m, unsigned pattern) {
    run_case("Q8x2 true2", MiCo_Q8x2_MatMul, b, k, m, 8, 2, 0, pattern);
    run_case("Q8x2 ternary", MiCo_Q8x2_MatMul, b, k, m, 8, 2, 1, pattern);
    run_case("Q2x8 true2", MiCo_Q2x8_MatMul, b, k, m, 2, 8, 0, pattern);
    run_case("Q2x8 ternary", MiCo_Q2x8_MatMul, b, k, m, 2, 8, 1, pattern);
    run_case("Q8x1", MiCo_Q8x1_MatMul, b, k, m, 8, 1, 0, pattern);
}

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

#ifdef CORAL_RVV_MODEL_SMOKE
    /* Short model-only gate for slow RTL simulation. Keep the complete lowbit
     * regression below available when this macro is not defined. */
    run_case("Q8x2 model", MiCo_Q8x2_MatMul, 1, 32, 16, 8, 2, 0, 0);
    run_case("Q8x2 true2 tail extreme", MiCo_Q8x2_MatMul, 1, 17, 3, 8, 2, 0, 1);
    run_case("Q8x2 ternary tail", MiCo_Q8x2_MatMul, 1, 17, 3, 8, 2, 1, 0);
    run_case("Q8x8 model", MiCo_Q8_MatMul, 1, 32, 4, 8, 8, 0, 0);
#else
    /* Real 3.8M model uses dim=hidden_dim=256. No huge vocabulary matrix. */
    model_calls(1, 256, 32, 0);
    model_calls(1, 256, 256, 0);
    static const unsigned tails[][2] = {
        {1, 1}, {3, 3}, {7, 7}, {15, 15}, {16, 16}, {17, 17},
        {31, 31}, {32, 32}, {33, 33}, {65, 35}, {257, 67}
    };
    for (size_t i = 0; i < sizeof(tails) / sizeof(tails[0]); ++i)
        model_calls(3, tails[i][0], tails[i][1], 0);
    for (unsigned pattern = 1; pattern <= 3; ++pattern)
        model_calls(1, 257, 35, pattern);

    /* Extra calls exercise both reduction helpers: default model lowbit
     * kernels vectorize M and do not themselves reduce over K. */
    run_case("Q8x8 small", MiCo_Q8_MatMul, 1, 3, 5, 8, 8, 0, 0);
    run_case("Q8x8 tail", MiCo_Q8_MatMul, 3, 257, 7, 8, 8, 0, 0);
    run_case("Q8x8 extreme", MiCo_Q8_MatMul, 1, 257, 5, 8, 8, 0, 1);
    run_case("Q8x4 reduce", MiCo_Q8x4_MatMul, 3, 257, 7, 8, 4, 0, 0);
    run_case("Q4x8 reduce", MiCo_Q4x8_MatMul, 3, 257, 7, 4, 8, 0, 1);
#endif
#ifdef MICO_RVV_PROFILE
    checks += 2;
#ifdef CORAL_RVV_MODEL_SMOKE
    if (mico_rvv_q8_calls != 1 || mico_rvv_q8x2_calls != 3) ++failures;
#else
    if (mico_rvv_q8_calls != 3 || mico_rvv_q8x2_calls != 32) ++failures;
#endif
    printf("CORAL_RVV_LOWBIT_PROFILE q8_calls=%u q8x2_calls=%u\n",
           (unsigned)mico_rvv_q8_calls, (unsigned)mico_rvv_q8x2_calls);
#endif
    printf("CORAL_RVV_LOWBIT_SMOKE %s kernel_calls=%u checks=%u failures=%u\n",
           failures ? "FAIL" : "PASS", kernel_calls, checks, failures);
    return failures ? 1 : 0;
}
