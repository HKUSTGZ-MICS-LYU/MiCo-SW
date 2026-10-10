/* CPU-level functional check of the RVV memory forms this port enables.
 *
 * All vector code lives in tests/coral_rvv_memforms_kernels.S: this bare-metal
 * zve32x toolchain cannot reach `main` in a translation unit that includes
 * <riscv_vector.h>, which is why the matmul kernels use the same split. Driving
 * the kernels from plain C also means the assembler's actual encodings -- not the
 * ones a bridge-level test hands in -- are what reaches the Coral LSU.
 *
 * Covered: constant-stride e8/e16 loads and stores (strides 3/6 through t1,
 * not the argument register), indexed e8/e32 (unordered/ordered), unit-stride
 * segments nf=2/3/4, indexed segment nf=3, whole-register 2, and mask load/store.
 * The stride cases check CPU scalar-rs2 scheduling, not just bridge decoding.
 *
 * The Coral RVV lane is gated by mstatus.VS, so main enables it before the first
 * vector instruction -- without that the very first RVV instruction never
 * completes and the core simply stops committing.
 *
 * RVV indexed offsets are *byte* offsets, so an e32 gather at byte offset 4 reads
 * lut32[1], not lut32[4]. The e32 expectations below are written that way.
 *
 * Build with -fno-tree-vectorize -fno-tree-slp-vectorize, SPRAM=1,
 * EXTRA_SOURCES=tests/coral_rvv_memforms_kernels.S.
 */
#include <stdint.h>
#include "sim_stdlib.h"
#include "coral_rvv_bench_trap.h"

#define GUARD ((int8_t)0x5a)

extern void coral_rvv_stride8_load(const int8_t *, int32_t, int8_t *, uint32_t);
extern void coral_rvv_stride8_store(int8_t *, int32_t, const int8_t *, uint32_t);
extern void coral_rvv_stride16_load(const int16_t *, int32_t, int16_t *, uint32_t);
extern void coral_rvv_stride16_store(int16_t *, int32_t, const int16_t *, uint32_t);
extern void coral_rvv_index8_load(const int8_t *, const uint8_t *, int8_t *, uint32_t);
extern void coral_rvv_index8_store(int8_t *, const uint8_t *, const int8_t *, uint32_t);
extern void coral_rvv_index32_load(const int32_t *, const uint32_t *, int32_t *, uint32_t);
extern void coral_rvv_index32_store(int32_t *, const uint32_t *, const int32_t *, uint32_t);
extern void coral_rvv_seg2_load(const int8_t *, int8_t *, int8_t *, uint32_t);
extern void coral_rvv_seg2_store(int8_t *, const int8_t *, const int8_t *, uint32_t);
extern void coral_rvv_seg4_load(const int8_t *, int8_t *, int32_t, uint32_t);
extern void coral_rvv_seg4_store(int8_t *, const int8_t *, int32_t, uint32_t);
extern void coral_rvv_seg3_load(const int8_t *, int8_t *, int32_t, uint32_t);
extern void coral_rvv_indexseg3_load(const int8_t *, const uint8_t *, int8_t *, uint32_t);
extern void coral_rvv_whole2_move(const int8_t *, int8_t *);
extern void coral_rvv_mask_roundtrip(const uint8_t *, uint8_t *, uint32_t);

static void text(const char *s) { while (*s) putchar(*s++); }
static void number(uint32_t n) {
    char b[10]; unsigned i = 0;
    do { b[i++] = (char)('0' + n % 10); n /= 10; } while (n);
    while (i) putchar(b[--i]);
}
static void fail(const char *what, uint32_t at) {
    text("CORAL_RVV_MEMFORMS "); text(what); text(" @"); number(at); putchar('\n');
}

static uint32_t failures;

static int8_t lut[512] __attribute__((aligned(16)));
static uint8_t idx8[64] __attribute__((aligned(16)));
static uint32_t idx32[64] __attribute__((aligned(16)));
static int8_t work[1024] __attribute__((aligned(16)));
static int8_t out[1024] __attribute__((aligned(16)));

/* Constant stride, end to end. Bits 24:20 of vlse/vsse name the stride register,
 * so these also cover scalar-rs2 scheduling, which a bridge-level test cannot
 * see. Strides are deliberately not 1. */
static void test_strided_e8(void) {
    const int32_t stride = 3;
    for (int i = 0; i < 256; ++i) lut[i] = (int8_t)(i * 13 + 5);
    for (int i = 0; i < 1024; ++i) work[i] = GUARD;
    coral_rvv_stride8_load(lut, stride, work, 16);
    for (int i = 0; i < 16; ++i)
        if (work[i] != lut[i * stride]) { failures++; return fail("vlse8.v", (uint32_t)i); }

    for (int i = 0; i < 1024; ++i) out[i] = GUARD;
    coral_rvv_stride8_store(out, stride, work, 16);
    for (int i = 0; i < 16; ++i)
        if (out[i * stride] != lut[i * stride]) { failures++; return fail("vsse8.v", (uint32_t)i); }
    /* Bytes between the strided elements must be untouched. */
    for (int i = 0; i < 16; ++i) {
        int32_t gap = i * stride + 1;
        if (gap < 16 * stride && out[gap] != GUARD) {
            failures++; return fail("vsse8.v-gap", (uint32_t)gap);
        }
    }
}

