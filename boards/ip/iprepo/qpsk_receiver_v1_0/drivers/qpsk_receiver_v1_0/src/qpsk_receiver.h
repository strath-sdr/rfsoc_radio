#ifndef QPSK_RECEIVER__H
#define QPSK_RECEIVER__H
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
#include "qpsk_receiver_hw.h"
/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
#else
typedef struct {
    u16 DeviceId;
    u32 qpsk_receiver_BaseAddress;
} qpsk_receiver_Config;
#endif
/**
* The qpsk_receiver driver instance data. The user is required to
* allocate a variable of this type for every qpsk_receiver device in the system.
* A pointer to a variable of this type is then passed to the driver
* API functions.
*/
typedef struct {
    u32 qpsk_receiver_BaseAddress;
    u32 IsReady;
} qpsk_receiver;
/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define qpsk_receiver_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define qpsk_receiver_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define qpsk_receiver_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define qpsk_receiver_ReadReg(BaseAddress, RegOffset) \
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
int qpsk_receiver_Initialize(qpsk_receiver *InstancePtr, u16 DeviceId);
qpsk_receiver_Config* qpsk_receiver_LookupConfig(u16 DeviceId);
int qpsk_receiver_CfgInitialize(qpsk_receiver *InstancePtr, qpsk_receiver_Config *ConfigPtr);
#else
int qpsk_receiver_Initialize(qpsk_receiver *InstancePtr, const char* InstanceName);
int qpsk_receiver_Release(qpsk_receiver *InstancePtr);
#endif
/**
* Write to threshold gateway of qpsk_receiver. Assignments are LSB-justified.
*
* @param	InstancePtr is the threshold instance to operate on.
* @param	Data is value to be written to gateway threshold.
*
* @return	None.
*
* @note    .
*
*/
void qpsk_receiver_threshold_write(qpsk_receiver *InstancePtr, u32 Data);
/**
* Read from threshold gateway of qpsk_receiver. Assignments are LSB-justified.
*
* @param	InstancePtr is the threshold instance to operate on.
*
* @return	u32
*
* @note    .
*
*/
u32 qpsk_receiver_threshold_read(qpsk_receiver *InstancePtr);
/**
* Write to reset_time_sync gateway of qpsk_receiver. Assignments are LSB-justified.
*
* @param	InstancePtr is the reset_time_sync instance to operate on.
* @param	Data is value to be written to gateway reset_time_sync.
*
* @return	None.
*
* @note    .
*
*/
void qpsk_receiver_reset_time_sync_write(qpsk_receiver *InstancePtr, u32 Data);
/**
* Read from reset_time_sync gateway of qpsk_receiver. Assignments are LSB-justified.
*
* @param	InstancePtr is the reset_time_sync instance to operate on.
*
* @return	u32
*
* @note    .
*
*/
u32 qpsk_receiver_reset_time_sync_read(qpsk_receiver *InstancePtr);
/**
* Write to reset_phase_sync gateway of qpsk_receiver. Assignments are LSB-justified.
*
* @param	InstancePtr is the reset_phase_sync instance to operate on.
* @param	Data is value to be written to gateway reset_phase_sync.
*
* @return	None.
*
* @note    .
*
*/
void qpsk_receiver_reset_phase_sync_write(qpsk_receiver *InstancePtr, u32 Data);
/**
* Read from reset_phase_sync gateway of qpsk_receiver. Assignments are LSB-justified.
*
* @param	InstancePtr is the reset_phase_sync instance to operate on.
*
* @return	u32
*
* @note    .
*
*/
u32 qpsk_receiver_reset_phase_sync_read(qpsk_receiver *InstancePtr);
/**
* Write to reset_frame_sync gateway of qpsk_receiver. Assignments are LSB-justified.
*
* @param	InstancePtr is the reset_frame_sync instance to operate on.
* @param	Data is value to be written to gateway reset_frame_sync.
*
* @return	None.
*
* @note    .
*
*/
void qpsk_receiver_reset_frame_sync_write(qpsk_receiver *InstancePtr, u32 Data);
/**
* Read from reset_frame_sync gateway of qpsk_receiver. Assignments are LSB-justified.
*
* @param	InstancePtr is the reset_frame_sync instance to operate on.
*
* @return	u32
*
* @note    .
*
*/
u32 qpsk_receiver_reset_frame_sync_read(qpsk_receiver *InstancePtr);
/**
* Write to observation_point gateway of qpsk_receiver. Assignments are LSB-justified.
*
* @param	InstancePtr is the observation_point instance to operate on.
* @param	Data is value to be written to gateway observation_point.
*
* @return	None.
*
* @note    .
*
*/
void qpsk_receiver_observation_point_write(qpsk_receiver *InstancePtr, u32 Data);
/**
* Read from observation_point gateway of qpsk_receiver. Assignments are LSB-justified.
*
* @param	InstancePtr is the observation_point instance to operate on.
*
* @return	u32
*
* @note    .
*
*/
u32 qpsk_receiver_observation_point_read(qpsk_receiver *InstancePtr);
/**
* Write to enable_transfer gateway of qpsk_receiver. Assignments are LSB-justified.
*
* @param	InstancePtr is the enable_transfer instance to operate on.
* @param	Data is value to be written to gateway enable_transfer.
*
* @return	None.
*
* @note    .
*
*/
void qpsk_receiver_enable_transfer_write(qpsk_receiver *InstancePtr, u32 Data);
/**
* Read from enable_transfer gateway of qpsk_receiver. Assignments are LSB-justified.
*
* @param	InstancePtr is the enable_transfer instance to operate on.
*
* @return	u32
*
* @note    .
*
*/
u32 qpsk_receiver_enable_transfer_read(qpsk_receiver *InstancePtr);
/**
* Write to coarse_passthrough gateway of qpsk_receiver. Assignments are LSB-justified.
*
* @param	InstancePtr is the coarse_passthrough instance to operate on.
* @param	Data is value to be written to gateway coarse_passthrough.
*
* @return	None.
*
* @note    .
*
*/
void qpsk_receiver_coarse_passthrough_write(qpsk_receiver *InstancePtr, u32 Data);
/**
* Read from coarse_passthrough gateway of qpsk_receiver. Assignments are LSB-justified.
*
* @param	InstancePtr is the coarse_passthrough instance to operate on.
*
* @return	u32
*
* @note    .
*
*/
u32 qpsk_receiver_coarse_passthrough_read(qpsk_receiver *InstancePtr);
/**
* Read from data_count gateway of qpsk_receiver. Assignments are LSB-justified.
*
* @param	InstancePtr is the data_count instance to operate on.
*
* @return	u32
*
* @note    .
*
*/
u32 qpsk_receiver_data_count_read(qpsk_receiver *InstancePtr);
/**
* Read from frame_size gateway of qpsk_receiver. Assignments are LSB-justified.
*
* @param	InstancePtr is the frame_size instance to operate on.
*
* @return	u8
*
* @note    .
*
*/
u8 qpsk_receiver_frame_size_read(qpsk_receiver *InstancePtr);
/**
* Read from freq_offset gateway of qpsk_receiver. Assignments are LSB-justified.
*
* @param	InstancePtr is the freq_offset instance to operate on.
*
* @return	int
*
* @note    .
*
*/
int qpsk_receiver_freq_offset_read(qpsk_receiver *InstancePtr);
/**
* Read from packet_count gateway of qpsk_receiver. Assignments are LSB-justified.
*
* @param	InstancePtr is the packet_count instance to operate on.
*
* @return	u32
*
* @note    .
*
*/
u32 qpsk_receiver_packet_count_read(qpsk_receiver *InstancePtr);
/**
* Read from packet_size gateway of qpsk_receiver. Assignments are LSB-justified.
*
* @param	InstancePtr is the packet_size instance to operate on.
*
* @return	u8
*
* @note    .
*
*/
u8 qpsk_receiver_packet_size_read(qpsk_receiver *InstancePtr);
#ifdef __cplusplus
}
#endif
#endif
