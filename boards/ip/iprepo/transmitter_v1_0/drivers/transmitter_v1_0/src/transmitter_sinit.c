/**
* @file transmitter_sinit.c
*
* The implementation of the transmitter driver's static initialzation
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
#include "transmitter.h"
extern transmitter_Config transmitter_ConfigTable[];
/**
* Lookup the device configuration based on the unique device ID.  The table
* ConfigTable contains the configuration info for each device in the system.
*
* @param DeviceId is the device identifier to lookup.
*
* @return
*     - A pointer of data type transmitter_Config which
*    points to the device configuration if DeviceID is found.
*    - NULL if DeviceID is not found.
*
* @note    None.
*
*/
transmitter_Config *transmitter_LookupConfig(u16 DeviceId) {
    transmitter_Config *ConfigPtr = NULL;
    int Index;
    for (Index = 0; Index < XPAR_TRANSMITTER_NUM_INSTANCES; Index++) {
        if (transmitter_ConfigTable[Index].DeviceId == DeviceId) {
            ConfigPtr = &transmitter_ConfigTable[Index];
            break;
        }
    }
    return ConfigPtr;
}
int transmitter_Initialize(transmitter *InstancePtr, u16 DeviceId) {
    transmitter_Config *ConfigPtr;
    Xil_AssertNonvoid(InstancePtr != NULL);
    ConfigPtr = transmitter_LookupConfig(DeviceId);
    if (ConfigPtr == NULL) {
        InstancePtr->IsReady = 0;
        return (XST_DEVICE_NOT_FOUND);
    }
    return transmitter_CfgInitialize(InstancePtr, ConfigPtr);
}
#endif
