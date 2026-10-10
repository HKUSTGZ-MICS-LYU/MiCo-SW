/* Correctness regression, not a benchmark: production Coral RVV kernels on
 * ordinary sparse heap, noncoherent CPU L1, no L2, 64-byte lines and Zicbom.
 * Build TARGET=vexii_soc OPT=rvv RVV_CACHE_MAINTENANCE=1 SPRAM=1, with
 * MICO_RVV_PROFILE and scalar compiler auto-vectorization disabled.
 * Default layout is X[B,K], W[N,K]; packed Q2 rows occupy ceil(K/4) bytes.
 * No test-side flush/invalidate/fence: the production handoff must preserve
 * dirty inputs, cached old outputs AND dirty neighbors of the user's O+3.
 * Q8x2 uses the production vector-store/bounce path; Q8 writes CPU scalars and
 * must not invalidate its newly dirty output. CRT supplies FS; we install VS.
 */
#include "mico_qnn.h"
#include <limits.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include "coral_rvv_bench_trap.h"

#ifdef USE_ALT_LAYOUT
#error "This test requires the default W[N,K] packed-row layout"
#endif
#if !defined(RISCV_VEXII) || !defined(MICO_RVV) || !defined(SPRAM)
#error "Build TARGET=vexii_soc OPT=rvv SPRAM=1 (ordinary sparse heap)"
#endif
#if !defined(MICO_RVV_EXPLICIT_CACHE) || !MICO_RVV_EXPLICIT_CACHE
#error "Build RVV_CACHE_MAINTENANCE=1 for the production explicit handoff"
#endif
#if !defined(__riscv_zicbom) || !defined(__riscv_zve32x)
#error "Keep the real compiler Zicbom and Zve32x ISA feature macros enabled"
#endif
#if !defined(MICO_RVV_HAS_REDUCTION) || !MICO_RVV_HAS_REDUCTION
#error "This test requires production hardware RVV reductions"
#endif
#ifndef MICO_RVV_PROFILE
#error "Build with -DMICO_RVV_PROFILE to verify production kernel calls"
#endif

extern uint32_t mico_rvv_q8_calls, mico_rvv_q8x2_calls;

enum {
    CACHE_LINE = 64, MAX_B = 2, MAX_K = 256, MAX_N = 32,
    X_BYTES = MAX_B * MAX_K, W_BYTES = MAX_N * (MAX_K / 4),
    OUTPUT_OFFSET = 3, OUTPUT_WORDS = 80, EXPECT_Q8 = 2, EXPECT_Q8X2 = 6
};
/* These are bounds of the ordinary sparse-memory window in the SPRAM setup,
 * not the private Coral VRAM window (0xa0000000) or on-chip RAM (0x800...). */
#define SPARSE_START ((uintptr_t)0x82000000u)
#define SPARSE_LIMIT ((uintptr_t)0x92000000u)

typedef void (*Kernel)(int32_t *, const Tensor2D_Q8 *, const Tensor2D_Q8 *);
typedef struct {
    const char *name;
    Kernel kernel;
    size_t b, k, n;
    unsigned wbits, ternary, epoch, reuse_output;
} Case;
typedef struct {
    void *allocation;
    uint8_t *data;
} HeapBlock;

static unsigned kernel_calls, checks, failures, expected_q8, expected_q8x2;
static volatile uint32_t warm_digest;

static HeapBlock heap_block(size_t bytes) {
    HeapBlock block = {0};
    block.allocation = malloc(bytes + CACHE_LINE - 1u);
    if (block.allocation) {
        const uintptr_t aligned = ((uintptr_t)block.allocation + CACHE_LINE - 1u) &
                                  ~(uintptr_t)(CACHE_LINE - 1u);
        block.data = (uint8_t *)aligned;
        if (aligned < SPARSE_START || aligned >= SPARSE_LIMIT ||
            bytes > SPARSE_LIMIT - aligned || (aligned % CACHE_LINE) != 0) {
            printf("FAIL heap range address=%08x bytes=%u\n", (unsigned)aligned,
                   (unsigned)bytes);
            free(block.allocation);
            block.allocation = NULL;
            block.data = NULL;
        }
    }
    return block;
}

static size_t row_bytes(size_t k, unsigned bits) {
    return bits == 8 ? k : (k + 3u) / 4u;
}

/* Logical values for both the packer and the independent int64 oracle. The
 * oracle never decodes the packed bytes or calls a MiCo reference kernel.
 * Every raw row includes BOTH -128 and 127; true INT2 includes live code 10
 * (-2), while ternary includes zero and never uses live code 10. */
