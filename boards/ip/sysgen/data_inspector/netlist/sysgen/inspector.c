#include "inspector.h"
#ifndef __linux__
int inspector_CfgInitialize(inspector *InstancePtr, inspector_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->inspector_BaseAddress = ConfigPtr->inspector_BaseAddress;

    InstancePtr->IsReady = 1;
    return XST_SUCCESS;
}
#endif
void inspector_reset_dim_write(inspector *InstancePtr, u32 Data) {

    Xil_AssertVoid(InstancePtr != NULL);

    inspector_WriteReg(InstancePtr->inspector_BaseAddress, 0, Data);
}
u32 inspector_reset_dim_read(inspector *InstancePtr) {

    u32 Data;
    Xil_AssertVoid(InstancePtr != NULL);

    Data = inspector_ReadReg(InstancePtr->inspector_BaseAddress, 0);
    return Data;
}
void inspector_packetsize_dim_write(inspector *InstancePtr, u32 Data) {

    Xil_AssertVoid(InstancePtr != NULL);

    inspector_WriteReg(InstancePtr->inspector_BaseAddress, 8, Data);
}
u32 inspector_packetsize_dim_read(inspector *InstancePtr) {

    u32 Data;
    Xil_AssertVoid(InstancePtr != NULL);

    Data = inspector_ReadReg(InstancePtr->inspector_BaseAddress, 8);
    return Data;
}
void inspector_enable_dim_write(inspector *InstancePtr, u32 Data) {

    Xil_AssertVoid(InstancePtr != NULL);

    inspector_WriteReg(InstancePtr->inspector_BaseAddress, 4, Data);
}
u32 inspector_enable_dim_read(inspector *InstancePtr) {

    u32 Data;
    Xil_AssertVoid(InstancePtr != NULL);

    Data = inspector_ReadReg(InstancePtr->inspector_BaseAddress, 4);
    return Data;
}
