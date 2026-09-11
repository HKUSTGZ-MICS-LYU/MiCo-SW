# Make

CC = gcc # gcc, clang
OBJDUMP = objdump

MICO_DIR = MiCo-Lib

MICO_INCLUDES = $(MICO_DIR)/include $(MICO_DIR)/test
MICO_SOURCES = $(wildcard $(MICO_DIR)/src/*.c)
MICO_SOURCES += $(wildcard $(MICO_DIR)/src/mico/*.c)

OPT ?=
TARGET ?= host

CFLAGS ?=

CFLAGS += -O3
# CFLAGS += -Wall
LDFLAGS = -lm

# (Optional) Address Sanitizer
# CFLAGS += -fsanitize=address -static-libasan

# (Optional) Section GC
CFLAGS += -ffunction-sections -fdata-sections
LDFLAGS += -Wl,--gc-sections

# External sources/headers/flags for a project built against this Makefile
# (for example the Embench benchmark copied into a run workspace). These are
# appended, never assigned, so a command-line value cannot drop -march/-mabi.
EXTRA_SOURCES ?=
EXTRA_INCLUDES ?=
EXTRA_CFLAGS ?=

INCLUDES = $(MICO_INCLUDES) ./ $(EXTRA_INCLUDES)
CFLAGS += $(EXTRA_CFLAGS)

BUILD = build
MAIN = main

TEST_NUM ?= 1 # Not used by host

# RISC-V
RISCV_PREFIX = riscv64-unknown-elf
RISCV_SOURCE ?= 

# Targets
include $(MICO_DIR)/targets/common.mk
include $(MICO_DIR)/targets/$(TARGET).mk

OBJS := $(MICO_SOURCES) $(RISCV_SOURCE) $(wildcard $(EXTRA_SOURCES))
OBJS := $(OBJS:.c=.o)
OBJS := $(OBJS:.S=.o)
OBJS := $(OBJS:.s=.o)
OBJS := $(addprefix $(BUILD)/,$(OBJS))

LLAMA2_BIN ?=

ifneq ("$(LLAMA2_BIN)","")
CFLAGS += -DLLAMA2_BIN=\"$(LLAMA2_BIN)\"
endif

$(BUILD)/%.o: %.c | $(BUILD)
	@mkdir -p $(dir $@)
	@echo "Compiling Source File ($<)..."
	@$(CC) $(CFLAGS) -c -o $@ $< $(addprefix -I,$(INCLUDES))

$(BUILD)/%.o: %.S | $(BUILD)
	@mkdir -p $(dir $@)
	@echo "Compiling Source File ($<)..."
	@$(CC) $(CFLAGS) -c -o $@ $< $(addprefix -I,$(INCLUDES))

$(MAIN).elf: $(OBJS) $(MAIN).c
	@mkdir -p $(dir $@)
	@echo "Compiling Flags $(CFLAGS)"
	@echo "Linker Flags $(LDFLAGS)"
	@echo "Linking Executable (main)..."
	@$(CC) $(CFLAGS) -o $(MAIN).elf $(OBJS) $(MAIN).c $(addprefix -I,$(INCLUDES)) $(LDFLAGS)

$(MAIN).asm : $(MAIN).elf
	@echo "Generating Assembly Code..."
	@$(OBJDUMP) -d $(MAIN).elf > $(MAIN).asm

$(BUILD):
	@mkdir -p $(dir $@)
	
clean:
	@rm -rf $(BUILD)
	@rm -f *.elf *.asm
	@rm -f tests/*.elf tests/*.asm

debug: CFLAGS += -DDEBUG
debug: recompile

compile: $(MAIN).asm

recompile:
	@$(MAKE) clean
	@$(MAKE) compile


run-host: $(MAIN).elf
	./$<

all: compile

.PHONY: clean compile recompile run-host all debug
