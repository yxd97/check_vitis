
################################################################
# This is a generated script based on design: design_1
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2020.2
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_gid_msg -ssname BD::TCL -id 2041 -severity "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source design_1_script.tcl

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xcu280-fsvh2892-2L-e
   set_property BOARD_PART xilinx.com:au280:part0:1.2 [current_project]
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name design_1

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_gid_msg -ssname BD::TCL -id 2001 -severity "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_gid_msg -ssname BD::TCL -id 2002 -severity "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_gid_msg -ssname BD::TCL -id 2003 -severity "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_gid_msg -ssname BD::TCL -id 2004 -severity "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_gid_msg -ssname BD::TCL -id 2005 -severity "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_gid_msg -ssname BD::TCL -id 2006 -severity "ERROR" $errMsg}
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports

  # Create ports
  set clk_100MHz [ create_bd_port -dir I -type clk -freq_hz 100000000 clk_100MHz ]
  set resetn [ create_bd_port -dir I -type rst resetn ]
  set_property -dict [ list \
   CONFIG.POLARITY {ACTIVE_LOW} \
 ] $resetn
  set resetn_0 [ create_bd_port -dir I -type rst resetn_0 ]
  set_property -dict [ list \
   CONFIG.POLARITY {ACTIVE_LOW} \
 ] $resetn_0

  # Create instance: axi_protocol_convert_0, and set properties
  set axi_protocol_convert_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_protocol_converter:2.1 axi_protocol_convert_0 ]
  set_property -dict [ list \
   CONFIG.DATA_WIDTH {256} \
   CONFIG.MI_PROTOCOL {AXI3} \
   CONFIG.TRANSLATION_MODE {2} \
 ] $axi_protocol_convert_0

  # Create instance: axi_vip_0, and set properties
  set axi_vip_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_vip:1.1 axi_vip_0 ]
  set_property -dict [ list \
   CONFIG.ADDR_WIDTH {32} \
   CONFIG.DATA_WIDTH {32} \
   CONFIG.INTERFACE_MODE {SLAVE} \
   CONFIG.PROTOCOL {AXI4} \
   CONFIG.READ_WRITE_MODE {READ_WRITE} \
 ] $axi_vip_0

  # Create instance: axi_vip_1, and set properties
  set axi_vip_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_vip:1.1 axi_vip_1 ]

  # Create instance: clk_wiz, and set properties
  set clk_wiz [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:6.0 clk_wiz ]
  set_property -dict [ list \
   CONFIG.RESET_BOARD_INTERFACE {resetn} \
   CONFIG.USE_BOARD_FLOW {true} \
 ] $clk_wiz

  # Create instance: clk_wiz_1, and set properties
  set clk_wiz_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:6.0 clk_wiz_1 ]
  set_property -dict [ list \
   CONFIG.RESET_BOARD_INTERFACE {resetn} \
   CONFIG.USE_BOARD_FLOW {true} \
 ] $clk_wiz_1

  # Create instance: hbm_0, and set properties
  set hbm_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:hbm:1.0 hbm_0 ]
  set_property -dict [ list \
   CONFIG.USER_APB_EN {false} \
   CONFIG.USER_AXI_ADDR_SIZE {32} \
   CONFIG.USER_AXI_CLK1_FREQ {450} \
   CONFIG.USER_AXI_CLK_FREQ {450} \
   CONFIG.USER_CLK_SEL_LIST0 {AXI_00_ACLK} \
   CONFIG.USER_CLK_SEL_LIST1 {AXI_16_ACLK} \
   CONFIG.USER_CTRL_PHY_MODE {Controller_and_Physical_Layer} \
   CONFIG.USER_DEBUG_EN {TRUE} \
   CONFIG.USER_EN_PHY_ONLY {FALSE} \
   CONFIG.USER_EXAMPLE_TG {SYNTHESIZABLE} \
   CONFIG.USER_HBM_CP_1 {3} \
   CONFIG.USER_HBM_DENSITY {4GB} \
   CONFIG.USER_HBM_FBDIV_1 {5} \
   CONFIG.USER_HBM_HEX_CP_RES_1 {0x0000B300} \
   CONFIG.USER_HBM_HEX_FBDIV_CLKOUTDIV_1 {0x00000142} \
   CONFIG.USER_HBM_HEX_LOCK_FB_REF_DLY_1 {0x00000a0a} \
   CONFIG.USER_HBM_LOCK_FB_DLY_1 {10} \
   CONFIG.USER_HBM_LOCK_REF_DLY_1 {10} \
   CONFIG.USER_HBM_RES_1 {11} \
   CONFIG.USER_HBM_STACK {1} \
   CONFIG.USER_MC0_LOOKAHEAD_ACT {false} \
   CONFIG.USER_MC0_LOOKAHEAD_PCH {false} \
   CONFIG.USER_MC0_MAINTAIN_COHERENCY {false} \
   CONFIG.USER_MC0_REORDER_EN {false} \
   CONFIG.USER_MC0_REORDER_QUEUE_EN {false} \
   CONFIG.USER_MC10_LOOKAHEAD_ACT {false} \
   CONFIG.USER_MC10_LOOKAHEAD_PCH {false} \
   CONFIG.USER_MC10_MAINTAIN_COHERENCY {false} \
   CONFIG.USER_MC10_REORDER_EN {false} \
   CONFIG.USER_MC10_REORDER_QUEUE_EN {false} \
   CONFIG.USER_MC11_LOOKAHEAD_ACT {false} \
   CONFIG.USER_MC11_LOOKAHEAD_PCH {false} \
   CONFIG.USER_MC11_MAINTAIN_COHERENCY {false} \
   CONFIG.USER_MC11_REORDER_EN {false} \
   CONFIG.USER_MC11_REORDER_QUEUE_EN {false} \
   CONFIG.USER_MC12_LOOKAHEAD_ACT {false} \
   CONFIG.USER_MC12_LOOKAHEAD_PCH {false} \
   CONFIG.USER_MC12_MAINTAIN_COHERENCY {false} \
   CONFIG.USER_MC12_REORDER_EN {false} \
   CONFIG.USER_MC12_REORDER_QUEUE_EN {false} \
   CONFIG.USER_MC13_LOOKAHEAD_ACT {false} \
   CONFIG.USER_MC13_LOOKAHEAD_PCH {false} \
   CONFIG.USER_MC13_MAINTAIN_COHERENCY {false} \
   CONFIG.USER_MC13_REORDER_EN {false} \
   CONFIG.USER_MC13_REORDER_QUEUE_EN {false} \
   CONFIG.USER_MC14_LOOKAHEAD_ACT {false} \
   CONFIG.USER_MC14_LOOKAHEAD_PCH {false} \
   CONFIG.USER_MC14_MAINTAIN_COHERENCY {false} \
   CONFIG.USER_MC14_REORDER_EN {false} \
   CONFIG.USER_MC14_REORDER_QUEUE_EN {false} \
   CONFIG.USER_MC15_LOOKAHEAD_ACT {false} \
   CONFIG.USER_MC15_LOOKAHEAD_PCH {false} \
   CONFIG.USER_MC15_MAINTAIN_COHERENCY {false} \
   CONFIG.USER_MC15_REORDER_EN {false} \
   CONFIG.USER_MC15_REORDER_QUEUE_EN {false} \
   CONFIG.USER_MC1_LOOKAHEAD_ACT {false} \
   CONFIG.USER_MC1_LOOKAHEAD_PCH {false} \
   CONFIG.USER_MC1_MAINTAIN_COHERENCY {false} \
   CONFIG.USER_MC1_REORDER_EN {false} \
   CONFIG.USER_MC1_REORDER_QUEUE_EN {false} \
   CONFIG.USER_MC2_LOOKAHEAD_ACT {false} \
   CONFIG.USER_MC2_LOOKAHEAD_PCH {false} \
   CONFIG.USER_MC2_MAINTAIN_COHERENCY {false} \
   CONFIG.USER_MC2_REORDER_EN {false} \
   CONFIG.USER_MC2_REORDER_QUEUE_EN {false} \
   CONFIG.USER_MC3_LOOKAHEAD_ACT {false} \
   CONFIG.USER_MC3_LOOKAHEAD_PCH {false} \
   CONFIG.USER_MC3_MAINTAIN_COHERENCY {false} \
   CONFIG.USER_MC3_REORDER_EN {false} \
   CONFIG.USER_MC3_REORDER_QUEUE_EN {false} \
   CONFIG.USER_MC4_LOOKAHEAD_ACT {false} \
   CONFIG.USER_MC4_LOOKAHEAD_PCH {false} \
   CONFIG.USER_MC4_MAINTAIN_COHERENCY {false} \
   CONFIG.USER_MC4_REORDER_EN {false} \
   CONFIG.USER_MC4_REORDER_QUEUE_EN {false} \
   CONFIG.USER_MC5_LOOKAHEAD_ACT {false} \
   CONFIG.USER_MC5_LOOKAHEAD_PCH {false} \
   CONFIG.USER_MC5_MAINTAIN_COHERENCY {false} \
   CONFIG.USER_MC5_REORDER_EN {false} \
   CONFIG.USER_MC5_REORDER_QUEUE_EN {false} \
   CONFIG.USER_MC6_LOOKAHEAD_ACT {false} \
   CONFIG.USER_MC6_LOOKAHEAD_PCH {false} \
   CONFIG.USER_MC6_MAINTAIN_COHERENCY {false} \
   CONFIG.USER_MC6_REORDER_EN {false} \
   CONFIG.USER_MC6_REORDER_QUEUE_EN {false} \
   CONFIG.USER_MC7_LOOKAHEAD_ACT {false} \
   CONFIG.USER_MC7_LOOKAHEAD_PCH {false} \
   CONFIG.USER_MC7_MAINTAIN_COHERENCY {false} \
   CONFIG.USER_MC7_REORDER_EN {false} \
   CONFIG.USER_MC7_REORDER_QUEUE_EN {false} \
   CONFIG.USER_MC8_LOOKAHEAD_ACT {false} \
   CONFIG.USER_MC8_LOOKAHEAD_PCH {false} \
   CONFIG.USER_MC8_MAINTAIN_COHERENCY {false} \
   CONFIG.USER_MC8_REORDER_EN {false} \
   CONFIG.USER_MC8_REORDER_QUEUE_EN {false} \
   CONFIG.USER_MC9_LOOKAHEAD_ACT {false} \
   CONFIG.USER_MC9_LOOKAHEAD_PCH {false} \
   CONFIG.USER_MC9_MAINTAIN_COHERENCY {false} \
   CONFIG.USER_MC9_REORDER_EN {false} \
   CONFIG.USER_MC9_REORDER_QUEUE_EN {false} \
   CONFIG.USER_MC_ENABLE_00 {TRUE} \
   CONFIG.USER_MC_ENABLE_01 {TRUE} \
   CONFIG.USER_MC_ENABLE_02 {TRUE} \
   CONFIG.USER_MC_ENABLE_03 {TRUE} \
   CONFIG.USER_MC_ENABLE_04 {TRUE} \
   CONFIG.USER_MC_ENABLE_05 {TRUE} \
   CONFIG.USER_MC_ENABLE_06 {TRUE} \
   CONFIG.USER_MC_ENABLE_07 {TRUE} \
   CONFIG.USER_MC_ENABLE_08 {FALSE} \
   CONFIG.USER_MC_ENABLE_09 {FALSE} \
   CONFIG.USER_MC_ENABLE_10 {FALSE} \
   CONFIG.USER_MC_ENABLE_11 {FALSE} \
   CONFIG.USER_MC_ENABLE_12 {FALSE} \
   CONFIG.USER_MC_ENABLE_13 {FALSE} \
   CONFIG.USER_MC_ENABLE_14 {FALSE} \
   CONFIG.USER_MC_ENABLE_15 {FALSE} \
   CONFIG.USER_MC_ENABLE_APB_00 {TRUE} \
   CONFIG.USER_MC_ENABLE_APB_01 {FALSE} \
   CONFIG.USER_MEMORY_DISPLAY {4096} \
   CONFIG.USER_PHY_ENABLE_08 {FALSE} \
   CONFIG.USER_PHY_ENABLE_09 {FALSE} \
   CONFIG.USER_PHY_ENABLE_10 {FALSE} \
   CONFIG.USER_PHY_ENABLE_11 {FALSE} \
   CONFIG.USER_PHY_ENABLE_12 {FALSE} \
   CONFIG.USER_PHY_ENABLE_13 {FALSE} \
   CONFIG.USER_PHY_ENABLE_14 {FALSE} \
   CONFIG.USER_PHY_ENABLE_15 {FALSE} \
   CONFIG.USER_SAXI_01 {false} \
   CONFIG.USER_SAXI_02 {false} \
   CONFIG.USER_SAXI_03 {false} \
   CONFIG.USER_SAXI_04 {false} \
   CONFIG.USER_SAXI_05 {false} \
   CONFIG.USER_SAXI_06 {false} \
   CONFIG.USER_SAXI_07 {false} \
   CONFIG.USER_SAXI_08 {false} \
   CONFIG.USER_SAXI_09 {false} \
   CONFIG.USER_SAXI_10 {false} \
   CONFIG.USER_SAXI_11 {false} \
   CONFIG.USER_SAXI_12 {false} \
   CONFIG.USER_SAXI_13 {false} \
   CONFIG.USER_SAXI_14 {false} \
   CONFIG.USER_SAXI_15 {false} \
   CONFIG.USER_SAXI_16 {false} \
   CONFIG.USER_SAXI_17 {false} \
   CONFIG.USER_SAXI_18 {false} \
   CONFIG.USER_SAXI_19 {false} \
   CONFIG.USER_SAXI_20 {false} \
   CONFIG.USER_SAXI_21 {false} \
   CONFIG.USER_SAXI_22 {false} \
   CONFIG.USER_SAXI_23 {false} \
   CONFIG.USER_SAXI_24 {false} \
   CONFIG.USER_SAXI_25 {false} \
   CONFIG.USER_SAXI_26 {false} \
   CONFIG.USER_SAXI_27 {false} \
   CONFIG.USER_SAXI_28 {false} \
   CONFIG.USER_SAXI_29 {false} \
   CONFIG.USER_SAXI_30 {false} \
   CONFIG.USER_SAXI_31 {false} \
   CONFIG.USER_SWITCH_ENABLE_00 {TRUE} \
   CONFIG.USER_SWITCH_ENABLE_01 {FALSE} \
   CONFIG.USER_tFAW_0 {0x00F} \
   CONFIG.USER_tFAW_1 {0x00F} \
   CONFIG.USER_tRCDRD_0 {0x0D} \
   CONFIG.USER_tRCDRD_1 {0x0D} \
   CONFIG.USER_tRCDWR_0 {0x09} \
   CONFIG.USER_tRCDWR_1 {0x09} \
   CONFIG.USER_tRFC_0 {0x0EA} \
   CONFIG.USER_tRFC_1 {0x0EA} \
   CONFIG.USER_tRP_0 {0x0D} \
   CONFIG.USER_tRP_1 {0x0D} \
   CONFIG.USER_tRRDL_0 {0x04} \
   CONFIG.USER_tRRDL_1 {0x04} \
   CONFIG.USER_tRRDS_0 {0x04} \
   CONFIG.USER_tRRDS_1 {0x04} \
   CONFIG.USER_tWR_0 {0x0F} \
   CONFIG.USER_tWR_1 {0x0F} \
   CONFIG.USER_tXP_0 {0x07} \
   CONFIG.USER_tXP_1 {0x07} \
 ] $hbm_0

  # Create instance: hbm_traffic_gen_0, and set properties
  set hbm_traffic_gen_0 [ create_bd_cell -type ip -vlnv xilinx.com:hls:hbm_traffic_gen:1.0 hbm_traffic_gen_0 ]

  # Create instance: resetn_inv_0, and set properties
  set resetn_inv_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 resetn_inv_0 ]
  set_property -dict [ list \
   CONFIG.C_OPERATION {not} \
   CONFIG.C_SIZE {1} \
 ] $resetn_inv_0

  # Create instance: resetn_inv_1, and set properties
  set resetn_inv_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 resetn_inv_1 ]
  set_property -dict [ list \
   CONFIG.C_OPERATION {not} \
   CONFIG.C_SIZE {1} \
 ] $resetn_inv_1

  # Create instance: rst_clk_wiz_100M, and set properties
  set rst_clk_wiz_100M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_clk_wiz_100M ]

  # Create interface connections
  connect_bd_intf_net -intf_net axi_protocol_convert_0_M_AXI [get_bd_intf_pins axi_protocol_convert_0/M_AXI] [get_bd_intf_pins hbm_0/SAXI_00]
  connect_bd_intf_net -intf_net axi_vip_1_M_AXI [get_bd_intf_pins axi_protocol_convert_0/S_AXI] [get_bd_intf_pins axi_vip_1/M_AXI]
  connect_bd_intf_net -intf_net hbm_traffic_gen_0_m_axi_cmd [get_bd_intf_pins axi_vip_0/S_AXI] [get_bd_intf_pins hbm_traffic_gen_0/m_axi_cmd]
  connect_bd_intf_net -intf_net hbm_traffic_gen_0_m_axi_gmem [get_bd_intf_pins axi_vip_1/S_AXI] [get_bd_intf_pins hbm_traffic_gen_0/m_axi_gmem]

  # Create port connections
  connect_bd_net -net clk_100MHz_1 [get_bd_ports clk_100MHz] [get_bd_pins clk_wiz/clk_in1] [get_bd_pins clk_wiz_1/clk_in1]
  connect_bd_net -net clk_wiz_1_clk_out1 [get_bd_pins clk_wiz_1/clk_out1] [get_bd_pins hbm_0/HBM_REF_CLK_0]
  connect_bd_net -net clk_wiz_clk_out1 [get_bd_pins axi_protocol_convert_0/aclk] [get_bd_pins axi_vip_0/aclk] [get_bd_pins axi_vip_1/aclk] [get_bd_pins clk_wiz/clk_out1] [get_bd_pins hbm_0/APB_0_PCLK] [get_bd_pins hbm_0/AXI_00_ACLK] [get_bd_pins hbm_traffic_gen_0/ap_clk] [get_bd_pins rst_clk_wiz_100M/slowest_sync_clk]
  connect_bd_net -net clk_wiz_locked [get_bd_pins clk_wiz/locked] [get_bd_pins rst_clk_wiz_100M/dcm_locked]
  connect_bd_net -net resetn_0_1 [get_bd_ports resetn_0] [get_bd_pins resetn_inv_1/Op1]
  connect_bd_net -net resetn_1 [get_bd_ports resetn] [get_bd_pins resetn_inv_0/Op1]
  connect_bd_net -net resetn_inv_0_Res [get_bd_pins clk_wiz/reset] [get_bd_pins resetn_inv_0/Res] [get_bd_pins rst_clk_wiz_100M/ext_reset_in]
  connect_bd_net -net resetn_inv_1_Res [get_bd_pins clk_wiz_1/reset] [get_bd_pins resetn_inv_1/Res]
  connect_bd_net -net rst_clk_wiz_100M_peripheral_aresetn [get_bd_pins axi_protocol_convert_0/aresetn] [get_bd_pins axi_vip_0/aresetn] [get_bd_pins axi_vip_1/aresetn] [get_bd_pins hbm_0/APB_0_PRESET_N] [get_bd_pins hbm_0/AXI_00_ARESET_N] [get_bd_pins hbm_traffic_gen_0/ap_rst_n] [get_bd_pins rst_clk_wiz_100M/peripheral_aresetn]

  # Create address segments
  assign_bd_address -offset 0x44A00000 -range 0x00001000 -target_address_space [get_bd_addr_spaces hbm_traffic_gen_0/Data_m_axi_cmd] [get_bd_addr_segs axi_vip_0/S_AXI/Reg] -force
  assign_bd_address -offset 0x00000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces hbm_traffic_gen_0/Data_m_axi_gmem] [get_bd_addr_segs hbm_0/SAXI_00/HBM_MEM00] -force
  assign_bd_address -offset 0x10000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces hbm_traffic_gen_0/Data_m_axi_gmem] [get_bd_addr_segs hbm_0/SAXI_00/HBM_MEM01] -force
  assign_bd_address -offset 0x20000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces hbm_traffic_gen_0/Data_m_axi_gmem] [get_bd_addr_segs hbm_0/SAXI_00/HBM_MEM02] -force
  assign_bd_address -offset 0x30000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces hbm_traffic_gen_0/Data_m_axi_gmem] [get_bd_addr_segs hbm_0/SAXI_00/HBM_MEM03] -force
  assign_bd_address -offset 0x40000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces hbm_traffic_gen_0/Data_m_axi_gmem] [get_bd_addr_segs hbm_0/SAXI_00/HBM_MEM04] -force
  assign_bd_address -offset 0x50000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces hbm_traffic_gen_0/Data_m_axi_gmem] [get_bd_addr_segs hbm_0/SAXI_00/HBM_MEM05] -force
  assign_bd_address -offset 0x60000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces hbm_traffic_gen_0/Data_m_axi_gmem] [get_bd_addr_segs hbm_0/SAXI_00/HBM_MEM06] -force
  assign_bd_address -offset 0x70000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces hbm_traffic_gen_0/Data_m_axi_gmem] [get_bd_addr_segs hbm_0/SAXI_00/HBM_MEM07] -force
  assign_bd_address -offset 0x80000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces hbm_traffic_gen_0/Data_m_axi_gmem] [get_bd_addr_segs hbm_0/SAXI_00/HBM_MEM08] -force
  assign_bd_address -offset 0x90000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces hbm_traffic_gen_0/Data_m_axi_gmem] [get_bd_addr_segs hbm_0/SAXI_00/HBM_MEM09] -force
  assign_bd_address -offset 0xA0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces hbm_traffic_gen_0/Data_m_axi_gmem] [get_bd_addr_segs hbm_0/SAXI_00/HBM_MEM10] -force
  assign_bd_address -offset 0xB0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces hbm_traffic_gen_0/Data_m_axi_gmem] [get_bd_addr_segs hbm_0/SAXI_00/HBM_MEM11] -force
  assign_bd_address -offset 0xC0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces hbm_traffic_gen_0/Data_m_axi_gmem] [get_bd_addr_segs hbm_0/SAXI_00/HBM_MEM12] -force
  assign_bd_address -offset 0xD0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces hbm_traffic_gen_0/Data_m_axi_gmem] [get_bd_addr_segs hbm_0/SAXI_00/HBM_MEM13] -force
  assign_bd_address -offset 0xE0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces hbm_traffic_gen_0/Data_m_axi_gmem] [get_bd_addr_segs hbm_0/SAXI_00/HBM_MEM14] -force
  assign_bd_address -offset 0xF0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces hbm_traffic_gen_0/Data_m_axi_gmem] [get_bd_addr_segs hbm_0/SAXI_00/HBM_MEM15] -force


  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