static int logical_value(size_t r, size_t k, unsigned bits,
                         unsigned ternary, unsigned epoch) {
    static const int raw[] = {-128, 127, -127, 126, 0, 1, -1, 64, -64};
    static const int true2[] = {-2, -1, 0, 1};
    static const int tern[] = {0, 1, -1};
    if (bits == 8) {
        if (k == 0) return (epoch & 1u) ? 127 : -128;
        if (k == 1) return (epoch & 1u) ? -128 : 127;
        return raw[(k * 5u + r * 7u + k / 3u + epoch * 3u) % 9u];
    }
    return ternary ? tern[(k + r + epoch) % 3u] :
                     true2[(k + r + epoch) % 4u];
}

/* Volatile scalar CPU writes establish dirty inputs immediately before the
 * kernel. Nonzero unused packed slots expose overreads of K=17 tails. */
static void pack_cpu(volatile uint8_t *dst, size_t rows, size_t k,
                     unsigned bits, unsigned ternary, unsigned epoch,
                     size_t row_base) {
    const size_t stride = row_bytes(k, bits);
    for (size_t r = 0; r < rows; ++r) {
        if (bits == 8) {
            for (size_t c = 0; c < k; ++c)
                dst[r * stride + c] =
                    (uint8_t)logical_value(r + row_base, c, bits, ternary, epoch);
        } else {
            for (size_t byte = 0; byte < stride; ++byte) {
                unsigned packed = 0xffu;
                for (unsigned slot = 0; slot < 4; ++slot) {
                    const size_t c = byte * 4u + slot;
                    if (c < k) {
                        const unsigned code = (unsigned)logical_value(
                            r + row_base, c, bits, ternary, epoch) & 3u;
                        packed = (packed & ~(3u << (2u * slot))) | (code << (2u * slot));
                    }
                }
                dst[r * stride + byte] = (uint8_t)packed;
            }
        }
    }
}

static int32_t guard_value(unsigned epoch, size_t index) {
    /* Different from zero, stale outputs and all possible small-shape dots;
     * every guard changes on every call, including both shared-line edges. */
    return (int32_t)(0x36a50000u ^ ((epoch + 1u) * 0x00010101u) ^
                     ((unsigned)index * 0x00001021u));
}

static int prepare_oracle(const Case *test, int32_t *expected) {
    for (size_t i = 0; i < OUTPUT_WORDS; ++i)
        expected[i] = guard_value(test->epoch, i);
    for (size_t r = 0; r < test->b; ++r) {
        for (size_t n = 0; n < test->n; ++n) {
            int64_t sum = 0;
            for (size_t k = 0; k < test->k; ++k) {
                sum += (int64_t)logical_value(r, k, 8, 0, test->epoch) *
                       (int64_t)logical_value(n + 11u, k, test->wbits,
                                             test->ternary, test->epoch + 2u);
            }
            ++checks;
            if (sum < INT32_MIN || sum > INT32_MAX) {
                printf("FAIL oracle overflow case=%s at=%u,%u\n", test->name,
                       (unsigned)r, (unsigned)n);
                ++failures;
                return 0;
            }
            expected[OUTPUT_OFFSET + r * test->n + n] = (int32_t)sum;
        }
    }
    return 1;
}

