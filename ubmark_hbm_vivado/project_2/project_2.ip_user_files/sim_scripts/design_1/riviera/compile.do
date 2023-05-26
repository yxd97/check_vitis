vlib work
vlib riviera

vlib riviera/xilinx_vip
vlib riviera/xpm
vlib riviera/xil_defaultlib
vlib riviera/hbm_v1_0_9
vlib riviera/axi_infrastructure_v1_1_0
vlib riviera/axi_vip_v1_1_8
vlib riviera/util_vector_logic_v2_0_1
vlib riviera/lib_cdc_v1_0_2
vlib riviera/proc_sys_reset_v5_0_13
vlib riviera/generic_baseblocks_v2_1_0
vlib riviera/fifo_generator_v13_2_5
vlib riviera/axi_data_fifo_v2_1_21
vlib riviera/axi_register_slice_v2_1_22
vlib riviera/axi_protocol_converter_v2_1_22

vmap xilinx_vip riviera/xilinx_vip
vmap xpm riviera/xpm
vmap xil_defaultlib riviera/xil_defaultlib
vmap hbm_v1_0_9 riviera/hbm_v1_0_9
vmap axi_infrastructure_v1_1_0 riviera/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_8 riviera/axi_vip_v1_1_8
vmap util_vector_logic_v2_0_1 riviera/util_vector_logic_v2_0_1
vmap lib_cdc_v1_0_2 riviera/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_13 riviera/proc_sys_reset_v5_0_13
vmap generic_baseblocks_v2_1_0 riviera/generic_baseblocks_v2_1_0
vmap fifo_generator_v13_2_5 riviera/fifo_generator_v13_2_5
vmap axi_data_fifo_v2_1_21 riviera/axi_data_fifo_v2_1_21
vmap axi_register_slice_v2_1_22 riviera/axi_register_slice_v2_1_22
vmap axi_protocol_converter_v2_1_22 riviera/axi_protocol_converter_v2_1_22

vlog -work xilinx_vip  -sv2k12 "+incdir+/opt/xilinx/Xilinx_Vivado_vitis_2020.2/Vivado/2020.2/data/xilinx_vip/include" \
"/opt/xilinx/Xilinx_Vivado_vitis_2020.2/Vivado/2020.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"/opt/xilinx/Xilinx_Vivado_vitis_2020.2/Vivado/2020.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"/opt/xilinx/Xilinx_Vivado_vitis_2020.2/Vivado/2020.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"/opt/xilinx/Xilinx_Vivado_vitis_2020.2/Vivado/2020.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"/opt/xilinx/Xilinx_Vivado_vitis_2020.2/Vivado/2020.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"/opt/xilinx/Xilinx_Vivado_vitis_2020.2/Vivado/2020.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"/opt/xilinx/Xilinx_Vivado_vitis_2020.2/Vivado/2020.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
"/opt/xilinx/Xilinx_Vivado_vitis_2020.2/Vivado/2020.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
"/opt/xilinx/Xilinx_Vivado_vitis_2020.2/Vivado/2020.2/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm  -sv2k12 "+incdir+../../../bd/design_1/ip/design_1_hbm_0_0/hdl/rtl" "+incdir+../../../../project_2.gen/sources_1/bd/design_1/ipshared/e09e/verif/model" "+incdir+../../../../project_2.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../project_2.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../project_2.gen/sources_1/bd/design_1/ip/design_1_hbm_0_0/hdl/rtl" "+incdir+/opt/xilinx/Xilinx_Vivado_vitis_2020.2/Vivado/2020.2/data/xilinx_vip/include" \
"/opt/xilinx/Xilinx_Vivado_vitis_2020.2/Vivado/2020.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/opt/xilinx/Xilinx_Vivado_vitis_2020.2/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"/opt/xilinx/Xilinx_Vivado_vitis_2020.2/Vivado/2020.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../bd/design_1/ip/design_1_hbm_0_0/hdl/rtl" "+incdir+../../../../project_2.gen/sources_1/bd/design_1/ipshared/e09e/verif/model" "+incdir+../../../../project_2.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../project_2.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../project_2.gen/sources_1/bd/design_1/ip/design_1_hbm_0_0/hdl/rtl" "+incdir+/opt/xilinx/Xilinx_Vivado_vitis_2020.2/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_hbm_0_0/hdl/rtl/hbm_v1_0_9.sv" \

vlog -work hbm_v1_0_9  -sv2k12 "+incdir+../../../bd/design_1/ip/design_1_hbm_0_0/hdl/rtl" "+incdir+../../../../project_2.gen/sources_1/bd/design_1/ipshared/e09e/verif/model" "+incdir+../../../../project_2.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../project_2.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../project_2.gen/sources_1/bd/design_1/ip/design_1_hbm_0_0/hdl/rtl" "+incdir+/opt/xilinx/Xilinx_Vivado_vitis_2020.2/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../project_2.gen/sources_1/bd/design_1/ipshared/e09e/hdl/hbm_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../bd/design_1/ip/design_1_hbm_0_0/hdl/rtl" "+incdir+../../../../project_2.gen/sources_1/bd/design_1/ipshared/e09e/verif/model" "+incdir+../../../../project_2.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../project_2.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../project_2.gen/sources_1/bd/design_1/ip/design_1_hbm_0_0/hdl/rtl" "+incdir+/opt/xilinx/Xilinx_Vivado_vitis_2020.2/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_hbm_0_0/verif/model/hbm_model.sv" \
"../../../bd/design_1/ip/design_1_hbm_0_0/sim/design_1_hbm_0_0.sv" \

