------------------------------------------
Tablet Counting and Bottle Filling System
------------------------------------------

--------------------

🔹 Project Overview

--------------------
This project demonstrates a digital tablet counting and monitoring system using combinational and sequential logic circuits. It combines hardware design, simulation, and Verilog HDL modeling, aiming for accurate tablet counting, preset comparison, and cumulative tracking in pharmaceutical applications.

Key Highlights:

Accurate preset-based tablet counting

Real-time comparison between preset and actual counts

Cumulative tablet counting across multiple bottles

Full simulation in Proteus and ModelSim Verilog

Potential for FPGA or microcontroller hardware implementation

-------------
🔹 Features
------------

Preset Entry Using Keypad:

Matrix keypad input (simulation supports keys 1–3)

Encoded into 4-bit Binary Coded Decimal (BCD) using 74LS147 priority encoder

Active-high logic achieved with 74HC04 hex inverter

Tablet Counting:

Push-button simulates tablet detection

Each press increments a cascaded counter

Real-time digital comparator signals LED when preset count is reached

Cumulative Counting:

Counter output added using cascaded binary adders

Stored in registers for cumulative counting across bottles


--------
Display:
--------
BCD-to-seven-segment display shows:

Upper: preset tablets per bottle

Lower: cumulative tablets dispensed

Verilog HDL Implementation:

Separate modules for encoding, counting, comparison, addition, storage, and display

Simulation performed in ModelSim

Compatible with FPGA implementation for real hardware

Proteus Simulation:

Complete system tested virtually

Demonstrates accurate preset entry, counting, comparison, and cumulative addition






🔹 Tools & Technologies Used

Hardware: TTL Logic ICs (74LS147, 74HC04), Push-button, LED, BCD Displays

Simulation & Modeling:

Proteus Design Suite – Hardware simulation

Verilog HDL & ModelSim – Module design and waveform verification

Design Concepts: Digital logic circuits, combinational and sequential design, counters, comparators, registers, encoders

🔹 Learning Outcomes

Design and simulate digital systems using combinational and sequential logic

Understand encoder-decoder logic, BCD-to-seven-segment display interfacing

Implement cascaded counters and adders for cumulative counting

Experience both hardware simulation and Verilog HDL modeling

Prepare for real-world FPGA/microcontroller hardware design

🔹 References

M. M. Mano and C. R. Kime, Logic and Computer Design Fundamentals, Pearson.

R. J. Tocci et al., Digital Systems, Pearson.

Texas Instruments, 74LS/74HC Series Datasheets.

Labcenter Electronics, Proteus Design Suite.