static void run_case(const Case *test, uint8_t *xdata, uint8_t *wdata,
                     int32_t *output, int32_t *expected,
                     uint32_t q8_base, uint32_t q8x2_base) {
    const size_t count = test->b * test->n;
    const unsigned failures_before = failures;
    if (test->b > MAX_B || test->k > MAX_K || test->n > MAX_N ||
        test->b * test->k > X_BYTES ||
        test->n * row_bytes(test->k, test->wbits) > W_BYTES ||
        OUTPUT_OFFSET + count >= OUTPUT_WORDS) {
        printf("FAIL capacity case=%s\n", test->name);
        ++failures;
        return;
    }
    if (!prepare_oracle(test, expected)) return;
    volatile int32_t *cpu_output = output;
    if (test->reuse_output) {
        /* Keep the previous production results in the SAME output buffer.
         * Prove the new input epoch actually changes the expected result. */
        unsigned changed = 0;
        for (size_t i = 0; i < count; ++i)
            changed |= cpu_output[OUTPUT_OFFSET + i] != expected[OUTPUT_OFFSET + i];
        ++checks;
        if (!changed) {
            printf("FAIL unchanged repeat oracle case=%s\n", test->name);
            ++failures;
        }
    } else {
        for (size_t i = 0; i < OUTPUT_WORDS; ++i)
            cpu_output[i] = -(int32_t)(1000000u + test->epoch * 100u + (unsigned)i);
    }
    Tensor2D_Q8 x = {.shape = {test->b, test->k}, .data = (qbyte *)xdata,
                    .scale = 1.0f, .wq = 8};
    Tensor2D_Q8 w = {.shape = {test->n, test->k}, .data = (qbyte *)wdata,
                    .scale = 1.0f, .wq = (qtype)test->wbits};
    printf("CORAL_RVV_CACHE_CASE BEGIN name=%s B=%u K=%u N=%u wbits=%u "
           "ternary=%u epoch=%u reuse=%u output=%08x offset_bytes=%u\n",
           test->name, (unsigned)test->b, (unsigned)test->k, (unsigned)test->n,
           test->wbits, test->ternary, test->epoch, test->reuse_output,
           (unsigned)(uintptr_t)(output + OUTPUT_OFFSET),
           (unsigned)(OUTPUT_OFFSET * sizeof(*output)));

    /* Critical preparation-to-call interval: no printf, oracle, allocation,
     * test-side maintenance or unrelated sweep can clean/evict the test data.
     * Both X and W change, even on consecutive identical-shape reuse calls. */
    pack_cpu(xdata, test->b, test->k, 8, 0, test->epoch, 0);
    pack_cpu(wdata, test->n, test->k, test->wbits, test->ternary,
             test->epoch + 2u, 11);
    uint32_t digest = 0;
    for (size_t i = 0; i < OUTPUT_WORDS; ++i)
        digest ^= (uint32_t)cpu_output[i]; /* CPU caches the OLD output. */
    warm_digest = digest;
    for (size_t i = 0; i < OUTPUT_WORDS; ++i) {
        if (i < OUTPUT_OFFSET || i >= OUTPUT_OFFSET + count)
            cpu_output[i] = guard_value(test->epoch, i); /* adjacent DIRTY guards */
    }
    test->kernel(output + OUTPUT_OFFSET, &x, &w);
    ++kernel_calls;
    if (test->wbits == 8) ++expected_q8;
    else ++expected_q8x2;

    /* Compare the ENTIRE array with a separate snapshot, not just two guards.
     * Do this immediately on return: Q8 scalar output must survive any library
     * post-invalidate, and Q8x2 must be visible after its vector-store handoff. */
    unsigned mismatches = 0, guard_mismatches = 0;
    for (size_t i = 0; i < OUTPUT_WORDS; ++i) {
        const int32_t got = cpu_output[i];
        ++checks;
        if (got != expected[i]) {
            const unsigned guard = i < OUTPUT_OFFSET || i >= OUTPUT_OFFSET + count;
            ++mismatches;
            guard_mismatches += guard;
            ++failures;
            if (mismatches <= 4)
                printf("FAIL case=%s %s word=%u got=%ld ref=%ld\n", test->name,
                       guard ? "dirty-guard" : "dot", (unsigned)i,
                       (long)got, (long)expected[i]);
        }
    }
    checks += 2;
    if (mico_rvv_q8_calls - q8_base != expected_q8 ||
        mico_rvv_q8x2_calls - q8x2_base != expected_q8x2) {
        printf("FAIL case=%s profile q8=%u expected=%u q8x2=%u expected=%u\n",
               test->name, (unsigned)(mico_rvv_q8_calls - q8_base), expected_q8,
               (unsigned)(mico_rvv_q8x2_calls - q8x2_base), expected_q8x2);
        ++failures;
    }
    printf("CORAL_RVV_CACHE_CASE %s name=%s array_checks=%u dot_checks=%u "
           "guard_checks=%u mismatches=%u guard_mismatches=%u q8=%u q8x2=%u\n",
           failures == failures_before ? "PASS" : "FAIL", test->name,
           OUTPUT_WORDS, (unsigned)count, (unsigned)(OUTPUT_WORDS - count),
           mismatches, guard_mismatches,
           (unsigned)(mico_rvv_q8_calls - q8_base),
           (unsigned)(mico_rvv_q8x2_calls - q8x2_base));
}

