#ifdef RISCV_VEXII
#include "sim_stdlib.h"
#else
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#endif

#ifndef REF
#error "bnmatmul_variants_test requires REF functions. Build with OPT including ref."
#endif

#include "mico_qnn.h"

typedef struct {
    int n;
    int m;
    int k;
} MatmulCase;

static size_t packed_1bit_bytes(size_t elements) {
    return (elements + 7u) >> 3;
}

static size_t packed_2bit_bytes(size_t elements) {
    return ((elements << 1) + 7u) >> 3;
}

static void fill_i8(int8_t *data, size_t count, int seed) {
    for (size_t i = 0; i < count; ++i) {
        const int v = (int)((i * 29u + (unsigned int)seed) % 255u) - 127;
        data[i] = (int8_t)v;
    }
}

static void fill_packed(int8_t *data, size_t count, int seed) {
    for (size_t i = 0; i < count; ++i) {
        data[i] = (int8_t)((i * 37u + (unsigned int)seed * 13u) & 0xFF);
    }
}

static void fill_i8_limited(int8_t *data, size_t count, int seed, int limit) {
    const unsigned int span = (unsigned int)(limit * 2 + 1);
    for (size_t i = 0; i < count; ++i) {
        const int v = (int)((i * 23u + (unsigned int)seed) % span) - limit;
        data[i] = (int8_t)v;
    }
}

static void fill_packed_2bit(int8_t *data, size_t count, int seed, int allow_code2) {
    static const uint8_t q15_codes[3] = {0, 1, 3};
    for (size_t i = 0; i < count; ++i) {
        uint8_t packed = 0;
        for (int lane = 0; lane < 4; ++lane) {
            const unsigned int mix = (unsigned int)(i * 11u + lane * 7u + (unsigned int)seed);
            uint8_t code;
            if (allow_code2) {
                code = (uint8_t)(mix & 0x3u);
            } else {
                code = q15_codes[mix % 3u];
            }
            packed |= (uint8_t)(code << (lane * 2));
        }
        data[i] = (int8_t)packed;
    }
}

static int compare_outputs(
        const char *name,
        const MatmulCase *tc,
        const int32_t *ref_out,
        const int32_t *dut_out) {
    const size_t out_count = (size_t)tc->n * (size_t)tc->m;
    for (size_t i = 0; i < out_count; ++i) {
        if (ref_out[i] != dut_out[i]) {
            printf(
                    "FAIL %s N=%d M=%d K=%d idx=%u ref=%d dut=%d\n",
                    name,
                    tc->n,
                    tc->m,
                    tc->k,
                    (unsigned int)i,
                    ref_out[i],
                    dut_out[i]);
            return -1;
        }
    }
    return 0;
}

static int run_q8x1_case(const MatmulCase *tc) {
    const size_t x_count = (size_t)tc->n * (size_t)tc->k;
    const size_t w_count = (size_t)tc->m * (size_t)tc->k;
    const size_t w_bytes = packed_1bit_bytes(w_count);
    const size_t out_count = (size_t)tc->n * (size_t)tc->m;

    Tensor2D_Q8 x = {0};
    Tensor2D_Q8 w = {0};
    int32_t *ref_out = (int32_t *)malloc(out_count * sizeof(int32_t));
    int32_t *dut_out = (int32_t *)malloc(out_count * sizeof(int32_t));
    x.data = (int8_t *)malloc(x_count);
    w.data = (int8_t *)malloc(w_bytes);

    if (!x.data || !w.data || !ref_out || !dut_out) {
        printf("Allocation failed in Q8x1 case N=%d M=%d K=%d\n", tc->n, tc->m, tc->k);
        free(x.data);
        free(w.data);
        free(ref_out);
        free(dut_out);
        return -1;
    }

    fill_i8(x.data, x_count, tc->k + 11);
    fill_packed(w.data, w_bytes, tc->m + 17);
    x.shape[0] = (size_t)tc->n;
    x.shape[1] = (size_t)tc->k;
    w.shape[0] = (size_t)tc->m;
    w.shape[1] = (size_t)tc->k;

    MiCo_Q8x1_MatMul_Ref(ref_out, &x, &w);
    MiCo_Q8x1_MatMul(dut_out, &x, &w);

    const int err = compare_outputs("Q8x1", tc, ref_out, dut_out);
    free(x.data);
    free(w.data);
    free(ref_out);
    free(dut_out);
    return err;
}

static int run_q1x8_case(const MatmulCase *tc) {
    const size_t x_count = (size_t)tc->n * (size_t)tc->k;
    const size_t x_bytes = packed_1bit_bytes(x_count);
    const size_t w_count = (size_t)tc->m * (size_t)tc->k;
    const size_t out_count = (size_t)tc->n * (size_t)tc->m;

    Tensor2D_Q8 x = {0};
    Tensor2D_Q8 w = {0};
    int32_t *ref_out = (int32_t *)malloc(out_count * sizeof(int32_t));
    int32_t *dut_out = (int32_t *)malloc(out_count * sizeof(int32_t));
    x.data = (int8_t *)malloc(x_bytes);
    w.data = (int8_t *)malloc(w_count);

    if (!x.data || !w.data || !ref_out || !dut_out) {
        printf("Allocation failed in Q1x8 case N=%d M=%d K=%d\n", tc->n, tc->m, tc->k);
        free(x.data);
        free(w.data);
        free(ref_out);
        free(dut_out);
        return -1;
    }

    fill_packed(x.data, x_bytes, tc->n + 23);
    fill_i8(w.data, w_count, tc->k + 29);
    x.shape[0] = (size_t)tc->n;
    x.shape[1] = (size_t)tc->k;
    w.shape[0] = (size_t)tc->m;
    w.shape[1] = (size_t)tc->k;

    MiCo_Q1x8_MatMul_Ref(ref_out, &x, &w);
    MiCo_Q1x8_MatMul(dut_out, &x, &w);

    const int err = compare_outputs("Q1x8", tc, ref_out, dut_out);
    free(x.data);
    free(w.data);
    free(ref_out);
    free(dut_out);
    return err;
}

