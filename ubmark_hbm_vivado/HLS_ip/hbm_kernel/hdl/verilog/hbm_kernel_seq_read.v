// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1.2 (64-bit)
// Version: 2022.1.2
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module hbm_kernel_seq_read (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        m_axi_gmem_AWVALID,
        m_axi_gmem_AWREADY,
        m_axi_gmem_AWADDR,
        m_axi_gmem_AWID,
        m_axi_gmem_AWLEN,
        m_axi_gmem_AWSIZE,
        m_axi_gmem_AWBURST,
        m_axi_gmem_AWLOCK,
        m_axi_gmem_AWCACHE,
        m_axi_gmem_AWPROT,
        m_axi_gmem_AWQOS,
        m_axi_gmem_AWREGION,
        m_axi_gmem_AWUSER,
        m_axi_gmem_WVALID,
        m_axi_gmem_WREADY,
        m_axi_gmem_WDATA,
        m_axi_gmem_WSTRB,
        m_axi_gmem_WLAST,
        m_axi_gmem_WID,
        m_axi_gmem_WUSER,
        m_axi_gmem_ARVALID,
        m_axi_gmem_ARREADY,
        m_axi_gmem_ARADDR,
        m_axi_gmem_ARID,
        m_axi_gmem_ARLEN,
        m_axi_gmem_ARSIZE,
        m_axi_gmem_ARBURST,
        m_axi_gmem_ARLOCK,
        m_axi_gmem_ARCACHE,
        m_axi_gmem_ARPROT,
        m_axi_gmem_ARQOS,
        m_axi_gmem_ARREGION,
        m_axi_gmem_ARUSER,
        m_axi_gmem_RVALID,
        m_axi_gmem_RREADY,
        m_axi_gmem_RDATA,
        m_axi_gmem_RLAST,
        m_axi_gmem_RID,
        m_axi_gmem_RFIFONUM,
        m_axi_gmem_RUSER,
        m_axi_gmem_RRESP,
        m_axi_gmem_BVALID,
        m_axi_gmem_BREADY,
        m_axi_gmem_BRESP,
        m_axi_gmem_BID,
        m_axi_gmem_BUSER,
        maxi,
        buffer_r_address1,
        buffer_r_ce1,
        buffer_r_we1,
        buffer_r_d1,
        size
);

