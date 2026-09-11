# VexiiRiscv board support for Embench

This directory holds the tracked glue that lets an Embench-iot benchmark run on
MiCoSoc. Embench itself lives in the read-only `benchmarks/embench-iot`
submodule; the agent framework copies the selected benchmark, Embench's support
code and these files into a per-run workspace.

## Files

- `boardsupport.c/.h` - implements the three board hooks Embench's
  `support/main.c` calls: `initialise_board()`, `start_trigger()`,
  `stop_trigger()`. `warm_caches()` is benchmark-owned, so the board does not
  define it. `start_trigger` snapshots `rdcycle`; `stop_trigger` prints
  `CFU_AGENT_PROFILE <name>=<cycles>` **after** the timed region, so UART cost
  never pollutes the measurement. `initialise_board` sets up the BEEBS bump
  heap (64 KiB static pool).
- `embench_obs.h` - observation-point macro used by the instrumenter.

## Observation points

`EMBENCH_OBS_ENTER(id)` declares a scope variable whose GCC `cleanup`
attribute closes the counter on **every** exit path, including early `return`,
`break` and `continue`. Only one line is inserted per function, and the
counters are compiled out unless `-DEMBENCH_OBS` is passed, so the reference
build is untouched. Recursion is depth-counted: only the outermost frame
accumulates cycles. Counters reset in `start_trigger` and dump in
`stop_trigger` as `CFU_AGENT_PROFILE <id>=<cycles> calls=<n>`.

## Build integration

`sw/Makefile` gained three append-only variables:

```make
EXTRA_SOURCES ?=   # extra .c files (wildcards allowed)
EXTRA_INCLUDES ?=  # extra -I directories
EXTRA_CFLAGS ?=    # extra defines/flags
```

They are appended, never assigned, so passing them on the command line cannot
drop `-march`/`-mabi`. The framework builds one configuration at a time with
`make -C sw TARGET=vexii_soc MAIN=... BUILD=... EXTRA_* compile`.

## Configurations

| config | defines | purpose |
| --- | --- | --- |
| reference | board only | correctness + baseline cycles |
| profile | `-DEMBENCH_OBS` | per-function observation table |
| cfu | `-DUSE_AGENT_CFU` | agent kernel, must still pass verify |

Each configuration gets its own source tree inside the run workspace. This is
required: the Makefile derives object paths from the source path, so a shared
tree would let one configuration reuse another's objects and silently ignore its
own defines.

## Correctness

Embench's `verify_benchmark()` is the oracle: `support/main.c` returns
`!correct`, and `sw/MiCo-Lib/targets/vexii_soc/start.S` jumps to the `pass` or
`fail` symbol that `MiCoSocSim` watches. A simulation that reaches `pass`
therefore proves the benchmark's own expected result, including for the CFU
configuration.
