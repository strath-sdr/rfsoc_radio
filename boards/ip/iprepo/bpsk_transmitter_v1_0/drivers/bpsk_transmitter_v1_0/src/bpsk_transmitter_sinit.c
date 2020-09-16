/**
* @file bpsk_transmitter_sinit.c
*
* The implementation of the bpsk_transmitter driver's static initialzation
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
#include "bpsk_transmitter.h"
extern bpsk_transmitter_Config bpsk_transmitter_ConfigTable[];
/**
* Lookup the device configuration based on the unique device ID.  The table
* ConfigTable contains the configuration info for each device in the system.
*
* @param DeviceId is the device identifier to lookup.
*
* @return
*     - A pointer of data type bpsk_transmitter_Config which
*    points to the device configuration if DeviceID is found.
*    - NULL if DeviceID is not found.
*
* @note    None.
*
*/
bpsk_transmitter_Config *bpsk_transmitter_LookupConfig(u16 DeviceId) {
    bpsk_transmitter_Config *ConfigPtr = NULL;
    int Index;
    for (Index = 0; Index < XPAR_BPSK_TRANSMITTER_NUM_INSTANCES; Index++) {
        if (bpsk_transmitter_ConfigTable[Index].DeviceId == DeviceId) {
            ConfigPtr = &bpsk_transmitter_ConfigTable[Index];
            break;
        }
    }
    return ConfigPtr;
}
int bpsk_transmitter_Initialize(bpsk_transmitter *InstancePtr, u16 DeviceId) {
    bpsk_transmitter_Config *ConfigPtr;
    Xil_AssertNonvoid(InstancePtr != NULL);
    ConfigPtr = bpsk_transmitter_LookupConfig(DeviceId);
    if (ConfigPtr == NULL) {
        InstancePtr->IsReady = 0;
        return (XST_DEVICE_NOT_FOUND);
    }
    return bpsk_transmitter_CfgInitialize(InstancePtr, ConfigPtr);
}
#endif
