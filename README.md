# 8-Bit Modular Multicycle CPU (Verilog)

[cite_start]**Institution:** Cairo University, Faculty of Engineering [cite: 16, 17]
[cite_start]**Course:** Logic Design [cite: 1]
[cite_start]**Developed by:** Salah Waheed [cite: 2]

## Overview
This repository contains the design and implementation of a custom **8-bit Central Processing Unit (CPU)** developed using Verilog HDL. [cite_start]The architecture follows a highly modular **multicycle** approach, executing instructions through a 3-stage Finite State Machine (FSM): **FETCH**, **DECODE**, and **EXECUTE**[cite: 23, 27, 28, 29, 30].

## System Specifications
[cite_start]The CPU is designed for computational efficiency with a clear separation between the control logic and the datapath components[cite: 24, 27].

| Feature | Specification |
| :--- | :--- |
| **Word Size** | [cite_start]8-bit data / 16-bit instructions [cite: 23] |
| **Architecture** | [cite_start]Multicycle (3 stages: Fetch, Decode, Execute) [cite: 28, 29, 30] |
| **Registers** | [cite_start]16 general-purpose 8-bit registers [cite: 24] |
| **Control Unit** | [cite_start]Finite State Machine (FSM) [cite: 20] |
| **ALU Operations** | [cite_start]Arithmetic, Logic, and Shift/Rotate [cite: 22] |

## Hardware Architecture
The design is broken down into several modular Verilog components:

* [cite_start]**Control Unit (CU)**: Manages the FSM stages and generates control signals based on the OpCode[cite: 27, 42].
* [cite_start]**ALU & Full Adder (FUA)**: Optimized to perform 8-bit addition, subtraction, and logical operations[cite: 29].
* [cite_start]**Register File (REG)**: Supports 16 internal registers with asynchronous reads and synchronous writes[cite: 24].
* [cite_start]**Status Register**: Tracks condition flags including **Carry (C)**, **Zero (Z)**, **Negative (N)**, and **Overflow (V)**[cite: 32, 58].
* [cite_start]**Instruction Memory**: Stores 16-bit instructions used for simulation and verification[cite: 44, 45].

## Instruction Set Architecture (ISA)
[cite_start]The CPU supports a variety of instruction types for data processing and flow control[cite: 28, 29, 30, 31]:
* [cite_start]**Data Transfer**: `LDI` (Load Immediate)[cite: 30].
* [cite_start]**Arithmetic**: `ADD`, `SUB`, `MUL`, `DIV`[cite: 29, 30].
* [cite_start]**Logic**: `AND`, `OR`, `XOR`, `NOT`[cite: 29].
* [cite_start]**Shifts/Rotates**: `LSL`, `LSR`, `ROL`, `ROR`[cite: 22, 29].
* [cite_start]**Control Flow**: `JMP` (Unconditional Branching)[cite: 31, 137].

## Simulation & Analysis
[cite_start]The design was verified using **Xilinx Vivado** with a custom testbench to validate instruction timing and datapath integrity[cite: 47, 49, 108].
* [cite_start]**Stage Validation**: Waveforms confirm the correct transition through Fetch, Decode, and Execute for each OpCode[cite: 56, 57].
* [cite_start]**Flag Accuracy**: Status flags correctly reflect the outcome of mathematical operations (e.g., Carry-out on addition overflow)[cite: 58].
* [cite_start]**Noise and Robustness**: The system was simulated under various scenarios to ensure stability during high-speed execution[cite: 49].

## Repository Structure
* `/rtl`: Contains all Verilog source files (CPU top, ALU, Control Unit, etc.).
* `/sim`: Contains the testbench (`cpu_tb.v`) and simulation waveform configurations.
* `/docs`: Contains the technical project report and architectural diagrams.

## References
* [cite_start]Digital Signal Processing and Logic Design fundamentals[cite: 161, 1858].
* [cite_start]Industry-standard Verilog and FPGA design guides[cite: 1859, 1861].