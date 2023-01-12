#include "transmitter.h"
#ifndef __linux__
int transmitter_CfgInitialize(transmitter *InstancePtr, transmitter_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->transmitter_BaseAddress = ConfigPtr->transmitter_BaseAddress;

    InstancePtr->IsReady = 1;
    return XST_SUCCESS;
}
#endif
void transmitter_observation_point_write(transmitter *InstancePtr, u32 Data) {

    Xil_AssertVoid(InstancePtr != NULL);

    transmitter_WriteReg(InstancePtr->transmitter_BaseAddress, 12, Data);
}
u32 transmitter_observation_point_read(transmitter *InstancePtr) {

    u32 Data;
    Xil_AssertVoid(InstancePtr != NULL);

    Data = transmitter_ReadReg(InstancePtr->transmitter_BaseAddress, 12);
    return Data;
}
void transmitter_modulation_write(transmitter *InstancePtr, u32 Data) {

    Xil_AssertVoid(InstancePtr != NULL);

    transmitter_WriteReg(InstancePtr->transmitter_BaseAddress, 8, Data);
}
u32 transmitter_modulation_read(transmitter *InstancePtr) {

    u32 Data;
    Xil_AssertVoid(InstancePtr != NULL);

    Data = transmitter_ReadReg(InstancePtr->transmitter_BaseAddress, 8);
    return Data;
}
void transmitter_enable_tx_write(transmitter *InstancePtr, u32 Data) {

    Xil_AssertVoid(InstancePtr != NULL);

    transmitter_WriteReg(InstancePtr->transmitter_BaseAddress, 4, Data);
}
u32 transmitter_enable_tx_read(transmitter *InstancePtr) {

    u32 Data;
    Xil_AssertVoid(InstancePtr != NULL);

    Data = transmitter_ReadReg(InstancePtr->transmitter_BaseAddress, 4);
    return Data;
}
void transmitter_enable_data_write(transmitter *InstancePtr, u32 Data) {

    Xil_AssertVoid(InstancePtr != NULL);

    transmitter_WriteReg(InstancePtr->transmitter_BaseAddress, 0, Data);
}
u32 transmitter_enable_data_read(transmitter *InstancePtr) {

    u32 Data;
    Xil_AssertVoid(InstancePtr != NULL);

    Data = transmitter_ReadReg(InstancePtr->transmitter_BaseAddress, 0);
    return Data;
}
