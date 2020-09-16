proc generate {drv_handle} {
    xdefine_include_file $drv_handle "xparameters.h" "bpsk_transmitter" "NUM_INSTANCES" "DEVICE_ID" "C_BPSK_TRANSMITTER_S_AXI_BASEADDR" "C_BPSK_TRANSMITTER_S_AXI_HIGHADDR" 
    xdefine_config_file $drv_handle "bpsk_transmitter_g.c" "bpsk_transmitter" "DEVICE_ID" "C_BPSK_TRANSMITTER_S_AXI_BASEADDR" 
    xdefine_canonical_xpars $drv_handle "xparameters.h" "bpsk_transmitter" "DEVICE_ID" "C_BPSK_TRANSMITTER_S_AXI_BASEADDR" "C_BPSK_TRANSMITTER_S_AXI_HIGHADDR" 

}