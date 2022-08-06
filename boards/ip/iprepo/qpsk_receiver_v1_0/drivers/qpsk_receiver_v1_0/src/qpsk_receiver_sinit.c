/**
* @file qpsk_receiver_sinit.c
*
* The implementation of the qpsk_receiver driver's static initialzation
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
#include "qpsk_receiver.h"
extern qpsk_receiver_Config qpsk_receiver_ConfigTable[];
/**
* Lookup the device configuration based on the unique device ID.  The table
* ConfigTable contains the configuration info for each device in the system.
*
* @param DeviceId is the device identifier to lookup.
*
* @return
*     - A pointer of data type qpsk_receiver_Config which
*    points to the device configuration if DeviceID is found.
*    - NULL if DeviceID is not found.
*
* @note    None.
*
*/
qpsk_receiver_Config *qpsk_receiver_LookupConfig(u16 DeviceId) {
    qpsk_receiver_Config *ConfigPtr = NULL;
    int Index;
    for (Index = 0; Index < XPAR_QPSK_RECEIVER_NUM_INSTANCES; Index++) {
        if (qpsk_receiver_ConfigTable[Index].DeviceId == DeviceId) {
            ConfigPtr = &qpsk_receiver_ConfigTable[Index];
            break;
        }
    }
    return ConfigPtr;
}
int qpsk_receiver_Initialize(qpsk_receiver *InstancePtr, u16 DeviceId) {
    qpsk_receiver_Config *ConfigPtr;
    Xil_AssertNonvoid(InstancePtr != NULL);
    ConfigPtr = qpsk_receiver_LookupConfig(DeviceId);
    if (ConfigPtr == NULL) {
        InstancePtr->IsReady = 0;
        return (XST_DEVICE_NOT_FOUND);
    }
    return qpsk_receiver_CfgInitialize(InstancePtr, ConfigPtr);
}
#endif
