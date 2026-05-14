#ifdef RISCV_VEXII
#include "sim_stdlib.h"
#else
#include <stdio.h>
#include <stdlib.h>
#endif

#include "profile.h"
#include "mico_nn.h"
#include "mico_qnn.h"

#ifndef ATT_B
#define ATT_B 1
#endif
#ifndef ATT_H
#define ATT_H 4
#endif
#ifndef ATT_N
#define ATT_N 8
#endif
#ifndef ATT_D
#define ATT_D 64
#endif

#define B ATT_B
#define H ATT_H
#define N ATT_N
#define D ATT_D

int main(){
    Tensor4D_F32 q, k, v;
    Tensor4D_F32 y;

    // Allocate and init q: [B, H, N, D]
    q.data = (float*)malloc(B * H * N * D * sizeof(float));
    q.shape[0] = B;  q.shape[1] = H;  q.shape[2] = N;  q.shape[3] = D;
    for (int i = 0; i < B * H * N * D; i++)
        q.data[i] = (float)(i % 256) / 256.0f;

    // Allocate and init k: [B, H, N, D]
    k.data = (float*)malloc(B * H * N * D * sizeof(float));
    k.shape[0] = B;  k.shape[1] = H;  k.shape[2] = N;  k.shape[3] = D;
    for (int i = 0; i < B * H * N * D; i++)
        k.data[i] = (float)((i * 13) % 256) / 256.0f;

    // Allocate and init v: [B, H, N, D]
    v.data = (float*)malloc(B * H * N * D * sizeof(float));
    v.shape[0] = B;  v.shape[1] = H;  v.shape[2] = N;  v.shape[3] = D;
    for (int i = 0; i < B * H * N * D; i++)
        v.data[i] = (float)((i * 7) % 256) / 256.0f;

    // Allocate y for ViT attention: [B, N, H, D]
    y.data = (float*)malloc(B * N * H * D * sizeof(float));
    y.shape[0] = B;  y.shape[1] = N;  y.shape[2] = H;  y.shape[3] = D;

    printf("Start Attn Benchmarking...\n");

    // Test Regular Attention
    MiCo_reset_profilers();
    long start = MiCo_time();
    MiCo_ViT_attention_f32(&y, &q, &k, &v, 8.0);
    long regular_attn_time = MiCo_time() - start;
    printf("Regular Attn Time: %ld\n", regular_attn_time);
    MiCo_print_profilers();

    // Test Linear Attention
    MiCo_reset_profilers();
    y.shape[0] = B;  y.shape[1] = N;  y.shape[2] = H;  y.shape[3] = D;
    start = MiCo_time();
    MiCo_linear_attention_f32(&y, &q, &k, &v, 1e-6);
    long linear_attn_time = MiCo_time() - start;
    printf("Linear Attn Time: %ld\n", linear_attn_time);
    MiCo_print_profilers();

    free(q.data);
    free(k.data);
    free(v.data);
    free(y.data);

    return 0;
}
