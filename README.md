# VHDL MIPS Processor 

This repository contains the VHDL source code for a 32-bit RISC processor based on the MIPS architecture. The project implements two different microarchitectures: a **Multi-Cycle** design controlled by a finite state machine and a **5-Stage Pipelined** design with advanced hazard handling.

## Overview

The design targets a 32-bit instruction set supporting standard arithmetic, logical, memory access and control flow operations. It was developed and verified using Xilinx ISE (ISim).

### 1. Pipelined Architecture (`sources/pipeline`)
Implements a classic 5-stage pipeline (Fetch, Decode, Execute, Memory, Writeback) optimized for instruction-level parallelism.
* **Hazard Resolution:**
    * **Data Hazards:** Solved via a **Forwarding Unit** that routes ALU results from EX/MEM and MEM/WB stages back to the ALU inputs, bypassing the register file.
    * **Control/Load-Use Hazards:** A **Stall Unit** detects dependencies (e.g., `lw` followed by use) and freezes the PC/Instruction Register while inserting NOPs (bubbles).
* **Pipeline Registers:** Dedicated registers (IF/ID, ID/EX, EX/MEM, MEM/WB) ensure synchronous signal propagation between stages.

### 2. Multi-Cycle Architecture (`sources/multicycle`)
Implements the processor using a single shared datapath where instructions take multiple clock cycles to complete.
* **Control Unit:** A complex Finite State Machine (FSM) orchestrates the execution flow, transitioning through Fetch, Decode, Execute and Writeback states.
* **Resource Sharing:** Optimized for area efficiency by reusing the ALU for both address calculation and arithmetic operations.

## Instruction Set Support

The processor supports a comprehensive subset of the MIPS32 instruction set:
* **R-Type:** `add`, `sub`, `and`, `or`, `nand`, `nor`, `sll`, `srl`, `sra`, `rol`, `ror`
* **I-Type:** `addi`, `li`, `lui`, `ori`, `lb`, `sb`, `lw`, `sw`
* **Branch/Jump:** `beq`, `bne`, `b` (unconditional branch)

## Directory Structure

.
├── sources/
│   ├── multicycle/       # VHDL sources for the FSM-based implementation
│   └── pipeline/         # VHDL sources for the 5-stage pipeline implementation
├── tb/                   # Testbenches and verification files
│   ├── *.vhd             # Testbench entities (proc_test, pipeline_test)
│   ├── *.txt             # Assembly test vectors used for verification
│   ├── *.data            # Compiled machine code (hex) for RAM initialization
│   └── *.wcfg            # Waveform configuration files for Xilinx ISim
└── README.md
