#include "rfsoc_transmitter.h"
#ifndef __linux__
int rfsoc_transmitter_CfgInitialize(rfsoc_transmitter *InstancePtr, rfsoc_transmitter_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->rfsoc_transmitter_BaseAddress = ConfigPtr->rfsoc_transmitter_BaseAddress;

    InstancePtr->IsReady = 1;
    return XST_SUCCESS;
}
#endif
void rfsoc_transmitter_enable_tx_write(rfsoc_transmitter *InstancePtr, u32 Data) {

    Xil_AssertVoid(InstancePtr != NULL);

    rfsoc_transmitter_WriteReg(InstancePtr->rfsoc_transmitter_BaseAddress, 4, Data);
}
u32 rfsoc_transmitter_enable_tx_read(rfsoc_transmitter *InstancePtr) {

    u32 Data;
    Xil_AssertVoid(InstancePtr != NULL);

    Data = rfsoc_transmitter_ReadReg(InstancePtr->rfsoc_transmitter_BaseAddress, 4);
    return Data;
}
void rfsoc_transmitter_enable_data_write(rfsoc_transmitter *InstancePtr, u32 Data) {

    Xil_AssertVoid(InstancePtr != NULL);

    rfsoc_transmitter_WriteReg(InstancePtr->rfsoc_transmitter_BaseAddress, 0, Data);
}
u32 rfsoc_transmitter_enable_data_read(rfsoc_transmitter *InstancePtr) {

    u32 Data;
    Xil_AssertVoid(InstancePtr != NULL);

    Data = rfsoc_transmitter_ReadReg(InstancePtr->rfsoc_transmitter_BaseAddress, 0);
    return Data;
}
