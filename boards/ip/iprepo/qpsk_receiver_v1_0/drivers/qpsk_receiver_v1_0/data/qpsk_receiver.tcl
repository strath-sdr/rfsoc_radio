proc generate {drv_handle} {
    xdefine_include_file $drv_handle "xparameters.h" "qpsk_receiver" "NUM_INSTANCES" "DEVICE_ID" "C_QPSK_RECEIVER_S_AXI_BASEADDR" "C_QPSK_RECEIVER_S_AXI_HIGHADDR" 
    xdefine_config_file $drv_handle "qpsk_receiver_g.c" "qpsk_receiver" "DEVICE_ID" "C_QPSK_RECEIVER_S_AXI_BASEADDR" 
    xdefine_canonical_xpars $drv_handle "xparameters.h" "qpsk_receiver" "DEVICE_ID" "C_QPSK_RECEIVER_S_AXI_BASEADDR" "C_QPSK_RECEIVER_S_AXI_HIGHADDR" 

}