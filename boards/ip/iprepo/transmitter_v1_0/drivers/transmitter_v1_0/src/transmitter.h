#ifndef TRANSMITTER__H
#define TRANSMITTER__H
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
#include "transmitter_hw.h"
/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
#else
typedef struct {
    u16 DeviceId;
    u32 transmitter_BaseAddress;
} transmitter_Config;
#endif
/**
* The transmitter driver instance data. The user is required to
* allocate a variable of this type for every transmitter device in the system.
* A pointer to a variable of this type is then passed to the driver
* API functions.
*/
typedef struct {
    u32 transmitter_BaseAddress;
    u32 IsReady;
} transmitter;
/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define transmitter_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define transmitter_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define transmitter_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define transmitter_ReadReg(BaseAddress, RegOffset) \
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
int transmitter_Initialize(transmitter *InstancePtr, u16 DeviceId);
transmitter_Config* transmitter_LookupConfig(u16 DeviceId);
int transmitter_CfgInitialize(transmitter *InstancePtr, transmitter_Config *ConfigPtr);
#else
int transmitter_Initialize(transmitter *InstancePtr, const char* InstanceName);
int transmitter_Release(transmitter *InstancePtr);
#endif
/**
* Write to observation_point gateway of transmitter. Assignments are LSB-justified.
*
* @param	InstancePtr is the observation_point instance to operate on.
* @param	Data is value to be written to gateway observation_point.
*
* @return	None.
*
* @note    .
*
*/
void transmitter_observation_point_write(transmitter *InstancePtr, u32 Data);
/**
* Read from observation_point gateway of transmitter. Assignments are LSB-justified.
*
* @param	InstancePtr is the observation_point instance to operate on.
*
* @return	u32
*
* @note    .
*
*/
u32 transmitter_observation_point_read(transmitter *InstancePtr);
/**
* Write to modulation gateway of transmitter. Assignments are LSB-justified.
*
* @param	InstancePtr is the modulation instance to operate on.
* @param	Data is value to be written to gateway modulation.
*
* @return	None.
*
* @note    .
*
*/
void transmitter_modulation_write(transmitter *InstancePtr, u32 Data);
/**
* Read from modulation gateway of transmitter. Assignments are LSB-justified.
*
* @param	InstancePtr is the modulation instance to operate on.
*
* @return	u32
*
* @note    .
*
*/
u32 transmitter_modulation_read(transmitter *InstancePtr);
/**
* Write to enable_tx gateway of transmitter. Assignments are LSB-justified.
*
* @param	InstancePtr is the enable_tx instance to operate on.
* @param	Data is value to be written to gateway enable_tx.
*
* @return	None.
*
* @note    .
*
*/
void transmitter_enable_tx_write(transmitter *InstancePtr, u32 Data);
/**
* Read from enable_tx gateway of transmitter. Assignments are LSB-justified.
*
* @param	InstancePtr is the enable_tx instance to operate on.
*
* @return	u32
*
* @note    .
*
*/
u32 transmitter_enable_tx_read(transmitter *InstancePtr);
/**
* Write to enable_data gateway of transmitter. Assignments are LSB-justified.
*
* @param	InstancePtr is the enable_data instance to operate on.
* @param	Data is value to be written to gateway enable_data.
*
* @return	None.
*
* @note    .
*
*/
void transmitter_enable_data_write(transmitter *InstancePtr, u32 Data);
/**
* Read from enable_data gateway of transmitter. Assignments are LSB-justified.
*
* @param	InstancePtr is the enable_data instance to operate on.
*
* @return	u32
*
* @note    .
*
*/
u32 transmitter_enable_data_read(transmitter *InstancePtr);
#ifdef __cplusplus
}
#endif
#endif
