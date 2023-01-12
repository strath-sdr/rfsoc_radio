#include "receiver.h"
#ifndef __linux__
int receiver_CfgInitialize(receiver *InstancePtr, receiver_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->receiver_BaseAddress = ConfigPtr->receiver_BaseAddress;

    InstancePtr->IsReady = 1;
    return XST_SUCCESS;
}
#endif
void receiver_threshold_write(receiver *InstancePtr, u32 Data) {

    Xil_AssertVoid(InstancePtr != NULL);

    receiver_WriteReg(InstancePtr->receiver_BaseAddress, 12, Data);
}
u32 receiver_threshold_read(receiver *InstancePtr) {

    u32 Data;
    Xil_AssertVoid(InstancePtr != NULL);

    Data = receiver_ReadReg(InstancePtr->receiver_BaseAddress, 12);
    return Data;
}
void receiver_reset_time_sync_write(receiver *InstancePtr, u32 Data) {

    Xil_AssertVoid(InstancePtr != NULL);

    receiver_WriteReg(InstancePtr->receiver_BaseAddress, 0, Data);
}
u32 receiver_reset_time_sync_read(receiver *InstancePtr) {

    u32 Data;
    Xil_AssertVoid(InstancePtr != NULL);

    Data = receiver_ReadReg(InstancePtr->receiver_BaseAddress, 0);
    return Data;
}
void receiver_reset_phase_sync_write(receiver *InstancePtr, u32 Data) {

    Xil_AssertVoid(InstancePtr != NULL);

    receiver_WriteReg(InstancePtr->receiver_BaseAddress, 4, Data);
}
u32 receiver_reset_phase_sync_read(receiver *InstancePtr) {

    u32 Data;
    Xil_AssertVoid(InstancePtr != NULL);

    Data = receiver_ReadReg(InstancePtr->receiver_BaseAddress, 4);
    return Data;
}
void receiver_reset_frame_sync_write(receiver *InstancePtr, u32 Data) {

    Xil_AssertVoid(InstancePtr != NULL);

    receiver_WriteReg(InstancePtr->receiver_BaseAddress, 8, Data);
}
u32 receiver_reset_frame_sync_read(receiver *InstancePtr) {

    u32 Data;
    Xil_AssertVoid(InstancePtr != NULL);

    Data = receiver_ReadReg(InstancePtr->receiver_BaseAddress, 8);
    return Data;
}
void receiver_observation_point_write(receiver *InstancePtr, u32 Data) {

    Xil_AssertVoid(InstancePtr != NULL);

    receiver_WriteReg(InstancePtr->receiver_BaseAddress, 36, Data);
}
u32 receiver_observation_point_read(receiver *InstancePtr) {

    u32 Data;
    Xil_AssertVoid(InstancePtr != NULL);

    Data = receiver_ReadReg(InstancePtr->receiver_BaseAddress, 36);
    return Data;
}
void receiver_modulation_write(receiver *InstancePtr, u32 Data) {

    Xil_AssertVoid(InstancePtr != NULL);

    receiver_WriteReg(InstancePtr->receiver_BaseAddress, 48, Data);
}
u32 receiver_modulation_read(receiver *InstancePtr) {

    u32 Data;
    Xil_AssertVoid(InstancePtr != NULL);

    Data = receiver_ReadReg(InstancePtr->receiver_BaseAddress, 48);
    return Data;
}
void receiver_global_reset_sync_write(receiver *InstancePtr, u32 Data) {

    Xil_AssertVoid(InstancePtr != NULL);

    receiver_WriteReg(InstancePtr->receiver_BaseAddress, 56, Data);
}
u32 receiver_global_reset_sync_read(receiver *InstancePtr) {

    u32 Data;
    Xil_AssertVoid(InstancePtr != NULL);

    Data = receiver_ReadReg(InstancePtr->receiver_BaseAddress, 56);
    return Data;
}
void receiver_enable_transfer_write(receiver *InstancePtr, u32 Data) {

    Xil_AssertVoid(InstancePtr != NULL);

    receiver_WriteReg(InstancePtr->receiver_BaseAddress, 28, Data);
}
u32 receiver_enable_transfer_read(receiver *InstancePtr) {

    u32 Data;
    Xil_AssertVoid(InstancePtr != NULL);

    Data = receiver_ReadReg(InstancePtr->receiver_BaseAddress, 28);
    return Data;
}
void receiver_coarse_passthrough_write(receiver *InstancePtr, u32 Data) {

    Xil_AssertVoid(InstancePtr != NULL);

    receiver_WriteReg(InstancePtr->receiver_BaseAddress, 44, Data);
}
u32 receiver_coarse_passthrough_read(receiver *InstancePtr) {

    u32 Data;
    Xil_AssertVoid(InstancePtr != NULL);

    Data = receiver_ReadReg(InstancePtr->receiver_BaseAddress, 44);
    return Data;
}
u32 receiver_bpsk_packet_count_read(receiver *InstancePtr) {

    u32 Data;
    Xil_AssertVoid(InstancePtr != NULL);

    Data = receiver_ReadReg(InstancePtr->receiver_BaseAddress, 52);
    return Data;
}
u32 receiver_data_count_read(receiver *InstancePtr) {

    u32 Data;
    Xil_AssertVoid(InstancePtr != NULL);

    Data = receiver_ReadReg(InstancePtr->receiver_BaseAddress, 32);
    return Data;
}
u8 receiver_frame_size_read(receiver *InstancePtr) {

    u8 Data;
    Xil_AssertVoid(InstancePtr != NULL);

    Data = receiver_ReadReg(InstancePtr->receiver_BaseAddress, 16);
    return Data;
}
int receiver_freq_offset_read(receiver *InstancePtr) {

    int Data;
    Xil_AssertVoid(InstancePtr != NULL);

    Data = receiver_ReadReg(InstancePtr->receiver_BaseAddress, 40);
    return Data;
}
u8 receiver_packet_size_read(receiver *InstancePtr) {

    u8 Data;
    Xil_AssertVoid(InstancePtr != NULL);

    Data = receiver_ReadReg(InstancePtr->receiver_BaseAddress, 20);
    return Data;
}
u32 receiver_qpsk_packet_count_read(receiver *InstancePtr) {

    u32 Data;
    Xil_AssertVoid(InstancePtr != NULL);

    Data = receiver_ReadReg(InstancePtr->receiver_BaseAddress, 24);
    return Data;
}
