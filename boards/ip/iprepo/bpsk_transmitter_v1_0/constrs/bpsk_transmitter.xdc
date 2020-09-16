set rateCebpsk_transmitter320 bpsk_transmitter_default_clock_driver/clockdriver_x1/pipelined_ce.ce_pipeline[1].ce_reg/latency_gt_0.fd_array[1].reg_comp/fd_prim_array[0].bit_is_0.fdre_comp
set rateCellsbpsk_transmitter320 [get_cells -of [filter [all_fanout -flat -endpoints [get_pins $rateCebpsk_transmitter320/Q]] IS_ENABLE]]
set rateCebpsk_transmitter1280 bpsk_transmitter_default_clock_driver/clockdriver_x0/pipelined_ce.ce_pipeline[1].ce_reg/latency_gt_0.fd_array[1].reg_comp/fd_prim_array[0].bit_is_0.fdre_comp
set rateCellsbpsk_transmitter1280 [get_cells -of [filter [all_fanout -flat -endpoints [get_pins $rateCebpsk_transmitter1280/Q]] IS_ENABLE]]
set rateCebpsk_transmitter10240 bpsk_transmitter_default_clock_driver/clockdriver/pipelined_ce.ce_pipeline[1].ce_reg/latency_gt_0.fd_array[1].reg_comp/fd_prim_array[0].bit_is_0.fdre_comp
set rateCellsbpsk_transmitter10240 [get_cells -of [filter [all_fanout -flat -endpoints [get_pins $rateCebpsk_transmitter10240/Q]] IS_ENABLE]]
set_multicycle_path -from $rateCellsbpsk_transmitter320 -to $rateCellsbpsk_transmitter320 -setup 320
set_multicycle_path -from $rateCellsbpsk_transmitter320 -to $rateCellsbpsk_transmitter320 -hold 319
set_multicycle_path -from $rateCellsbpsk_transmitter320 -to $rateCellsbpsk_transmitter1280 -setup 320
set_multicycle_path -from $rateCellsbpsk_transmitter320 -to $rateCellsbpsk_transmitter1280 -hold 319
set_multicycle_path -from $rateCellsbpsk_transmitter320 -to $rateCellsbpsk_transmitter10240 -setup 320
set_multicycle_path -from $rateCellsbpsk_transmitter320 -to $rateCellsbpsk_transmitter10240 -hold 319
set_multicycle_path -from $rateCellsbpsk_transmitter1280 -to $rateCellsbpsk_transmitter320 -setup 320
set_multicycle_path -from $rateCellsbpsk_transmitter1280 -to $rateCellsbpsk_transmitter320 -hold 319
set_multicycle_path -from $rateCellsbpsk_transmitter1280 -to $rateCellsbpsk_transmitter1280 -setup 1280
set_multicycle_path -from $rateCellsbpsk_transmitter1280 -to $rateCellsbpsk_transmitter1280 -hold 1279
set_multicycle_path -from $rateCellsbpsk_transmitter1280 -to $rateCellsbpsk_transmitter10240 -setup 1280
set_multicycle_path -from $rateCellsbpsk_transmitter1280 -to $rateCellsbpsk_transmitter10240 -hold 1279
set_multicycle_path -from $rateCellsbpsk_transmitter10240 -to $rateCellsbpsk_transmitter320 -setup 320
set_multicycle_path -from $rateCellsbpsk_transmitter10240 -to $rateCellsbpsk_transmitter320 -hold 319
set_multicycle_path -from $rateCellsbpsk_transmitter10240 -to $rateCellsbpsk_transmitter1280 -setup 1280
set_multicycle_path -from $rateCellsbpsk_transmitter10240 -to $rateCellsbpsk_transmitter1280 -hold 1279
set_multicycle_path -from $rateCellsbpsk_transmitter10240 -to $rateCellsbpsk_transmitter10240 -setup 10240
set_multicycle_path -from $rateCellsbpsk_transmitter10240 -to $rateCellsbpsk_transmitter10240 -hold 10239
