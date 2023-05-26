-makelib xcelium_lib/xilinx_vip -sv \
  "/opt/xilinx/Xilinx_Vivado_vitis_2020.2/Vivado/2020.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
  "/opt/xilinx/Xilinx_Vivado_vitis_2020.2/Vivado/2020.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
  "/opt/xilinx/Xilinx_Vivado_vitis_2020.2/Vivado/2020.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
  "/opt/xilinx/Xilinx_Vivado_vitis_2020.2/Vivado/2020.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
  "/opt/xilinx/Xilinx_Vivado_vitis_2020.2/Vivado/2020.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
  "/opt/xilinx/Xilinx_Vivado_vitis_2020.2/Vivado/2020.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
  "/opt/xilinx/Xilinx_Vivado_vitis_2020.2/Vivado/2020.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
  "/opt/xilinx/Xilinx_Vivado_vitis_2020.2/Vivado/2020.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
  "/opt/xilinx/Xilinx_Vivado_vitis_2020.2/Vivado/2020.2/data/xilinx_vip/hdl/rst_vip_if.sv" \
-endlib
-makelib xcelium_lib/xpm -sv \
  "/opt/xilinx/Xilinx_Vivado_vitis_2020.2/Vivado/2020.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "/opt/xilinx/Xilinx_Vivado_vitis_2020.2/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib xcelium_lib/xpm \
  "/opt/xilinx/Xilinx_Vivado_vitis_2020.2/Vivado/2020.2/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib -sv \
  "../../../bd/design_1/ip/design_1_hbm_0_0/hdl/rtl/hbm_v1_0_9.sv" \
-endlib
-makelib xcelium_lib/hbm_v1_0_9 -sv \
  "../../../../project_2.gen/sources_1/bd/design_1/ipshared/e09e/hdl/hbm_v1_0_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib -sv \
  "../../../bd/design_1/ip/design_1_hbm_0_0/verif/model/hbm_model.sv" \
  "../../../bd/design_1/ip/design_1_hbm_0_0/sim/design_1_hbm_0_0.sv" \
-endlib
-makelib xcelium_lib/axi_infrastructure_v1_1_0 \
  "../../../../project_2.gen/sources_1/bd/design_1/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib -sv \
  "../../../bd/design_1/ip/design_1_axi_vip_0_1/sim/design_1_axi_vip_0_1_pkg.sv" \
-endlib
-makelib xcelium_lib/axi_vip_v1_1_8 -sv \
  "../../../../project_2.gen/sources_1/bd/design_1/ipshared/94c3/hdl/axi_vip_v1_1_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib -sv \
  "../../../bd/design_1/ip/design_1_axi_vip_0_1/sim/design_1_axi_vip_0_1.sv" \
  "../../../bd/design_1/ip/design_1_axi_vip_1_0/sim/design_1_axi_vip_1_0_pkg.sv" \
  "../../../bd/design_1/ip/design_1_axi_vip_1_0/sim/design_1_axi_vip_1_0.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/design_1/ip/design_1_clk_wiz_0/design_1_clk_wiz_0_clk_wiz.v" \
  "../../../bd/design_1/ip/design_1_clk_wiz_0/design_1_clk_wiz_0.v" \
  "../../../bd/design_1/ip/design_1_clk_wiz_1_0/design_1_clk_wiz_1_0_clk_wiz.v" \
  "../../../bd/design_1/ip/design_1_clk_wiz_1_0/design_1_clk_wiz_1_0.v" \
-endlib
-makelib xcelium_lib/util_vector_logic_v2_0_1 \
  "../../../../project_2.gen/sources_1/bd/design_1/ipshared/3f90/hdl/util_vector_logic_v2_0_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/design_1/ip/design_1_resetn_inv_0_0/sim/design_1_resetn_inv_0_0.v" \
  "../../../bd/design_1/ip/design_1_resetn_inv_1_0/sim/design_1_resetn_inv_1_0.v" \
