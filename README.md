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



## Hardware Architecture & Modules
The design is partitioned into specialized modules that interact to form the complete processor:

* **CPU (Top Module):** The top-level entity that instantiates and interconnects the control unit and all datapath components to form the functional processor.
* **Control Unit (CU):** The core intelligence that implements the 3-stage FSM to manage instruction flow, handle jumps, and generate precise control signals for the rest of the system.
* **Arithmetic Logic Unit (ALU):** Responsible for logical operations (`AND`, `OR`, `XOR`, `NOT`) and bitwise manipulation through shifts and rotates (`LSL`, `LSR`, `ROL`, `ROR`).
* **Full Adder Unit (FUA):** A dedicated arithmetic block optimized to perform both addition and subtraction using two’s complement logic within a single unit.
* **Register File (REG):** A storage bank containing 16 general-purpose 8-bit registers. It supports two asynchronous read ports for operands and one synchronous write port for results.
* **Status Register:** A monitoring module that tracks condition flags after execution: **Carry (C)**, **Overflow (V)**, **Negative (N)**, and **Zero (Z)**.
* **Program Counter (PC):** An 8-bit register that tracks the memory address of the next instruction to be fetched.
* **Instruction Register (IR):** A 16-bit register that holds the current instruction word during the decode and execute phases.
* **Instruction Memory:** A memory block modeled as 16-bit words, used to store the machine code program executed during simulation.

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