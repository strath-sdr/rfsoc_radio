# Vivado 2019.1
# RFSoC BPSK Radio
# Copyright (c) 2020, David Northcote
# All rights reserved

set origin_dir "."
set iprepo_dir $origin_dir/../ip

create_project bpsk_radio $origin_dir/rfsoc_pynq -part xczu28dr-ffvg1517-2-e
set_property board_part xilinx.com:zcu111:part0:1.2 [current_project]
set_property  ip_repo_paths $iprepo_dir [current_project]
set_property target_language VHDL [current_project]
update_ip_catalog
source $origin_dir/block_design.tcl
make_wrapper -files [get_files $origin_dir/rfsoc_pynq/bpsk_radio.srcs/sources_1/bd/rfsoc_radio_bpsk/rfsoc_radio_bpsk.bd] -top
add_files -norecurse $origin_dir/rfsoc_pynq/bpsk_radio.srcs/sources_1/bd/rfsoc_radio_bpsk/hdl/rfsoc_radio_bpsk_wrapper.vhd
update_compile_order -fileset sources_1
#launch_runs impl_1 -to_step write_bitstream
#wait_on_run impl_1
#file copy -force $origin_dir/rfsoc_pynq/bpsk_radio.runs/impl_1/block_design_wrapper.bit $origin_dir/bpsk_radio/bitstream/bpsk_radio.bit
#file copy -force $origin_dir/rfsoc_pynq/bpsk_radio.srcs/sources_1/bd/block_design/hw_handoff/block_design.hwh $origin_dir/bpsk_radio/bitstream/bpsk_radio.hwh