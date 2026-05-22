#ifdef RISCV_VEXII
#include "sim_stdlib.h"
#else
#include <stdio.h>
#include <stdlib.h>
#endif

#include <math.h>
#include "profile.h"
#include "mico_nn.h"
#include "mico_qnn.h"

#ifndef KIVI_B
#define KIVI_B 1
#endif
#ifndef KIVI_H
#define KIVI_H 4
#endif
#ifndef KIVI_I
#define KIVI_I 8
#endif
#ifndef KIVI_J
#define KIVI_J 8
#endif
#ifndef KIVI_F
#define KIVI_F 64
#endif

#define B KIVI_B
#define H KIVI_H
#define I KIVI_I
#define J KIVI_J
#define F KIVI_F

extern long EXPF_TIMER;

#ifdef KIVI_COMPARE_REF
void MiCo_ViT_kivi_attention_ref_f32(
    Tensor4D_F32 *y,
    const Tensor4D_F32 *q,
    const Tensor4D_F32 *k,
    const Tensor4D_F32 *v,
    const float scale
);
#endif

static float compute_max_abs_error(const float *a, const float *b, size_t n){
    float max_err = 0.0f;
    for (size_t i = 0; i < n; i++){
        float err = fabsf(a[i] - b[i]);
        if (err > max_err) max_err = err;
    }
    return max_err;
}

static float compute_mse(const float *a, const float *b, size_t n){
    double sum_sq = 0.0;
    for (size_t i = 0; i < n; i++){
        float diff = a[i] - b[i];
        sum_sq += (double)diff * (double)diff;
    }
    return (float)(sum_sq / (double)n);
}

static float compute_cosine_similarity(const float *a, const float *b, size_t n){
    double dot = 0.0, norm_a = 0.0, norm_b = 0.0;
    for (size_t i = 0; i < n; i++){
        dot += (double)a[i] * (double)b[i];
        norm_a += (double)a[i] * (double)a[i];
        norm_b += (double)b[i] * (double)b[i];
    }
    return (float)(dot / (sqrt(norm_a) * sqrt(norm_b) + 1e-8));
}

static void print_tensor_range(const char *name, const float *data, size_t n){
    float vmin = data[0], vmax = data[0];
    for (size_t i = 1; i < n; i++){
        if (data[i] < vmin) vmin = data[i];
        if (data[i] > vmax) vmax = data[i];
    }
    printf("  %s: [%+.6f, %+.6f]  (first=%.6f, last=%.6f)\n",
           name, vmin, vmax, data[0], data[n-1]);
}

