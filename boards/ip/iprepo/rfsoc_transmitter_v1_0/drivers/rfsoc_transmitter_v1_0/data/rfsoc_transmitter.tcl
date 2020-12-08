proc generate {drv_handle} {
    xdefine_include_file $drv_handle "xparameters.h" "rfsoc_transmitter" "NUM_INSTANCES" "DEVICE_ID" "C_RFSOC_TRANSMITTER_S_AXI_BASEADDR" "C_RFSOC_TRANSMITTER_S_AXI_HIGHADDR" 
    xdefine_config_file $drv_handle "rfsoc_transmitter_g.c" "rfsoc_transmitter" "DEVICE_ID" "C_RFSOC_TRANSMITTER_S_AXI_BASEADDR" 
    xdefine_canonical_xpars $drv_handle "xparameters.h" "rfsoc_transmitter" "DEVICE_ID" "C_RFSOC_TRANSMITTER_S_AXI_BASEADDR" "C_RFSOC_TRANSMITTER_S_AXI_HIGHADDR" 

}