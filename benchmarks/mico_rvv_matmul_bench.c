#include <stdint.h>

#include "mico_qnn.h"
#ifdef RISCV_VEXII
#include "sim_stdlib.h"
#else
#include <stdio.h>
#endif

/*
 * Benchmark the actual MiCo-Lib RVV target against its scalar reference.
 * MiCo_Q8_MatMul expects weights in [out_features][in_features] layout.
 * Initialization and output checking are outside the timed calls.
 */
#define MAX_M 8u
#define MAX_K 256u
#define MAX_N 8u
#define GUARD 0x31579bdf

#ifdef MICO_BENCH_VRAM
#define MICO_BENCH_DATA __attribute__((section(".vram"), aligned(16)))
#elif defined(MICO_BENCH_ONCHIP)
#define MICO_BENCH_DATA __attribute__((section(".onchip"), aligned(16)))
#else
#define MICO_BENCH_DATA __attribute__((aligned(16)))
#endif

static int8_t input_data[MAX_M * MAX_K] MICO_BENCH_DATA;
static int8_t weight_data[MAX_N * MAX_K] MICO_BENCH_DATA;
static int32_t reference_output[MAX_M * MAX_N + 2] MICO_BENCH_DATA;
static int32_t rvv_output[MAX_M * MAX_N + 2] MICO_BENCH_DATA;

static inline __attribute__((always_inline)) uint32_t cycle(void) {
    uint32_t value;
    asm volatile("rdcycle %0" : "=r"(value) :: "memory");
    return value;
}

static void text(const char *value) {
    while (*value) putchar(*value++);
}

static void number(uint32_t value) {
    char buffer[10];
    unsigned count = 0;
    do {
        buffer[count++] = (char)('0' + value % 10u);
        value /= 10u;
    } while (value);
    while (count) putchar(buffer[--count]);
}

static void field(const char *name, uint32_t value) {
    text(name);
    number(value);
}

static void fill_inputs(uint32_t m, uint32_t k, uint32_t n) {
    static const int8_t edge[] = {-128, 127, -1, 0, 1, -127, 64, -64};
    for (uint32_t i = 0; i < m; ++i) {
        for (uint32_t q = 0; q < k; ++q) {
            input_data[i * k + q] = edge[(i * k + q) % 8u];
        }
    }
    /* MiCo default layout: one contiguous K-vector per output column. */
    for (uint32_t j = 0; j < n; ++j) {
        for (uint32_t q = 0; q < k; ++q) {
            weight_data[j * k + q] = edge[(j * k + q * 3u + 1u) % 8u];
        }
    }
}

static void poison(int32_t *output) {
    for (uint32_t i = 0; i < MAX_M * MAX_N + 2u; ++i) output[i] = GUARD;
}

static uint32_t check_outputs(uint32_t count) {
    uint32_t failures = 0;
    if (reference_output[0] != GUARD || rvv_output[0] != GUARD) ++failures;
    for (uint32_t i = 0; i < count; ++i) {
        if (reference_output[i + 1u] != rvv_output[i + 1u]) {
            if (failures == 0) {
                text("MICO_RVV_MM_MISMATCH index=");
                number(i);
                text(" ref=");
                number((uint32_t)reference_output[i + 1u]);
                text(" rvv=");
                number((uint32_t)rvv_output[i + 1u]);
                putchar('\n');
            }
            ++failures;
        }
    }
    for (uint32_t i = count + 1u; i < MAX_M * MAX_N + 2u; ++i) {
        if (reference_output[i] != GUARD || rvv_output[i] != GUARD) ++failures;
    }
    return failures;
}

static uint32_t run_case(uint32_t id, uint32_t m, uint32_t k, uint32_t n) {
    Tensor2D_Q8 x;
    Tensor2D_Q8 w;
    x.shape[0] = m;
    x.shape[1] = k;
    x.data = input_data;
    x.scale = 1.0f;
    x.wq = 8;
    w.shape[0] = n;
    w.shape[1] = k;
    w.data = weight_data;
    w.scale = 1.0f;
    w.wq = 8;

    const uint32_t count = m * n;
    uint32_t failures = 0;

    poison(reference_output);
    poison(rvv_output);

    uint32_t start = cycle();
    MiCo_Q8_MatMul_Ref(reference_output + 1, &x, &w);
    uint32_t reference_first = cycle() - start;

    start = cycle();
    MiCo_Q8_MatMul(rvv_output + 1, &x, &w);
    uint32_t rvv_first = cycle() - start;
    failures = check_outputs(count);

    poison(reference_output);
    poison(rvv_output);

    start = cycle();
    MiCo_Q8_MatMul(rvv_output + 1, &x, &w);
    uint32_t rvv_repeat = cycle() - start;

    start = cycle();
    MiCo_Q8_MatMul_Ref(reference_output + 1, &x, &w);
    uint32_t reference_repeat = cycle() - start;
    failures += check_outputs(count);

    field("MICO_RVV_MM case=", id);
    field(" M=", m);
    field(" K=", k);
    field(" N=", n);
    field(" macs=", m * k * n);
    field(" reference_first_api_cycles=", reference_first);
    field(" rvv_first_api_cycles=", rvv_first);
    field(" reference_repeat_api_cycles=", reference_repeat);
    field(" rvv_repeat_api_cycles=", rvv_repeat);
    field(" speedup_num=", reference_first);
    field(" speedup_den=", rvv_first);
    field(" failures=", failures);
    putchar('\n');
    return failures;
}

int main(void) {
    /* MiCo's RVV target assumes the caller has enabled the vector state. */
    uint32_t vector_state = 0x600u;
    uint32_t vector_clean = 0x200u;
    asm volatile("csrc mstatus,%0\ncsrs mstatus,%1\ncsrw vstart,zero"
                 :: "r"(vector_state), "r"(vector_clean) : "memory");
    text("MICO_RVV_MM_CONFIG kernel=MiCo_Q8_MatMul layout=weights_NxK ");
    text("reference=MiCo_Q8_MatMul_Ref reduction=hardware_vredsum timing=whole_api\n");

    uint32_t failures = 0;
    static const uint32_t cases[][3] = {
        {8u, 8u, 8u},
        {8u, 256u, 8u},
    };
    for (uint32_t i = 0; i < sizeof(cases) / sizeof(cases[0]); ++i) {
        fill_inputs(cases[i][0], cases[i][1], cases[i][2]);
        failures += run_case(i, cases[i][0], cases[i][1], cases[i][2]);
    }

    field("MICO_RVV_MM_SUMMARY failures=", failures);
    text(failures ? "MICO_RVV_MATMUL FAIL\n" : "MICO_RVV_MATMUL PASS\n");
    return failures ? 1 : 0;
}
