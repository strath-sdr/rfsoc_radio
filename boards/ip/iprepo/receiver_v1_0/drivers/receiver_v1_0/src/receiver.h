#ifndef RECEIVER__H
#define RECEIVER__H
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
#include "receiver_hw.h"
/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
#else
typedef struct {
    u16 DeviceId;
    u32 receiver_BaseAddress;
} receiver_Config;
#endif
/**
* The receiver driver instance data. The user is required to
* allocate a variable of this type for every receiver device in the system.
* A pointer to a variable of this type is then passed to the driver
* API functions.
*/
typedef struct {
    u32 receiver_BaseAddress;
    u32 IsReady;
} receiver;
/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define receiver_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define receiver_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define receiver_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define receiver_ReadReg(BaseAddress, RegOffset) \
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
int receiver_Initialize(receiver *InstancePtr, u16 DeviceId);
receiver_Config* receiver_LookupConfig(u16 DeviceId);
int receiver_CfgInitialize(receiver *InstancePtr, receiver_Config *ConfigPtr);
#else
int receiver_Initialize(receiver *InstancePtr, const char* InstanceName);
int receiver_Release(receiver *InstancePtr);
#endif
/**
* Write to threshold gateway of receiver. Assignments are LSB-justified.
*
* @param	InstancePtr is the threshold instance to operate on.
* @param	Data is value to be written to gateway threshold.
*
* @return	None.
*
* @note    .
*
*/
void receiver_threshold_write(receiver *InstancePtr, u32 Data);
/**
* Read from threshold gateway of receiver. Assignments are LSB-justified.
*
* @param	InstancePtr is the threshold instance to operate on.
*
* @return	u32
*
* @note    .
*
*/
u32 receiver_threshold_read(receiver *InstancePtr);
/**
* Write to reset_time_sync gateway of receiver. Assignments are LSB-justified.
*
* @param	InstancePtr is the reset_time_sync instance to operate on.
* @param	Data is value to be written to gateway reset_time_sync.
*
* @return	None.
*
* @note    .
*
*/
void receiver_reset_time_sync_write(receiver *InstancePtr, u32 Data);
/**
* Read from reset_time_sync gateway of receiver. Assignments are LSB-justified.
*
* @param	InstancePtr is the reset_time_sync instance to operate on.
*
* @return	u32
*
* @note    .
*
*/
u32 receiver_reset_time_sync_read(receiver *InstancePtr);
/**
* Write to reset_phase_sync gateway of receiver. Assignments are LSB-justified.
*
* @param	InstancePtr is the reset_phase_sync instance to operate on.
* @param	Data is value to be written to gateway reset_phase_sync.
*
* @return	None.
*
* @note    .
*
*/
void receiver_reset_phase_sync_write(receiver *InstancePtr, u32 Data);
/**
* Read from reset_phase_sync gateway of receiver. Assignments are LSB-justified.
*
* @param	InstancePtr is the reset_phase_sync instance to operate on.
*
* @return	u32
*
* @note    .
*
*/
u32 receiver_reset_phase_sync_read(receiver *InstancePtr);
/**
* Write to reset_frame_sync gateway of receiver. Assignments are LSB-justified.
*
* @param	InstancePtr is the reset_frame_sync instance to operate on.
* @param	Data is value to be written to gateway reset_frame_sync.
*
* @return	None.
*
* @note    .
*
*/
void receiver_reset_frame_sync_write(receiver *InstancePtr, u32 Data);
/**
* Read from reset_frame_sync gateway of receiver. Assignments are LSB-justified.
*
* @param	InstancePtr is the reset_frame_sync instance to operate on.
*
* @return	u32
*
* @note    .
*
*/
u32 receiver_reset_frame_sync_read(receiver *InstancePtr);
/**
* Write to observation_point gateway of receiver. Assignments are LSB-justified.
*
* @param	InstancePtr is the observation_point instance to operate on.
* @param	Data is value to be written to gateway observation_point.
*
* @return	None.
*
* @note    .
*
*/
void receiver_observation_point_write(receiver *InstancePtr, u32 Data);
/**
* Read from observation_point gateway of receiver. Assignments are LSB-justified.
*
* @param	InstancePtr is the observation_point instance to operate on.
*
* @return	u32
*
* @note    .
*
*/
u32 receiver_observation_point_read(receiver *InstancePtr);
/**
* Write to modulation gateway of receiver. Assignments are LSB-justified.
*
* @param	InstancePtr is the modulation instance to operate on.
* @param	Data is value to be written to gateway modulation.
*
* @return	None.
*
* @note    .
*
*/
void receiver_modulation_write(receiver *InstancePtr, u32 Data);
/**
* Read from modulation gateway of receiver. Assignments are LSB-justified.
*
* @param	InstancePtr is the modulation instance to operate on.
*
* @return	u32
*
* @note    .
*
*/
u32 receiver_modulation_read(receiver *InstancePtr);
/**
* Write to global_reset_sync gateway of receiver. Assignments are LSB-justified.
*
* @param	InstancePtr is the global_reset_sync instance to operate on.
* @param	Data is value to be written to gateway global_reset_sync.
*
* @return	None.
*
* @note    .
*
*/
void receiver_global_reset_sync_write(receiver *InstancePtr, u32 Data);
/**
* Read from global_reset_sync gateway of receiver. Assignments are LSB-justified.
*
* @param	InstancePtr is the global_reset_sync instance to operate on.
*
* @return	u32
*
* @note    .
*
*/
u32 receiver_global_reset_sync_read(receiver *InstancePtr);
/**
* Write to enable_transfer gateway of receiver. Assignments are LSB-justified.
*
* @param	InstancePtr is the enable_transfer instance to operate on.
* @param	Data is value to be written to gateway enable_transfer.
*
* @return	None.
*
* @note    .
*
*/
void receiver_enable_transfer_write(receiver *InstancePtr, u32 Data);
/**
* Read from enable_transfer gateway of receiver. Assignments are LSB-justified.
*
* @param	InstancePtr is the enable_transfer instance to operate on.
*
* @return	u32
*
* @note    .
*
*/
u32 receiver_enable_transfer_read(receiver *InstancePtr);
/**
* Write to coarse_passthrough gateway of receiver. Assignments are LSB-justified.
*
* @param	InstancePtr is the coarse_passthrough instance to operate on.
* @param	Data is value to be written to gateway coarse_passthrough.
*
* @return	None.
*
* @note    .
*
*/
void receiver_coarse_passthrough_write(receiver *InstancePtr, u32 Data);
/**
* Read from coarse_passthrough gateway of receiver. Assignments are LSB-justified.
*
* @param	InstancePtr is the coarse_passthrough instance to operate on.
*
* @return	u32
*
* @note    .
*
*/
u32 receiver_coarse_passthrough_read(receiver *InstancePtr);
/**
* Read from bpsk_packet_count gateway of receiver. Assignments are LSB-justified.
*
* @param	InstancePtr is the bpsk_packet_count instance to operate on.
*
* @return	u32
*
* @note    .
*
*/
u32 receiver_bpsk_packet_count_read(receiver *InstancePtr);
/**
* Read from data_count gateway of receiver. Assignments are LSB-justified.
*
* @param	InstancePtr is the data_count instance to operate on.
*
* @return	u32
*
* @note    .
*
*/
u32 receiver_data_count_read(receiver *InstancePtr);
/**
* Read from frame_size gateway of receiver. Assignments are LSB-justified.
*
* @param	InstancePtr is the frame_size instance to operate on.
*
* @return	u8
*
* @note    .
*
*/
u8 receiver_frame_size_read(receiver *InstancePtr);
/**
* Read from freq_offset gateway of receiver. Assignments are LSB-justified.
*
* @param	InstancePtr is the freq_offset instance to operate on.
*
* @return	int
*
* @note    .
*
*/
int receiver_freq_offset_read(receiver *InstancePtr);
/**
* Read from packet_size gateway of receiver. Assignments are LSB-justified.
*
* @param	InstancePtr is the packet_size instance to operate on.
*
* @return	u8
*
* @note    .
*
*/
u8 receiver_packet_size_read(receiver *InstancePtr);
/**
* Read from qpsk_packet_count gateway of receiver. Assignments are LSB-justified.
*
* @param	InstancePtr is the qpsk_packet_count instance to operate on.
*
* @return	u32
*
* @note    .
*
*/
u32 receiver_qpsk_packet_count_read(receiver *InstancePtr);
#ifdef __cplusplus
}
#endif
#endif
