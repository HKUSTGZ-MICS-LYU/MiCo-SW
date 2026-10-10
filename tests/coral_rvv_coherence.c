#include <stdint.h>
#include <stdio.h>

/* Cached-RVV integration correctness, not a performance benchmark.
 * Build with automatic vectorization disabled. All non-asm accesses are scalar.
 * No software cache maintenance or hardware fences: ordering/coherence must be
 * supplied by the integrated scalar/vector memory paths.
 */
enum { WORDS = 16, ROUNDS = 4, THRASH_WORDS = 8 * 1024 / sizeof(uint32_t) };
static volatile uint32_t buffer[WORDS] __attribute__((aligned(64)));
static volatile uint32_t thrash[THRASH_WORDS] __attribute__((aligned(64)));

static uint32_t vector_read(const volatile uint32_t *address)
{
    uint32_t value;
    __asm__ volatile (
        "vsetivli zero, 1, e32, m1, ta, ma\n\t"
        "vle32.v v1, (%1)\n\t"
        "vmv.x.s %0, v1"
        : "=r" (value) : "r" (address) : "v1", "memory");
    return value;
}

static void vector_write(volatile uint32_t *address, uint32_t value)
{
    __asm__ volatile (
        "vsetivli zero, 1, e32, m1, ta, ma\n\t"
        "vmv.v.x v1, %1\n\t"
        "vse32.v v1, (%0)"
        : : "r" (address), "r" (value) : "v1", "memory");
}

static uint32_t scalar_pattern(unsigned round, unsigned word)
{
    return 0x13579bdfu ^ (round * 0x01010101u) ^ (word * 0x10204081u);
}

static uint32_t vector_pattern(unsigned round, unsigned word)
{
    return ~scalar_pattern(round, word);
}

int main(void)
{
    unsigned failed = 0;
    const uint32_t vs_initial = 1u << 9;
    __asm__ volatile (
        "csrs mstatus, %0\n\t"
        "csrw vstart, zero"
        : : "r" (vs_initial) : "memory");

    for (unsigned round = 0; round < ROUNDS; ++round) {
        /* Dirty every adjacent word of the same aligned cache line. */
        for (unsigned i = 0; i < WORDS; ++i)
            buffer[i] = scalar_pattern(round, i);

        for (unsigned i = 1; i < WORDS; i += 4) {
            /* A vector read must see a scalar store still in a dirty line. */
            failed |= vector_read(&buffer[i]) != scalar_pattern(round, i);
            /* Explicitly warm the scalar copy immediately before RVV writes. */
            failed |= buffer[i] != scalar_pattern(round, i);
            vector_write(&buffer[i], vector_pattern(round, i));
            failed |= buffer[i] != vector_pattern(round, i);
        }
        for (unsigned i = 0; i < WORDS; ++i) {
            uint32_t expected = (i % 4 == 1) ? vector_pattern(round, i)
                                            : scalar_pattern(round, i);
            failed |= buffer[i] != expected;
        }
    }

    /* Exceed the integration's D-cache capacity, forcing dirty writebacks.
     * A stale scalar line must not overwrite the earlier vector stores.
     * Read the entire sweep too, exercising dirty eviction and scalar refill.
     */
    for (unsigned i = 0; i < THRASH_WORDS; ++i)
        thrash[i] = 0xa5c30000u ^ i;
    for (unsigned i = 0; i < THRASH_WORDS; ++i)
        failed |= thrash[i] != (0xa5c30000u ^ i);

    for (unsigned i = 0; i < WORDS; ++i) {
        uint32_t expected = (i % 4 == 1) ? vector_pattern(ROUNDS - 1, i)
                                        : scalar_pattern(ROUNDS - 1, i);
        failed |= buffer[i] != expected;
        failed |= vector_read(&buffer[i]) != expected;
    }

    puts(failed ? "CORAL_RVV_COHERENCE FAIL" : "CORAL_RVV_COHERENCE PASS");
    return failed ? 1 : 0;
}
