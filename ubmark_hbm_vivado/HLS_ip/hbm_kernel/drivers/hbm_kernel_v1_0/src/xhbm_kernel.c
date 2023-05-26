// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1.2 (64-bit)
// Tool Version Limit: 2022.04
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xhbm_kernel.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XHbm_kernel_CfgInitialize(XHbm_kernel *InstancePtr, XHbm_kernel_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XHbm_kernel_Start(XHbm_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHbm_kernel_ReadReg(InstancePtr->Control_BaseAddress, XHBM_KERNEL_CONTROL_ADDR_AP_CTRL) & 0x80;
    XHbm_kernel_WriteReg(InstancePtr->Control_BaseAddress, XHBM_KERNEL_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XHbm_kernel_IsDone(XHbm_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHbm_kernel_ReadReg(InstancePtr->Control_BaseAddress, XHBM_KERNEL_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XHbm_kernel_IsIdle(XHbm_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHbm_kernel_ReadReg(InstancePtr->Control_BaseAddress, XHBM_KERNEL_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XHbm_kernel_IsReady(XHbm_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHbm_kernel_ReadReg(InstancePtr->Control_BaseAddress, XHBM_KERNEL_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XHbm_kernel_Continue(XHbm_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHbm_kernel_ReadReg(InstancePtr->Control_BaseAddress, XHBM_KERNEL_CONTROL_ADDR_AP_CTRL) & 0x80;
    XHbm_kernel_WriteReg(InstancePtr->Control_BaseAddress, XHBM_KERNEL_CONTROL_ADDR_AP_CTRL, Data | 0x10);
}

void XHbm_kernel_EnableAutoRestart(XHbm_kernel *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHbm_kernel_WriteReg(InstancePtr->Control_BaseAddress, XHBM_KERNEL_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XHbm_kernel_DisableAutoRestart(XHbm_kernel *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHbm_kernel_WriteReg(InstancePtr->Control_BaseAddress, XHBM_KERNEL_CONTROL_ADDR_AP_CTRL, 0);
}

void XHbm_kernel_Set_maxi(XHbm_kernel *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHbm_kernel_WriteReg(InstancePtr->Control_BaseAddress, XHBM_KERNEL_CONTROL_ADDR_MAXI_DATA, (u32)(Data));
    XHbm_kernel_WriteReg(InstancePtr->Control_BaseAddress, XHBM_KERNEL_CONTROL_ADDR_MAXI_DATA + 4, (u32)(Data >> 32));
}

u64 XHbm_kernel_Get_maxi(XHbm_kernel *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHbm_kernel_ReadReg(InstancePtr->Control_BaseAddress, XHBM_KERNEL_CONTROL_ADDR_MAXI_DATA);
    Data += (u64)XHbm_kernel_ReadReg(InstancePtr->Control_BaseAddress, XHBM_KERNEL_CONTROL_ADDR_MAXI_DATA + 4) << 32;
    return Data;
}

void XHbm_kernel_Set_size(XHbm_kernel *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHbm_kernel_WriteReg(InstancePtr->Control_BaseAddress, XHBM_KERNEL_CONTROL_ADDR_SIZE_DATA, Data);
}

u32 XHbm_kernel_Get_size(XHbm_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHbm_kernel_ReadReg(InstancePtr->Control_BaseAddress, XHBM_KERNEL_CONTROL_ADDR_SIZE_DATA);
    return Data;
}

void XHbm_kernel_Set_pattern(XHbm_kernel *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHbm_kernel_WriteReg(InstancePtr->Control_BaseAddress, XHBM_KERNEL_CONTROL_ADDR_PATTERN_DATA, Data);
}

u32 XHbm_kernel_Get_pattern(XHbm_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHbm_kernel_ReadReg(InstancePtr->Control_BaseAddress, XHBM_KERNEL_CONTROL_ADDR_PATTERN_DATA);
    return Data;
}

void XHbm_kernel_Set_range_r(XHbm_kernel *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHbm_kernel_WriteReg(InstancePtr->Control_BaseAddress, XHBM_KERNEL_CONTROL_ADDR_RANGE_R_DATA, Data);
}

u32 XHbm_kernel_Get_range_r(XHbm_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHbm_kernel_ReadReg(InstancePtr->Control_BaseAddress, XHBM_KERNEL_CONTROL_ADDR_RANGE_R_DATA);
    return Data;
}

void XHbm_kernel_InterruptGlobalEnable(XHbm_kernel *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHbm_kernel_WriteReg(InstancePtr->Control_BaseAddress, XHBM_KERNEL_CONTROL_ADDR_GIE, 1);
}

void XHbm_kernel_InterruptGlobalDisable(XHbm_kernel *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHbm_kernel_WriteReg(InstancePtr->Control_BaseAddress, XHBM_KERNEL_CONTROL_ADDR_GIE, 0);
}

void XHbm_kernel_InterruptEnable(XHbm_kernel *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XHbm_kernel_ReadReg(InstancePtr->Control_BaseAddress, XHBM_KERNEL_CONTROL_ADDR_IER);
    XHbm_kernel_WriteReg(InstancePtr->Control_BaseAddress, XHBM_KERNEL_CONTROL_ADDR_IER, Register | Mask);
}

void XHbm_kernel_InterruptDisable(XHbm_kernel *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XHbm_kernel_ReadReg(InstancePtr->Control_BaseAddress, XHBM_KERNEL_CONTROL_ADDR_IER);
    XHbm_kernel_WriteReg(InstancePtr->Control_BaseAddress, XHBM_KERNEL_CONTROL_ADDR_IER, Register & (~Mask));
}

void XHbm_kernel_InterruptClear(XHbm_kernel *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    //XHbm_kernel_WriteReg(InstancePtr->Control_BaseAddress, XHBM_KERNEL_CONTROL_ADDR_ISR, Mask);
}

u32 XHbm_kernel_InterruptGetEnabled(XHbm_kernel *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XHbm_kernel_ReadReg(InstancePtr->Control_BaseAddress, XHBM_KERNEL_CONTROL_ADDR_IER);
}

u32 XHbm_kernel_InterruptGetStatus(XHbm_kernel *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    // Current Interrupt Clear Behavior is Clear on Read(COR).
    return XHbm_kernel_ReadReg(InstancePtr->Control_BaseAddress, XHBM_KERNEL_CONTROL_ADDR_ISR);
}

