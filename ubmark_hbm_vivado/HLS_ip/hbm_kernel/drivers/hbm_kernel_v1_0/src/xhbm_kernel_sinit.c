// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1.2 (64-bit)
// Tool Version Limit: 2022.04
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xhbm_kernel.h"

extern XHbm_kernel_Config XHbm_kernel_ConfigTable[];

XHbm_kernel_Config *XHbm_kernel_LookupConfig(u16 DeviceId) {
	XHbm_kernel_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XHBM_KERNEL_NUM_INSTANCES; Index++) {
		if (XHbm_kernel_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XHbm_kernel_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XHbm_kernel_Initialize(XHbm_kernel *InstancePtr, u16 DeviceId) {
	XHbm_kernel_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XHbm_kernel_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XHbm_kernel_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

