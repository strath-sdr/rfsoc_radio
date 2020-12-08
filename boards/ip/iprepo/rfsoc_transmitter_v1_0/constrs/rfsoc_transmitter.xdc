set rateCerfsoc_transmitter320 rfsoc_transmitter_default_clock_driver/clockdriver_x1/pipelined_ce.ce_pipeline[1].ce_reg/latency_gt_0.fd_array[1].reg_comp/fd_prim_array[0].bit_is_0.fdre_comp
set rateCellsrfsoc_transmitter320 [get_cells -of [filter [all_fanout -flat -endpoints [get_pins $rateCerfsoc_transmitter320/Q]] IS_ENABLE]]
set rateCerfsoc_transmitter1280 rfsoc_transmitter_default_clock_driver/clockdriver_x0/pipelined_ce.ce_pipeline[1].ce_reg/latency_gt_0.fd_array[1].reg_comp/fd_prim_array[0].bit_is_0.fdre_comp
set rateCellsrfsoc_transmitter1280 [get_cells -of [filter [all_fanout -flat -endpoints [get_pins $rateCerfsoc_transmitter1280/Q]] IS_ENABLE]]
set rateCerfsoc_transmitter10240 rfsoc_transmitter_default_clock_driver/clockdriver/pipelined_ce.ce_pipeline[1].ce_reg/latency_gt_0.fd_array[1].reg_comp/fd_prim_array[0].bit_is_0.fdre_comp
set rateCellsrfsoc_transmitter10240 [get_cells -of [filter [all_fanout -flat -endpoints [get_pins $rateCerfsoc_transmitter10240/Q]] IS_ENABLE]]
set_multicycle_path -from $rateCellsrfsoc_transmitter320 -to $rateCellsrfsoc_transmitter320 -setup 320
set_multicycle_path -from $rateCellsrfsoc_transmitter320 -to $rateCellsrfsoc_transmitter320 -hold 319
set_multicycle_path -from $rateCellsrfsoc_transmitter320 -to $rateCellsrfsoc_transmitter1280 -setup 320
set_multicycle_path -from $rateCellsrfsoc_transmitter320 -to $rateCellsrfsoc_transmitter1280 -hold 319
set_multicycle_path -from $rateCellsrfsoc_transmitter320 -to $rateCellsrfsoc_transmitter10240 -setup 320
set_multicycle_path -from $rateCellsrfsoc_transmitter320 -to $rateCellsrfsoc_transmitter10240 -hold 319
set_multicycle_path -from $rateCellsrfsoc_transmitter1280 -to $rateCellsrfsoc_transmitter320 -setup 320
set_multicycle_path -from $rateCellsrfsoc_transmitter1280 -to $rateCellsrfsoc_transmitter320 -hold 319
set_multicycle_path -from $rateCellsrfsoc_transmitter1280 -to $rateCellsrfsoc_transmitter1280 -setup 1280
set_multicycle_path -from $rateCellsrfsoc_transmitter1280 -to $rateCellsrfsoc_transmitter1280 -hold 1279
set_multicycle_path -from $rateCellsrfsoc_transmitter1280 -to $rateCellsrfsoc_transmitter10240 -setup 1280
set_multicycle_path -from $rateCellsrfsoc_transmitter1280 -to $rateCellsrfsoc_transmitter10240 -hold 1279
set_multicycle_path -from $rateCellsrfsoc_transmitter10240 -to $rateCellsrfsoc_transmitter320 -setup 320
set_multicycle_path -from $rateCellsrfsoc_transmitter10240 -to $rateCellsrfsoc_transmitter320 -hold 319
set_multicycle_path -from $rateCellsrfsoc_transmitter10240 -to $rateCellsrfsoc_transmitter1280 -setup 1280
set_multicycle_path -from $rateCellsrfsoc_transmitter10240 -to $rateCellsrfsoc_transmitter1280 -hold 1279
set_multicycle_path -from $rateCellsrfsoc_transmitter10240 -to $rateCellsrfsoc_transmitter10240 -setup 10240
set_multicycle_path -from $rateCellsrfsoc_transmitter10240 -to $rateCellsrfsoc_transmitter10240 -hold 10239
