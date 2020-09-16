proc generate {drv_handle} {
    xdefine_include_file $drv_handle "xparameters.h" "bpsk_receiver" "NUM_INSTANCES" "DEVICE_ID" "C_BPSK_RECEIVER_S_AXI_BASEADDR" "C_BPSK_RECEIVER_S_AXI_HIGHADDR" 
    xdefine_config_file $drv_handle "bpsk_receiver_g.c" "bpsk_receiver" "DEVICE_ID" "C_BPSK_RECEIVER_S_AXI_BASEADDR" 
    xdefine_canonical_xpars $drv_handle "xparameters.h" "bpsk_receiver" "DEVICE_ID" "C_BPSK_RECEIVER_S_AXI_BASEADDR" "C_BPSK_RECEIVER_S_AXI_HIGHADDR" 

}