static void test_strided_e16(void) {
    const int32_t stride = 6;
    int16_t *lut16 = (int16_t *)lut;
    int16_t *work16 = (int16_t *)work;
    int16_t *out16 = (int16_t *)out;
    for (int i = 0; i < 128; ++i) lut16[i] = (int16_t)(i * 0x1234 + 7);
    for (int i = 0; i < 256; ++i) work16[i] = (int16_t)0x5a5a;
    coral_rvv_stride16_load(lut16, stride, work16, 8);
    for (int i = 0; i < 8; ++i) {
        int16_t want = *(const int16_t *)((const int8_t *)lut + i * stride);
        if (work16[i] != want) { failures++; return fail("vlse16.v", (uint32_t)i); }
    }
    for (int i = 0; i < 256; ++i) out16[i] = (int16_t)0x5a5a;
    coral_rvv_stride16_store(out16, stride, work16, 8);
    for (int i = 0; i < 8; ++i) {
        int16_t want = *(const int16_t *)((const int8_t *)lut + i * stride);
        int16_t got = *(const int16_t *)((const int8_t *)out + i * stride);
        if (got != want) { failures++; return fail("vsse16.v", (uint32_t)i); }
    }
}

static void test_indexed_e8(void) {
    for (int i = 0; i < 256; ++i) lut[i] = (int8_t)(i * 5 + 1);
    for (int i = 0; i < 64; ++i) idx8[i] = (uint8_t)((i * 3 + 2) & 0x7f);
    for (int i = 0; i < 1024; ++i) out[i] = GUARD;
    coral_rvv_index8_load(lut, idx8, work, 16);
    for (int i = 0; i < 16; ++i)
        if (work[i] != lut[idx8[i]]) { failures++; return fail("vluxei8.v", (uint32_t)i); }
    coral_rvv_index8_store(out, idx8, work, 16);
    for (int i = 0; i < 16; ++i)
        if (out[idx8[i]] != lut[idx8[i]]) { failures++; return fail("vsuxei8.v", (uint32_t)i); }
    if (out[0x7f] != GUARD) { failures++; return fail("vsuxei8.v-gap", 0); }
}

static void test_indexed_e32(void) {
    int32_t *lut32 = (int32_t *)lut;
    int32_t *work32 = (int32_t *)work;
    int32_t *out32 = (int32_t *)out;
    for (int i = 0; i < 64; ++i) lut32[i] = i * 0x01020304 + 7;
    /* RVV indexed offsets are byte offsets, not element indices, so keep them
     * 4-aligned here to make the expected element unambiguous. */
    for (int i = 0; i < 64; ++i) idx32[i] = (uint32_t)((i * 8 + 4) & 0x3c);
    for (int i = 0; i < 256; ++i) out32[i] = (int32_t)0x5a5a5a5a;
    coral_rvv_index32_load(lut32, idx32, work32, 4);
    for (int i = 0; i < 4; ++i) {
        int32_t want = *(const int32_t *)((const int8_t *)lut + idx32[i]);
        if (work32[i] != want) {
            failures++;
            text("CORAL_RVV_MEMFORMS vloxei32.v i="); number((uint32_t)i);
            text(" off="); number(idx32[i]);
            text(" got="); number((uint32_t)work32[i]);
            text(" want="); number((uint32_t)want);
            putchar('\n');
            return;
        }
    }
    coral_rvv_index32_store(out32, idx32, work32, 4);
    for (int i = 0; i < 4; ++i) {
        int32_t want = *(const int32_t *)((const int8_t *)lut + idx32[i]);
        int32_t got = *(const int32_t *)((const int8_t *)out + idx32[i]);
        if (got != want) { failures++; return fail("vsoxei32.v", (uint32_t)i); }
    }
}

static void test_segment2_e8(void) {
    for (int i = 0; i < 256; ++i) lut[i] = (int8_t)(i * 13 + 9);
    for (int i = 0; i < 1024; ++i) out[i] = GUARD;
    /* Element i of field f lives at lut[i*2 + f]. */
    coral_rvv_seg2_load(lut, work, work + 128, 8);
    for (int i = 0; i < 8; ++i) {
        if (work[i] != lut[i * 2]) { failures++; return fail("vlseg2e8.v-f0", (uint32_t)i); }
        if (work[128 + i] != lut[i * 2 + 1]) { failures++; return fail("vlseg2e8.v-f1", (uint32_t)i); }
    }
    coral_rvv_seg2_store(out, work, work + 128, 8);
    for (int i = 0; i < 8; ++i) {
        if (out[i * 2] != lut[i * 2]) { failures++; return fail("vsseg2e8.v-f0", (uint32_t)i); }
        if (out[i * 2 + 1] != lut[i * 2 + 1]) { failures++; return fail("vsseg2e8.v-f1", (uint32_t)i); }
    }
    if (out[16] != GUARD) { failures++; return fail("vsseg2e8.v-gap", 0); }
}

