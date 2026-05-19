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
#define ATT_N 64
#endif
#ifndef ATT_D
#define ATT_D 64
#endif

#define B ATT_B
#define H ATT_H
#define N ATT_N
#define D ATT_D

extern long EXPF_TIMER;

static void fill_tensor(float *data, size_t n, int mul) {
    for(size_t i = 0; i < n; ++i) {
        data[i] = (float)(((int)(i * (size_t)mul) % 256) - 128) / 256.0f;
    }
}

static float checksum_tensor(const float *data, size_t n) {
    float sum = 0.0f;
    for(size_t i = 0; i < n; ++i) {
        sum += data[i];
    }
    return sum;
}

int main() {
    Tensor4D_F32 q, k, v, y;
    const size_t tensor_elems = B * H * N * D;
    const size_t y_elems = B * N * H * D;

    q.data = (float *)malloc(tensor_elems * sizeof(float));
    k.data = (float *)malloc(tensor_elems * sizeof(float));
    v.data = (float *)malloc(tensor_elems * sizeof(float));
    y.data = (float *)malloc(y_elems * sizeof(float));

    if(!q.data || !k.data || !v.data || !y.data) {
        printf("KIVI_ATTENTION_TEST FAIL allocation\n");
        return 1;
    }

    q.shape[0] = B; q.shape[1] = H; q.shape[2] = N; q.shape[3] = D;
    k.shape[0] = B; k.shape[1] = H; k.shape[2] = N; k.shape[3] = D;
    v.shape[0] = B; v.shape[1] = H; v.shape[2] = N; v.shape[3] = D;
    y.shape[0] = B; y.shape[1] = N; y.shape[2] = H; y.shape[3] = D;

    fill_tensor(q.data, tensor_elems, 1);
    fill_tensor(k.data, tensor_elems, 13);
    fill_tensor(v.data, tensor_elems, 7);

    printf("Start KIVI Attention Benchmark B=%d H=%d N=%d D=%d\n", B, H, N, D);

    MiCo_reset_profilers();
    EXPF_TIMER = 0;
    long start = MiCo_time();
    MiCo_ViT_kivi_attention_f32(&y, &q, &k, &v, 8.0f);
    long cycles = MiCo_time() - start;
    float checksum = checksum_tensor(y.data, y_elems);

    printf("KIVI Attn Time: %ld\n", cycles);
    printf("KIVI Checksum: %f\n", checksum);
    MiCo_print_profilers();
    printf("EXPF_TIMER: %ld\n", EXPF_TIMER);
    printf("KIVI_ATTENTION_TEST PASS\n");

    free(q.data);
    free(k.data);
    free(v.data);
    free(y.data);
    return 0;
}
