/* VexiiRiscv board support for Embench.

   Implements the four hooks Embench's support/main.c calls, so a benchmark can
   be built for MiCoSoc and simulated with MiCoSocSim without patching Embench
   itself:

     initialise_board()  - set up the BEEBS bump heap
     start_trigger()     - snapshot rdcycle before benchmark()
     stop_trigger()      - print CFU_AGENT_PROFILE <name>=<cycles> after it

   warm_caches() is benchmark-owned (all 19 Embench benchmarks define it), so
   the board deliberately does not provide it.

   All printing happens outside the timed region, so UART cost never pollutes
   the measurement. The profile line uses the CFU_AGENT_PROFILE format already
   parsed by the agent framework.

   SPDX-License-Identifier: MIT */

#include <stdint.h>
#include <stdio.h>
#include <string.h>

#include "support.h"
#include "embench_obs.h"

#ifndef EMBENCH_NAME
#define EMBENCH_NAME embench
#endif

/* Allow -DEMBENCH_NAME=crc32 on the command line: stringify the token so the
   build does not need shell quoting. */
#define EMBENCH_STRINGIFY_(x) #x
#define EMBENCH_STRINGIFY(x) EMBENCH_STRINGIFY_(x)

/* 64 KiB matches the Embench footprint contract (<=64 kB RAM). */
#ifndef EMBENCH_HEAP_BYTES
#define EMBENCH_HEAP_BYTES (64u * 1024u)
#endif

static uint8_t embench_heap[EMBENCH_HEAP_BYTES] __attribute__((aligned(8)));

static uint32_t embench_start_cycles;
static uint32_t embench_cycles;

static inline uint32_t embench_rdcycle(void)
{
  uint32_t value;
  __asm__ volatile("rdcycle %0" : "=r"(value));
  return value;
}

void
initialise_board(void)
{
  init_heap_beebs(embench_heap, sizeof(embench_heap));
  embench_obs_init();
}

void __attribute__((noinline)) __attribute__((externally_visible))
start_trigger(void)
{
  /* Observation counters describe the timed region only. */
  embench_obs_reset();
  embench_start_cycles = embench_rdcycle();
}

void __attribute__((noinline)) __attribute__((externally_visible))
stop_trigger(void)
{
  embench_cycles = embench_rdcycle() - embench_start_cycles;
  printf("CFU_AGENT_PROFILE %s=%u\n", EMBENCH_STRINGIFY(EMBENCH_NAME),
         (unsigned)embench_cycles);
  embench_obs_dump();
}

/* warm_caches() is provided by each benchmark (support.h documents it as
   benchmark-owned), so the board must not define it. */

#ifdef EMBENCH_OBS

typedef struct
{
  const char *name;
  uint32_t cycles;
  uint32_t calls;
  uint32_t depth;
} embench_obs_entry_t;

static embench_obs_entry_t embench_obs_table[EMBENCH_OBS_MAX];
static size_t embench_obs_count;
static int embench_obs_overflowed;

static embench_obs_entry_t *
embench_obs_find(const char *name)
{
  size_t i;

  for (i = 0; i < embench_obs_count; ++i)
    {
      if (strcmp(embench_obs_table[i].name, name) == 0)
        {
          return &embench_obs_table[i];
        }
    }
  return NULL;
}

void
embench_obs_init(void)
{
  embench_obs_count = 0;
  embench_obs_overflowed = 0;
}

void
embench_obs_reset(void)
{
  size_t i;

  for (i = 0; i < embench_obs_count; ++i)
    {
      embench_obs_table[i].cycles = 0;
      embench_obs_table[i].calls = 0;
      embench_obs_table[i].depth = 0;
    }
}

uint32_t
embench_obs_enter_scope(const char *name)
{
  embench_obs_entry_t *entry = embench_obs_find(name);

  if (entry == NULL)
    {
      if (embench_obs_count >= EMBENCH_OBS_MAX)
        {
          if (!embench_obs_overflowed)
            {
              embench_obs_overflowed = 1;
              printf("CFU_AGENT_PROFILE obs_overflow=%u\n",
                     (unsigned)embench_obs_count);
            }
          return 0;
        }
      entry = &embench_obs_table[embench_obs_count++];
      entry->name = name;
      entry->cycles = 0;
      entry->calls = 0;
      entry->depth = 0;
    }

  entry->depth++;
  /* Only the outermost frame is timed; nested frames return 0 as a sentinel. */
  return (entry->depth == 1) ? embench_rdcycle() : 0;
}

void
embench_obs_exit_scope(const char *name, uint32_t start_cycles)
{
  embench_obs_entry_t *entry = embench_obs_find(name);

  if (entry == NULL || entry->depth == 0)
    {
      return;
    }
  entry->depth--;
  if (start_cycles == 0)
    {
      return;
    }
  entry->cycles += embench_rdcycle() - start_cycles;
  entry->calls++;
}

void
embench_obs_dump(void)
{
  size_t i;

  for (i = 0; i < embench_obs_count; ++i)
    {
      printf("CFU_AGENT_PROFILE %s=%u calls=%u\n", embench_obs_table[i].name,
             (unsigned)embench_obs_table[i].cycles,
             (unsigned)embench_obs_table[i].calls);
    }
}

#else

void
embench_obs_init(void)
{
}

void
embench_obs_reset(void)
{
}

void
embench_obs_dump(void)
{
}

#endif /* EMBENCH_OBS */
