set rateCeqpsk_receiver5 qpsk_receiver_default_clock_driver/clockdriver_x0/pipelined_ce.ce_pipeline[1].ce_reg/latency_gt_0.fd_array[1].reg_comp/fd_prim_array[0].bit_is_0.fdre_comp
set rateCellsqpsk_receiver5 [get_cells -of [filter [all_fanout -flat -endpoints [get_pins $rateCeqpsk_receiver5/Q]] IS_ENABLE]]
set rateCeqpsk_receiver20 qpsk_receiver_default_clock_driver/clockdriver/pipelined_ce.ce_pipeline[1].ce_reg/latency_gt_0.fd_array[1].reg_comp/fd_prim_array[0].bit_is_0.fdre_comp
set rateCellsqpsk_receiver20 [get_cells -of [filter [all_fanout -flat -endpoints [get_pins $rateCeqpsk_receiver20/Q]] IS_ENABLE]]
set_multicycle_path -from $rateCellsqpsk_receiver5 -to $rateCellsqpsk_receiver5 -setup 5
set_multicycle_path -from $rateCellsqpsk_receiver5 -to $rateCellsqpsk_receiver5 -hold 4
set_multicycle_path -from $rateCellsqpsk_receiver5 -to $rateCellsqpsk_receiver20 -setup 5
set_multicycle_path -from $rateCellsqpsk_receiver5 -to $rateCellsqpsk_receiver20 -hold 4
set_multicycle_path -from $rateCellsqpsk_receiver20 -to $rateCellsqpsk_receiver5 -setup 5
set_multicycle_path -from $rateCellsqpsk_receiver20 -to $rateCellsqpsk_receiver5 -hold 4
set_multicycle_path -from $rateCellsqpsk_receiver20 -to $rateCellsqpsk_receiver20 -setup 20
set_multicycle_path -from $rateCellsqpsk_receiver20 -to $rateCellsqpsk_receiver20 -hold 19
