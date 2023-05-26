// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1.2 (64-bit)
// Tool Version Limit: 2022.04
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
// control
// 0x00 : Control signals
//        bit 0  - ap_start (Read/Write/COH)
//        bit 1  - ap_done (Read)
//        bit 2  - ap_idle (Read)
//        bit 3  - ap_ready (Read/COR)
//        bit 4  - ap_continue (Read/Write/SC)
//        bit 7  - auto_restart (Read/Write)
//        bit 9  - interrupt (Read)
//        others - reserved
// 0x04 : Global Interrupt Enable Register
//        bit 0  - Global Interrupt Enable (Read/Write)
//        others - reserved
// 0x08 : IP Interrupt Enable Register (Read/Write)
//        bit 0 - enable ap_done interrupt (Read/Write)
//        bit 1 - enable ap_ready interrupt (Read/Write)
//        others - reserved
// 0x0c : IP Interrupt Status Register (Read/COR)
//        bit 0 - ap_done (Read/COR)
//        bit 1 - ap_ready (Read/COR)
//        others - reserved
// 0x10 : Data signal of maxi
//        bit 31~0 - maxi[31:0] (Read/Write)
// 0x14 : Data signal of maxi
//        bit 31~0 - maxi[63:32] (Read/Write)
// 0x18 : reserved
// 0x1c : Data signal of size
//        bit 31~0 - size[31:0] (Read/Write)
// 0x20 : reserved
// 0x24 : Data signal of pattern
//        bit 31~0 - pattern[31:0] (Read/Write)
// 0x28 : reserved
// 0x2c : Data signal of range_r
//        bit 31~0 - range_r[31:0] (Read/Write)
// 0x30 : reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define XHBM_KERNEL_CONTROL_ADDR_AP_CTRL      0x00
#define XHBM_KERNEL_CONTROL_ADDR_GIE          0x04
#define XHBM_KERNEL_CONTROL_ADDR_IER          0x08
#define XHBM_KERNEL_CONTROL_ADDR_ISR          0x0c
#define XHBM_KERNEL_CONTROL_ADDR_MAXI_DATA    0x10
#define XHBM_KERNEL_CONTROL_BITS_MAXI_DATA    64
#define XHBM_KERNEL_CONTROL_ADDR_SIZE_DATA    0x1c
#define XHBM_KERNEL_CONTROL_BITS_SIZE_DATA    32
#define XHBM_KERNEL_CONTROL_ADDR_PATTERN_DATA 0x24
#define XHBM_KERNEL_CONTROL_BITS_PATTERN_DATA 32
#define XHBM_KERNEL_CONTROL_ADDR_RANGE_R_DATA 0x2c
#define XHBM_KERNEL_CONTROL_BITS_RANGE_R_DATA 32

