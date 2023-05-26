// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1.2 (64-bit)
// Tool Version Limit: 2022.04
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XHBM_KERNEL_H
#define XHBM_KERNEL_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xhbm_kernel_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
    u16 DeviceId;
    u64 Control_BaseAddress;
} XHbm_kernel_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XHbm_kernel;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XHbm_kernel_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XHbm_kernel_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XHbm_kernel_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XHbm_kernel_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
int XHbm_kernel_Initialize(XHbm_kernel *InstancePtr, u16 DeviceId);
XHbm_kernel_Config* XHbm_kernel_LookupConfig(u16 DeviceId);
int XHbm_kernel_CfgInitialize(XHbm_kernel *InstancePtr, XHbm_kernel_Config *ConfigPtr);
#else
int XHbm_kernel_Initialize(XHbm_kernel *InstancePtr, const char* InstanceName);
int XHbm_kernel_Release(XHbm_kernel *InstancePtr);
#endif

void XHbm_kernel_Start(XHbm_kernel *InstancePtr);
u32 XHbm_kernel_IsDone(XHbm_kernel *InstancePtr);
u32 XHbm_kernel_IsIdle(XHbm_kernel *InstancePtr);
u32 XHbm_kernel_IsReady(XHbm_kernel *InstancePtr);
void XHbm_kernel_Continue(XHbm_kernel *InstancePtr);
void XHbm_kernel_EnableAutoRestart(XHbm_kernel *InstancePtr);
void XHbm_kernel_DisableAutoRestart(XHbm_kernel *InstancePtr);

void XHbm_kernel_Set_maxi(XHbm_kernel *InstancePtr, u64 Data);
u64 XHbm_kernel_Get_maxi(XHbm_kernel *InstancePtr);
void XHbm_kernel_Set_size(XHbm_kernel *InstancePtr, u32 Data);
u32 XHbm_kernel_Get_size(XHbm_kernel *InstancePtr);
void XHbm_kernel_Set_pattern(XHbm_kernel *InstancePtr, u32 Data);
u32 XHbm_kernel_Get_pattern(XHbm_kernel *InstancePtr);
void XHbm_kernel_Set_range_r(XHbm_kernel *InstancePtr, u32 Data);
u32 XHbm_kernel_Get_range_r(XHbm_kernel *InstancePtr);

void XHbm_kernel_InterruptGlobalEnable(XHbm_kernel *InstancePtr);
void XHbm_kernel_InterruptGlobalDisable(XHbm_kernel *InstancePtr);
void XHbm_kernel_InterruptEnable(XHbm_kernel *InstancePtr, u32 Mask);
void XHbm_kernel_InterruptDisable(XHbm_kernel *InstancePtr, u32 Mask);
void XHbm_kernel_InterruptClear(XHbm_kernel *InstancePtr, u32 Mask);
u32 XHbm_kernel_InterruptGetEnabled(XHbm_kernel *InstancePtr);
u32 XHbm_kernel_InterruptGetStatus(XHbm_kernel *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