parameter    ap_ST_fsm_state1 = 74'd1;
parameter    ap_ST_fsm_state2 = 74'd2;
parameter    ap_ST_fsm_state3 = 74'd4;
parameter    ap_ST_fsm_state4 = 74'd8;
parameter    ap_ST_fsm_state5 = 74'd16;
parameter    ap_ST_fsm_state6 = 74'd32;
parameter    ap_ST_fsm_state7 = 74'd64;
parameter    ap_ST_fsm_state8 = 74'd128;
parameter    ap_ST_fsm_state9 = 74'd256;
parameter    ap_ST_fsm_state10 = 74'd512;
parameter    ap_ST_fsm_state11 = 74'd1024;
parameter    ap_ST_fsm_state12 = 74'd2048;
parameter    ap_ST_fsm_state13 = 74'd4096;
parameter    ap_ST_fsm_state14 = 74'd8192;
parameter    ap_ST_fsm_state15 = 74'd16384;
parameter    ap_ST_fsm_state16 = 74'd32768;
parameter    ap_ST_fsm_state17 = 74'd65536;
parameter    ap_ST_fsm_state18 = 74'd131072;
parameter    ap_ST_fsm_state19 = 74'd262144;
parameter    ap_ST_fsm_state20 = 74'd524288;
parameter    ap_ST_fsm_state21 = 74'd1048576;
parameter    ap_ST_fsm_state22 = 74'd2097152;
parameter    ap_ST_fsm_state23 = 74'd4194304;
parameter    ap_ST_fsm_state24 = 74'd8388608;
parameter    ap_ST_fsm_state25 = 74'd16777216;
parameter    ap_ST_fsm_state26 = 74'd33554432;
parameter    ap_ST_fsm_state27 = 74'd67108864;
parameter    ap_ST_fsm_state28 = 74'd134217728;
parameter    ap_ST_fsm_state29 = 74'd268435456;
parameter    ap_ST_fsm_state30 = 74'd536870912;
parameter    ap_ST_fsm_state31 = 74'd1073741824;
parameter    ap_ST_fsm_state32 = 74'd2147483648;
parameter    ap_ST_fsm_state33 = 74'd4294967296;
parameter    ap_ST_fsm_state34 = 74'd8589934592;
parameter    ap_ST_fsm_state35 = 74'd17179869184;
parameter    ap_ST_fsm_state36 = 74'd34359738368;
parameter    ap_ST_fsm_state37 = 74'd68719476736;
parameter    ap_ST_fsm_state38 = 74'd137438953472;
parameter    ap_ST_fsm_state39 = 74'd274877906944;
parameter    ap_ST_fsm_state40 = 74'd549755813888;
parameter    ap_ST_fsm_state41 = 74'd1099511627776;
parameter    ap_ST_fsm_state42 = 74'd2199023255552;
parameter    ap_ST_fsm_state43 = 74'd4398046511104;
parameter    ap_ST_fsm_state44 = 74'd8796093022208;
parameter    ap_ST_fsm_state45 = 74'd17592186044416;
parameter    ap_ST_fsm_state46 = 74'd35184372088832;
parameter    ap_ST_fsm_state47 = 74'd70368744177664;
parameter    ap_ST_fsm_state48 = 74'd140737488355328;
parameter    ap_ST_fsm_state49 = 74'd281474976710656;
parameter    ap_ST_fsm_state50 = 74'd562949953421312;
parameter    ap_ST_fsm_state51 = 74'd1125899906842624;
parameter    ap_ST_fsm_state52 = 74'd2251799813685248;
parameter    ap_ST_fsm_state53 = 74'd4503599627370496;
parameter    ap_ST_fsm_state54 = 74'd9007199254740992;
parameter    ap_ST_fsm_state55 = 74'd18014398509481984;
parameter    ap_ST_fsm_state56 = 74'd36028797018963968;
parameter    ap_ST_fsm_state57 = 74'd72057594037927936;
parameter    ap_ST_fsm_state58 = 74'd144115188075855872;
parameter    ap_ST_fsm_state59 = 74'd288230376151711744;
parameter    ap_ST_fsm_state60 = 74'd576460752303423488;
parameter    ap_ST_fsm_state61 = 74'd1152921504606846976;
parameter    ap_ST_fsm_state62 = 74'd2305843009213693952;
parameter    ap_ST_fsm_state63 = 74'd4611686018427387904;
parameter    ap_ST_fsm_state64 = 74'd9223372036854775808;
parameter    ap_ST_fsm_state65 = 74'd18446744073709551616;
parameter    ap_ST_fsm_state66 = 74'd36893488147419103232;
parameter    ap_ST_fsm_state67 = 74'd73786976294838206464;
parameter    ap_ST_fsm_state68 = 74'd147573952589676412928;
parameter    ap_ST_fsm_state69 = 74'd295147905179352825856;
parameter    ap_ST_fsm_state70 = 74'd590295810358705651712;
parameter    ap_ST_fsm_state71 = 74'd1180591620717411303424;
parameter    ap_ST_fsm_state72 = 74'd2361183241434822606848;
parameter    ap_ST_fsm_state73 = 74'd4722366482869645213696;
parameter    ap_ST_fsm_state74 = 74'd9444732965739290427392;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output   m_axi_gmem_AWVALID;
input   m_axi_gmem_AWREADY;
output  [63:0] m_axi_gmem_AWADDR;
output  [0:0] m_axi_gmem_AWID;
output  [31:0] m_axi_gmem_AWLEN;
output  [2:0] m_axi_gmem_AWSIZE;
output  [1:0] m_axi_gmem_AWBURST;
output  [1:0] m_axi_gmem_AWLOCK;
output  [3:0] m_axi_gmem_AWCACHE;
output  [2:0] m_axi_gmem_AWPROT;
output  [3:0] m_axi_gmem_AWQOS;
output  [3:0] m_axi_gmem_AWREGION;
output  [0:0] m_axi_gmem_AWUSER;
output   m_axi_gmem_WVALID;
input   m_axi_gmem_WREADY;
output  [511:0] m_axi_gmem_WDATA;
output  [63:0] m_axi_gmem_WSTRB;
output   m_axi_gmem_WLAST;
output  [0:0] m_axi_gmem_WID;
output  [0:0] m_axi_gmem_WUSER;
output   m_axi_gmem_ARVALID;
input   m_axi_gmem_ARREADY;
output  [63:0] m_axi_gmem_ARADDR;
output  [0:0] m_axi_gmem_ARID;
output  [31:0] m_axi_gmem_ARLEN;
output  [2:0] m_axi_gmem_ARSIZE;
output  [1:0] m_axi_gmem_ARBURST;
output  [1:0] m_axi_gmem_ARLOCK;
output  [3:0] m_axi_gmem_ARCACHE;
output  [2:0] m_axi_gmem_ARPROT;
output  [3:0] m_axi_gmem_ARQOS;
output  [3:0] m_axi_gmem_ARREGION;
output  [0:0] m_axi_gmem_ARUSER;
input   m_axi_gmem_RVALID;
output   m_axi_gmem_RREADY;
input  [511:0] m_axi_gmem_RDATA;
input   m_axi_gmem_RLAST;
input  [0:0] m_axi_gmem_RID;
input  [8:0] m_axi_gmem_RFIFONUM;
input  [0:0] m_axi_gmem_RUSER;
input  [1:0] m_axi_gmem_RRESP;
input   m_axi_gmem_BVALID;
output   m_axi_gmem_BREADY;
input  [1:0] m_axi_gmem_BRESP;
input  [0:0] m_axi_gmem_BID;
input  [0:0] m_axi_gmem_BUSER;
input  [63:0] maxi;
output  [8:0] buffer_r_address1;
output   buffer_r_ce1;
output   buffer_r_we1;
output  [511:0] buffer_r_d1;
input  [31:0] size;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg m_axi_gmem_ARVALID;
reg m_axi_gmem_RREADY;
reg buffer_r_ce1;
reg buffer_r_we1;

