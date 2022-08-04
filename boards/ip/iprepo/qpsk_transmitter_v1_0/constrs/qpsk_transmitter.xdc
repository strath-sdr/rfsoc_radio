set rateCeqpsk_transmitter320 qpsk_transmitter_default_clock_driver/clockdriver_x1/pipelined_ce.ce_pipeline[1].ce_reg/latency_gt_0.fd_array[1].reg_comp/fd_prim_array[0].bit_is_0.fdre_comp
set rateCellsqpsk_transmitter320 [get_cells -of [filter [all_fanout -flat -endpoints [get_pins $rateCeqpsk_transmitter320/Q]] IS_ENABLE]]
set rateCeqpsk_transmitter1280 qpsk_transmitter_default_clock_driver/clockdriver_x0/pipelined_ce.ce_pipeline[1].ce_reg/latency_gt_0.fd_array[1].reg_comp/fd_prim_array[0].bit_is_0.fdre_comp
set rateCellsqpsk_transmitter1280 [get_cells -of [filter [all_fanout -flat -endpoints [get_pins $rateCeqpsk_transmitter1280/Q]] IS_ENABLE]]
set rateCeqpsk_transmitter5120 qpsk_transmitter_default_clock_driver/clockdriver/pipelined_ce.ce_pipeline[1].ce_reg/latency_gt_0.fd_array[1].reg_comp/fd_prim_array[0].bit_is_0.fdre_comp
set rateCellsqpsk_transmitter5120 [get_cells -of [filter [all_fanout -flat -endpoints [get_pins $rateCeqpsk_transmitter5120/Q]] IS_ENABLE]]
set_multicycle_path -from $rateCellsqpsk_transmitter320 -to $rateCellsqpsk_transmitter320 -setup 320
set_multicycle_path -from $rateCellsqpsk_transmitter320 -to $rateCellsqpsk_transmitter320 -hold 319
set_multicycle_path -from $rateCellsqpsk_transmitter320 -to $rateCellsqpsk_transmitter1280 -setup 320
set_multicycle_path -from $rateCellsqpsk_transmitter320 -to $rateCellsqpsk_transmitter1280 -hold 319
set_multicycle_path -from $rateCellsqpsk_transmitter320 -to $rateCellsqpsk_transmitter5120 -setup 320
set_multicycle_path -from $rateCellsqpsk_transmitter320 -to $rateCellsqpsk_transmitter5120 -hold 319
set_multicycle_path -from $rateCellsqpsk_transmitter1280 -to $rateCellsqpsk_transmitter320 -setup 320
set_multicycle_path -from $rateCellsqpsk_transmitter1280 -to $rateCellsqpsk_transmitter320 -hold 319
set_multicycle_path -from $rateCellsqpsk_transmitter1280 -to $rateCellsqpsk_transmitter1280 -setup 1280
set_multicycle_path -from $rateCellsqpsk_transmitter1280 -to $rateCellsqpsk_transmitter1280 -hold 1279
set_multicycle_path -from $rateCellsqpsk_transmitter1280 -to $rateCellsqpsk_transmitter5120 -setup 1280
set_multicycle_path -from $rateCellsqpsk_transmitter1280 -to $rateCellsqpsk_transmitter5120 -hold 1279
set_multicycle_path -from $rateCellsqpsk_transmitter5120 -to $rateCellsqpsk_transmitter320 -setup 320
set_multicycle_path -from $rateCellsqpsk_transmitter5120 -to $rateCellsqpsk_transmitter320 -hold 319
set_multicycle_path -from $rateCellsqpsk_transmitter5120 -to $rateCellsqpsk_transmitter1280 -setup 1280
set_multicycle_path -from $rateCellsqpsk_transmitter5120 -to $rateCellsqpsk_transmitter1280 -hold 1279
set_multicycle_path -from $rateCellsqpsk_transmitter5120 -to $rateCellsqpsk_transmitter5120 -setup 5120
set_multicycle_path -from $rateCellsqpsk_transmitter5120 -to $rateCellsqpsk_transmitter5120 -hold 5119
