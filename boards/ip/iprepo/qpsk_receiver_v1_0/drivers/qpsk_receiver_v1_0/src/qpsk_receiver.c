#include "qpsk_receiver.h"
#ifndef __linux__
int qpsk_receiver_CfgInitialize(qpsk_receiver *InstancePtr, qpsk_receiver_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->qpsk_receiver_BaseAddress = ConfigPtr->qpsk_receiver_BaseAddress;

    InstancePtr->IsReady = 1;
    return XST_SUCCESS;
}
#endif
void qpsk_receiver_threshold_write(qpsk_receiver *InstancePtr, u32 Data) {

    Xil_AssertVoid(InstancePtr != NULL);

    qpsk_receiver_WriteReg(InstancePtr->qpsk_receiver_BaseAddress, 12, Data);
}
u32 qpsk_receiver_threshold_read(qpsk_receiver *InstancePtr) {

    u32 Data;
    Xil_AssertVoid(InstancePtr != NULL);

    Data = qpsk_receiver_ReadReg(InstancePtr->qpsk_receiver_BaseAddress, 12);
    return Data;
}
void qpsk_receiver_reset_time_sync_write(qpsk_receiver *InstancePtr, u32 Data) {

    Xil_AssertVoid(InstancePtr != NULL);

    qpsk_receiver_WriteReg(InstancePtr->qpsk_receiver_BaseAddress, 0, Data);
}
u32 qpsk_receiver_reset_time_sync_read(qpsk_receiver *InstancePtr) {

    u32 Data;
    Xil_AssertVoid(InstancePtr != NULL);

    Data = qpsk_receiver_ReadReg(InstancePtr->qpsk_receiver_BaseAddress, 0);
    return Data;
}
void qpsk_receiver_reset_phase_sync_write(qpsk_receiver *InstancePtr, u32 Data) {

    Xil_AssertVoid(InstancePtr != NULL);

    qpsk_receiver_WriteReg(InstancePtr->qpsk_receiver_BaseAddress, 4, Data);
}
u32 qpsk_receiver_reset_phase_sync_read(qpsk_receiver *InstancePtr) {

    u32 Data;
    Xil_AssertVoid(InstancePtr != NULL);

    Data = qpsk_receiver_ReadReg(InstancePtr->qpsk_receiver_BaseAddress, 4);
    return Data;
}
void qpsk_receiver_reset_frame_sync_write(qpsk_receiver *InstancePtr, u32 Data) {

    Xil_AssertVoid(InstancePtr != NULL);

    qpsk_receiver_WriteReg(InstancePtr->qpsk_receiver_BaseAddress, 8, Data);
}
u32 qpsk_receiver_reset_frame_sync_read(qpsk_receiver *InstancePtr) {

    u32 Data;
    Xil_AssertVoid(InstancePtr != NULL);

    Data = qpsk_receiver_ReadReg(InstancePtr->qpsk_receiver_BaseAddress, 8);
    return Data;
}
void qpsk_receiver_observation_point_write(qpsk_receiver *InstancePtr, u32 Data) {

    Xil_AssertVoid(InstancePtr != NULL);

    qpsk_receiver_WriteReg(InstancePtr->qpsk_receiver_BaseAddress, 36, Data);
}
u32 qpsk_receiver_observation_point_read(qpsk_receiver *InstancePtr) {

    u32 Data;
    Xil_AssertVoid(InstancePtr != NULL);

    Data = qpsk_receiver_ReadReg(InstancePtr->qpsk_receiver_BaseAddress, 36);
    return Data;
}
void qpsk_receiver_enable_transfer_write(qpsk_receiver *InstancePtr, u32 Data) {

    Xil_AssertVoid(InstancePtr != NULL);

    qpsk_receiver_WriteReg(InstancePtr->qpsk_receiver_BaseAddress, 28, Data);
}
u32 qpsk_receiver_enable_transfer_read(qpsk_receiver *InstancePtr) {

    u32 Data;
    Xil_AssertVoid(InstancePtr != NULL);

    Data = qpsk_receiver_ReadReg(InstancePtr->qpsk_receiver_BaseAddress, 28);
    return Data;
}
void qpsk_receiver_coarse_passthrough_write(qpsk_receiver *InstancePtr, u32 Data) {

    Xil_AssertVoid(InstancePtr != NULL);

    qpsk_receiver_WriteReg(InstancePtr->qpsk_receiver_BaseAddress, 44, Data);
}
u32 qpsk_receiver_coarse_passthrough_read(qpsk_receiver *InstancePtr) {

    u32 Data;
    Xil_AssertVoid(InstancePtr != NULL);

    Data = qpsk_receiver_ReadReg(InstancePtr->qpsk_receiver_BaseAddress, 44);
    return Data;
}
u32 qpsk_receiver_data_count_read(qpsk_receiver *InstancePtr) {

    u32 Data;
    Xil_AssertVoid(InstancePtr != NULL);

    Data = qpsk_receiver_ReadReg(InstancePtr->qpsk_receiver_BaseAddress, 32);
    return Data;
}
u8 qpsk_receiver_frame_size_read(qpsk_receiver *InstancePtr) {

    u8 Data;
    Xil_AssertVoid(InstancePtr != NULL);

    Data = qpsk_receiver_ReadReg(InstancePtr->qpsk_receiver_BaseAddress, 16);
    return Data;
}
int qpsk_receiver_freq_offset_read(qpsk_receiver *InstancePtr) {

    int Data;
    Xil_AssertVoid(InstancePtr != NULL);

    Data = qpsk_receiver_ReadReg(InstancePtr->qpsk_receiver_BaseAddress, 40);
    return Data;
}
u32 qpsk_receiver_packet_count_read(qpsk_receiver *InstancePtr) {

    u32 Data;
    Xil_AssertVoid(InstancePtr != NULL);

    Data = qpsk_receiver_ReadReg(InstancePtr->qpsk_receiver_BaseAddress, 24);
    return Data;
}
u8 qpsk_receiver_packet_size_read(qpsk_receiver *InstancePtr) {

    u8 Data;
    Xil_AssertVoid(InstancePtr != NULL);

    Data = qpsk_receiver_ReadReg(InstancePtr->qpsk_receiver_BaseAddress, 20);
    return Data;
}
