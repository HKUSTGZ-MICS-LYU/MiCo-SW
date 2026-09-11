/* Observation-point instrumentation for Embench on VexiiRiscv.

   The instrumenter (agents/cfu_design_agent/embench_instrument.py) inserts a
   single EMBENCH_OBS_ENTER(id) at the start of a chosen function or block.
   Scope exit is handled by GCC's cleanup attribute, so the counter is closed on
   every exit path including early `return`, `break` and `continue` - a plain
   "insert EXIT before the closing brace" would silently miss those.

   Counters are only compiled in when EMBENCH_OBS is defined, so the reference
   build stays untouched. Recursion is handled by depth counting: only the
   outermost frame for a given id accumulates cycles.

   SPDX-License-Identifier: MIT */

#ifndef VEXII_EMBENCH_OBS_H
#define VEXII_EMBENCH_OBS_H

#include <stdint.h>

/* Fixed-size table: observation points are few and known at instrumentation
   time. Exceeding it prints a warning instead of corrupting memory. */
#ifndef EMBENCH_OBS_MAX
#define EMBENCH_OBS_MAX 96
#endif

/* Always declared: the board calls these unconditionally, and they compile to
   no-ops when EMBENCH_OBS is not defined. */
void embench_obs_init(void);
void embench_obs_reset(void);
void embench_obs_dump(void);

#ifdef EMBENCH_OBS

typedef struct
{
  const char *name;
  uint32_t start_cycles;
} embench_obs_scope_t;

uint32_t embench_obs_enter_scope(const char *name);
void embench_obs_exit_scope(const char *name, uint32_t start_cycles);

static inline void
embench_obs_cleanup(const embench_obs_scope_t *scope)
{
  embench_obs_exit_scope(scope->name, scope->start_cycles);
}

#define EMBENCH_OBS_ENTER(id) \
  embench_obs_scope_t _embench_obs_scope_##id \
    __attribute__((cleanup(embench_obs_cleanup))) = { #id, embench_obs_enter_scope(#id) }

#else

#define EMBENCH_OBS_ENTER(id) ((void)0)

#endif /* EMBENCH_OBS */

#endif /* VEXII_EMBENCH_OBS_H */
