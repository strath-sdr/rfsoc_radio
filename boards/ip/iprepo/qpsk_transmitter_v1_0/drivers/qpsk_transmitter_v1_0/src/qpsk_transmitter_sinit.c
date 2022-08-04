/**
* @file qpsk_transmitter_sinit.c
*
* The implementation of the qpsk_transmitter driver's static initialzation
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
#include "qpsk_transmitter.h"
extern qpsk_transmitter_Config qpsk_transmitter_ConfigTable[];
/**
* Lookup the device configuration based on the unique device ID.  The table
* ConfigTable contains the configuration info for each device in the system.
*
* @param DeviceId is the device identifier to lookup.
*
* @return
*     - A pointer of data type qpsk_transmitter_Config which
*    points to the device configuration if DeviceID is found.
*    - NULL if DeviceID is not found.
*
* @note    None.
*
*/
qpsk_transmitter_Config *qpsk_transmitter_LookupConfig(u16 DeviceId) {
    qpsk_transmitter_Config *ConfigPtr = NULL;
    int Index;
    for (Index = 0; Index < XPAR_QPSK_TRANSMITTER_NUM_INSTANCES; Index++) {
        if (qpsk_transmitter_ConfigTable[Index].DeviceId == DeviceId) {
            ConfigPtr = &qpsk_transmitter_ConfigTable[Index];
            break;
        }
    }
    return ConfigPtr;
}
int qpsk_transmitter_Initialize(qpsk_transmitter *InstancePtr, u16 DeviceId) {
    qpsk_transmitter_Config *ConfigPtr;
    Xil_AssertNonvoid(InstancePtr != NULL);
    ConfigPtr = qpsk_transmitter_LookupConfig(DeviceId);
    if (ConfigPtr == NULL) {
        InstancePtr->IsReady = 0;
        return (XST_DEVICE_NOT_FOUND);
    }
    return qpsk_transmitter_CfgInitialize(InstancePtr, ConfigPtr);
}
#endif
