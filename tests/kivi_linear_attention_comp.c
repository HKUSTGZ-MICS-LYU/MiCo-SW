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

#ifndef KIVI_LIN_B
#define KIVI_LIN_B 1
#endif
#ifndef KIVI_LIN_H
#define KIVI_LIN_H 4
#endif
#ifndef KIVI_LIN_N
#define KIVI_LIN_N 32
#endif
#ifndef KIVI_LIN_D
#define KIVI_LIN_D 64
#endif
#ifndef KIVI_LIN_M
#define KIVI_LIN_M KIVI_LIN_D
#endif

#define B KIVI_LIN_B
#define H KIVI_LIN_H
#define N KIVI_LIN_N
#define D KIVI_LIN_D
#define M KIVI_LIN_M

extern long EXPF_TIMER;

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
    double dot = 0.0;
    double norm_a = 0.0;
    double norm_b = 0.0;
    for (size_t i = 0; i < n; i++){
        dot += (double)a[i] * (double)b[i];
        norm_a += (double)a[i] * (double)a[i];
        norm_b += (double)b[i] * (double)b[i];
    }
    return (float)(dot / (sqrt(norm_a) * sqrt(norm_b) + 1e-8));
}

static void print_tensor_range(const char *name, const float *data, size_t n){
    float vmin = data[0];
    float vmax = data[0];
    for (size_t i = 1; i < n; i++){
        if (data[i] < vmin) vmin = data[i];
        if (data[i] > vmax) vmax = data[i];
    }
    printf("  %s: [%+.6f, %+.6f]  (first=%.6f, last=%.6f)\n",
           name, vmin, vmax, data[0], data[n - 1]);
}

static void fill_input(float *data, size_t n, int mul, int add, float denom){
    for (size_t i = 0; i < n; i++){
        data[i] = (float)((int)((i * (size_t)mul + (size_t)add) % 1024) - 512) / denom;
    }
}

int main(){
    printf("=== KIVI Linear Attention Testbench ===\n");
    printf("Shape: B=%d H=%d N=%d D=%d M=%d\n", B, H, N, D, M);

    const size_t qk_size = (size_t)B * H * N * D;
    const size_t v_size = (size_t)B * H * N * M;
    const size_t y_size = (size_t)B * N * H * M;

    float *q_data = (float *)malloc(qk_size * sizeof(float));
    float *k_data = (float *)malloc(qk_size * sizeof(float));
    float *v_data = (float *)malloc(v_size * sizeof(float));
    float *y_ref_data = (float *)malloc(y_size * sizeof(float));
    float *y_kivi_data = (float *)malloc(y_size * sizeof(float));

    if (!q_data || !k_data || !v_data || !y_ref_data || !y_kivi_data){
        printf("ERROR: malloc failed\n");
        return 1;
    }

    fill_input(q_data, qk_size, 131, 17, 1024.0f);
    fill_input(k_data, qk_size, 257, 31, 1024.0f);
    fill_input(v_data, v_size, 59, 73, 1024.0f);

    printf("Input statistics:\n");
    print_tensor_range("Q", q_data, qk_size);
    print_tensor_range("K", k_data, qk_size);
    print_tensor_range("V", v_data, v_size);
    printf("\n");

    Tensor4D_F32 q = { .shape = {B, H, N, D}, .data = q_data };
    Tensor4D_F32 k = { .shape = {B, H, N, D}, .data = k_data };
    Tensor4D_F32 v = { .shape = {B, H, N, M}, .data = v_data };
    Tensor4D_F32 y_ref = { .shape = {B, N, H, M}, .data = y_ref_data };
    Tensor4D_F32 y_kivi = { .shape = {B, N, H, M}, .data = y_kivi_data };

    const float eps = 1e-6f;

    MiCo_reset_profilers();
    EXPF_TIMER = 0;
    long start = MiCo_time();
    MiCo_linear_attention_f32(&y_ref, &q, &k, &v, eps);
    long ref_time = MiCo_time() - start;
    long ref_attn_time = ATTN_TIMER;
    printf("Reference Linear Attention:\n");
    printf("  Time: %ld cycles\n", ref_time);
    print_tensor_range("Y_ref", y_ref_data, y_size);
    MiCo_print_profilers();
    printf("  EXPF_TIMER: %ld\n\n", EXPF_TIMER);

    MiCo_reset_profilers();
    EXPF_TIMER = 0;
    start = MiCo_time();
    MiCo_kivi_linear_attention(&y_kivi, &q, &k, &v, eps);
    long kivi_time = MiCo_time() - start;
    long kivi_attn_time = ATTN_TIMER;
    printf("KIVI Linear Attention (INT8xINT2 context):\n");
    printf("  Time: %ld cycles\n", kivi_time);
    print_tensor_range("Y_kivi", y_kivi_data, y_size);
    MiCo_print_profilers();
    printf("  EXPF_TIMER: %ld\n\n", EXPF_TIMER);

    printf("=== First 8 output elements ===\n");
    printf("  %-12s %-12s %-12s\n", "Ref", "KIVI", "Diff");
    for (size_t i = 0; i < 8 && i < y_size; i++){
        printf("  %+12.6f %+12.6f %+12.6f\n",
               y_ref_data[i], y_kivi_data[i], y_ref_data[i] - y_kivi_data[i]);
    }
    printf("\n");

    float max_err = compute_max_abs_error(y_ref_data, y_kivi_data, y_size);
    float mse = compute_mse(y_ref_data, y_kivi_data, y_size);
    float cos_sim = compute_cosine_similarity(y_ref_data, y_kivi_data, y_size);
    long speedup_milli = 0;
    if (kivi_attn_time > 0){
        speedup_milli = (long)(((long long)ref_attn_time * 1000LL) / (long long)kivi_attn_time);
    }

    printf("=== Comparison ===\n");
    printf("  Ref ATTN_TIMER:       %ld\n", ref_attn_time);
    printf("  KIVI ATTN_TIMER:      %ld\n", kivi_attn_time);
    printf("  Speedup milli:        %ld\n", speedup_milli);
    printf("  Max absolute error:   %.6f\n", max_err);
    printf("  MSE:                  %.8f\n", mse);
    printf("  RMSE:                 %.6f\n", sqrtf(mse));
    printf("  Cosine similarity:    %.6f\n", cos_sim);
    printf("KIVI_LINEAR_CHECK max_err_u=%d mse_u=%d rmse_u=%d cos_u=%d speedup_milli=%ld\n",
           (int)(max_err * 1000000.0f + 0.5f),
           (int)(mse * 1000000000.0f + 0.5f),
           (int)(sqrtf(mse) * 1000000.0f + 0.5f),
           (int)(cos_sim * 1000000.0f + 0.5f),
           speedup_milli);

    const size_t kv_fp32_bytes = ((size_t)B * H * N * D + (size_t)B * H * N * M) * sizeof(float);
    const size_t kv_kivi_bytes = (size_t)B * H * (
        D * N + D * sizeof(float) +
        M * ((N + 3) / 4) + M * sizeof(float)
    );
    printf("\n=== Memory Estimate For Quantized K/V Phase ===\n");
    printf("  FP32 phi(K)+V: %zu bytes\n", kv_fp32_bytes);
    printf("  KIVI buffers:  %zu bytes\n", kv_kivi_bytes);
    printf("  Compression:   %.2fx\n", (float)kv_fp32_bytes / (float)kv_kivi_bytes);

    free(q_data);
    free(k_data);
    free(v_data);
    free(y_ref_data);
    free(y_kivi_data);

    printf("\nDone.\n");
    return 0;
}