static void test_segment4_e8(void) {
    for (int i = 0; i < 256; ++i) lut[i] = (int8_t)(i * 17 + 3);
    for (int i = 0; i < 1024; ++i) out[i] = GUARD;
    coral_rvv_seg4_load(lut, work, 128, 4);
    for (int f = 0; f < 4; ++f)
        for (int i = 0; i < 4; ++i)
            if (work[f * 128 + i] != lut[i * 4 + f]) {
                failures++; return fail("vlseg4e8.v", (uint32_t)(f * 4 + i));
            }
    /* Re-interleave the four fields with the matching store and compare. */
    coral_rvv_seg4_store(out, work, 128, 4);
    for (int i = 0; i < 4; ++i)
        for (int f = 0; f < 4; ++f)
            if (out[i * 4 + f] != lut[i * 4 + f]) {
                failures++; return fail("vsseg4e8.v", (uint32_t)(i * 4 + f));
            }
    if (out[16] != GUARD) { failures++; return fail("vsseg4e8.v-gap", 0); }
}

static void test_segment3_e8(void) {
    for (int i = 0; i < 256; ++i) lut[i] = (int8_t)(i * 23 + 5);
    for (int i = 0; i < 1024; ++i) work[i] = GUARD;
    coral_rvv_seg3_load(lut, work, 128, 5);
    for (int f = 0; f < 3; ++f)
        for (int i = 0; i < 5; ++i)
            if (work[f * 128 + i] != lut[i * 3 + f]) {
                failures++; return fail("vlseg3e8.v", (uint32_t)(f * 5 + i));
            }
}

static void test_indexed_segment3_e8(void) {
    for (int i = 0; i < 256; ++i) lut[i] = (int8_t)(i * 29 + 7);
    for (int i = 0; i < 16; ++i) idx8[i] = (uint8_t)(4 + i * 5);
    for (int i = 0; i < 1024; ++i) work[i] = GUARD;
    coral_rvv_indexseg3_load(lut, idx8, work, 6);
    for (int f = 0; f < 3; ++f)
        for (int i = 0; i < 6; ++i)
            if (work[f * 6 + i] != lut[idx8[i] + f]) {
                failures++; return fail("vluxseg3ei8.v", (uint32_t)(f * 6 + i));
            }
}

static void test_whole_register_e8(void) {
    for (int i = 0; i < 256; ++i) lut[i] = (int8_t)(i * 3 + 1);
    for (int i = 0; i < 1024; ++i) out[i] = GUARD;
    coral_rvv_whole2_move(lut, out);
    for (int i = 0; i < 32; ++i)
        if (out[i] != lut[i]) { failures++; return fail("vl2re8.v", (uint32_t)i); }
    if (out[32] != GUARD) { failures++; return fail("vs2r.v-gap", 0); }
}

static void test_mask_e8(void) {
    uint8_t mbuf[16];
    for (int i = 0; i < 16; ++i) mbuf[i] = (uint8_t)(i == 0 ? 0xa5 : (i == 1 ? 0x3c : 0x00));
    for (int i = 0; i < 64; ++i) out[i] = GUARD;
    coral_rvv_mask_roundtrip(mbuf, (uint8_t *)out, 16);
    if ((uint8_t)out[0] != 0xa5 || (uint8_t)out[1] != 0x3c) {
        failures++; return fail("vlm.v/vsm.v", 0);
    }
    if (out[2] != GUARD) { failures++; return fail("vsm.v-past-vl", 0); }
}

int main(void) {
    coral_rvv_install_trap();
    /* The Coral RVV lane is gated by mstatus.VS, so enable it (and clear vstart)
     * before the first vector instruction; otherwise the very first RVV
     * instruction never completes and the core simply stops committing. */
    uint32_t vs = 0x600u, initial = 0x200u;
    asm volatile("csrc mstatus,%0\ncsrs mstatus,%1\ncsrw vstart,zero"
                 :: "r"(vs), "r"(initial) : "memory");
    text("STAGE index8\n");    test_indexed_e8();
    text("STAGE index32\n");   test_indexed_e32();
    text("STAGE stride8\n");   test_strided_e8();
    text("STAGE stride16\n");  test_strided_e16();
    text("STAGE seg2\n");      test_segment2_e8();
    text("STAGE seg4\n");      test_segment4_e8();
    text("STAGE seg3\n");      test_segment3_e8();
    text("STAGE idxseg3\n");   test_indexed_segment3_e8();
    text("STAGE whole2\n");    test_whole_register_e8();
    text("STAGE mask\n");      test_mask_e8();
    text(failures ? "CORAL_RVV_MEMFORMS FAIL\n" : "CORAL_RVV_MEMFORMS PASS\n");
    return failures ? 1 : 0;
}
