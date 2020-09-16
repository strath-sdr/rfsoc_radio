/**
* @file data_inspector_module_sinit.c
*
* The implementation of the data_inspector_module driver's static initialzation
* functionality.
*
* @note
*
* None
*
*/
#ifndef __linux__
#include "xstatus.h"
#include "xparameters.h"
#include "data_inspector_module.h"
extern data_inspector_module_Config data_inspector_module_ConfigTable[];
/**
* Lookup the device configuration based on the unique device ID.  The table
* ConfigTable contains the configuration info for each device in the system.
*
* @param DeviceId is the device identifier to lookup.
*
* @return
*     - A pointer of data type data_inspector_module_Config which
*    points to the device configuration if DeviceID is found.
*    - NULL if DeviceID is not found.
*
* @note    None.
*
*/
data_inspector_module_Config *data_inspector_module_LookupConfig(u16 DeviceId) {
    data_inspector_module_Config *ConfigPtr = NULL;
    int Index;
    for (Index = 0; Index < XPAR_DATA_INSPECTOR_MODULE_NUM_INSTANCES; Index++) {
        if (data_inspector_module_ConfigTable[Index].DeviceId == DeviceId) {
            ConfigPtr = &data_inspector_module_ConfigTable[Index];
            break;
        }
    }
    return ConfigPtr;
}
int data_inspector_module_Initialize(data_inspector_module *InstancePtr, u16 DeviceId) {
    data_inspector_module_Config *ConfigPtr;
    Xil_AssertNonvoid(InstancePtr != NULL);
    ConfigPtr = data_inspector_module_LookupConfig(DeviceId);
    if (ConfigPtr == NULL) {
        InstancePtr->IsReady = 0;
        return (XST_DEVICE_NOT_FOUND);
    }
    return data_inspector_module_CfgInitialize(InstancePtr, ConfigPtr);
}
#endif
