#include "bpsk_transmitter.h"
#ifndef __linux__
int bpsk_transmitter_CfgInitialize(bpsk_transmitter *InstancePtr, bpsk_transmitter_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->bpsk_transmitter_BaseAddress = ConfigPtr->bpsk_transmitter_BaseAddress;

    InstancePtr->IsReady = 1;
    return XST_SUCCESS;
}
#endif
void bpsk_transmitter_enable_tx_write(bpsk_transmitter *InstancePtr, u32 Data) {

    Xil_AssertVoid(InstancePtr != NULL);

    bpsk_transmitter_WriteReg(InstancePtr->bpsk_transmitter_BaseAddress, 4, Data);
}
u32 bpsk_transmitter_enable_tx_read(bpsk_transmitter *InstancePtr) {

    u32 Data;
    Xil_AssertVoid(InstancePtr != NULL);

    Data = bpsk_transmitter_ReadReg(InstancePtr->bpsk_transmitter_BaseAddress, 4);
    return Data;
}
void bpsk_transmitter_enable_data_write(bpsk_transmitter *InstancePtr, u32 Data) {

    Xil_AssertVoid(InstancePtr != NULL);

    bpsk_transmitter_WriteReg(InstancePtr->bpsk_transmitter_BaseAddress, 0, Data);
}
u32 bpsk_transmitter_enable_data_read(bpsk_transmitter *InstancePtr) {

    u32 Data;
    Xil_AssertVoid(InstancePtr != NULL);

    Data = bpsk_transmitter_ReadReg(InstancePtr->bpsk_transmitter_BaseAddress, 0);
    return Data;
}
