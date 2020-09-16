proc generate {drv_handle} {
    xdefine_include_file $drv_handle "xparameters.h" "data_inspector_module" "NUM_INSTANCES" "DEVICE_ID" "C_DATA_INSPECTOR_MODULE_S_AXI_BASEADDR" "C_DATA_INSPECTOR_MODULE_S_AXI_HIGHADDR" 
    xdefine_config_file $drv_handle "data_inspector_module_g.c" "data_inspector_module" "DEVICE_ID" "C_DATA_INSPECTOR_MODULE_S_AXI_BASEADDR" 
    xdefine_canonical_xpars $drv_handle "xparameters.h" "data_inspector_module" "DEVICE_ID" "C_DATA_INSPECTOR_MODULE_S_AXI_BASEADDR" "C_DATA_INSPECTOR_MODULE_S_AXI_HIGHADDR" 

}