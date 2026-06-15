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

#define Q8_VEC_LANES (VLEN / 32)

#ifndef Q8_CUSTOM_N
#ifdef QUANT_CUSTOM_N
#define Q8_CUSTOM_N QUANT_CUSTOM_N
#endif
#endif

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

static float scalar_q8(qbyte *qx, float *x, size_t n) {
    const float absmax = local_absmax(x, n);
    const float scale = 127.0f / absmax;

    if(absmax == 0.0f) {
        memset(qx, 0, n);
        return 0.0f;
    }

    for(size_t i = 0; i < n; ++i) {
        qx[i] = (qbyte)((int8_t)round_half_away(x[i] * scale));
    }

    return 1.0f / scale;
}

static void fill_case(float *x, size_t n) {
    static const float pattern[] = {
        0.0f, 0.125f, -0.125f, 0.25f,
        -0.25f, 0.49f, -0.49f, 0.5f,
        -0.5f, 0.75f, -0.75f, 0.999f,
        -0.999f, 1.0f, -1.0f, 0.03125f,
    };

    for(size_t i = 0; i < n; ++i) {
        x[i] = pattern[i % (sizeof(pattern) / sizeof(pattern[0]))];
    }
}

static int compare_bytes(const char *name, const qbyte *ref, const qbyte *dut, size_t n, float ref_scale, float dut_scale) {
    if(ref_scale != dut_scale) {
        printf("FAIL %s scale ref=%f dut=%f\n", name, ref_scale, dut_scale);
        return -1;
    }

    for(size_t i = 0; i < n; ++i) {
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
    qbyte *ref = (qbyte *)MiCo_alloc(n * sizeof(qbyte), MICO_ALIGN);
    qbyte *dut = (qbyte *)MiCo_alloc(n * sizeof(qbyte), MICO_ALIGN);

    if(!x || !ref || !dut) {
        printf("FAIL %s allocation\n", name);
        MiCo_free(x);
        MiCo_free(ref);
        MiCo_free(dut);
        return -1;
    }

    fill_case(x, n);

    const long scalar_start = MiCo_time();
    const float ref_scale = scalar_q8(ref, x, n);
    const long scalar_cycles = MiCo_time() - scalar_start;

    memset(dut, 0xa5, n);
    const long dut_start = MiCo_time();
    const float dut_scale = __FP32toQ8(dut, x, n);
    const long dut_cycles = MiCo_time() - dut_start;

    const long speedup_x100 = dut_cycles > 0 ? (scalar_cycles * 100) / dut_cycles : 0;
    printf("TIME %s n=%u scalar=%ld dut=%ld speedup_x100=%ld\n", name, (unsigned int)n, scalar_cycles, dut_cycles, speedup_x100);

    const int err = compare_bytes(name, ref, dut, n, ref_scale, dut_scale);
    MiCo_free(x);
    MiCo_free(ref);
    MiCo_free(dut);
    return err;
}

int main() {
    int failures = 0;

#ifdef Q8_CUSTOM_N
    failures += run_case("custom", Q8_CUSTOM_N) != 0;
#else
    failures += run_case("short-tail", Q8_VEC_LANES > 1 ? Q8_VEC_LANES - 1 : 3) != 0;
    failures += run_case("exact", Q8_VEC_LANES) != 0;
    failures += run_case("long-tail", Q8_VEC_LANES + 5) != 0;
    failures += run_case("vec-128", 128) != 0;
    failures += run_case("vec-512", 512) != 0;
    failures += run_case("vec-2048", 2048) != 0;
#endif

    if(failures) {
        printf("Q8_QUANT_TEST FAIL failures=%d\n", failures);
        return 1;
    }

    printf("Q8_QUANT_TEST PASS\n");
    return 0;
}
