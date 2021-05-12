# Hierarchical cell: DataInspector
proc create_hier_cell_DataInspector { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_DataInspector() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M_AXI

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 S_AXIS


  # Create pins
  create_bd_pin -dir I -type clk aclk
  create_bd_pin -dir I -type rst aresetn
  create_bd_pin -dir O -type intr irq

  # Create instance: axi_dma, and set properties
  set axi_dma [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_dma:7.1 axi_dma ]
  set_property -dict [ list \
   CONFIG.c_addr_width {64} \
   CONFIG.c_include_mm2s {0} \
   CONFIG.c_include_sg {0} \
   CONFIG.c_mm2s_burst_size {16} \
   CONFIG.c_s2mm_burst_size {256} \
   CONFIG.c_sg_include_stscntrl_strm {0} \
   CONFIG.c_sg_length_width {26} \
 ] $axi_dma

  # Create instance: data_inspector_module, and set properties
  set data_inspector_module [ create_bd_cell -type ip -vlnv UoS:RFSoC:inspector:1.0 data_inspector_module ]

  # Create instance: s_axi_interconnect, and set properties
  set s_axi_interconnect [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 s_axi_interconnect ]

  # Create interface connections
  connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins S_AXIS] [get_bd_intf_pins data_inspector_module/s_axis]
  connect_bd_intf_net -intf_net Conn2 [get_bd_intf_pins S_AXI] [get_bd_intf_pins s_axi_interconnect/S00_AXI]
  connect_bd_intf_net -intf_net Conn3 [get_bd_intf_pins M_AXI] [get_bd_intf_pins axi_dma/M_AXI_S2MM]
  connect_bd_intf_net -intf_net axi_interconnect_0_M00_AXI [get_bd_intf_pins axi_dma/S_AXI_LITE] [get_bd_intf_pins s_axi_interconnect/M00_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M01_AXI [get_bd_intf_pins data_inspector_module/inspector_s_axi] [get_bd_intf_pins s_axi_interconnect/M01_AXI]
  connect_bd_intf_net -intf_net data_inspector_module_m_axis [get_bd_intf_pins axi_dma/S_AXIS_S2MM] [get_bd_intf_pins data_inspector_module/m_axis]

  # Create port connections
  connect_bd_net -net axi_dma_s2mm_introut1 [get_bd_pins irq] [get_bd_pins axi_dma/s2mm_introut]
  connect_bd_net -net proc_sys_reset_clk_dac1_peripheral_aresetn [get_bd_pins aresetn] [get_bd_pins axi_dma/axi_resetn] [get_bd_pins data_inspector_module/inspector_aresetn] [get_bd_pins s_axi_interconnect/ARESETN] [get_bd_pins s_axi_interconnect/M00_ARESETN] [get_bd_pins s_axi_interconnect/M01_ARESETN] [get_bd_pins s_axi_interconnect/S00_ARESETN]
  connect_bd_net -net usp_rf_data_converter_0_clk_dac1 [get_bd_pins aclk] [get_bd_pins axi_dma/m_axi_s2mm_aclk] [get_bd_pins axi_dma/s_axi_lite_aclk] [get_bd_pins data_inspector_module/clk] [get_bd_pins s_axi_interconnect/ACLK] [get_bd_pins s_axi_interconnect/M00_ACLK] [get_bd_pins s_axi_interconnect/M01_ACLK] [get_bd_pins s_axi_interconnect/S00_ACLK]

  # Restore current instance
  current_bd_instance $oldCurInst
}


# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  # Create instance: DataInspector
  create_hier_cell_DataInspector [current_bd_instance .] DataInspector

}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""