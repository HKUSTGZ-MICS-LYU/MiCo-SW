#ifndef CORAL_RVV_BENCH_TRAP_H
#define CORAL_RVV_BENCH_TRAP_H
/* Diagnostic only: unsupported subset instructions must fail, not hang at PC 0. */
#ifdef RISCV_VEXII
#include <stdint.h>
#include "sim_stdlib.h"
static void __attribute__((interrupt("machine"), aligned(4))) coral_rvv_bench_trap(void) {
    uintptr_t cause, pc, value;
    __asm__ volatile("csrr %0, mcause" : "=r"(cause));
    __asm__ volatile("csrr %0, mepc" : "=r"(pc));
    __asm__ volatile("csrr %0, mtval" : "=r"(value));
    printf("CORAL_RVV_BENCH_TRAP mcause=%u mepc=%08x mtval=%08x\n",
           (unsigned)cause, (unsigned)pc, (unsigned)value);
    exit(1);
}
static inline void coral_rvv_install_trap(void) {
    __asm__ volatile("csrw mtvec, %0" :: "r"((uintptr_t)coral_rvv_bench_trap) : "memory");
}
#else
static inline void coral_rvv_install_trap(void) {}
#endif
#endif
