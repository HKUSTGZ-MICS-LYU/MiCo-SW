/* Hand-written RVV memory-form kernels. Vector code lives here rather than in C
 * intrinsics because this bare-metal zve32x toolchain cannot even reach `main`
 * in a translation unit that includes <riscv_vector.h>; the matmul kernels use
 * the same split. Only base I/M instructions.
 *
 * Every kernel takes the element count as its last argument and sets vl itself,
 * so the native REDUCE_LMUL path sees VL == vlmax of the requested LMUL.
 */
.text
.balign 4

/* Constant-stride kernels deliberately route the stride through t1 (x6) instead
 * of the argument's own a1 (x11). Bits 24:20 of vlse/vsse hold the stride
 * register number, so this proves both that the encoder places that number
 * correctly and that the Vexii plugin schedules the right scalar register;
 * using a1 would leave those two indistinguishable from an accidental hardcode.
 */

/* void coral_rvv_stride8_load(const int8_t *base, int32_t stride, int8_t *dst, size_t vl) */
.global coral_rvv_stride8_load
.type coral_rvv_stride8_load, @function
coral_rvv_stride8_load:
    mv t1, a1
    vsetvli t0, a3, e8, m1, ta, ma
    vlse8.v v8, (a0), t1
    vse8.v v8, (a2)
    ret

/* void coral_rvv_stride8_store(int8_t *base, int32_t stride, const int8_t *src, size_t vl) */
.global coral_rvv_stride8_store
.type coral_rvv_stride8_store, @function
coral_rvv_stride8_store:
    mv t1, a1
    vsetvli t0, a3, e8, m1, ta, ma
    vle8.v v8, (a2)
    vsse8.v v8, (a0), t1
    ret

/* void coral_rvv_stride16_load(const int16_t *base, int32_t stride, int16_t *dst, size_t vl) */
.global coral_rvv_stride16_load
.type coral_rvv_stride16_load, @function
coral_rvv_stride16_load:
    mv t1, a1
    vsetvli t0, a3, e16, m1, ta, ma
    vlse16.v v8, (a0), t1
    vse16.v v8, (a2)
    ret

/* void coral_rvv_stride16_store(int16_t *base, int32_t stride, const int16_t *src, size_t vl) */
.global coral_rvv_stride16_store
.type coral_rvv_stride16_store, @function
coral_rvv_stride16_store:
    mv t1, a1
    vsetvli t0, a3, e16, m1, ta, ma
    vle16.v v8, (a2)
    vsse16.v v8, (a0), t1
    ret

/* void coral_rvv_index8_load(const int8_t *base, const uint8_t *idx, int8_t *dst, size_t vl) */
.global coral_rvv_index8_load
.type coral_rvv_index8_load, @function
coral_rvv_index8_load:
    vsetvli t0, a3, e8, m1, ta, ma
    vle8.v v9, (a1)
    vluxei8.v v8, (a0), v9
    vse8.v v8, (a2)
    ret

/* void coral_rvv_index8_store(int8_t *base, const uint8_t *idx, const int8_t *src, size_t vl) */
.global coral_rvv_index8_store
.type coral_rvv_index8_store, @function
coral_rvv_index8_store:
    vsetvli t0, a3, e8, m1, ta, ma
    vle8.v v9, (a1)
    vle8.v v8, (a2)
    vsuxei8.v v8, (a0), v9
    ret

/* void coral_rvv_index32_load(const int32_t *base, const uint32_t *idx, int32_t *dst, size_t vl) */
.global coral_rvv_index32_load
.type coral_rvv_index32_load, @function
coral_rvv_index32_load:
    vsetvli t0, a3, e32, m1, ta, ma
    vle32.v v9, (a1)
    vloxei32.v v8, (a0), v9
    vse32.v v8, (a2)
    ret

/* void coral_rvv_index32_store(int32_t *base, const uint32_t *idx, const int32_t *src, size_t vl) */
.global coral_rvv_index32_store
.type coral_rvv_index32_store, @function
coral_rvv_index32_store:
    vsetvli t0, a3, e32, m1, ta, ma
    vle32.v v9, (a1)
    vle32.v v8, (a2)
    vsoxei32.v v8, (a0), v9
    ret