vlog -work axi_infrastructure_v1_1_0  -v2k5 "+incdir+../../../bd/design_1/ip/design_1_hbm_0_0/hdl/rtl" "+incdir+../../../../project_2.gen/sources_1/bd/design_1/ipshared/e09e/verif/model" "+incdir+../../../../project_2.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../project_2.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../project_2.gen/sources_1/bd/design_1/ip/design_1_hbm_0_0/hdl/rtl" "+incdir+/opt/xilinx/Xilinx_Vivado_vitis_2020.2/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../project_2.gen/sources_1/bd/design_1/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../bd/design_1/ip/design_1_hbm_0_0/hdl/rtl" "+incdir+../../../../project_2.gen/sources_1/bd/design_1/ipshared/e09e/verif/model" "+incdir+../../../../project_2.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../project_2.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../project_2.gen/sources_1/bd/design_1/ip/design_1_hbm_0_0/hdl/rtl" "+incdir+/opt/xilinx/Xilinx_Vivado_vitis_2020.2/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_axi_vip_0_1/sim/design_1_axi_vip_0_1_pkg.sv" \

vlog -work axi_vip_v1_1_8  -sv2k12 "+incdir+../../../bd/design_1/ip/design_1_hbm_0_0/hdl/rtl" "+incdir+../../../../project_2.gen/sources_1/bd/design_1/ipshared/e09e/verif/model" "+incdir+../../../../project_2.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../project_2.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../project_2.gen/sources_1/bd/design_1/ip/design_1_hbm_0_0/hdl/rtl" "+incdir+/opt/xilinx/Xilinx_Vivado_vitis_2020.2/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../project_2.gen/sources_1/bd/design_1/ipshared/94c3/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../bd/design_1/ip/design_1_hbm_0_0/hdl/rtl" "+incdir+../../../../project_2.gen/sources_1/bd/design_1/ipshared/e09e/verif/model" "+incdir+../../../../project_2.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../project_2.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../project_2.gen/sources_1/bd/design_1/ip/design_1_hbm_0_0/hdl/rtl" "+incdir+/opt/xilinx/Xilinx_Vivado_vitis_2020.2/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_axi_vip_0_1/sim/design_1_axi_vip_0_1.sv" \
"../../../bd/design_1/ip/design_1_axi_vip_1_0/sim/design_1_axi_vip_1_0_pkg.sv" \
"../../../bd/design_1/ip/design_1_axi_vip_1_0/sim/design_1_axi_vip_1_0.sv" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../bd/design_1/ip/design_1_hbm_0_0/hdl/rtl" "+incdir+../../../../project_2.gen/sources_1/bd/design_1/ipshared/e09e/verif/model" "+incdir+../../../../project_2.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../project_2.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../project_2.gen/sources_1/bd/design_1/ip/design_1_hbm_0_0/hdl/rtl" "+incdir+/opt/xilinx/Xilinx_Vivado_vitis_2020.2/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_clk_wiz_0/design_1_clk_wiz_0_clk_wiz.v" \
"../../../bd/design_1/ip/design_1_clk_wiz_0/design_1_clk_wiz_0.v" \
"../../../bd/design_1/ip/design_1_clk_wiz_1_0/design_1_clk_wiz_1_0_clk_wiz.v" \
"../../../bd/design_1/ip/design_1_clk_wiz_1_0/design_1_clk_wiz_1_0.v" \

vlog -work util_vector_logic_v2_0_1  -v2k5 "+incdir+../../../bd/design_1/ip/design_1_hbm_0_0/hdl/rtl" "+incdir+../../../../project_2.gen/sources_1/bd/design_1/ipshared/e09e/verif/model" "+incdir+../../../../project_2.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../project_2.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../project_2.gen/sources_1/bd/design_1/ip/design_1_hbm_0_0/hdl/rtl" "+incdir+/opt/xilinx/Xilinx_Vivado_vitis_2020.2/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../project_2.gen/sources_1/bd/design_1/ipshared/3f90/hdl/util_vector_logic_v2_0_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../bd/design_1/ip/design_1_hbm_0_0/hdl/rtl" "+incdir+../../../../project_2.gen/sources_1/bd/design_1/ipshared/e09e/verif/model" "+incdir+../../../../project_2.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../project_2.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../project_2.gen/sources_1/bd/design_1/ip/design_1_hbm_0_0/hdl/rtl" "+incdir+/opt/xilinx/Xilinx_Vivado_vitis_2020.2/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_resetn_inv_0_0/sim/design_1_resetn_inv_0_0.v" \
"../../../bd/design_1/ip/design_1_resetn_inv_1_0/sim/design_1_resetn_inv_1_0.v" \

