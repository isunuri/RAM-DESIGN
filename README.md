# RAM-DESIGN

*COMPANY* : CODTECH IT SOLUTIONS

*NAME* : Chetana Isunuri

*INTERN ID* : CT04DF2543

*DOMAIN* : VLSI

*DURATION* : 4 WEEKS

*MENTOR* : VAISHALI

# About the Task
The task required me to develop a basic RAM block capable of performing read and write operations synchronously with a clock signal. The RAM had an 8-bit data width and supported up to 256 memory locations, addressed using an 8-bit address bus. The design featured three main input signals:

addr: the address of the memory location

din: data input for writing to memory

we: write enable signal

clk: the clock to control synchronization

A fourth signal, dout, was used to output data when a read operation was performed. The RAM only performed writes when the we signal was high on the rising edge of the clock, making it synchronous. Reads, in contrast, were designed as either synchronous or asynchronous, depending on the configuration, but in this implementation, the output reflected the data at the given address immediately.

# Tools and Technologies Used

-> HDL Language: Verilog

-> Design Suite: Xilinx Vivado

-> Simulation Type: RTL simulation with testbench

-> Verification: Waveform analysis using Vivado’s simulation environment

Xilinx Vivado provided an integrated platform to write, compile, simulate, and debug Verilog modules. Using the testbench, I applied a sequence of read and write operations to validate the correct functionality of the RAM module.

# Working Principle
A RAM module is used for temporary data storage in most digital systems. It allows both read and write access at random (non-sequential) addresses, enabling fast data retrieval. In this synchronous RAM design:

On every positive clock edge, if we = 1, the data input (din) is stored into the memory at the specified address (addr).

If we = 0, the RAM outputs the value stored at the specified address on the dout line.

This mechanism mimics how modern processors access instruction and data memory during execution cycles.

# Applications of RAM Modules
RAM is used extensively in:

1. Microprocessors and Microcontrollers: For temporary data storage, program execution, and stack operations.

2. Embedded Systems: RAM modules are used in digital cameras, routers, printers, smart appliances, and IoT devices.

3. FPGAs and ASICs: As internal memory buffers, FIFO (First-In-First-Out) queues, or scratchpad memory for temporary computations.

4. Computer Systems: Every computer uses several layers of RAM (cache, DRAM, etc.) to bridge the gap between slow storage and fast CPUs.

5. Graphics Cards (GPUs): Store image/frame data for rendering and computation.

# Learning Outcomes
Through this task, I gained valuable experience in:

@ Understanding the internal architecture and operation of memory circuits.

@ Implementing memory read/write logic in Verilog.

@ Synchronizing data operations with clock signals.

@ Creating and running testbenches to verify functionality.

@ Using Vivado simulation tools to view memory behavior and debug designs.

# Schematic & outputwaveforms

![Image](https://github.com/user-attachments/assets/2c9ba605-4d78-427a-a064-adf04f89817a)
![Image](https://github.com/user-attachments/assets/0a2fd166-6b47-408c-8dae-4af1ff8d33f3)
