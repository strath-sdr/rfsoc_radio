#include "bpsk_receiver.h"
#ifndef __linux__
int bpsk_receiver_CfgInitialize(bpsk_receiver *InstancePtr, bpsk_receiver_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->bpsk_receiver_BaseAddress = ConfigPtr->bpsk_receiver_BaseAddress;

    InstancePtr->IsReady = 1;
    return XST_SUCCESS;
}
#endif
void bpsk_receiver_threshold_write(bpsk_receiver *InstancePtr, u32 Data) {

    Xil_AssertVoid(InstancePtr != NULL);

    bpsk_receiver_WriteReg(InstancePtr->bpsk_receiver_BaseAddress, 12, Data);
}
u32 bpsk_receiver_threshold_read(bpsk_receiver *InstancePtr) {

    u32 Data;
    Xil_AssertVoid(InstancePtr != NULL);

    Data = bpsk_receiver_ReadReg(InstancePtr->bpsk_receiver_BaseAddress, 12);
    return Data;
}
void bpsk_receiver_reset_time_sync_write(bpsk_receiver *InstancePtr, u32 Data) {

    Xil_AssertVoid(InstancePtr != NULL);

    bpsk_receiver_WriteReg(InstancePtr->bpsk_receiver_BaseAddress, 0, Data);
}
u32 bpsk_receiver_reset_time_sync_read(bpsk_receiver *InstancePtr) {

    u32 Data;
    Xil_AssertVoid(InstancePtr != NULL);

    Data = bpsk_receiver_ReadReg(InstancePtr->bpsk_receiver_BaseAddress, 0);
    return Data;
}
void bpsk_receiver_reset_phase_sync_write(bpsk_receiver *InstancePtr, u32 Data) {

    Xil_AssertVoid(InstancePtr != NULL);

    bpsk_receiver_WriteReg(InstancePtr->bpsk_receiver_BaseAddress, 4, Data);
}
u32 bpsk_receiver_reset_phase_sync_read(bpsk_receiver *InstancePtr) {

    u32 Data;
    Xil_AssertVoid(InstancePtr != NULL);

    Data = bpsk_receiver_ReadReg(InstancePtr->bpsk_receiver_BaseAddress, 4);
    return Data;
}
void bpsk_receiver_reset_frame_sync_write(bpsk_receiver *InstancePtr, u32 Data) {

    Xil_AssertVoid(InstancePtr != NULL);

    bpsk_receiver_WriteReg(InstancePtr->bpsk_receiver_BaseAddress, 8, Data);
}
u32 bpsk_receiver_reset_frame_sync_read(bpsk_receiver *InstancePtr) {

    u32 Data;
    Xil_AssertVoid(InstancePtr != NULL);

    Data = bpsk_receiver_ReadReg(InstancePtr->bpsk_receiver_BaseAddress, 8);
    return Data;
}
void bpsk_receiver_observation_point_write(bpsk_receiver *InstancePtr, u32 Data) {

    Xil_AssertVoid(InstancePtr != NULL);

    bpsk_receiver_WriteReg(InstancePtr->bpsk_receiver_BaseAddress, 36, Data);
}
u32 bpsk_receiver_observation_point_read(bpsk_receiver *InstancePtr) {

    u32 Data;
    Xil_AssertVoid(InstancePtr != NULL);

    Data = bpsk_receiver_ReadReg(InstancePtr->bpsk_receiver_BaseAddress, 36);
    return Data;
}
void bpsk_receiver_enable_transfer_write(bpsk_receiver *InstancePtr, u32 Data) {

    Xil_AssertVoid(InstancePtr != NULL);

    bpsk_receiver_WriteReg(InstancePtr->bpsk_receiver_BaseAddress, 28, Data);
}
u32 bpsk_receiver_enable_transfer_read(bpsk_receiver *InstancePtr) {

    u32 Data;
    Xil_AssertVoid(InstancePtr != NULL);

    Data = bpsk_receiver_ReadReg(InstancePtr->bpsk_receiver_BaseAddress, 28);
    return Data;
}
u8 bpsk_receiver_frame_size_read(bpsk_receiver *InstancePtr) {

    u8 Data;
    Xil_AssertVoid(InstancePtr != NULL);

    Data = bpsk_receiver_ReadReg(InstancePtr->bpsk_receiver_BaseAddress, 16);
    return Data;
}
u32 bpsk_receiver_data_count_read(bpsk_receiver *InstancePtr) {

    u32 Data;
    Xil_AssertVoid(InstancePtr != NULL);

    Data = bpsk_receiver_ReadReg(InstancePtr->bpsk_receiver_BaseAddress, 32);
    return Data;
}
u32 bpsk_receiver_packet_count_read(bpsk_receiver *InstancePtr) {

    u32 Data;
    Xil_AssertVoid(InstancePtr != NULL);

    Data = bpsk_receiver_ReadReg(InstancePtr->bpsk_receiver_BaseAddress, 24);
    return Data;
}
u8 bpsk_receiver_packet_size_read(bpsk_receiver *InstancePtr) {

    u8 Data;
    Xil_AssertVoid(InstancePtr != NULL);

    Data = bpsk_receiver_ReadReg(InstancePtr->bpsk_receiver_BaseAddress, 20);
    return Data;
}