/* void coral_rvv_seg2_load(const int8_t *base, int8_t *f0, int8_t *f1, size_t vl) */
.global coral_rvv_seg2_load
.type coral_rvv_seg2_load, @function
coral_rvv_seg2_load:
    vsetvli t0, a3, e8, m1, ta, ma
    vlseg2e8.v v8, (a0)
    vse8.v v8, (a1)
    vse8.v v9, (a2)
    ret

/* void coral_rvv_seg2_store(int8_t *base, const int8_t *f0, const int8_t *f1, size_t vl) */
.global coral_rvv_seg2_store
.type coral_rvv_seg2_store, @function
coral_rvv_seg2_store:
    vsetvli t0, a3, e8, m1, ta, ma
    vle8.v v8, (a1)
    vle8.v v9, (a2)
    vsseg2e8.v v8, (a0)
    ret

/* void coral_rvv_seg4_load(const int8_t *base, int8_t *dst, int32_t fieldStride, size_t vl) */
.global coral_rvv_seg4_load
.type coral_rvv_seg4_load, @function
coral_rvv_seg4_load:
    vsetvli t0, a3, e8, m1, ta, ma
    vlseg4e8.v v8, (a0)
    vse8.v v8, (a1)
    add a1, a1, a2
    vse8.v v9, (a1)
    add a1, a1, a2
    vse8.v v10, (a1)
    add a1, a1, a2
    vse8.v v11, (a1)
    ret

/* void coral_rvv_seg3_load(const int8_t *base, int8_t *dst, int32_t fieldStride, size_t vl) */
.global coral_rvv_seg3_load
.type coral_rvv_seg3_load, @function
coral_rvv_seg3_load:
    vsetvli t0, a3, e8, m1, ta, ma
    vlseg3e8.v v8, (a0)
    vse8.v v8, (a1)
    add a1, a1, a2
    vse8.v v9, (a1)
    add a1, a1, a2
    vse8.v v10, (a1)
    ret

/* void coral_rvv_indexseg3_load(const int8_t *base, const uint8_t *idx,
 *                               int8_t *dst, size_t vl) */
.global coral_rvv_indexseg3_load
.type coral_rvv_indexseg3_load, @function
coral_rvv_indexseg3_load:
    vsetvli t0, a3, e8, m1, ta, ma
    vle8.v v11, (a1)
    vluxseg3ei8.v v8, (a0), v11
    vse8.v v8, (a2)
    add a2, a2, a3
    vse8.v v9, (a2)
    add a2, a2, a3
    vse8.v v10, (a2)
    ret

/* void coral_rvv_whole2_move(const int8_t *base, int8_t *dst)
 * Whole-register moves take no vl: the group is nf registers regardless of vtype.
 */
.global coral_rvv_whole2_move
.type coral_rvv_whole2_move, @function
coral_rvv_whole2_move:
    vl2re8.v v8, (a0)
    vs2r.v v8, (a1)
    ret

/* void coral_rvv_mask_roundtrip(const uint8_t *in, uint8_t *out, size_t vl)
 * Transfers ceil(vl/8) bytes of the mask register, so with vl = 16 exactly two
 * bytes move and the rest of the destination is untouched.
 */
.global coral_rvv_mask_roundtrip
.type coral_rvv_mask_roundtrip, @function
coral_rvv_mask_roundtrip:
    /* Three arguments: the element count is a2, not the four-argument a3. */
    vsetvli t0, a2, e8, m1, ta, ma
    vlm.v v0, (a0)
    vsm.v v0, (a1)
    ret

/* void coral_rvv_seg4_store(int8_t *base, const int8_t *src, int32_t fieldStride, size_t vl) */
.global coral_rvv_seg4_store
.type coral_rvv_seg4_store, @function
coral_rvv_seg4_store:
    vsetvli t0, a3, e8, m1, ta, ma
    vle8.v v8, (a1)
    add a1, a1, a2
    vle8.v v9, (a1)
    add a1, a1, a2
    vle8.v v10, (a1)
    add a1, a1, a2
    vle8.v v11, (a1)
    vsseg4e8.v v8, (a0)
    ret
