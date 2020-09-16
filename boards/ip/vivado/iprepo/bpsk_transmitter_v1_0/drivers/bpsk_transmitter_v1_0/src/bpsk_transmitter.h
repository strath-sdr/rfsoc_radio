#ifndef BPSK_TRANSMITTER__H
#define BPSK_TRANSMITTER__H
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
#include "bpsk_transmitter_hw.h"
/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
#else
typedef struct {
    u16 DeviceId;
    u32 bpsk_transmitter_BaseAddress;
} bpsk_transmitter_Config;
#endif
/**
* The bpsk_transmitter driver instance data. The user is required to
* allocate a variable of this type for every bpsk_transmitter device in the system.
* A pointer to a variable of this type is then passed to the driver
* API functions.
*/
typedef struct {
    u32 bpsk_transmitter_BaseAddress;
    u32 IsReady;
} bpsk_transmitter;
/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define bpsk_transmitter_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define bpsk_transmitter_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define bpsk_transmitter_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define bpsk_transmitter_ReadReg(BaseAddress, RegOffset) \
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
int bpsk_transmitter_Initialize(bpsk_transmitter *InstancePtr, u16 DeviceId);
bpsk_transmitter_Config* bpsk_transmitter_LookupConfig(u16 DeviceId);
int bpsk_transmitter_CfgInitialize(bpsk_transmitter *InstancePtr, bpsk_transmitter_Config *ConfigPtr);
#else
int bpsk_transmitter_Initialize(bpsk_transmitter *InstancePtr, const char* InstanceName);
int bpsk_transmitter_Release(bpsk_transmitter *InstancePtr);
#endif
/**
* Write to enable_tx gateway of bpsk_transmitter. Assignments are LSB-justified.
*
* @param	InstancePtr is the enable_tx instance to operate on.
* @param	Data is value to be written to gateway enable_tx.
*
* @return	None.
*
* @note    .
*
*/
void bpsk_transmitter_enable_tx_write(bpsk_transmitter *InstancePtr, u32 Data);
/**
* Read from enable_tx gateway of bpsk_transmitter. Assignments are LSB-justified.
*
* @param	InstancePtr is the enable_tx instance to operate on.
*
* @return	u32
*
* @note    .
*
*/
u32 bpsk_transmitter_enable_tx_read(bpsk_transmitter *InstancePtr);
/**
* Write to enable_data gateway of bpsk_transmitter. Assignments are LSB-justified.
*
* @param	InstancePtr is the enable_data instance to operate on.
* @param	Data is value to be written to gateway enable_data.
*
* @return	None.
*
* @note    .
*
*/
void bpsk_transmitter_enable_data_write(bpsk_transmitter *InstancePtr, u32 Data);
/**
* Read from enable_data gateway of bpsk_transmitter. Assignments are LSB-justified.
*
* @param	InstancePtr is the enable_data instance to operate on.
*
* @return	u32
*
* @note    .
*
*/
u32 bpsk_transmitter_enable_data_read(bpsk_transmitter *InstancePtr);
#ifdef __cplusplus
}
#endif
#endif
