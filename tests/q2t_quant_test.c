#ifdef RISCV_VEXII
#include "sim_stdlib.h"
#else
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#endif

#include "mico_quant.h"
#include "profile.h"

#ifndef VLEN
#define VLEN 256
#endif

#define Q2T_LANES (VLEN / 32)

static int round_half_away(float value) {
    return value >= 0.0f ? (int)(value + 0.5f) : (int)(value - 0.5f);
}

static float local_absmax(float *x, size_t n) {
    float absmax = 0.0f;

    for(size_t i = 0; i < n; ++i) {
        float value = x[i];
        if(value < 0.0f) {
            value = -value;
        }
        if(value > absmax) {
            absmax = value;
        }
    }

    return absmax;
}

static float scalar_q2t(qbyte *qx, float *x, size_t n) {
    const float absmax = local_absmax(x, n);
    const float scale = 1.0f / absmax;
    const size_t qbytes = (n + 3) / 4;

    memset(qx, 0, qbytes);
    if(absmax == 0.0f) {
        return absmax;
    }

    for(size_t i = 0; i < n; ++i) {
        const int rounded = round_half_away(x[i] * scale);
        const int clamped = CLAMP_INT2T(rounded);
        const uint8_t code = (uint8_t)(clamped & 0x3);
        qx[i / 4] = (qbyte)(((uint8_t)qx[i / 4]) | (uint8_t)(code << (2 * (i & 0x3u))));
    }

    return absmax;
}

static void fill_case(float *x, size_t n) {
    static const float pattern[] = {
        0.0f, 0.49f, 0.5f, 0.51f,
        -0.49f, -0.5f, -0.51f, 1.0f,
        -1.0f, 0.25f, -0.25f, 0.75f,
        -0.75f, 0.125f, -0.125f, 0.999f,
    };

    for(size_t i = 0; i < n; ++i) {
        x[i] = pattern[i % (sizeof(pattern) / sizeof(pattern[0]))];
    }
}

static int compare_bytes(const char *name, const qbyte *ref, const qbyte *dut, size_t n, float ref_scale, float dut_scale) {
    const size_t qbytes = (n + 3) / 4;

    if(ref_scale != dut_scale) {
        printf("FAIL %s scale ref=%f dut=%f\n", name, ref_scale, dut_scale);
        return -1;
    }

    for(size_t i = 0; i < qbytes; ++i) {
        if(ref[i] != dut[i]) {
            printf(
                "FAIL %s n=%u byte=%u ref=0x%02x dut=0x%02x\n",
                name,
                (unsigned int)n,
                (unsigned int)i,
                (unsigned int)((uint8_t)ref[i]),
                (unsigned int)((uint8_t)dut[i]));
            return -1;
        }
    }

    return 0;
}

static int run_case(const char *name, size_t n) {
    float *x = (float *)MiCo_alloc(n * sizeof(float), MICO_ALIGN);
    qbyte *ref = (qbyte *)MiCo_alloc(((n + 3) / 4) * sizeof(qbyte), MICO_ALIGN);
    qbyte *dut = (qbyte *)MiCo_alloc(((n + 3) / 4) * sizeof(qbyte), MICO_ALIGN);

    if(!x || !ref || !dut) {
        printf("FAIL %s allocation\n", name);
        MiCo_free(x);
        MiCo_free(ref);
        MiCo_free(dut);
        return -1;
    }

    fill_case(x, n);

    const long scalar_start = MiCo_time();
    const float ref_scale = scalar_q2t(ref, x, n);
    const long scalar_cycles = MiCo_time() - scalar_start;

    memset(dut, 0xa5, (n + 3) / 4);
    const long dut_start = MiCo_time();
    const float dut_scale = __FP32toQ2T(dut, x, n);
    const long dut_cycles = MiCo_time() - dut_start;

    const long speedup_x100 = dut_cycles > 0 ? (scalar_cycles * 100) / dut_cycles : 0;
    printf("TIME %s n=%u scalar=%ld dut=%ld speedup_x100=%ld\n", name, (unsigned int)n, scalar_cycles, dut_cycles, speedup_x100);

    const int err = compare_bytes(name, ref, dut, n, ref_scale, dut_scale);
    MiCo_free(x);
    MiCo_free(ref);
    MiCo_free(dut);
    return err;
}

static int run_static_case(void) {
    static float x[Q2T_LANES] __attribute__((aligned(MICO_ALIGN))) = {
#if Q2T_LANES > 0
        0.0f, 0.49f, 0.5f, 0.51f,
#endif
#if Q2T_LANES > 4
        -0.49f, -0.5f, -0.51f, 1.0f
#endif
    };
    qbyte ref[(Q2T_LANES + 3) / 4];
    qbyte dut[(Q2T_LANES + 3) / 4];
    const size_t n = Q2T_LANES;

    const float ref_scale = scalar_q2t(ref, x, n);
    memset(dut, 0xa5, sizeof(dut));
    const float dut_scale = __FP32toQ2T(dut, x, n);

    return compare_bytes("static-exact", ref, dut, n, ref_scale, dut_scale);
}

int main() {
    int failures = 0;

    failures += run_static_case() != 0;
    failures += run_case("short-tail", Q2T_LANES > 1 ? Q2T_LANES - 1 : 3) != 0;
    failures += run_case("exact", Q2T_LANES) != 0;
    failures += run_case("long-tail", Q2T_LANES + 5) != 0;
    failures += run_case("vec-128", 128) != 0;
    failures += run_case("vec-512", 512) != 0;
    failures += run_case("vec-2048", 2048) != 0;
    failures += run_case("vec-8192", 8192) != 0;

    if(failures) {
        printf("Q2T_QUANT_TEST FAIL failures=%d\n", failures);
        return 1;
    }

    printf("Q2T_QUANT_TEST PASS\n");
    return 0;
}
