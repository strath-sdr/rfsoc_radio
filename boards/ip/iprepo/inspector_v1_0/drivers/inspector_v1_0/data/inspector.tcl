proc generate {drv_handle} {
    xdefine_include_file $drv_handle "xparameters.h" "inspector" "NUM_INSTANCES" "DEVICE_ID" "C_INSPECTOR_S_AXI_BASEADDR" "C_INSPECTOR_S_AXI_HIGHADDR" 
    xdefine_config_file $drv_handle "inspector_g.c" "inspector" "DEVICE_ID" "C_INSPECTOR_S_AXI_BASEADDR" 
    xdefine_canonical_xpars $drv_handle "xparameters.h" "inspector" "DEVICE_ID" "C_INSPECTOR_S_AXI_BASEADDR" "C_INSPECTOR_S_AXI_HIGHADDR" 

}