(* fsm_encoding = "none" *) reg   [73:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    gmem_blk_n_AR;
wire    ap_CS_fsm_state2;
reg   [0:0] icmp_ln10_reg_169;
reg    gmem_blk_n_R;
wire    ap_CS_fsm_state73;
reg   [0:0] icmp_ln10_1_reg_189;
wire   [0:0] icmp_ln10_fu_106_p2;
wire   [0:0] icmp_ln10_1_fu_145_p2;
wire    ap_CS_fsm_state72;
wire   [63:0] zext_ln10_fu_150_p1;
reg   [63:0] zext_ln10_reg_193;
reg   [511:0] gmem_addr_read_reg_198;
wire    ap_CS_fsm_state74;
wire  signed [63:0] sext_ln10_fu_122_p1;
reg    ap_block_state2_io;
reg    ap_predicate_op163_read_state73;
reg    ap_block_state73;
reg   [9:0] i_fu_62;
wire   [9:0] add_ln10_fu_153_p2;
wire   [57:0] trunc_ln_fu_112_p4;
wire   [31:0] zext_ln10_1_fu_141_p1;
reg   [73:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
reg    ap_ST_fsm_state2_blk;
wire    ap_ST_fsm_state3_blk;
wire    ap_ST_fsm_state4_blk;
wire    ap_ST_fsm_state5_blk;
wire    ap_ST_fsm_state6_blk;
wire    ap_ST_fsm_state7_blk;
wire    ap_ST_fsm_state8_blk;
wire    ap_ST_fsm_state9_blk;
wire    ap_ST_fsm_state10_blk;
wire    ap_ST_fsm_state11_blk;
wire    ap_ST_fsm_state12_blk;
wire    ap_ST_fsm_state13_blk;
wire    ap_ST_fsm_state14_blk;
wire    ap_ST_fsm_state15_blk;
wire    ap_ST_fsm_state16_blk;
wire    ap_ST_fsm_state17_blk;
wire    ap_ST_fsm_state18_blk;
wire    ap_ST_fsm_state19_blk;
wire    ap_ST_fsm_state20_blk;
wire    ap_ST_fsm_state21_blk;
wire    ap_ST_fsm_state22_blk;
wire    ap_ST_fsm_state23_blk;
wire    ap_ST_fsm_state24_blk;
wire    ap_ST_fsm_state25_blk;
wire    ap_ST_fsm_state26_blk;
wire    ap_ST_fsm_state27_blk;
wire    ap_ST_fsm_state28_blk;
wire    ap_ST_fsm_state29_blk;
wire    ap_ST_fsm_state30_blk;
wire    ap_ST_fsm_state31_blk;
wire    ap_ST_fsm_state32_blk;
wire    ap_ST_fsm_state33_blk;
wire    ap_ST_fsm_state34_blk;
wire    ap_ST_fsm_state35_blk;
wire    ap_ST_fsm_state36_blk;
wire    ap_ST_fsm_state37_blk;
wire    ap_ST_fsm_state38_blk;
wire    ap_ST_fsm_state39_blk;
wire    ap_ST_fsm_state40_blk;
wire    ap_ST_fsm_state41_blk;
wire    ap_ST_fsm_state42_blk;
wire    ap_ST_fsm_state43_blk;
wire    ap_ST_fsm_state44_blk;
wire    ap_ST_fsm_state45_blk;
wire    ap_ST_fsm_state46_blk;
wire    ap_ST_fsm_state47_blk;
wire    ap_ST_fsm_state48_blk;
wire    ap_ST_fsm_state49_blk;
wire    ap_ST_fsm_state50_blk;
wire    ap_ST_fsm_state51_blk;
wire    ap_ST_fsm_state52_blk;
wire    ap_ST_fsm_state53_blk;
wire    ap_ST_fsm_state54_blk;
wire    ap_ST_fsm_state55_blk;
wire    ap_ST_fsm_state56_blk;
wire    ap_ST_fsm_state57_blk;
wire    ap_ST_fsm_state58_blk;
wire    ap_ST_fsm_state59_blk;
wire    ap_ST_fsm_state60_blk;
wire    ap_ST_fsm_state61_blk;
wire    ap_ST_fsm_state62_blk;
wire    ap_ST_fsm_state63_blk;
wire    ap_ST_fsm_state64_blk;
wire    ap_ST_fsm_state65_blk;
wire    ap_ST_fsm_state66_blk;
wire    ap_ST_fsm_state67_blk;
wire    ap_ST_fsm_state68_blk;
wire    ap_ST_fsm_state69_blk;
wire    ap_ST_fsm_state70_blk;
wire    ap_ST_fsm_state71_blk;
wire    ap_ST_fsm_state72_blk;
reg    ap_ST_fsm_state73_blk;
wire    ap_ST_fsm_state74_blk;
reg    ap_condition_756;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 74'd1;
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if ((icmp_ln10_reg_169 == 1'd0)) begin
        if (((1'b0 == ap_block_state2_io) & (1'b1 == ap_CS_fsm_state2))) begin
            i_fu_62 <= 10'd0;
        end else if ((1'b1 == ap_condition_756)) begin
            i_fu_62 <= add_ln10_fu_153_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state73) & (icmp_ln10_1_reg_189 == 1'd0) & (icmp_ln10_reg_169 == 1'd0))) begin
        gmem_addr_read_reg_198 <= m_axi_gmem_RDATA;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state72)) begin
        icmp_ln10_1_reg_189 <= icmp_ln10_1_fu_145_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        icmp_ln10_reg_169 <= icmp_ln10_fu_106_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state73) & (icmp_ln10_reg_169 == 1'd0))) begin
        zext_ln10_reg_193[9 : 0] <= zext_ln10_fu_150_p1[9 : 0];
    end
end

assign ap_ST_fsm_state10_blk = 1'b0;

assign ap_ST_fsm_state11_blk = 1'b0;

assign ap_ST_fsm_state12_blk = 1'b0;

assign ap_ST_fsm_state13_blk = 1'b0;

assign ap_ST_fsm_state14_blk = 1'b0;

assign ap_ST_fsm_state15_blk = 1'b0;

assign ap_ST_fsm_state16_blk = 1'b0;

assign ap_ST_fsm_state17_blk = 1'b0;

assign ap_ST_fsm_state18_blk = 1'b0;

assign ap_ST_fsm_state19_blk = 1'b0;

always @ (*) begin
    if ((ap_start == 1'b0)) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

assign ap_ST_fsm_state20_blk = 1'b0;

assign ap_ST_fsm_state21_blk = 1'b0;

assign ap_ST_fsm_state22_blk = 1'b0;

assign ap_ST_fsm_state23_blk = 1'b0;

assign ap_ST_fsm_state24_blk = 1'b0;

assign ap_ST_fsm_state25_blk = 1'b0;

assign ap_ST_fsm_state26_blk = 1'b0;

assign ap_ST_fsm_state27_blk = 1'b0;

assign ap_ST_fsm_state28_blk = 1'b0;

assign ap_ST_fsm_state29_blk = 1'b0;

always @ (*) begin
    if ((1'b1 == ap_block_state2_io)) begin
        ap_ST_fsm_state2_blk = 1'b1;
    end else begin
        ap_ST_fsm_state2_blk = 1'b0;
    end
end

assign ap_ST_fsm_state30_blk = 1'b0;

assign ap_ST_fsm_state31_blk = 1'b0;

assign ap_ST_fsm_state32_blk = 1'b0;

assign ap_ST_fsm_state33_blk = 1'b0;

assign ap_ST_fsm_state34_blk = 1'b0;

assign ap_ST_fsm_state35_blk = 1'b0;

assign ap_ST_fsm_state36_blk = 1'b0;

assign ap_ST_fsm_state37_blk = 1'b0;

assign ap_ST_fsm_state38_blk = 1'b0;

assign ap_ST_fsm_state39_blk = 1'b0;

assign ap_ST_fsm_state3_blk = 1'b0;

assign ap_ST_fsm_state40_blk = 1'b0;

assign ap_ST_fsm_state41_blk = 1'b0;

assign ap_ST_fsm_state42_blk = 1'b0;

assign ap_ST_fsm_state43_blk = 1'b0;

assign ap_ST_fsm_state44_blk = 1'b0;

assign ap_ST_fsm_state45_blk = 1'b0;

assign ap_ST_fsm_state46_blk = 1'b0;

assign ap_ST_fsm_state47_blk = 1'b0;

assign ap_ST_fsm_state48_blk = 1'b0;

assign ap_ST_fsm_state49_blk = 1'b0;

assign ap_ST_fsm_state4_blk = 1'b0;

assign ap_ST_fsm_state50_blk = 1'b0;

assign ap_ST_fsm_state51_blk = 1'b0;

assign ap_ST_fsm_state52_blk = 1'b0;

assign ap_ST_fsm_state53_blk = 1'b0;

assign ap_ST_fsm_state54_blk = 1'b0;

assign ap_ST_fsm_state55_blk = 1'b0;

assign ap_ST_fsm_state56_blk = 1'b0;

assign ap_ST_fsm_state57_blk = 1'b0;

assign ap_ST_fsm_state58_blk = 1'b0;

assign ap_ST_fsm_state59_blk = 1'b0;

assign ap_ST_fsm_state5_blk = 1'b0;

assign ap_ST_fsm_state60_blk = 1'b0;

assign ap_ST_fsm_state61_blk = 1'b0;

assign ap_ST_fsm_state62_blk = 1'b0;

assign ap_ST_fsm_state63_blk = 1'b0;

assign ap_ST_fsm_state64_blk = 1'b0;

assign ap_ST_fsm_state65_blk = 1'b0;

assign ap_ST_fsm_state66_blk = 1'b0;

assign ap_ST_fsm_state67_blk = 1'b0;

assign ap_ST_fsm_state68_blk = 1'b0;

assign ap_ST_fsm_state69_blk = 1'b0;

assign ap_ST_fsm_state6_blk = 1'b0;

assign ap_ST_fsm_state70_blk = 1'b0;

assign ap_ST_fsm_state71_blk = 1'b0;

assign ap_ST_fsm_state72_blk = 1'b0;

always @ (*) begin
    if (((ap_predicate_op163_read_state73 == 1'b1) & (m_axi_gmem_RVALID == 1'b0))) begin
        ap_ST_fsm_state73_blk = 1'b1;
    end else begin
        ap_ST_fsm_state73_blk = 1'b0;
    end
end

assign ap_ST_fsm_state74_blk = 1'b0;

assign ap_ST_fsm_state7_blk = 1'b0;

assign ap_ST_fsm_state8_blk = 1'b0;

assign ap_ST_fsm_state9_blk = 1'b0;

always @ (*) begin
    if ((((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1)) | (~((ap_predicate_op163_read_state73 == 1'b1) & (m_axi_gmem_RVALID == 1'b0)) & (1'b1 == ap_CS_fsm_state73) & ((icmp_ln10_1_reg_189 == 1'd1) | (icmp_ln10_reg_169 == 1'd1))))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_predicate_op163_read_state73 == 1'b1) & (m_axi_gmem_RVALID == 1'b0)) & (1'b1 == ap_CS_fsm_state73) & ((icmp_ln10_1_reg_189 == 1'd1) | (icmp_ln10_reg_169 == 1'd1)))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state74)) begin
        buffer_r_ce1 = 1'b1;
    end else begin
        buffer_r_ce1 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state74)) begin
        buffer_r_we1 = 1'b1;
    end else begin
        buffer_r_we1 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state2) & (icmp_ln10_reg_169 == 1'd0))) begin
        gmem_blk_n_AR = m_axi_gmem_ARREADY;
    end else begin
        gmem_blk_n_AR = 1'b1;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state73) & (icmp_ln10_1_reg_189 == 1'd0) & (icmp_ln10_reg_169 == 1'd0))) begin
        gmem_blk_n_R = m_axi_gmem_RVALID;
    end else begin
        gmem_blk_n_R = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_state2_io) & (1'b1 == ap_CS_fsm_state2) & (icmp_ln10_reg_169 == 1'd0))) begin
        m_axi_gmem_ARVALID = 1'b1;
    end else begin
        m_axi_gmem_ARVALID = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_predicate_op163_read_state73 == 1'b1) & (m_axi_gmem_RVALID == 1'b0)) & (ap_predicate_op163_read_state73 == 1'b1) & (1'b1 == ap_CS_fsm_state73))) begin
        m_axi_gmem_RREADY = 1'b1;
    end else begin
        m_axi_gmem_RREADY = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((1'b0 == ap_block_state2_io) & (1'b1 == ap_CS_fsm_state2) & (icmp_ln10_reg_169 == 1'd1))) begin
                ap_NS_fsm = ap_ST_fsm_state73;
            end else if (((1'b0 == ap_block_state2_io) & (1'b1 == ap_CS_fsm_state2) & (icmp_ln10_reg_169 == 1'd0))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state5;
        end
        ap_ST_fsm_state5 : begin
            ap_NS_fsm = ap_ST_fsm_state6;
        end
        ap_ST_fsm_state6 : begin
            ap_NS_fsm = ap_ST_fsm_state7;
        end
        ap_ST_fsm_state7 : begin
            ap_NS_fsm = ap_ST_fsm_state8;
        end
        ap_ST_fsm_state8 : begin
            ap_NS_fsm = ap_ST_fsm_state9;
        end
        ap_ST_fsm_state9 : begin
            ap_NS_fsm = ap_ST_fsm_state10;
        end
        ap_ST_fsm_state10 : begin
            ap_NS_fsm = ap_ST_fsm_state11;
        end
        ap_ST_fsm_state11 : begin
            ap_NS_fsm = ap_ST_fsm_state12;
        end
        ap_ST_fsm_state12 : begin
            ap_NS_fsm = ap_ST_fsm_state13;
        end
        ap_ST_fsm_state13 : begin
            ap_NS_fsm = ap_ST_fsm_state14;
        end
        ap_ST_fsm_state14 : begin
            ap_NS_fsm = ap_ST_fsm_state15;
        end
        ap_ST_fsm_state15 : begin
            ap_NS_fsm = ap_ST_fsm_state16;
        end
        ap_ST_fsm_state16 : begin
            ap_NS_fsm = ap_ST_fsm_state17;
        end
        ap_ST_fsm_state17 : begin
            ap_NS_fsm = ap_ST_fsm_state18;
        end
        ap_ST_fsm_state18 : begin
            ap_NS_fsm = ap_ST_fsm_state19;
        end
        ap_ST_fsm_state19 : begin
            ap_NS_fsm = ap_ST_fsm_state20;
        end
        ap_ST_fsm_state20 : begin
            ap_NS_fsm = ap_ST_fsm_state21;
        end
        ap_ST_fsm_state21 : begin
            ap_NS_fsm = ap_ST_fsm_state22;
        end
        ap_ST_fsm_state22 : begin
            ap_NS_fsm = ap_ST_fsm_state23;
        end
        ap_ST_fsm_state23 : begin
            ap_NS_fsm = ap_ST_fsm_state24;
        end
        ap_ST_fsm_state24 : begin
            ap_NS_fsm = ap_ST_fsm_state25;
        end
        ap_ST_fsm_state25 : begin
            ap_NS_fsm = ap_ST_fsm_state26;
        end
        ap_ST_fsm_state26 : begin
            ap_NS_fsm = ap_ST_fsm_state27;
        end
        ap_ST_fsm_state27 : begin
            ap_NS_fsm = ap_ST_fsm_state28;
        end
        ap_ST_fsm_state28 : begin
            ap_NS_fsm = ap_ST_fsm_state29;
        end
        ap_ST_fsm_state29 : begin
            ap_NS_fsm = ap_ST_fsm_state30;
        end
        ap_ST_fsm_state30 : begin
            ap_NS_fsm = ap_ST_fsm_state31;
        end
        ap_ST_fsm_state31 : begin
            ap_NS_fsm = ap_ST_fsm_state32;
        end
        ap_ST_fsm_state32 : begin
            ap_NS_fsm = ap_ST_fsm_state33;
        end
        ap_ST_fsm_state33 : begin
            ap_NS_fsm = ap_ST_fsm_state34;
        end
        ap_ST_fsm_state34 : begin
            ap_NS_fsm = ap_ST_fsm_state35;
        end
        ap_ST_fsm_state35 : begin
            ap_NS_fsm = ap_ST_fsm_state36;
        end
        ap_ST_fsm_state36 : begin
            ap_NS_fsm = ap_ST_fsm_state37;
        end
        ap_ST_fsm_state37 : begin
            ap_NS_fsm = ap_ST_fsm_state38;
        end
        ap_ST_fsm_state38 : begin
            ap_NS_fsm = ap_ST_fsm_state39;
        end
        ap_ST_fsm_state39 : begin
            ap_NS_fsm = ap_ST_fsm_state40;
        end
        ap_ST_fsm_state40 : begin
            ap_NS_fsm = ap_ST_fsm_state41;
        end
        ap_ST_fsm_state41 : begin
            ap_NS_fsm = ap_ST_fsm_state42;
        end
        ap_ST_fsm_state42 : begin
            ap_NS_fsm = ap_ST_fsm_state43;
        end
        ap_ST_fsm_state43 : begin
            ap_NS_fsm = ap_ST_fsm_state44;
        end
        ap_ST_fsm_state44 : begin
            ap_NS_fsm = ap_ST_fsm_state45;
        end
        ap_ST_fsm_state45 : begin
            ap_NS_fsm = ap_ST_fsm_state46;
        end
        ap_ST_fsm_state46 : begin
            ap_NS_fsm = ap_ST_fsm_state47;
        end
        ap_ST_fsm_state47 : begin
            ap_NS_fsm = ap_ST_fsm_state48;
        end
        ap_ST_fsm_state48 : begin
            ap_NS_fsm = ap_ST_fsm_state49;
        end
        ap_ST_fsm_state49 : begin
            ap_NS_fsm = ap_ST_fsm_state50;
        end
        ap_ST_fsm_state50 : begin
            ap_NS_fsm = ap_ST_fsm_state51;
        end
        ap_ST_fsm_state51 : begin
            ap_NS_fsm = ap_ST_fsm_state52;
        end
        ap_ST_fsm_state52 : begin
            ap_NS_fsm = ap_ST_fsm_state53;
        end
        ap_ST_fsm_state53 : begin
            ap_NS_fsm = ap_ST_fsm_state54;
        end
        ap_ST_fsm_state54 : begin
            ap_NS_fsm = ap_ST_fsm_state55;
        end
        ap_ST_fsm_state55 : begin
            ap_NS_fsm = ap_ST_fsm_state56;
        end
        ap_ST_fsm_state56 : begin
            ap_NS_fsm = ap_ST_fsm_state57;
        end
        ap_ST_fsm_state57 : begin
            ap_NS_fsm = ap_ST_fsm_state58;
        end
        ap_ST_fsm_state58 : begin
            ap_NS_fsm = ap_ST_fsm_state59;
        end
        ap_ST_fsm_state59 : begin
            ap_NS_fsm = ap_ST_fsm_state60;
        end
        ap_ST_fsm_state60 : begin
            ap_NS_fsm = ap_ST_fsm_state61;
        end
        ap_ST_fsm_state61 : begin
            ap_NS_fsm = ap_ST_fsm_state62;
        end
        ap_ST_fsm_state62 : begin
            ap_NS_fsm = ap_ST_fsm_state63;
        end
        ap_ST_fsm_state63 : begin
            ap_NS_fsm = ap_ST_fsm_state64;
        end
        ap_ST_fsm_state64 : begin
            ap_NS_fsm = ap_ST_fsm_state65;
        end
        ap_ST_fsm_state65 : begin
            ap_NS_fsm = ap_ST_fsm_state66;
        end
        ap_ST_fsm_state66 : begin
            ap_NS_fsm = ap_ST_fsm_state67;
        end
        ap_ST_fsm_state67 : begin
            ap_NS_fsm = ap_ST_fsm_state68;
        end
        ap_ST_fsm_state68 : begin
            ap_NS_fsm = ap_ST_fsm_state69;
        end
        ap_ST_fsm_state69 : begin
            ap_NS_fsm = ap_ST_fsm_state70;
        end
        ap_ST_fsm_state70 : begin
            ap_NS_fsm = ap_ST_fsm_state71;
        end
        ap_ST_fsm_state71 : begin
            ap_NS_fsm = ap_ST_fsm_state72;
        end
        ap_ST_fsm_state72 : begin
            ap_NS_fsm = ap_ST_fsm_state73;
        end
        ap_ST_fsm_state73 : begin
            if ((~((ap_predicate_op163_read_state73 == 1'b1) & (m_axi_gmem_RVALID == 1'b0)) & (1'b1 == ap_CS_fsm_state73) & ((icmp_ln10_1_reg_189 == 1'd1) | (icmp_ln10_reg_169 == 1'd1)))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else if ((~((ap_predicate_op163_read_state73 == 1'b1) & (m_axi_gmem_RVALID == 1'b0)) & (1'b1 == ap_CS_fsm_state73) & (icmp_ln10_1_reg_189 == 1'd0) & (icmp_ln10_reg_169 == 1'd0))) begin
                ap_NS_fsm = ap_ST_fsm_state74;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state73;
            end
        end
        ap_ST_fsm_state74 : begin
            ap_NS_fsm = ap_ST_fsm_state72;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln10_fu_153_p2 = (i_fu_62 + 10'd1);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state72 = ap_CS_fsm[32'd71];

assign ap_CS_fsm_state73 = ap_CS_fsm[32'd72];

assign ap_CS_fsm_state74 = ap_CS_fsm[32'd73];

always @ (*) begin
    ap_block_state2_io = ((icmp_ln10_reg_169 == 1'd0) & (m_axi_gmem_ARREADY == 1'b0));
end

always @ (*) begin
    ap_block_state73 = ((ap_predicate_op163_read_state73 == 1'b1) & (m_axi_gmem_RVALID == 1'b0));
end

always @ (*) begin
    ap_condition_756 = (~((ap_predicate_op163_read_state73 == 1'b1) & (m_axi_gmem_RVALID == 1'b0)) & (1'b1 == ap_CS_fsm_state73) & (icmp_ln10_1_reg_189 == 1'd0));
end

always @ (*) begin
    ap_predicate_op163_read_state73 = ((icmp_ln10_1_reg_189 == 1'd0) & (icmp_ln10_reg_169 == 1'd0));
end

assign buffer_r_address1 = zext_ln10_reg_193;

assign buffer_r_d1 = gmem_addr_read_reg_198;

assign icmp_ln10_1_fu_145_p2 = ((zext_ln10_1_fu_141_p1 == size) ? 1'b1 : 1'b0);

assign icmp_ln10_fu_106_p2 = ((size == 32'd0) ? 1'b1 : 1'b0);

assign m_axi_gmem_ARADDR = sext_ln10_fu_122_p1;

assign m_axi_gmem_ARBURST = 2'd0;

assign m_axi_gmem_ARCACHE = 4'd0;

assign m_axi_gmem_ARID = 1'd0;

assign m_axi_gmem_ARLEN = size;

assign m_axi_gmem_ARLOCK = 2'd0;

assign m_axi_gmem_ARPROT = 3'd0;

assign m_axi_gmem_ARQOS = 4'd0;

assign m_axi_gmem_ARREGION = 4'd0;

assign m_axi_gmem_ARSIZE = 3'd0;

assign m_axi_gmem_ARUSER = 1'd0;

assign m_axi_gmem_AWADDR = 64'd0;

assign m_axi_gmem_AWBURST = 2'd0;

assign m_axi_gmem_AWCACHE = 4'd0;

assign m_axi_gmem_AWID = 1'd0;

assign m_axi_gmem_AWLEN = 32'd0;

assign m_axi_gmem_AWLOCK = 2'd0;

assign m_axi_gmem_AWPROT = 3'd0;

assign m_axi_gmem_AWQOS = 4'd0;

assign m_axi_gmem_AWREGION = 4'd0;

assign m_axi_gmem_AWSIZE = 3'd0;

assign m_axi_gmem_AWUSER = 1'd0;

assign m_axi_gmem_AWVALID = 1'b0;

assign m_axi_gmem_BREADY = 1'b0;

assign m_axi_gmem_WDATA = 512'd0;

assign m_axi_gmem_WID = 1'd0;

assign m_axi_gmem_WLAST = 1'b0;

assign m_axi_gmem_WSTRB = 64'd0;

assign m_axi_gmem_WUSER = 1'd0;

assign m_axi_gmem_WVALID = 1'b0;

assign sext_ln10_fu_122_p1 = $signed(trunc_ln_fu_112_p4);

assign trunc_ln_fu_112_p4 = {{maxi[63:6]}};

assign zext_ln10_1_fu_141_p1 = i_fu_62;

assign zext_ln10_fu_150_p1 = i_fu_62;

always @ (posedge ap_clk) begin
    zext_ln10_reg_193[63:10] <= 54'b000000000000000000000000000000000000000000000000000000;
end

endmodule //hbm_kernel_seq_read