int main(){
    printf("=== KIVI Attention Testbench ===\n");
    printf("Shape: B=%d H=%d I=%d J=%d F=%d\n", B, H, I, J, F);
    printf("Tensor sizes: Q=[%d,%d,%d,%d] K=[%d,%d,%d,%d] V=[%d,%d,%d,%d]\n\n",
           B, H, I, F, B, H, J, F, B, H, J, F);

    const size_t q_size  = (size_t)B * H * I * F;
    const size_t kv_size = (size_t)B * H * J * F;
    const size_t y_size  = (size_t)B * I * H * F;

    // Allocate
    float *q_data = (float*)malloc(q_size * sizeof(float));
    float *k_data = (float*)malloc(kv_size * sizeof(float));
    float *v_data = (float*)malloc(kv_size * sizeof(float));
    float *y_ref_data  = (float*)malloc(y_size * sizeof(float));
    float *y_kivi_data = (float*)malloc(y_size * sizeof(float));
#ifdef KIVI_COMPARE_REF
    float *y_kivi_ref_data = (float*)malloc(y_size * sizeof(float));
#else
    float *y_kivi_ref_data = NULL;
#endif

    if (!q_data || !k_data || !v_data || !y_ref_data || !y_kivi_data
#ifdef KIVI_COMPARE_REF
        || !y_kivi_ref_data
#endif
    ){
        printf("ERROR: malloc failed\n");
        return 1;
    }

    // Initialize with deterministic data in [-0.5, 0.5)
    for (size_t i = 0; i < q_size; i++)
        q_data[i] = (float)((int)((i * 131 + 17) % 1024) - 512) / 1024.0f;
    for (size_t i = 0; i < kv_size; i++)
        k_data[i] = (float)((int)((i * 257 + 31) % 1024) - 512) / 1024.0f;
    for (size_t i = 0; i < kv_size; i++)
        v_data[i] = (float)((int)((i * 59  + 73) % 1024) - 512) / 1024.0f;

    const float attn_scale = sqrtf((float)F);

    printf("Input statistics:\n");
    print_tensor_range("Q", q_data, q_size);
    print_tensor_range("K", k_data, kv_size);
    print_tensor_range("V", v_data, kv_size);
    printf("\n");

    // Build tensor structs
    Tensor4D_F32 q  = { .shape = {B, H, I, F}, .data = q_data };
    Tensor4D_F32 k  = { .shape = {B, H, J, F}, .data = k_data };
    Tensor4D_F32 v  = { .shape = {B, H, J, F}, .data = v_data };
    Tensor4D_F32 y_ref  = { .shape = {B, I, H, F}, .data = y_ref_data };
    Tensor4D_F32 y_kivi = { .shape = {B, I, H, F}, .data = y_kivi_data };
#ifdef KIVI_COMPARE_REF
    Tensor4D_F32 y_kivi_ref = { .shape = {B, I, H, F}, .data = y_kivi_ref_data };
#endif

    long ref_attn_time = 0;

#ifndef KIVI_ONLY
    // ---- Reference FP32 Attention ----
    MiCo_reset_profilers();
    EXPF_TIMER = 0;
    long start = MiCo_time();
    MiCo_ViT_attention_f32(&y_ref, &q, &k, &v, attn_scale);
    long ref_time = MiCo_time() - start;
    ref_attn_time = ATTN_TIMER;
    printf("Reference (FP32) Attention:\n");
    printf("  Time: %ld cycles\n", ref_time);
    print_tensor_range("Y_ref", y_ref_data, y_size);
    MiCo_print_profilers();
    printf("\n");
#else
    printf("KIVI_ONLY: skipping FP32 reference attention\n\n");
    long start = 0;
#endif

    // ---- KIVI Attention ----
    MiCo_reset_profilers();
    EXPF_TIMER = 0;
    start = MiCo_time();
    MiCo_ViT_kivi_attention_f32(&y_kivi, &q, &k, &v, attn_scale);
    long kivi_time = MiCo_time() - start;
    long kivi_attn_time = ATTN_TIMER;
    printf("KIVI (1.58-bit KV) Attention:\n");
    printf("  Time: %ld cycles\n", kivi_time);
    print_tensor_range("Y_kivi", y_kivi_data, y_size);
    MiCo_print_profilers();
    printf("\n");

    long speedup_milli = 0;
    if (kivi_attn_time > 0){
        speedup_milli = (long)(((long long)ref_attn_time * 1000LL) / (long long)kivi_attn_time);
    }
#ifndef KIVI_ONLY
    printf("=== Speed Comparison (ATTN_TIMER) ===\n");
    printf("KIVI_SPEED_COMPARE ref_attn=%ld kivi_attn=%ld speedup_milli=%ld faster=%d\n",
           ref_attn_time,
           kivi_attn_time,
           speedup_milli,
           kivi_attn_time > 0 && kivi_attn_time < ref_attn_time);
    printf("\n");
#else
    printf("KIVI_ONLY_RESULT kivi_attn=%ld total_time=%ld\n\n", kivi_attn_time, kivi_time);
#endif

#ifdef KIVI_COMPARE_REF
    // ---- KIVI Reference Schedule ----
    MiCo_reset_profilers();
    EXPF_TIMER = 0;
    start = MiCo_time();
    MiCo_ViT_kivi_attention_ref_f32(&y_kivi_ref, &q, &k, &v, attn_scale);
    long kivi_ref_time = MiCo_time() - start;
    printf("KIVI Reference Schedule:\n");
    printf("  Time: %ld cycles\n", kivi_ref_time);
    print_tensor_range("Y_kivi_ref", y_kivi_ref_data, y_size);
    MiCo_print_profilers();
    printf("\n");
#endif

#ifndef KIVI_ONLY
    // ---- Per-element comparison (first few elements) ----
    printf("=== First 8 output elements ===\n");
    printf("  %-12s %-12s %-12s\n", "Ref", "KIVI", "Diff");
    for (size_t i = 0; i < 8 && i < y_size; i++){
        printf("  %+12.6f %+12.6f %+12.6f\n",
               y_ref_data[i], y_kivi_data[i], y_ref_data[i] - y_kivi_data[i]);
    }
    printf("\n");

    // ---- Error Metrics ----
    printf("=== Error Metrics (KIVI vs FP32 Reference) ===\n");
    float max_err = compute_max_abs_error(y_ref_data, y_kivi_data, y_size);
    float mse     = compute_mse(y_ref_data, y_kivi_data, y_size);
    float cos_sim = compute_cosine_similarity(y_ref_data, y_kivi_data, y_size);

    printf("  Max absolute error:   %.6f\n", max_err);
    printf("  MSE:                  %.8f\n", mse);
    printf("  RMSE:                 %.6f\n", sqrtf(mse));
    printf("  Cosine similarity:    %.6f\n", cos_sim);
    int max_err_u = (int)(max_err * 1000000.0f + 0.5f);
    int mse_u = (int)(mse * 1000000000.0f + 0.5f);
    int rmse_u = (int)(sqrtf(mse) * 1000000.0f + 0.5f);
    int cos_u = (int)(cos_sim * 1000000.0f + 0.5f);
    printf("KIVI_FP32_CHECK max_err_u=%d mse_u=%d rmse_u=%d cos_u=%d\n",
           max_err_u, mse_u, rmse_u, cos_u);

#ifdef KIVI_COMPARE_REF
    printf("\n=== Error Metrics (Optimized KIVI vs Reference KIVI Schedule) ===\n");
    float kivi_ref_max_err = compute_max_abs_error(y_kivi_ref_data, y_kivi_data, y_size);
    float kivi_ref_mse     = compute_mse(y_kivi_ref_data, y_kivi_data, y_size);
    float kivi_ref_cos_sim = compute_cosine_similarity(y_kivi_ref_data, y_kivi_data, y_size);
    printf("  Max absolute error:   %.8f\n", kivi_ref_max_err);
    printf("  MSE:                  %.10f\n", kivi_ref_mse);
    printf("  RMSE:                 %.8f\n", sqrtf(kivi_ref_mse));
    printf("  Cosine similarity:    %.8f\n", kivi_ref_cos_sim);
    int kivi_ref_max_err_u = (int)(kivi_ref_max_err * 1000000.0f + 0.5f);
    int kivi_ref_mse_u = (int)(kivi_ref_mse * 1000000000.0f + 0.5f);
    int kivi_ref_cos_u = (int)(kivi_ref_cos_sim * 1000000.0f + 0.5f);
    printf("KIVI_REF_CHECK max_err_u=%d mse_u=%d cos_u=%d\n",
           kivi_ref_max_err_u, kivi_ref_mse_u, kivi_ref_cos_u);
    if (kivi_ref_max_err > 0.0001f){
        printf("KIVI_REF_CHECK FAIL\n");
        return 1;
    }
    printf("KIVI_REF_CHECK PASS\n");
#endif

    // ---- Per-token error breakdown ----
    printf("\n=== Per-position max absolute error ===\n");
    for (size_t pos = 0; pos < I; pos++){
        float pos_max_err = 0.0f;
        for (size_t b = 0; b < B; b++){
            for (size_t h = 0; h < H; h++){
                for (size_t f = 0; f < F; f++){
                    size_t idx = ((b * I + pos) * H + h) * F + f;
                    float err = fabsf(y_ref_data[idx] - y_kivi_data[idx]);
                    if (err > pos_max_err) pos_max_err = err;
                }
            }
        }
        printf("  Position %zu: max_err=%.6f\n", pos, pos_max_err);
    }

    // ---- Memory savings estimate ----
    size_t kv_fp32_bytes = 2 * B * H * J * F * sizeof(float);
    size_t kv_kivi_bytes = B * H * (
        F * ((J + 3) / 4) + F * sizeof(float) +
        J * ((F + 3) / 4) + J * sizeof(float)
    );
    printf("\n=== Memory Comparison (KV cache per forward pass) ===\n");
    printf("  FP32 KV:    %zu bytes\n", kv_fp32_bytes);
    printf("  KIVI KV:    %zu bytes\n", kv_kivi_bytes);
    printf("  Compression: %.1fx\n", (float)kv_fp32_bytes / (float)kv_kivi_bytes);
#endif

    // Cleanup
    free(q_data);
    free(k_data);
    free(v_data);
    free(y_ref_data);
    free(y_kivi_data);
#ifdef KIVI_COMPARE_REF
    free(y_kivi_ref_data);
#endif

    printf("\nDone.\n");
    return 0;
}