vcom -work lib_cdc_v1_0_2 -93 \
"../../../../project_2.gen/sources_1/bd/design_1/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_13 -93 \
"../../../../project_2.gen/sources_1/bd/design_1/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/design_1/ip/design_1_rst_clk_wiz_100M_0/sim/design_1_rst_clk_wiz_100M_0.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../bd/design_1/ip/design_1_hbm_0_0/hdl/rtl" "+incdir+../../../../project_2.gen/sources_1/bd/design_1/ipshared/e09e/verif/model" "+incdir+../../../../project_2.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../project_2.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../project_2.gen/sources_1/bd/design_1/ip/design_1_hbm_0_0/hdl/rtl" "+incdir+/opt/xilinx/Xilinx_Vivado_vitis_2020.2/Vivado/2020.2/data/xilinx_vip/include" \
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

vlog -work generic_baseblocks_v2_1_0  -v2k5 "+incdir+../../../bd/design_1/ip/design_1_hbm_0_0/hdl/rtl" "+incdir+../../../../project_2.gen/sources_1/bd/design_1/ipshared/e09e/verif/model" "+incdir+../../../../project_2.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../project_2.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../project_2.gen/sources_1/bd/design_1/ip/design_1_hbm_0_0/hdl/rtl" "+incdir+/opt/xilinx/Xilinx_Vivado_vitis_2020.2/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../project_2.gen/sources_1/bd/design_1/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_5  -v2k5 "+incdir+../../../bd/design_1/ip/design_1_hbm_0_0/hdl/rtl" "+incdir+../../../../project_2.gen/sources_1/bd/design_1/ipshared/e09e/verif/model" "+incdir+../../../../project_2.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../project_2.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../project_2.gen/sources_1/bd/design_1/ip/design_1_hbm_0_0/hdl/rtl" "+incdir+/opt/xilinx/Xilinx_Vivado_vitis_2020.2/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../project_2.gen/sources_1/bd/design_1/ipshared/276e/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_5 -93 \
"../../../../project_2.gen/sources_1/bd/design_1/ipshared/276e/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_5  -v2k5 "+incdir+../../../bd/design_1/ip/design_1_hbm_0_0/hdl/rtl" "+incdir+../../../../project_2.gen/sources_1/bd/design_1/ipshared/e09e/verif/model" "+incdir+../../../../project_2.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../project_2.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../project_2.gen/sources_1/bd/design_1/ip/design_1_hbm_0_0/hdl/rtl" "+incdir+/opt/xilinx/Xilinx_Vivado_vitis_2020.2/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../project_2.gen/sources_1/bd/design_1/ipshared/276e/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axi_data_fifo_v2_1_21  -v2k5 "+incdir+../../../bd/design_1/ip/design_1_hbm_0_0/hdl/rtl" "+incdir+../../../../project_2.gen/sources_1/bd/design_1/ipshared/e09e/verif/model" "+incdir+../../../../project_2.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../project_2.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../project_2.gen/sources_1/bd/design_1/ip/design_1_hbm_0_0/hdl/rtl" "+incdir+/opt/xilinx/Xilinx_Vivado_vitis_2020.2/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../project_2.gen/sources_1/bd/design_1/ipshared/54c0/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_22  -v2k5 "+incdir+../../../bd/design_1/ip/design_1_hbm_0_0/hdl/rtl" "+incdir+../../../../project_2.gen/sources_1/bd/design_1/ipshared/e09e/verif/model" "+incdir+../../../../project_2.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../project_2.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../project_2.gen/sources_1/bd/design_1/ip/design_1_hbm_0_0/hdl/rtl" "+incdir+/opt/xilinx/Xilinx_Vivado_vitis_2020.2/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../project_2.gen/sources_1/bd/design_1/ipshared/af2c/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work axi_protocol_converter_v2_1_22  -v2k5 "+incdir+../../../bd/design_1/ip/design_1_hbm_0_0/hdl/rtl" "+incdir+../../../../project_2.gen/sources_1/bd/design_1/ipshared/e09e/verif/model" "+incdir+../../../../project_2.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../project_2.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../project_2.gen/sources_1/bd/design_1/ip/design_1_hbm_0_0/hdl/rtl" "+incdir+/opt/xilinx/Xilinx_Vivado_vitis_2020.2/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../project_2.gen/sources_1/bd/design_1/ipshared/5cee/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../bd/design_1/ip/design_1_hbm_0_0/hdl/rtl" "+incdir+../../../../project_2.gen/sources_1/bd/design_1/ipshared/e09e/verif/model" "+incdir+../../../../project_2.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../project_2.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../project_2.gen/sources_1/bd/design_1/ip/design_1_hbm_0_0/hdl/rtl" "+incdir+/opt/xilinx/Xilinx_Vivado_vitis_2020.2/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_axi_protocol_convert_0_0/sim/design_1_axi_protocol_convert_0_0.v" \
"../../../bd/design_1/sim/design_1.v" \

vlog -work xil_defaultlib \
"glbl.v"

