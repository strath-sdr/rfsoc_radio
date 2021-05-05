/**
* @file inspector_sinit.c
*
* The implementation of the inspector driver's static initialzation
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
#include "inspector.h"
extern inspector_Config inspector_ConfigTable[];
/**
* Lookup the device configuration based on the unique device ID.  The table
* ConfigTable contains the configuration info for each device in the system.
*
* @param DeviceId is the device identifier to lookup.
*
* @return
*     - A pointer of data type inspector_Config which
*    points to the device configuration if DeviceID is found.
*    - NULL if DeviceID is not found.
*
* @note    None.
*
*/
inspector_Config *inspector_LookupConfig(u16 DeviceId) {
    inspector_Config *ConfigPtr = NULL;
    int Index;
    for (Index = 0; Index < XPAR_INSPECTOR_NUM_INSTANCES; Index++) {
        if (inspector_ConfigTable[Index].DeviceId == DeviceId) {
            ConfigPtr = &inspector_ConfigTable[Index];
            break;
        }
    }
    return ConfigPtr;
}
int inspector_Initialize(inspector *InstancePtr, u16 DeviceId) {
    inspector_Config *ConfigPtr;
    Xil_AssertNonvoid(InstancePtr != NULL);
    ConfigPtr = inspector_LookupConfig(DeviceId);
    if (ConfigPtr == NULL) {
        InstancePtr->IsReady = 0;
        return (XST_DEVICE_NOT_FOUND);
    }
    return inspector_CfgInitialize(InstancePtr, ConfigPtr);
}
#endif
