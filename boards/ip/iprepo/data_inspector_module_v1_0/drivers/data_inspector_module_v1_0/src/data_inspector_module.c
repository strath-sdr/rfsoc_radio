#include "data_inspector_module.h"
#ifndef __linux__
int data_inspector_module_CfgInitialize(data_inspector_module *InstancePtr, data_inspector_module_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->data_inspector_module_BaseAddress = ConfigPtr->data_inspector_module_BaseAddress;

    InstancePtr->IsReady = 1;
    return XST_SUCCESS;
}
#endif
void data_inspector_module_reset_dim_write(data_inspector_module *InstancePtr, u32 Data) {

    Xil_AssertVoid(InstancePtr != NULL);

    data_inspector_module_WriteReg(InstancePtr->data_inspector_module_BaseAddress, 0, Data);
}
u32 data_inspector_module_reset_dim_read(data_inspector_module *InstancePtr) {

    u32 Data;
    Xil_AssertVoid(InstancePtr != NULL);

    Data = data_inspector_module_ReadReg(InstancePtr->data_inspector_module_BaseAddress, 0);
    return Data;
}
void data_inspector_module_packetsize_dim_write(data_inspector_module *InstancePtr, u32 Data) {

    Xil_AssertVoid(InstancePtr != NULL);

    data_inspector_module_WriteReg(InstancePtr->data_inspector_module_BaseAddress, 8, Data);
}
u32 data_inspector_module_packetsize_dim_read(data_inspector_module *InstancePtr) {

    u32 Data;
    Xil_AssertVoid(InstancePtr != NULL);

    Data = data_inspector_module_ReadReg(InstancePtr->data_inspector_module_BaseAddress, 8);
    return Data;
}
void data_inspector_module_enable_dim_write(data_inspector_module *InstancePtr, u32 Data) {

    Xil_AssertVoid(InstancePtr != NULL);

    data_inspector_module_WriteReg(InstancePtr->data_inspector_module_BaseAddress, 4, Data);
}
u32 data_inspector_module_enable_dim_read(data_inspector_module *InstancePtr) {

    u32 Data;
    Xil_AssertVoid(InstancePtr != NULL);

    Data = data_inspector_module_ReadReg(InstancePtr->data_inspector_module_BaseAddress, 4);
    return Data;
}
