//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
//Date        : Fri May 26 18:12:33 2023
//Host        : brg-zhang-xcel.ece.cornell.edu running 64-bit CentOS Linux release 7.9.2009 (Core)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (clk_100MHz,
    resetn,
    resetn_0);
  input clk_100MHz;
  input resetn;
  input resetn_0;

  wire clk_100MHz;
  wire resetn;
  wire resetn_0;

  design_1 design_1_i
       (.clk_100MHz(clk_100MHz),
        .resetn(resetn),
        .resetn_0(resetn_0));
endmodule
