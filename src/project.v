/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_td4cpu (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);
    
  // All output pins must be assigned. If not used, assign to 0.
 wire [3:0] a   = ui_in[3:0];
    wire [1:0] sel = ui_in[5:4];
    wire [3:0] sw  = uio_in[3:0]; // Use it if necessary.

    wire [3:0] b;

    // TD4CPU instance
    TD4cpu core (
        .a(a),
        .sw(sw),
        .b(b),
        .sel(sel),
        .clk(clk)
    );

    // Output: Upper 4 bits zero-padded + b output
    assign uo_out  = {4'b0000, b};
    assign uio_out = 8'b00000000; // If you don't use it, it's zero.
    assign uio_oe  = 8'b00000000; // Output disabled (treated as input only)

  // List all unused inputs to prevent warnings
  wire _unused = &{ena, rst_n};

endmodule
