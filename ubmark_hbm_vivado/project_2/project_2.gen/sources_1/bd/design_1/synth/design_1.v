//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
//Date        : Fri May 26 18:12:33 2023
//Host        : brg-zhang-xcel.ece.cornell.edu running 64-bit CentOS Linux release 7.9.2009 (Core)
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=10,numReposBlks=10,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=1,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,da_axi4_cnt=1,da_board_cnt=4,da_clkrst_cnt=5,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "design_1.hwdef" *) 
module design_1
   (clk_100MHz,
    resetn,
    resetn_0);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK_100MHZ CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK_100MHZ, CLK_DOMAIN design_1_clk_100MHz, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000" *) input clk_100MHz;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RESETN RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RESETN, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input resetn;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RESETN_0 RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RESETN_0, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input resetn_0;

  wire [63:0]axi_protocol_convert_0_M_AXI_ARADDR;
  wire [1:0]axi_protocol_convert_0_M_AXI_ARBURST;
  wire [3:0]axi_protocol_convert_0_M_AXI_ARLEN;
  wire axi_protocol_convert_0_M_AXI_ARREADY;
  wire [2:0]axi_protocol_convert_0_M_AXI_ARSIZE;
  wire axi_protocol_convert_0_M_AXI_ARVALID;
  wire [63:0]axi_protocol_convert_0_M_AXI_AWADDR;
  wire [1:0]axi_protocol_convert_0_M_AXI_AWBURST;
  wire [3:0]axi_protocol_convert_0_M_AXI_AWLEN;
  wire axi_protocol_convert_0_M_AXI_AWREADY;
  wire [2:0]axi_protocol_convert_0_M_AXI_AWSIZE;
  wire axi_protocol_convert_0_M_AXI_AWVALID;
  wire axi_protocol_convert_0_M_AXI_BREADY;
  wire [1:0]axi_protocol_convert_0_M_AXI_BRESP;
  wire axi_protocol_convert_0_M_AXI_BVALID;
  wire [255:0]axi_protocol_convert_0_M_AXI_RDATA;
  wire axi_protocol_convert_0_M_AXI_RLAST;
  wire axi_protocol_convert_0_M_AXI_RREADY;
  wire [1:0]axi_protocol_convert_0_M_AXI_RRESP;
  wire axi_protocol_convert_0_M_AXI_RVALID;
  wire [255:0]axi_protocol_convert_0_M_AXI_WDATA;
  wire axi_protocol_convert_0_M_AXI_WLAST;
  wire axi_protocol_convert_0_M_AXI_WREADY;
  wire [31:0]axi_protocol_convert_0_M_AXI_WSTRB;
  wire axi_protocol_convert_0_M_AXI_WVALID;
  wire [63:0]axi_vip_1_M_AXI_ARADDR;
  wire [3:0]axi_vip_1_M_AXI_ARCACHE;
  wire [7:0]axi_vip_1_M_AXI_ARLEN;
  wire [0:0]axi_vip_1_M_AXI_ARLOCK;
  wire [2:0]axi_vip_1_M_AXI_ARPROT;
  wire [3:0]axi_vip_1_M_AXI_ARQOS;
  wire axi_vip_1_M_AXI_ARREADY;
  wire [3:0]axi_vip_1_M_AXI_ARREGION;
  wire axi_vip_1_M_AXI_ARVALID;
  wire [63:0]axi_vip_1_M_AXI_AWADDR;
  wire [3:0]axi_vip_1_M_AXI_AWCACHE;
  wire [7:0]axi_vip_1_M_AXI_AWLEN;
  wire [0:0]axi_vip_1_M_AXI_AWLOCK;
  wire [2:0]axi_vip_1_M_AXI_AWPROT;
  wire [3:0]axi_vip_1_M_AXI_AWQOS;
  wire axi_vip_1_M_AXI_AWREADY;
  wire [3:0]axi_vip_1_M_AXI_AWREGION;
  wire axi_vip_1_M_AXI_AWVALID;
  wire axi_vip_1_M_AXI_BREADY;
  wire [1:0]axi_vip_1_M_AXI_BRESP;
  wire axi_vip_1_M_AXI_BVALID;
  wire [255:0]axi_vip_1_M_AXI_RDATA;
  wire axi_vip_1_M_AXI_RLAST;
  wire axi_vip_1_M_AXI_RREADY;
  wire [1:0]axi_vip_1_M_AXI_RRESP;
  wire axi_vip_1_M_AXI_RVALID;
  wire [255:0]axi_vip_1_M_AXI_WDATA;
  wire axi_vip_1_M_AXI_WLAST;
  wire axi_vip_1_M_AXI_WREADY;
  wire [31:0]axi_vip_1_M_AXI_WSTRB;
  wire axi_vip_1_M_AXI_WVALID;
  wire clk_100MHz_1;
  wire clk_wiz_1_clk_out1;
  wire clk_wiz_clk_out1;
  wire clk_wiz_locked;
  wire [63:0]hbm_traffic_gen_0_m_axi_cmd_ARADDR;
  wire [3:0]hbm_traffic_gen_0_m_axi_cmd_ARCACHE;
  wire [7:0]hbm_traffic_gen_0_m_axi_cmd_ARLEN;
  wire [1:0]hbm_traffic_gen_0_m_axi_cmd_ARLOCK;
  wire [2:0]hbm_traffic_gen_0_m_axi_cmd_ARPROT;
  wire [3:0]hbm_traffic_gen_0_m_axi_cmd_ARQOS;
  wire hbm_traffic_gen_0_m_axi_cmd_ARREADY;
  wire [3:0]hbm_traffic_gen_0_m_axi_cmd_ARREGION;
  wire hbm_traffic_gen_0_m_axi_cmd_ARVALID;
  wire [63:0]hbm_traffic_gen_0_m_axi_cmd_AWADDR;
  wire [3:0]hbm_traffic_gen_0_m_axi_cmd_AWCACHE;
  wire [7:0]hbm_traffic_gen_0_m_axi_cmd_AWLEN;
  wire [1:0]hbm_traffic_gen_0_m_axi_cmd_AWLOCK;
  wire [2:0]hbm_traffic_gen_0_m_axi_cmd_AWPROT;
  wire [3:0]hbm_traffic_gen_0_m_axi_cmd_AWQOS;
  wire hbm_traffic_gen_0_m_axi_cmd_AWREADY;
  wire [3:0]hbm_traffic_gen_0_m_axi_cmd_AWREGION;
  wire hbm_traffic_gen_0_m_axi_cmd_AWVALID;
  wire hbm_traffic_gen_0_m_axi_cmd_BREADY;
  wire [1:0]hbm_traffic_gen_0_m_axi_cmd_BRESP;
  wire hbm_traffic_gen_0_m_axi_cmd_BVALID;
  wire [31:0]hbm_traffic_gen_0_m_axi_cmd_RDATA;
  wire hbm_traffic_gen_0_m_axi_cmd_RLAST;
  wire hbm_traffic_gen_0_m_axi_cmd_RREADY;
  wire [1:0]hbm_traffic_gen_0_m_axi_cmd_RRESP;
  wire hbm_traffic_gen_0_m_axi_cmd_RVALID;
  wire [31:0]hbm_traffic_gen_0_m_axi_cmd_WDATA;
  wire hbm_traffic_gen_0_m_axi_cmd_WLAST;
  wire hbm_traffic_gen_0_m_axi_cmd_WREADY;
  wire [3:0]hbm_traffic_gen_0_m_axi_cmd_WSTRB;
  wire hbm_traffic_gen_0_m_axi_cmd_WVALID;
  wire [63:0]hbm_traffic_gen_0_m_axi_gmem_ARADDR;
  wire [3:0]hbm_traffic_gen_0_m_axi_gmem_ARCACHE;
  wire [7:0]hbm_traffic_gen_0_m_axi_gmem_ARLEN;
  wire [1:0]hbm_traffic_gen_0_m_axi_gmem_ARLOCK;
  wire [2:0]hbm_traffic_gen_0_m_axi_gmem_ARPROT;
  wire [3:0]hbm_traffic_gen_0_m_axi_gmem_ARQOS;
  wire hbm_traffic_gen_0_m_axi_gmem_ARREADY;
  wire [3:0]hbm_traffic_gen_0_m_axi_gmem_ARREGION;
  wire hbm_traffic_gen_0_m_axi_gmem_ARVALID;
  wire [63:0]hbm_traffic_gen_0_m_axi_gmem_AWADDR;
  wire [3:0]hbm_traffic_gen_0_m_axi_gmem_AWCACHE;
  wire [7:0]hbm_traffic_gen_0_m_axi_gmem_AWLEN;
  wire [1:0]hbm_traffic_gen_0_m_axi_gmem_AWLOCK;
  wire [2:0]hbm_traffic_gen_0_m_axi_gmem_AWPROT;
  wire [3:0]hbm_traffic_gen_0_m_axi_gmem_AWQOS;
  wire hbm_traffic_gen_0_m_axi_gmem_AWREADY;
  wire [3:0]hbm_traffic_gen_0_m_axi_gmem_AWREGION;
  wire hbm_traffic_gen_0_m_axi_gmem_AWVALID;
  wire hbm_traffic_gen_0_m_axi_gmem_BREADY;
  wire [1:0]hbm_traffic_gen_0_m_axi_gmem_BRESP;
  wire hbm_traffic_gen_0_m_axi_gmem_BVALID;
  wire [255:0]hbm_traffic_gen_0_m_axi_gmem_RDATA;
  wire hbm_traffic_gen_0_m_axi_gmem_RLAST;
  wire hbm_traffic_gen_0_m_axi_gmem_RREADY;
  wire [1:0]hbm_traffic_gen_0_m_axi_gmem_RRESP;
  wire hbm_traffic_gen_0_m_axi_gmem_RVALID;
  wire [255:0]hbm_traffic_gen_0_m_axi_gmem_WDATA;
  wire hbm_traffic_gen_0_m_axi_gmem_WLAST;
  wire hbm_traffic_gen_0_m_axi_gmem_WREADY;
  wire [31:0]hbm_traffic_gen_0_m_axi_gmem_WSTRB;
  wire hbm_traffic_gen_0_m_axi_gmem_WVALID;
  wire resetn_0_1;
  wire resetn_1;
  wire [0:0]resetn_inv_0_Res;
  wire [0:0]resetn_inv_1_Res;
  wire [0:0]rst_clk_wiz_100M_peripheral_aresetn;

  assign clk_100MHz_1 = clk_100MHz;
  assign resetn_0_1 = resetn_0;
  assign resetn_1 = resetn;
  design_1_axi_protocol_convert_0_0 axi_protocol_convert_0
       (.aclk(clk_wiz_clk_out1),
        .aresetn(rst_clk_wiz_100M_peripheral_aresetn),
        .m_axi_araddr(axi_protocol_convert_0_M_AXI_ARADDR),
        .m_axi_arburst(axi_protocol_convert_0_M_AXI_ARBURST),
        .m_axi_arlen(axi_protocol_convert_0_M_AXI_ARLEN),
        .m_axi_arready(axi_protocol_convert_0_M_AXI_ARREADY),
        .m_axi_arsize(axi_protocol_convert_0_M_AXI_ARSIZE),
        .m_axi_arvalid(axi_protocol_convert_0_M_AXI_ARVALID),
        .m_axi_awaddr(axi_protocol_convert_0_M_AXI_AWADDR),
        .m_axi_awburst(axi_protocol_convert_0_M_AXI_AWBURST),
        .m_axi_awlen(axi_protocol_convert_0_M_AXI_AWLEN),
        .m_axi_awready(axi_protocol_convert_0_M_AXI_AWREADY),
        .m_axi_awsize(axi_protocol_convert_0_M_AXI_AWSIZE),
        .m_axi_awvalid(axi_protocol_convert_0_M_AXI_AWVALID),
        .m_axi_bready(axi_protocol_convert_0_M_AXI_BREADY),
        .m_axi_bresp(axi_protocol_convert_0_M_AXI_BRESP),
        .m_axi_bvalid(axi_protocol_convert_0_M_AXI_BVALID),
        .m_axi_rdata(axi_protocol_convert_0_M_AXI_RDATA),
        .m_axi_rlast(axi_protocol_convert_0_M_AXI_RLAST),
        .m_axi_rready(axi_protocol_convert_0_M_AXI_RREADY),
        .m_axi_rresp(axi_protocol_convert_0_M_AXI_RRESP),
        .m_axi_rvalid(axi_protocol_convert_0_M_AXI_RVALID),
        .m_axi_wdata(axi_protocol_convert_0_M_AXI_WDATA),
        .m_axi_wlast(axi_protocol_convert_0_M_AXI_WLAST),
        .m_axi_wready(axi_protocol_convert_0_M_AXI_WREADY),
        .m_axi_wstrb(axi_protocol_convert_0_M_AXI_WSTRB),
        .m_axi_wvalid(axi_protocol_convert_0_M_AXI_WVALID),
        .s_axi_araddr(axi_vip_1_M_AXI_ARADDR),
        .s_axi_arburst({1'b0,1'b1}),
        .s_axi_arcache(axi_vip_1_M_AXI_ARCACHE),
        .s_axi_arlen(axi_vip_1_M_AXI_ARLEN),
        .s_axi_arlock(axi_vip_1_M_AXI_ARLOCK),
        .s_axi_arprot(axi_vip_1_M_AXI_ARPROT),
        .s_axi_arqos(axi_vip_1_M_AXI_ARQOS),
        .s_axi_arready(axi_vip_1_M_AXI_ARREADY),
        .s_axi_arregion(axi_vip_1_M_AXI_ARREGION),
        .s_axi_arsize({1'b1,1'b0,1'b1}),
        .s_axi_arvalid(axi_vip_1_M_AXI_ARVALID),
        .s_axi_awaddr(axi_vip_1_M_AXI_AWADDR),
        .s_axi_awburst({1'b0,1'b1}),
        .s_axi_awcache(axi_vip_1_M_AXI_AWCACHE),
        .s_axi_awlen(axi_vip_1_M_AXI_AWLEN),
        .s_axi_awlock(axi_vip_1_M_AXI_AWLOCK),
        .s_axi_awprot(axi_vip_1_M_AXI_AWPROT),
        .s_axi_awqos(axi_vip_1_M_AXI_AWQOS),
        .s_axi_awready(axi_vip_1_M_AXI_AWREADY),
        .s_axi_awregion(axi_vip_1_M_AXI_AWREGION),
        .s_axi_awsize({1'b1,1'b0,1'b1}),
        .s_axi_awvalid(axi_vip_1_M_AXI_AWVALID),
        .s_axi_bready(axi_vip_1_M_AXI_BREADY),
        .s_axi_bresp(axi_vip_1_M_AXI_BRESP),
        .s_axi_bvalid(axi_vip_1_M_AXI_BVALID),
        .s_axi_rdata(axi_vip_1_M_AXI_RDATA),
        .s_axi_rlast(axi_vip_1_M_AXI_RLAST),
        .s_axi_rready(axi_vip_1_M_AXI_RREADY),
        .s_axi_rresp(axi_vip_1_M_AXI_RRESP),
        .s_axi_rvalid(axi_vip_1_M_AXI_RVALID),
        .s_axi_wdata(axi_vip_1_M_AXI_WDATA),
        .s_axi_wlast(axi_vip_1_M_AXI_WLAST),
        .s_axi_wready(axi_vip_1_M_AXI_WREADY),
        .s_axi_wstrb(axi_vip_1_M_AXI_WSTRB),
        .s_axi_wvalid(axi_vip_1_M_AXI_WVALID));
  design_1_axi_vip_0_1 axi_vip_0
       (.aclk(clk_wiz_clk_out1),
        .aresetn(rst_clk_wiz_100M_peripheral_aresetn),
        .s_axi_araddr(hbm_traffic_gen_0_m_axi_cmd_ARADDR[31:0]),
        .s_axi_arcache(hbm_traffic_gen_0_m_axi_cmd_ARCACHE),
        .s_axi_arlen(hbm_traffic_gen_0_m_axi_cmd_ARLEN),
        .s_axi_arlock(hbm_traffic_gen_0_m_axi_cmd_ARLOCK[0]),
        .s_axi_arprot(hbm_traffic_gen_0_m_axi_cmd_ARPROT),
        .s_axi_arqos(hbm_traffic_gen_0_m_axi_cmd_ARQOS),
        .s_axi_arready(hbm_traffic_gen_0_m_axi_cmd_ARREADY),
        .s_axi_arregion(hbm_traffic_gen_0_m_axi_cmd_ARREGION),
        .s_axi_arvalid(hbm_traffic_gen_0_m_axi_cmd_ARVALID),
        .s_axi_awaddr(hbm_traffic_gen_0_m_axi_cmd_AWADDR[31:0]),
        .s_axi_awcache(hbm_traffic_gen_0_m_axi_cmd_AWCACHE),
        .s_axi_awlen(hbm_traffic_gen_0_m_axi_cmd_AWLEN),
        .s_axi_awlock(hbm_traffic_gen_0_m_axi_cmd_AWLOCK[0]),
        .s_axi_awprot(hbm_traffic_gen_0_m_axi_cmd_AWPROT),
        .s_axi_awqos(hbm_traffic_gen_0_m_axi_cmd_AWQOS),
        .s_axi_awready(hbm_traffic_gen_0_m_axi_cmd_AWREADY),
        .s_axi_awregion(hbm_traffic_gen_0_m_axi_cmd_AWREGION),
        .s_axi_awvalid(hbm_traffic_gen_0_m_axi_cmd_AWVALID),
        .s_axi_bready(hbm_traffic_gen_0_m_axi_cmd_BREADY),
        .s_axi_bresp(hbm_traffic_gen_0_m_axi_cmd_BRESP),
        .s_axi_bvalid(hbm_traffic_gen_0_m_axi_cmd_BVALID),
        .s_axi_rdata(hbm_traffic_gen_0_m_axi_cmd_RDATA),
        .s_axi_rlast(hbm_traffic_gen_0_m_axi_cmd_RLAST),
        .s_axi_rready(hbm_traffic_gen_0_m_axi_cmd_RREADY),
        .s_axi_rresp(hbm_traffic_gen_0_m_axi_cmd_RRESP),
        .s_axi_rvalid(hbm_traffic_gen_0_m_axi_cmd_RVALID),
        .s_axi_wdata(hbm_traffic_gen_0_m_axi_cmd_WDATA),
        .s_axi_wlast(hbm_traffic_gen_0_m_axi_cmd_WLAST),
        .s_axi_wready(hbm_traffic_gen_0_m_axi_cmd_WREADY),
        .s_axi_wstrb(hbm_traffic_gen_0_m_axi_cmd_WSTRB),
        .s_axi_wvalid(hbm_traffic_gen_0_m_axi_cmd_WVALID));
  design_1_axi_vip_1_0 axi_vip_1
       (.aclk(clk_wiz_clk_out1),
        .aresetn(rst_clk_wiz_100M_peripheral_aresetn),
        .m_axi_araddr(axi_vip_1_M_AXI_ARADDR),
        .m_axi_arcache(axi_vip_1_M_AXI_ARCACHE),
        .m_axi_arlen(axi_vip_1_M_AXI_ARLEN),
        .m_axi_arlock(axi_vip_1_M_AXI_ARLOCK),
        .m_axi_arprot(axi_vip_1_M_AXI_ARPROT),
        .m_axi_arqos(axi_vip_1_M_AXI_ARQOS),
        .m_axi_arready(axi_vip_1_M_AXI_ARREADY),
        .m_axi_arregion(axi_vip_1_M_AXI_ARREGION),
        .m_axi_arvalid(axi_vip_1_M_AXI_ARVALID),
        .m_axi_awaddr(axi_vip_1_M_AXI_AWADDR),
        .m_axi_awcache(axi_vip_1_M_AXI_AWCACHE),
        .m_axi_awlen(axi_vip_1_M_AXI_AWLEN),
        .m_axi_awlock(axi_vip_1_M_AXI_AWLOCK),
        .m_axi_awprot(axi_vip_1_M_AXI_AWPROT),
        .m_axi_awqos(axi_vip_1_M_AXI_AWQOS),
        .m_axi_awready(axi_vip_1_M_AXI_AWREADY),
        .m_axi_awregion(axi_vip_1_M_AXI_AWREGION),
        .m_axi_awvalid(axi_vip_1_M_AXI_AWVALID),
        .m_axi_bready(axi_vip_1_M_AXI_BREADY),
        .m_axi_bresp(axi_vip_1_M_AXI_BRESP),
        .m_axi_bvalid(axi_vip_1_M_AXI_BVALID),
        .m_axi_rdata(axi_vip_1_M_AXI_RDATA),
        .m_axi_rlast(axi_vip_1_M_AXI_RLAST),
        .m_axi_rready(axi_vip_1_M_AXI_RREADY),
        .m_axi_rresp(axi_vip_1_M_AXI_RRESP),
        .m_axi_rvalid(axi_vip_1_M_AXI_RVALID),
        .m_axi_wdata(axi_vip_1_M_AXI_WDATA),
        .m_axi_wlast(axi_vip_1_M_AXI_WLAST),
        .m_axi_wready(axi_vip_1_M_AXI_WREADY),
        .m_axi_wstrb(axi_vip_1_M_AXI_WSTRB),
        .m_axi_wvalid(axi_vip_1_M_AXI_WVALID),
        .s_axi_araddr(hbm_traffic_gen_0_m_axi_gmem_ARADDR),
        .s_axi_arcache(hbm_traffic_gen_0_m_axi_gmem_ARCACHE),
        .s_axi_arlen(hbm_traffic_gen_0_m_axi_gmem_ARLEN),
        .s_axi_arlock(hbm_traffic_gen_0_m_axi_gmem_ARLOCK[0]),
        .s_axi_arprot(hbm_traffic_gen_0_m_axi_gmem_ARPROT),
        .s_axi_arqos(hbm_traffic_gen_0_m_axi_gmem_ARQOS),
        .s_axi_arready(hbm_traffic_gen_0_m_axi_gmem_ARREADY),
        .s_axi_arregion(hbm_traffic_gen_0_m_axi_gmem_ARREGION),
        .s_axi_arvalid(hbm_traffic_gen_0_m_axi_gmem_ARVALID),
        .s_axi_awaddr(hbm_traffic_gen_0_m_axi_gmem_AWADDR),
        .s_axi_awcache(hbm_traffic_gen_0_m_axi_gmem_AWCACHE),
        .s_axi_awlen(hbm_traffic_gen_0_m_axi_gmem_AWLEN),
        .s_axi_awlock(hbm_traffic_gen_0_m_axi_gmem_AWLOCK[0]),
        .s_axi_awprot(hbm_traffic_gen_0_m_axi_gmem_AWPROT),
        .s_axi_awqos(hbm_traffic_gen_0_m_axi_gmem_AWQOS),
        .s_axi_awready(hbm_traffic_gen_0_m_axi_gmem_AWREADY),
        .s_axi_awregion(hbm_traffic_gen_0_m_axi_gmem_AWREGION),
        .s_axi_awvalid(hbm_traffic_gen_0_m_axi_gmem_AWVALID),
        .s_axi_bready(hbm_traffic_gen_0_m_axi_gmem_BREADY),
        .s_axi_bresp(hbm_traffic_gen_0_m_axi_gmem_BRESP),
        .s_axi_bvalid(hbm_traffic_gen_0_m_axi_gmem_BVALID),
        .s_axi_rdata(hbm_traffic_gen_0_m_axi_gmem_RDATA),
        .s_axi_rlast(hbm_traffic_gen_0_m_axi_gmem_RLAST),
        .s_axi_rready(hbm_traffic_gen_0_m_axi_gmem_RREADY),
        .s_axi_rresp(hbm_traffic_gen_0_m_axi_gmem_RRESP),
        .s_axi_rvalid(hbm_traffic_gen_0_m_axi_gmem_RVALID),
        .s_axi_wdata(hbm_traffic_gen_0_m_axi_gmem_WDATA),
        .s_axi_wlast(hbm_traffic_gen_0_m_axi_gmem_WLAST),
        .s_axi_wready(hbm_traffic_gen_0_m_axi_gmem_WREADY),
        .s_axi_wstrb(hbm_traffic_gen_0_m_axi_gmem_WSTRB),
        .s_axi_wvalid(hbm_traffic_gen_0_m_axi_gmem_WVALID));
  design_1_clk_wiz_0 clk_wiz
       (.clk_in1(clk_100MHz_1),
        .clk_out1(clk_wiz_clk_out1),
        .locked(clk_wiz_locked),
        .reset(resetn_inv_0_Res));
  design_1_clk_wiz_1_0 clk_wiz_1
       (.clk_in1(clk_100MHz_1),
        .clk_out1(clk_wiz_1_clk_out1),
        .reset(resetn_inv_1_Res));
  design_1_hbm_0_0 hbm_0
       (.APB_0_PCLK(clk_wiz_clk_out1),
        .APB_0_PRESET_N(rst_clk_wiz_100M_peripheral_aresetn),
        .AXI_00_ACLK(clk_wiz_clk_out1),
        .AXI_00_ARADDR(axi_protocol_convert_0_M_AXI_ARADDR[32:0]),
        .AXI_00_ARBURST(axi_protocol_convert_0_M_AXI_ARBURST),
        .AXI_00_ARESET_N(rst_clk_wiz_100M_peripheral_aresetn),
        .AXI_00_ARID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .AXI_00_ARLEN(axi_protocol_convert_0_M_AXI_ARLEN),
        .AXI_00_ARREADY(axi_protocol_convert_0_M_AXI_ARREADY),
        .AXI_00_ARSIZE(axi_protocol_convert_0_M_AXI_ARSIZE),
        .AXI_00_ARVALID(axi_protocol_convert_0_M_AXI_ARVALID),
        .AXI_00_AWADDR(axi_protocol_convert_0_M_AXI_AWADDR[32:0]),
        .AXI_00_AWBURST(axi_protocol_convert_0_M_AXI_AWBURST),
        .AXI_00_AWID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .AXI_00_AWLEN(axi_protocol_convert_0_M_AXI_AWLEN),
        .AXI_00_AWREADY(axi_protocol_convert_0_M_AXI_AWREADY),
        .AXI_00_AWSIZE(axi_protocol_convert_0_M_AXI_AWSIZE),
        .AXI_00_AWVALID(axi_protocol_convert_0_M_AXI_AWVALID),
        .AXI_00_BREADY(axi_protocol_convert_0_M_AXI_BREADY),
        .AXI_00_BRESP(axi_protocol_convert_0_M_AXI_BRESP),
        .AXI_00_BVALID(axi_protocol_convert_0_M_AXI_BVALID),
        .AXI_00_RDATA(axi_protocol_convert_0_M_AXI_RDATA),
        .AXI_00_RLAST(axi_protocol_convert_0_M_AXI_RLAST),
        .AXI_00_RREADY(axi_protocol_convert_0_M_AXI_RREADY),
        .AXI_00_RRESP(axi_protocol_convert_0_M_AXI_RRESP),
        .AXI_00_RVALID(axi_protocol_convert_0_M_AXI_RVALID),
        .AXI_00_WDATA(axi_protocol_convert_0_M_AXI_WDATA),
        .AXI_00_WDATA_PARITY({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .AXI_00_WLAST(axi_protocol_convert_0_M_AXI_WLAST),
        .AXI_00_WREADY(axi_protocol_convert_0_M_AXI_WREADY),
        .AXI_00_WSTRB(axi_protocol_convert_0_M_AXI_WSTRB),
        .AXI_00_WVALID(axi_protocol_convert_0_M_AXI_WVALID),
        .HBM_REF_CLK_0(clk_wiz_1_clk_out1));
  design_1_hbm_traffic_gen_0_1 hbm_traffic_gen_0
       (.ap_clk(clk_wiz_clk_out1),
        .ap_rst_n(rst_clk_wiz_100M_peripheral_aresetn),
        .m_axi_cmd_ARADDR(hbm_traffic_gen_0_m_axi_cmd_ARADDR),
        .m_axi_cmd_ARCACHE(hbm_traffic_gen_0_m_axi_cmd_ARCACHE),
        .m_axi_cmd_ARLEN(hbm_traffic_gen_0_m_axi_cmd_ARLEN),
        .m_axi_cmd_ARLOCK(hbm_traffic_gen_0_m_axi_cmd_ARLOCK),
        .m_axi_cmd_ARPROT(hbm_traffic_gen_0_m_axi_cmd_ARPROT),
        .m_axi_cmd_ARQOS(hbm_traffic_gen_0_m_axi_cmd_ARQOS),
        .m_axi_cmd_ARREADY(hbm_traffic_gen_0_m_axi_cmd_ARREADY),
        .m_axi_cmd_ARREGION(hbm_traffic_gen_0_m_axi_cmd_ARREGION),
        .m_axi_cmd_ARVALID(hbm_traffic_gen_0_m_axi_cmd_ARVALID),
        .m_axi_cmd_AWADDR(hbm_traffic_gen_0_m_axi_cmd_AWADDR),
        .m_axi_cmd_AWCACHE(hbm_traffic_gen_0_m_axi_cmd_AWCACHE),
        .m_axi_cmd_AWLEN(hbm_traffic_gen_0_m_axi_cmd_AWLEN),
        .m_axi_cmd_AWLOCK(hbm_traffic_gen_0_m_axi_cmd_AWLOCK),
        .m_axi_cmd_AWPROT(hbm_traffic_gen_0_m_axi_cmd_AWPROT),
        .m_axi_cmd_AWQOS(hbm_traffic_gen_0_m_axi_cmd_AWQOS),
        .m_axi_cmd_AWREADY(hbm_traffic_gen_0_m_axi_cmd_AWREADY),
        .m_axi_cmd_AWREGION(hbm_traffic_gen_0_m_axi_cmd_AWREGION),
        .m_axi_cmd_AWVALID(hbm_traffic_gen_0_m_axi_cmd_AWVALID),
        .m_axi_cmd_BREADY(hbm_traffic_gen_0_m_axi_cmd_BREADY),
        .m_axi_cmd_BRESP(hbm_traffic_gen_0_m_axi_cmd_BRESP),
        .m_axi_cmd_BVALID(hbm_traffic_gen_0_m_axi_cmd_BVALID),
        .m_axi_cmd_RDATA(hbm_traffic_gen_0_m_axi_cmd_RDATA),
        .m_axi_cmd_RLAST(hbm_traffic_gen_0_m_axi_cmd_RLAST),
        .m_axi_cmd_RREADY(hbm_traffic_gen_0_m_axi_cmd_RREADY),
        .m_axi_cmd_RRESP(hbm_traffic_gen_0_m_axi_cmd_RRESP),
        .m_axi_cmd_RVALID(hbm_traffic_gen_0_m_axi_cmd_RVALID),
        .m_axi_cmd_WDATA(hbm_traffic_gen_0_m_axi_cmd_WDATA),
        .m_axi_cmd_WLAST(hbm_traffic_gen_0_m_axi_cmd_WLAST),
        .m_axi_cmd_WREADY(hbm_traffic_gen_0_m_axi_cmd_WREADY),
        .m_axi_cmd_WSTRB(hbm_traffic_gen_0_m_axi_cmd_WSTRB),
        .m_axi_cmd_WVALID(hbm_traffic_gen_0_m_axi_cmd_WVALID),
        .m_axi_gmem_ARADDR(hbm_traffic_gen_0_m_axi_gmem_ARADDR),
        .m_axi_gmem_ARCACHE(hbm_traffic_gen_0_m_axi_gmem_ARCACHE),
        .m_axi_gmem_ARLEN(hbm_traffic_gen_0_m_axi_gmem_ARLEN),
        .m_axi_gmem_ARLOCK(hbm_traffic_gen_0_m_axi_gmem_ARLOCK),
        .m_axi_gmem_ARPROT(hbm_traffic_gen_0_m_axi_gmem_ARPROT),
        .m_axi_gmem_ARQOS(hbm_traffic_gen_0_m_axi_gmem_ARQOS),
        .m_axi_gmem_ARREADY(hbm_traffic_gen_0_m_axi_gmem_ARREADY),
        .m_axi_gmem_ARREGION(hbm_traffic_gen_0_m_axi_gmem_ARREGION),
        .m_axi_gmem_ARVALID(hbm_traffic_gen_0_m_axi_gmem_ARVALID),
        .m_axi_gmem_AWADDR(hbm_traffic_gen_0_m_axi_gmem_AWADDR),
        .m_axi_gmem_AWCACHE(hbm_traffic_gen_0_m_axi_gmem_AWCACHE),
        .m_axi_gmem_AWLEN(hbm_traffic_gen_0_m_axi_gmem_AWLEN),
        .m_axi_gmem_AWLOCK(hbm_traffic_gen_0_m_axi_gmem_AWLOCK),
        .m_axi_gmem_AWPROT(hbm_traffic_gen_0_m_axi_gmem_AWPROT),
        .m_axi_gmem_AWQOS(hbm_traffic_gen_0_m_axi_gmem_AWQOS),
        .m_axi_gmem_AWREADY(hbm_traffic_gen_0_m_axi_gmem_AWREADY),
        .m_axi_gmem_AWREGION(hbm_traffic_gen_0_m_axi_gmem_AWREGION),
        .m_axi_gmem_AWVALID(hbm_traffic_gen_0_m_axi_gmem_AWVALID),
        .m_axi_gmem_BREADY(hbm_traffic_gen_0_m_axi_gmem_BREADY),
        .m_axi_gmem_BRESP(hbm_traffic_gen_0_m_axi_gmem_BRESP),
        .m_axi_gmem_BVALID(hbm_traffic_gen_0_m_axi_gmem_BVALID),
        .m_axi_gmem_RDATA(hbm_traffic_gen_0_m_axi_gmem_RDATA),
        .m_axi_gmem_RLAST(hbm_traffic_gen_0_m_axi_gmem_RLAST),
        .m_axi_gmem_RREADY(hbm_traffic_gen_0_m_axi_gmem_RREADY),
        .m_axi_gmem_RRESP(hbm_traffic_gen_0_m_axi_gmem_RRESP),
        .m_axi_gmem_RVALID(hbm_traffic_gen_0_m_axi_gmem_RVALID),
        .m_axi_gmem_WDATA(hbm_traffic_gen_0_m_axi_gmem_WDATA),
        .m_axi_gmem_WLAST(hbm_traffic_gen_0_m_axi_gmem_WLAST),
        .m_axi_gmem_WREADY(hbm_traffic_gen_0_m_axi_gmem_WREADY),
        .m_axi_gmem_WSTRB(hbm_traffic_gen_0_m_axi_gmem_WSTRB),
        .m_axi_gmem_WVALID(hbm_traffic_gen_0_m_axi_gmem_WVALID));
  design_1_resetn_inv_0_0 resetn_inv_0
       (.Op1(resetn_1),
        .Res(resetn_inv_0_Res));
  design_1_resetn_inv_1_0 resetn_inv_1
       (.Op1(resetn_0_1),
        .Res(resetn_inv_1_Res));
  design_1_rst_clk_wiz_100M_0 rst_clk_wiz_100M
       (.aux_reset_in(1'b1),
        .dcm_locked(clk_wiz_locked),
        .ext_reset_in(resetn_inv_0_Res),
        .mb_debug_sys_rst(1'b0),
        .peripheral_aresetn(rst_clk_wiz_100M_peripheral_aresetn),
        .slowest_sync_clk(clk_wiz_clk_out1));
endmodule
