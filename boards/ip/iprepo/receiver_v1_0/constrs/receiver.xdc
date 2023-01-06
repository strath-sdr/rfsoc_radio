set rateCereceiver5 receiver_default_clock_driver/clockdriver_x0/pipelined_ce.ce_pipeline[1].ce_reg/latency_gt_0.fd_array[1].reg_comp/fd_prim_array[0].bit_is_0.fdre_comp
set rateCellsreceiver5 [get_cells -of [filter [all_fanout -flat -endpoints [get_pins $rateCereceiver5/Q]] IS_ENABLE]]
set rateCereceiver20 receiver_default_clock_driver/clockdriver/pipelined_ce.ce_pipeline[1].ce_reg/latency_gt_0.fd_array[1].reg_comp/fd_prim_array[0].bit_is_0.fdre_comp
set rateCellsreceiver20 [get_cells -of [filter [all_fanout -flat -endpoints [get_pins $rateCereceiver20/Q]] IS_ENABLE]]
set_multicycle_path -from $rateCellsreceiver5 -to $rateCellsreceiver5 -setup 5
set_multicycle_path -from $rateCellsreceiver5 -to $rateCellsreceiver5 -hold 4
set_multicycle_path -from $rateCellsreceiver5 -to $rateCellsreceiver20 -setup 5
set_multicycle_path -from $rateCellsreceiver5 -to $rateCellsreceiver20 -hold 4
set_multicycle_path -from $rateCellsreceiver20 -to $rateCellsreceiver5 -setup 5
set_multicycle_path -from $rateCellsreceiver20 -to $rateCellsreceiver5 -hold 4
set_multicycle_path -from $rateCellsreceiver20 -to $rateCellsreceiver20 -setup 20
set_multicycle_path -from $rateCellsreceiver20 -to $rateCellsreceiver20 -hold 19