int main(void) {
    coral_rvv_install_trap();
    const uintptr_t vs_mask = (uintptr_t)3u << 9;
    const uintptr_t vs_initial = (uintptr_t)1u << 9;
    __asm__ volatile("csrc mstatus, %0\n\tcsrs mstatus, %1\n\tcsrw vstart, zero"
                     :: "r"(vs_mask), "r"(vs_initial) : "memory");
    uintptr_t vlenb;
    __asm__ volatile("csrr %0, vlenb" : "=r"(vlenb));
    printf("CORAL_RVV_CACHE_MAINTENANCE BEGIN vlenb=%u explicit_cache=1 "
           "zicbom=%u reduction=hardware layout=W[N,K] heap=sparse "
           "requires_cpu_l1=noncoherent requires_l2=none cacheline=%u "
           "test_side_cache_ops=0 expected_q8=%u expected_q8x2=%u\n",
           (unsigned)vlenb, (unsigned)__riscv_zicbom,
           CACHE_LINE, EXPECT_Q8, EXPECT_Q8X2);

    HeapBlock xb = heap_block(X_BYTES), wb = heap_block(W_BYTES);
    HeapBlock ob = heap_block(OUTPUT_WORDS * sizeof(int32_t));
    HeapBlock eb = heap_block(OUTPUT_WORDS * sizeof(int32_t));
    if (!xb.data || !wb.data || !ob.data || !eb.data) {
        printf("CORAL_RVV_CACHE_MAINTENANCE FAIL heap allocation/range\n");
        free(xb.allocation); free(wb.allocation);
        free(ob.allocation); free(eb.allocation);
        return 1;
    }
    printf("CORAL_RVV_CACHE_HEAP X=%08x W=%08x O=%08x user_O=%08x "
           "expected=%08x alignment=%u output_words=%u\n",
           (unsigned)(uintptr_t)xb.data, (unsigned)(uintptr_t)wb.data,
           (unsigned)(uintptr_t)ob.data,
           (unsigned)(uintptr_t)((int32_t *)ob.data + OUTPUT_OFFSET),
           (unsigned)(uintptr_t)eb.data, CACHE_LINE, OUTPUT_WORDS);
    static const Case cases[] = {
        {"q8x2-dirty-K17-N3", MiCo_Q8x2_MatMul, 1, 17, 3, 2, 0, 0, 0},
        {"q8x2-reuse-K17-N3", MiCo_Q8x2_MatMul, 1, 17, 3, 2, 0, 1, 1},
        {"q8x2-Mtail-K32-N17", MiCo_Q8x2_MatMul, 1, 32, 17, 2, 0, 2, 0},
        {"q8x2-ternary-Ktail-B2", MiCo_Q8x2_MatMul, 2, 17, 3, 2, 1, 3, 0},
        {"q8x2-model-K256-N32", MiCo_Q8x2_MatMul, 1, 256, 32, 2, 0, 4, 0},
        {"q8x2-ternary-Mtail-B2", MiCo_Q8x2_MatMul, 2, 32, 17, 2, 1, 5, 0},
        {"q8-scalar-output-K17-N3", MiCo_Q8_MatMul, 1, 17, 3, 8, 0, 6, 0},
        {"q8-scalar-output-K32-N17", MiCo_Q8_MatMul, 1, 32, 17, 8, 0, 7, 0}
    };
    const uint32_t q8_base = mico_rvv_q8_calls;
    const uint32_t q8x2_base = mico_rvv_q8x2_calls;
    for (size_t i = 0; i < sizeof(cases) / sizeof(cases[0]); ++i)
        run_case(&cases[i], xb.data, wb.data, (int32_t *)ob.data,
                 (int32_t *)eb.data, q8_base, q8x2_base);
    checks += 3;
    if (kernel_calls != EXPECT_Q8 + EXPECT_Q8X2 ||
        mico_rvv_q8_calls - q8_base != EXPECT_Q8 ||
        mico_rvv_q8x2_calls - q8x2_base != EXPECT_Q8X2) {
        printf("FAIL final production call counters\n");
        ++failures;
    }
    printf("CORAL_RVV_CACHE_MAINTENANCE %s kernel_calls=%u checks=%u "
           "failures=%u q8_calls=%u q8x2_calls=%u\n",
           failures ? "FAIL" : "PASS", kernel_calls, checks, failures,
           (unsigned)(mico_rvv_q8_calls - q8_base),
           (unsigned)(mico_rvv_q8x2_calls - q8x2_base));
    free(xb.allocation); free(wb.allocation);
    free(ob.allocation); free(eb.allocation);
    return failures ? 1 : 0;
}
