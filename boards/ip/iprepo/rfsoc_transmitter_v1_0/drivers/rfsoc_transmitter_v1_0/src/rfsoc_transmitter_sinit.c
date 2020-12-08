/**
* @file rfsoc_transmitter_sinit.c
*
* The implementation of the rfsoc_transmitter driver's static initialzation
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
#include "rfsoc_transmitter.h"
extern rfsoc_transmitter_Config rfsoc_transmitter_ConfigTable[];
/**
* Lookup the device configuration based on the unique device ID.  The table
* ConfigTable contains the configuration info for each device in the system.
*
* @param DeviceId is the device identifier to lookup.
*
* @return
*     - A pointer of data type rfsoc_transmitter_Config which
*    points to the device configuration if DeviceID is found.
*    - NULL if DeviceID is not found.
*
* @note    None.
*
*/
rfsoc_transmitter_Config *rfsoc_transmitter_LookupConfig(u16 DeviceId) {
    rfsoc_transmitter_Config *ConfigPtr = NULL;
    int Index;
    for (Index = 0; Index < XPAR_RFSOC_TRANSMITTER_NUM_INSTANCES; Index++) {
        if (rfsoc_transmitter_ConfigTable[Index].DeviceId == DeviceId) {
            ConfigPtr = &rfsoc_transmitter_ConfigTable[Index];
            break;
        }
    }
    return ConfigPtr;
}
int rfsoc_transmitter_Initialize(rfsoc_transmitter *InstancePtr, u16 DeviceId) {
    rfsoc_transmitter_Config *ConfigPtr;
    Xil_AssertNonvoid(InstancePtr != NULL);
    ConfigPtr = rfsoc_transmitter_LookupConfig(DeviceId);
    if (ConfigPtr == NULL) {
        InstancePtr->IsReady = 0;
        return (XST_DEVICE_NOT_FOUND);
    }
    return rfsoc_transmitter_CfgInitialize(InstancePtr, ConfigPtr);
}
#endif
