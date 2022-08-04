proc generate {drv_handle} {
    xdefine_include_file $drv_handle "xparameters.h" "qpsk_transmitter" "NUM_INSTANCES" "DEVICE_ID" "C_QPSK_TRANSMITTER_S_AXI_BASEADDR" "C_QPSK_TRANSMITTER_S_AXI_HIGHADDR" 
    xdefine_config_file $drv_handle "qpsk_transmitter_g.c" "qpsk_transmitter" "DEVICE_ID" "C_QPSK_TRANSMITTER_S_AXI_BASEADDR" 
    xdefine_canonical_xpars $drv_handle "xparameters.h" "qpsk_transmitter" "DEVICE_ID" "C_QPSK_TRANSMITTER_S_AXI_BASEADDR" "C_QPSK_TRANSMITTER_S_AXI_HIGHADDR" 

}