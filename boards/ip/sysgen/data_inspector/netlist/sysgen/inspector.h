#ifndef INSPECTOR__H
#define INSPECTOR__H
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
#include "inspector_hw.h"
/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
#else
typedef struct {
    u16 DeviceId;
    u32 inspector_BaseAddress;
} inspector_Config;
#endif
/**
* The inspector driver instance data. The user is required to
* allocate a variable of this type for every inspector device in the system.
* A pointer to a variable of this type is then passed to the driver
* API functions.
*/
typedef struct {
    u32 inspector_BaseAddress;
    u32 IsReady;
} inspector;
/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define inspector_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define inspector_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define inspector_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define inspector_ReadReg(BaseAddress, RegOffset) \
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
int inspector_Initialize(inspector *InstancePtr, u16 DeviceId);
inspector_Config* inspector_LookupConfig(u16 DeviceId);
int inspector_CfgInitialize(inspector *InstancePtr, inspector_Config *ConfigPtr);
#else
int inspector_Initialize(inspector *InstancePtr, const char* InstanceName);
int inspector_Release(inspector *InstancePtr);
#endif
/**
* Write to reset_dim gateway of inspector. Assignments are LSB-justified.
*
* @param	InstancePtr is the reset_dim instance to operate on.
* @param	Data is value to be written to gateway reset_dim.
*
* @return	None.
*
* @note    .
*
*/
void inspector_reset_dim_write(inspector *InstancePtr, u32 Data);
/**
* Read from reset_dim gateway of inspector. Assignments are LSB-justified.
*
* @param	InstancePtr is the reset_dim instance to operate on.
*
* @return	u32
*
* @note    .
*
*/
u32 inspector_reset_dim_read(inspector *InstancePtr);
/**
* Write to packetsize_dim gateway of inspector. Assignments are LSB-justified.
*
* @param	InstancePtr is the packetsize_dim instance to operate on.
* @param	Data is value to be written to gateway packetsize_dim.
*
* @return	None.
*
* @note    .
*
*/
void inspector_packetsize_dim_write(inspector *InstancePtr, u32 Data);
/**
* Read from packetsize_dim gateway of inspector. Assignments are LSB-justified.
*
* @param	InstancePtr is the packetsize_dim instance to operate on.
*
* @return	u32
*
* @note    .
*
*/
u32 inspector_packetsize_dim_read(inspector *InstancePtr);
/**
* Write to enable_dim gateway of inspector. Assignments are LSB-justified.
*
* @param	InstancePtr is the enable_dim instance to operate on.
* @param	Data is value to be written to gateway enable_dim.
*
* @return	None.
*
* @note    .
*
*/
void inspector_enable_dim_write(inspector *InstancePtr, u32 Data);
/**
* Read from enable_dim gateway of inspector. Assignments are LSB-justified.
*
* @param	InstancePtr is the enable_dim instance to operate on.
*
* @return	u32
*
* @note    .
*
*/
u32 inspector_enable_dim_read(inspector *InstancePtr);
#ifdef __cplusplus
}
#endif
#endif
