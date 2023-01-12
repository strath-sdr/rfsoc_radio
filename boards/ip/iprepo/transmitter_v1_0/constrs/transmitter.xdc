set rateCetransmitter320 transmitter_default_clock_driver/clockdriver_x2/pipelined_ce.ce_pipeline[1].ce_reg/latency_gt_0.fd_array[1].reg_comp/fd_prim_array[0].bit_is_0.fdre_comp
set rateCellstransmitter320 [get_cells -of [filter [all_fanout -flat -endpoints [get_pins $rateCetransmitter320/Q]] IS_ENABLE]]
set rateCetransmitter1280 transmitter_default_clock_driver/clockdriver_x1/pipelined_ce.ce_pipeline[1].ce_reg/latency_gt_0.fd_array[1].reg_comp/fd_prim_array[0].bit_is_0.fdre_comp
set rateCellstransmitter1280 [get_cells -of [filter [all_fanout -flat -endpoints [get_pins $rateCetransmitter1280/Q]] IS_ENABLE]]
set rateCetransmitter5120 transmitter_default_clock_driver/clockdriver_x0/pipelined_ce.ce_pipeline[1].ce_reg/latency_gt_0.fd_array[1].reg_comp/fd_prim_array[0].bit_is_0.fdre_comp
set rateCellstransmitter5120 [get_cells -of [filter [all_fanout -flat -endpoints [get_pins $rateCetransmitter5120/Q]] IS_ENABLE]]
set rateCetransmitter10240 transmitter_default_clock_driver/clockdriver/pipelined_ce.ce_pipeline[1].ce_reg/latency_gt_0.fd_array[1].reg_comp/fd_prim_array[0].bit_is_0.fdre_comp
set rateCellstransmitter10240 [get_cells -of [filter [all_fanout -flat -endpoints [get_pins $rateCetransmitter10240/Q]] IS_ENABLE]]
set_multicycle_path -from $rateCellstransmitter320 -to $rateCellstransmitter320 -setup 320
set_multicycle_path -from $rateCellstransmitter320 -to $rateCellstransmitter320 -hold 319
set_multicycle_path -from $rateCellstransmitter320 -to $rateCellstransmitter1280 -setup 320
set_multicycle_path -from $rateCellstransmitter320 -to $rateCellstransmitter1280 -hold 319
set_multicycle_path -from $rateCellstransmitter320 -to $rateCellstransmitter5120 -setup 320
set_multicycle_path -from $rateCellstransmitter320 -to $rateCellstransmitter5120 -hold 319
set_multicycle_path -from $rateCellstransmitter320 -to $rateCellstransmitter10240 -setup 320
set_multicycle_path -from $rateCellstransmitter320 -to $rateCellstransmitter10240 -hold 319
set_multicycle_path -from $rateCellstransmitter1280 -to $rateCellstransmitter320 -setup 320
set_multicycle_path -from $rateCellstransmitter1280 -to $rateCellstransmitter320 -hold 319
set_multicycle_path -from $rateCellstransmitter1280 -to $rateCellstransmitter1280 -setup 1280
set_multicycle_path -from $rateCellstransmitter1280 -to $rateCellstransmitter1280 -hold 1279
set_multicycle_path -from $rateCellstransmitter1280 -to $rateCellstransmitter5120 -setup 1280
set_multicycle_path -from $rateCellstransmitter1280 -to $rateCellstransmitter5120 -hold 1279
set_multicycle_path -from $rateCellstransmitter1280 -to $rateCellstransmitter10240 -setup 1280
set_multicycle_path -from $rateCellstransmitter1280 -to $rateCellstransmitter10240 -hold 1279
set_multicycle_path -from $rateCellstransmitter5120 -to $rateCellstransmitter320 -setup 320
set_multicycle_path -from $rateCellstransmitter5120 -to $rateCellstransmitter320 -hold 319
set_multicycle_path -from $rateCellstransmitter5120 -to $rateCellstransmitter1280 -setup 1280
set_multicycle_path -from $rateCellstransmitter5120 -to $rateCellstransmitter1280 -hold 1279
set_multicycle_path -from $rateCellstransmitter5120 -to $rateCellstransmitter5120 -setup 5120
set_multicycle_path -from $rateCellstransmitter5120 -to $rateCellstransmitter5120 -hold 5119
set_multicycle_path -from $rateCellstransmitter5120 -to $rateCellstransmitter10240 -setup 5120
set_multicycle_path -from $rateCellstransmitter5120 -to $rateCellstransmitter10240 -hold 5119
set_multicycle_path -from $rateCellstransmitter10240 -to $rateCellstransmitter320 -setup 320
set_multicycle_path -from $rateCellstransmitter10240 -to $rateCellstransmitter320 -hold 319
set_multicycle_path -from $rateCellstransmitter10240 -to $rateCellstransmitter1280 -setup 1280
set_multicycle_path -from $rateCellstransmitter10240 -to $rateCellstransmitter1280 -hold 1279
set_multicycle_path -from $rateCellstransmitter10240 -to $rateCellstransmitter5120 -setup 5120
set_multicycle_path -from $rateCellstransmitter10240 -to $rateCellstransmitter5120 -hold 5119
set_multicycle_path -from $rateCellstransmitter10240 -to $rateCellstransmitter10240 -setup 10240
set_multicycle_path -from $rateCellstransmitter10240 -to $rateCellstransmitter10240 -hold 10239
