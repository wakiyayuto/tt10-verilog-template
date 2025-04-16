<!---
This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

This project implements a simple CPU, the TD4 CPU, using Verilog. The CPU is designed to perform basic arithmetic operations based on four 4-bit inputs (`a`, `sw`, `sel`) and a clock signal (`clk`).

### Key components:
1. **Arithmetic Unit**: The CPU performs addition on the selected inputs based on the value of the `sel` signal.
2. **Registers**: Internal registers (Q0, Q1, Q2, Q3) store intermediate results and control values for operations.
3. **Clocked Process**: The CPU updates its state on the rising edge of the `clk` signal. The `a` and `sw` inputs are loaded into the registers, and the result of the arithmetic operation is stored in a separate register.
4. **Selection Mechanism**: The `sel` input determines which set of inputs are used for the arithmetic operations. The values of `a`, `sw`, and internal registers are selected for the calculation based on this input.

The final output (`b`) is based on the values stored in the registers after the operation is completed.

## How to test

To test the project, follow these steps:

1. **Simulation**: First, run a simulation of the Verilog code to verify the functionality of the CPU. Use a testbench that provides different values for `a`, `sw`, and `sel` to observe the output `b` in various conditions.
2. **Hardware Testing**: Once the simulation is successful, you can implement the design on the hardware (e.g., FPGA) and connect the `ui_in` and `uio_in` to input switches or buttons, while monitoring `uo_out` as the output. 
   - Connect `a`, `sw`, and `sel` inputs to switches or control signals.
   - Observe the output `b` using LEDs or a display.

Use the clock signal (`clk`) to trigger updates in the design. Ensure the `rst_n` signal is correctly handled for initialization.

## External hardware

This project does not require any external hardware beyond the basic FPGA or digital logic simulator. However, you may choose to use the following to assist in testing and interfacing:

- **Switches/Buttons**: To provide input for `a`, `sw`, and `sel`.
- **LEDs or Display**: To observe the output `b` in real-time.
- **FPGA Development Board**: For hardware implementation and testing.

Make sure to connect the `clk` to an external clock signal, and use the `rst_n` signal to initialize the design.
