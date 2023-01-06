/**
* @file receiver_sinit.c
*
* The implementation of the receiver driver's static initialzation
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
#include "receiver.h"
extern receiver_Config receiver_ConfigTable[];
/**
* Lookup the device configuration based on the unique device ID.  The table
* ConfigTable contains the configuration info for each device in the system.
*
* @param DeviceId is the device identifier to lookup.
*
* @return
*     - A pointer of data type receiver_Config which
*    points to the device configuration if DeviceID is found.
*    - NULL if DeviceID is not found.
*
* @note    None.
*
*/
receiver_Config *receiver_LookupConfig(u16 DeviceId) {
    receiver_Config *ConfigPtr = NULL;
    int Index;
    for (Index = 0; Index < XPAR_RECEIVER_NUM_INSTANCES; Index++) {
        if (receiver_ConfigTable[Index].DeviceId == DeviceId) {
            ConfigPtr = &receiver_ConfigTable[Index];
            break;
        }
    }
    return ConfigPtr;
}
int receiver_Initialize(receiver *InstancePtr, u16 DeviceId) {
    receiver_Config *ConfigPtr;
    Xil_AssertNonvoid(InstancePtr != NULL);
    ConfigPtr = receiver_LookupConfig(DeviceId);
    if (ConfigPtr == NULL) {
        InstancePtr->IsReady = 0;
        return (XST_DEVICE_NOT_FOUND);
    }
    return receiver_CfgInitialize(InstancePtr, ConfigPtr);
}
#endif
