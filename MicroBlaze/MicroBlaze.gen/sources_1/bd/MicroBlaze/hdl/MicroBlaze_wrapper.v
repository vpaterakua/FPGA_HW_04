//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2026 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2026.1 (win64) Build 6511674 Tue Jun 16 11:02:23 MDT 2026
//Date        : Sat Oct  3 12:52:24 2026
//Host        : DESKTOP-IOFH4PG running 64-bit major release  (build 9200)
//Command     : generate_target MicroBlaze_wrapper.bd
//Design      : MicroBlaze_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module MicroBlaze_wrapper
   (BTN_tri_i,
    LED_tri_o,
    clk_50MHz,
    reset_rtl_0);
  input [3:0]BTN_tri_i;
  output [3:0]LED_tri_o;
  input clk_50MHz;
  input reset_rtl_0;

  wire [3:0]BTN_tri_i;
  wire [3:0]LED_tri_o;
  wire clk_50MHz;
  wire reset_rtl_0;

  MicroBlaze MicroBlaze_i
       (.BTN_tri_i(BTN_tri_i),
        .LED_tri_o(LED_tri_o),
        .clk_50MHz(clk_50MHz),
        .reset_rtl_0(reset_rtl_0));
endmodule