static int run_q8x2_case(const MatmulCase *tc) {
    const size_t x_count = (size_t)tc->n * (size_t)tc->k;
    const size_t w_count = (size_t)tc->m * (size_t)tc->k;
    const size_t w_bytes = packed_2bit_bytes(w_count);
    const size_t out_count = (size_t)tc->n * (size_t)tc->m;

    Tensor2D_Q8 x = {0};
    Tensor2D_Q8 w = {0};
    int32_t *ref_out = (int32_t *)malloc(out_count * sizeof(int32_t));
    int32_t *dut_out = (int32_t *)malloc(out_count * sizeof(int32_t));
    x.data = (int8_t *)malloc(x_count);
    w.data = (int8_t *)malloc(w_bytes);

    if (!x.data || !w.data || !ref_out || !dut_out) {
        printf("Allocation failed in Q8x2 case N=%d M=%d K=%d\n", tc->n, tc->m, tc->k);
        free(x.data);
        free(w.data);
        free(ref_out);
        free(dut_out);
        return -1;
    }

    fill_i8_limited(x.data, x_count, tc->k + 31, 63);
#if BITNET_QUANT == 3
    fill_packed_2bit(w.data, w_bytes, tc->m + 37, 0);
#else
    fill_packed_2bit(w.data, w_bytes, tc->m + 37, 1);
#endif
    x.shape[0] = (size_t)tc->n;
    x.shape[1] = (size_t)tc->k;
    w.shape[0] = (size_t)tc->m;
    w.shape[1] = (size_t)tc->k;

    MiCo_Q8x2_MatMul_Ref(ref_out, &x, &w);
    MiCo_Q8x2_MatMul(dut_out, &x, &w);

    const int err = compare_outputs("Q8x2", tc, ref_out, dut_out);
    free(x.data);
    free(w.data);
    free(ref_out);
    free(dut_out);
    return err;
}

static int run_q2x8_case(const MatmulCase *tc) {
    const size_t x_count = (size_t)tc->n * (size_t)tc->k;
    const size_t x_bytes = packed_2bit_bytes(x_count);
    const size_t w_count = (size_t)tc->m * (size_t)tc->k;
    const size_t out_count = (size_t)tc->n * (size_t)tc->m;

    Tensor2D_Q8 x = {0};
    Tensor2D_Q8 w = {0};
    int32_t *ref_out = (int32_t *)malloc(out_count * sizeof(int32_t));
    int32_t *dut_out = (int32_t *)malloc(out_count * sizeof(int32_t));
    x.data = (int8_t *)malloc(x_bytes);
    w.data = (int8_t *)malloc(w_count);

    if (!x.data || !w.data || !ref_out || !dut_out) {
        printf("Allocation failed in Q2x8 case N=%d M=%d K=%d\n", tc->n, tc->m, tc->k);
        free(x.data);
        free(w.data);
        free(ref_out);
        free(dut_out);
        return -1;
    }

#if BITNET_QUANT == 3
    fill_packed_2bit(x.data, x_bytes, tc->n + 41, 0);
#else
    fill_packed_2bit(x.data, x_bytes, tc->n + 41, 1);
#endif
    fill_i8_limited(w.data, w_count, tc->k + 43, 63);
    x.shape[0] = (size_t)tc->n;
    x.shape[1] = (size_t)tc->k;
    w.shape[0] = (size_t)tc->m;
    w.shape[1] = (size_t)tc->k;

    MiCo_Q2x8_MatMul_Ref(ref_out, &x, &w);
    MiCo_Q2x8_MatMul(dut_out, &x, &w);

    const int err = compare_outputs("Q2x8", tc, ref_out, dut_out);
    free(x.data);
    free(w.data);
    free(ref_out);
    free(dut_out);
    return err;
}

int main(void) {
#if BITNET_QUANT == 2
    const MatmulCase tests[] = {
            {1, 1, 8},
            {1, 1, 16},
            {1, 1, 24},
            {2, 3, 32},
            {1, 4, 64},
    };
#elif BITNET_QUANT != 0
    const MatmulCase tests[] = {
            {1, 1, 4},
            {1, 1, 8},
            {1, 1, 12},
            {2, 3, 16},
            {1, 4, 32},
    };
#else
#error "BITNET_QUANT must be non-zero for bnmatmul_variants_test."
#endif

    int failures = 0;
    const int test_count = (int)(sizeof(tests) / sizeof(tests[0]));

#if BITNET_QUANT == 2
    printf("Running BNRV 1-bit variant checks (%d cases)\n", test_count);
    for (int i = 0; i < test_count; ++i) {
        failures += (run_q8x1_case(&tests[i]) != 0);
        failures += (run_q1x8_case(&tests[i]) != 0);
    }
#elif BITNET_QUANT != 0
    printf("Running BNRV 2-bit path checks (%d cases, BITNET_QUANT=%d)\n", test_count, BITNET_QUANT);
    for (int i = 0; i < test_count; ++i) {
        failures += (run_q8x2_case(&tests[i]) != 0);
        failures += (run_q2x8_case(&tests[i]) != 0);
    }
#endif

    if (failures == 0) {
        printf("BNRV matmul variant test PASS (BITNET_QUANT=%d)\n", BITNET_QUANT);
        return 0;
    }

    printf("BNRV matmul variant test FAIL: %d mismatches\n", failures);
    return 1;
}
