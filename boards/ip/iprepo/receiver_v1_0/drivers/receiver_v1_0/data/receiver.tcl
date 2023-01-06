proc generate {drv_handle} {
    xdefine_include_file $drv_handle "xparameters.h" "receiver" "NUM_INSTANCES" "DEVICE_ID" "C_RECEIVER_S_AXI_BASEADDR" "C_RECEIVER_S_AXI_HIGHADDR" 
    xdefine_config_file $drv_handle "receiver_g.c" "receiver" "DEVICE_ID" "C_RECEIVER_S_AXI_BASEADDR" 
    xdefine_canonical_xpars $drv_handle "xparameters.h" "receiver" "DEVICE_ID" "C_RECEIVER_S_AXI_BASEADDR" "C_RECEIVER_S_AXI_HIGHADDR" 

}