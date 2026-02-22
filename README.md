# 8-Bit Modular Multicycle CPU (Verilog)

**Institution:** Cairo University, Faculty of Engineering
**Developed by:** Salah Waheed

## Overview
This repository contains the design and implementation of a custom **8-bit Central Processing Unit (CPU)** developed using Verilog HDL. The architecture follows a highly modular **multicycle** approach, executing instructions through a 3-stage Finite State Machine (FSM): **FETCH**, **DECODE**, and **EXECUTE**.

## System Specifications
The CPU is designed for computational efficiency with a clear separation between the control logic and the datapath components.

| Feature | Specification |
| :--- | :--- |
| **Word Size** | 8-bit data / 16-bit instructions |
| **Architecture** | Multicycle (3 stages: Fetch, Decode, Execute) |
| **Registers** | 16 general-purpose 8-bit registers |
| **Control Unit** | Finite State Machine (FSM) |
| **ALU Operations** | Arithmetic, Logic, and Shift/Rotate |



## Hardware Architecture
The design is broken down into several modular Verilog components:

* **Control Unit (CU)**: Manages the FSM stages and generates control signals based on the OpCode.
* **ALU & Full Adder (FUA)**: Optimized to perform 8-bit addition, subtraction, and logical operations.
* **Register File (REG)**: Supports 16 internal registers with asynchronous reads and synchronous writes.
* **Status Register**: Tracks condition flags including **Carry (C)**, **Zero (Z)**, **Negative (N)**, and **Overflow (V)**.
* **Instruction Memory**: Stores 16-bit instructions used for simulation and verification.

## Instruction Set Architecture (ISA)
The CPU supports a variety of instruction types for data processing and flow control:
* **Data Transfer**: `LDI` (Load Immediate).
* **Arithmetic**: `ADD`, `SUB`, `MUL`, `DIV`.
* **Logic**: `AND`, `OR`, `XOR`, `NOT`.
* **Shifts/Rotates**: `LSL`, `LSR`, `ROL`, `ROR`.
* **Control Flow**: `JMP` (Unconditional Branching).

## Simulation & Analysis
The design was verified using **Xilinx Vivado** with a custom testbench to validate instruction timing and datapath integrity.
* **Stage Validation**: Waveforms confirm the correct transition through Fetch, Decode, and Execute for each OpCode.
* **Flag Accuracy**: Status flags correctly reflect the outcome of mathematical operations.
* **Robustness**: The system was simulated under various scenarios to ensure stability during high-speed execution.

## Repository Structure
* `/rtl`: Contains all Verilog source files (CPU top, ALU, Control Unit, etc.).
* `/sim`: Contains the testbench (`cpu_tb.v`) and simulation waveform configurations.
* `/docs`: Contains the technical project report and architectural diagrams.