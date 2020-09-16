/**
* @file bpsk_receiver_sinit.c
*
* The implementation of the bpsk_receiver driver's static initialzation
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
#include "bpsk_receiver.h"
extern bpsk_receiver_Config bpsk_receiver_ConfigTable[];
/**
* Lookup the device configuration based on the unique device ID.  The table
* ConfigTable contains the configuration info for each device in the system.
*
* @param DeviceId is the device identifier to lookup.
*
* @return
*     - A pointer of data type bpsk_receiver_Config which
*    points to the device configuration if DeviceID is found.
*    - NULL if DeviceID is not found.
*
* @note    None.
*
*/
bpsk_receiver_Config *bpsk_receiver_LookupConfig(u16 DeviceId) {
    bpsk_receiver_Config *ConfigPtr = NULL;
    int Index;
    for (Index = 0; Index < XPAR_BPSK_RECEIVER_NUM_INSTANCES; Index++) {
        if (bpsk_receiver_ConfigTable[Index].DeviceId == DeviceId) {
            ConfigPtr = &bpsk_receiver_ConfigTable[Index];
            break;
        }
    }
    return ConfigPtr;
}
int bpsk_receiver_Initialize(bpsk_receiver *InstancePtr, u16 DeviceId) {
    bpsk_receiver_Config *ConfigPtr;
    Xil_AssertNonvoid(InstancePtr != NULL);
    ConfigPtr = bpsk_receiver_LookupConfig(DeviceId);
    if (ConfigPtr == NULL) {
        InstancePtr->IsReady = 0;
        return (XST_DEVICE_NOT_FOUND);
    }
    return bpsk_receiver_CfgInitialize(InstancePtr, ConfigPtr);
}
#endif
