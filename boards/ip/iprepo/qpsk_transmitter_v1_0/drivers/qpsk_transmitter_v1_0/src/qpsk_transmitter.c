#include "qpsk_transmitter.h"
#ifndef __linux__
int qpsk_transmitter_CfgInitialize(qpsk_transmitter *InstancePtr, qpsk_transmitter_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->qpsk_transmitter_BaseAddress = ConfigPtr->qpsk_transmitter_BaseAddress;

    InstancePtr->IsReady = 1;
    return XST_SUCCESS;
}
#endif
void qpsk_transmitter_enable_tx_write(qpsk_transmitter *InstancePtr, u32 Data) {

    Xil_AssertVoid(InstancePtr != NULL);

    qpsk_transmitter_WriteReg(InstancePtr->qpsk_transmitter_BaseAddress, 4, Data);
}
u32 qpsk_transmitter_enable_tx_read(qpsk_transmitter *InstancePtr) {

    u32 Data;
    Xil_AssertVoid(InstancePtr != NULL);

    Data = qpsk_transmitter_ReadReg(InstancePtr->qpsk_transmitter_BaseAddress, 4);
    return Data;
}
void qpsk_transmitter_enable_data_write(qpsk_transmitter *InstancePtr, u32 Data) {

    Xil_AssertVoid(InstancePtr != NULL);

    qpsk_transmitter_WriteReg(InstancePtr->qpsk_transmitter_BaseAddress, 0, Data);
}
u32 qpsk_transmitter_enable_data_read(qpsk_transmitter *InstancePtr) {

    u32 Data;
    Xil_AssertVoid(InstancePtr != NULL);

    Data = qpsk_transmitter_ReadReg(InstancePtr->qpsk_transmitter_BaseAddress, 0);
    return Data;
}