-endlib
-makelib xcelium_lib/lib_cdc_v1_0_2 \
  "../../../../project_2.gen/sources_1/bd/design_1/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \
-endlib
-makelib xcelium_lib/proc_sys_reset_v5_0_13 \
  "../../../../project_2.gen/sources_1/bd/design_1/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/design_1/ip/design_1_rst_clk_wiz_100M_0/sim/design_1_rst_clk_wiz_100M_0.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../../project_2.gen/sources_1/bd/design_1/ipshared/3fa5/hdl/verilog/hbm_traffic_gen_buffer.v" \
  "../../../../project_2.gen/sources_1/bd/design_1/ipshared/3fa5/hdl/verilog/hbm_traffic_gen_cmd_m_axi.v" \
  "../../../../project_2.gen/sources_1/bd/design_1/ipshared/3fa5/hdl/verilog/hbm_traffic_gen_gmem_m_axi.v" \
  "../../../../project_2.gen/sources_1/bd/design_1/ipshared/3fa5/hdl/verilog/hbm_traffic_gen_random_read.v" \
  "../../../../project_2.gen/sources_1/bd/design_1/ipshared/3fa5/hdl/verilog/hbm_traffic_gen_random_read_write.v" \
  "../../../../project_2.gen/sources_1/bd/design_1/ipshared/3fa5/hdl/verilog/hbm_traffic_gen_random_write.v" \
  "../../../../project_2.gen/sources_1/bd/design_1/ipshared/3fa5/hdl/verilog/hbm_traffic_gen_seq_read.v" \
  "../../../../project_2.gen/sources_1/bd/design_1/ipshared/3fa5/hdl/verilog/hbm_traffic_gen_seq_read_burst.v" \
  "../../../../project_2.gen/sources_1/bd/design_1/ipshared/3fa5/hdl/verilog/hbm_traffic_gen_seq_write.v" \
  "../../../../project_2.gen/sources_1/bd/design_1/ipshared/3fa5/hdl/verilog/hbm_traffic_gen_seq_write_burst.v" \
  "../../../../project_2.gen/sources_1/bd/design_1/ipshared/3fa5/hdl/verilog/hbm_traffic_gen_urem_32ns_32ns_32_36_1.v" \
  "../../../../project_2.gen/sources_1/bd/design_1/ipshared/3fa5/hdl/verilog/hbm_traffic_gen.v" \
  "../../../bd/design_1/ip/design_1_hbm_traffic_gen_0_1/sim/design_1_hbm_traffic_gen_0_1.v" \
-endlib
-makelib xcelium_lib/generic_baseblocks_v2_1_0 \
  "../../../../project_2.gen/sources_1/bd/design_1/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_5 \
  "../../../../project_2.gen/sources_1/bd/design_1/ipshared/276e/simulation/fifo_generator_vlog_beh.v" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_5 \
  "../../../../project_2.gen/sources_1/bd/design_1/ipshared/276e/hdl/fifo_generator_v13_2_rfs.vhd" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_5 \
  "../../../../project_2.gen/sources_1/bd/design_1/ipshared/276e/hdl/fifo_generator_v13_2_rfs.v" \
-endlib
-makelib xcelium_lib/axi_data_fifo_v2_1_21 \
  "../../../../project_2.gen/sources_1/bd/design_1/ipshared/54c0/hdl/axi_data_fifo_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_register_slice_v2_1_22 \
  "../../../../project_2.gen/sources_1/bd/design_1/ipshared/af2c/hdl/axi_register_slice_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_protocol_converter_v2_1_22 \
  "../../../../project_2.gen/sources_1/bd/design_1/ipshared/5cee/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/design_1/ip/design_1_axi_protocol_convert_0_0/sim/design_1_axi_protocol_convert_0_0.v" \
  "../../../bd/design_1/sim/design_1.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib

