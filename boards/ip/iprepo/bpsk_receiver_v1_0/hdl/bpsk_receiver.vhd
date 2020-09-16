-- Generated from Simulink block bpsk_receiver/AXI-Stream Master Interface/Rising Edge Detector Enable
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity bpsk_receiver_rising_edge_detector_enable is
  port (
    input : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    output : out std_logic_vector( 1-1 downto 0 )
  );
end bpsk_receiver_rising_edge_detector_enable;
architecture structural of bpsk_receiver_rising_edge_detector_enable is 
  signal clk_net : std_logic;
  signal enable_transfer_net : std_logic_vector( 1-1 downto 0 );
  signal logical3_y_net : std_logic_vector( 1-1 downto 0 );
  signal register1_q_net : std_logic_vector( 1-1 downto 0 );
  signal ce_net : std_logic;
  signal inverter2_op_net : std_logic_vector( 1-1 downto 0 );
begin
  output <= logical3_y_net;
  enable_transfer_net <= input;
  clk_net <= clk_1;
  ce_net <= ce_1;
  inverter2 : entity xil_defaultlib.sysgen_inverter_8255e2898d 
  port map (
    clr => '0',
    ip => enable_transfer_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter2_op_net
  );
  logical3 : entity xil_defaultlib.sysgen_logical_4fdeb13a07 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => register1_q_net,
    d1 => enable_transfer_net,
    y => logical3_y_net
  );
  register1 : entity xil_defaultlib.bpsk_receiver_xlregister 
  generic map (
    d_width => 1,
    init_value => b"0"
  )
  port map (
    en => "1",
    rst => "0",
    d => inverter2_op_net,
    clk => clk_net,
    ce => ce_net,
    q => register1_q_net
  );
end structural;
-- Generated from Simulink block bpsk_receiver/AXI-Stream Master Interface/Rising Edge Detector Last
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity bpsk_receiver_rising_edge_detector_last is
  port (
    input : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    output : out std_logic_vector( 1-1 downto 0 )
  );
end bpsk_receiver_rising_edge_detector_last;
architecture structural of bpsk_receiver_rising_edge_detector_last is 
  signal logical3_y_net : std_logic_vector( 1-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal register1_q_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal inverter2_op_net : std_logic_vector( 1-1 downto 0 );
  signal ce_net : std_logic;
begin
  output <= logical3_y_net;
  slice_y_net <= input;
  clk_net <= clk_1;
  ce_net <= ce_1;
  inverter2 : entity xil_defaultlib.sysgen_inverter_8255e2898d 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter2_op_net
  );
  logical3 : entity xil_defaultlib.sysgen_logical_4fdeb13a07 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => register1_q_net,
    d1 => slice_y_net,
    y => logical3_y_net
  );
  register1 : entity xil_defaultlib.bpsk_receiver_xlregister 
  generic map (
    d_width => 1,
    init_value => b"0"
  )
  port map (
    en => "1",
    rst => "0",
    d => inverter2_op_net,
    clk => clk_net,
    ce => ce_net,
    q => register1_q_net
  );
end structural;
-- Generated from Simulink block bpsk_receiver/AXI-Stream Master Interface
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity bpsk_receiver_axi_stream_master_interface is
  port (
    enable : in std_logic_vector( 1-1 downto 0 );
    reset : in std_logic_vector( 1-1 downto 0 );
    valid_in : in std_logic_vector( 1-1 downto 0 );
    data_in : in std_logic_vector( 8-1 downto 0 );
    last_in : in std_logic_vector( 1-1 downto 0 );
    size_in : in std_logic_vector( 8-1 downto 0 );
    m_axis_tready : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    clk_20 : in std_logic;
    ce_20 : in std_logic;
    count : out std_logic_vector( 12-1 downto 0 );
    size_out : out std_logic_vector( 8-1 downto 0 );
    irq : out std_logic_vector( 1-1 downto 0 );
    m_axis_tdata : out std_logic_vector( 8-1 downto 0 );
    m_axis_tlast : out std_logic_vector( 1-1 downto 0 );
    m_axis_tvalid : out std_logic_vector( 1-1 downto 0 )
  );
end bpsk_receiver_axi_stream_master_interface;
architecture structural of bpsk_receiver_axi_stream_master_interface is 
  signal fifo_dout_net : std_logic_vector( 9-1 downto 0 );
  signal logical_y_net : std_logic;
  signal fifo_empty_net : std_logic;
  signal logical3_y_net : std_logic;
  signal fifo_full_net : std_logic;
  signal logical5_y_net : std_logic;
  signal fifo1_full_net : std_logic;
  signal fifo1_dcount_net : std_logic_vector( 13-1 downto 0 );
  signal fifo1_dout_net : std_logic_vector( 8-1 downto 0 );
  signal inverter1_op_net : std_logic_vector( 1-1 downto 0 );
  signal up_sample3_q_net : std_logic_vector( 8-1 downto 0 );
  signal inverter2_op_net : std_logic_vector( 1-1 downto 0 );
  signal fifo1_empty_net : std_logic;
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal relational_op_net : std_logic_vector( 1-1 downto 0 );
  signal up_sample2_q_net : std_logic_vector( 1-1 downto 0 );
  signal logical1_y_net : std_logic_vector( 1-1 downto 0 );
  signal logical2_y_net : std_logic_vector( 1-1 downto 0 );
  signal mux_y_net : std_logic_vector( 1-1 downto 0 );
  signal logical4_y_net : std_logic_vector( 1-1 downto 0 );
  signal register1_q_net : std_logic_vector( 1-1 downto 0 );
  signal register_q_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal src_clk_net : std_logic;
  signal logical3_y_net_x0 : std_logic_vector( 1-1 downto 0 );
  signal logical3_y_net_x1 : std_logic_vector( 1-1 downto 0 );
  signal src_ce_net : std_logic;
  signal concat_y_net : std_logic_vector( 9-1 downto 0 );
  signal up_sample4_q_net : std_logic_vector( 8-1 downto 0 );
  signal constant_op_net : std_logic_vector( 1-1 downto 0 );
  signal up_sample1_q_net : std_logic_vector( 1-1 downto 0 );
  signal constant1_op_net : std_logic_vector( 1-1 downto 0 );
  signal constant2_op_net : std_logic_vector( 8-1 downto 0 );
  signal mux1_y_net : std_logic_vector( 8-1 downto 0 );
  signal enable_transfer_net : std_logic_vector( 1-1 downto 0 );
  signal reset_frame_sync_net : std_logic_vector( 1-1 downto 0 );
  signal register5_q_net : std_logic_vector( 8-1 downto 0 );
  signal logical2_y_net_x0 : std_logic_vector( 1-1 downto 0 );
  signal fifo_dcount_net : std_logic_vector( 12-1 downto 0 );
  signal register3_q_net : std_logic_vector( 1-1 downto 0 );
  signal inverter3_op_net : std_logic_vector( 1-1 downto 0 );
  signal register6_q_net : std_logic_vector( 8-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 8-1 downto 0 );
  signal m_axis_tready_net : std_logic_vector( 1-1 downto 0 );
begin
  count <= fifo_dcount_net;
  size_out <= mux1_y_net;
  enable_transfer_net <= enable;
  reset_frame_sync_net <= reset;
  register3_q_net <= valid_in;
  register5_q_net <= data_in;
  logical2_y_net_x0 <= last_in;
  register6_q_net <= size_in;
  irq <= inverter3_op_net;
  m_axis_tdata <= slice1_y_net;
  m_axis_tlast <= slice_y_net;
  m_axis_tready_net <= m_axis_tready;
  m_axis_tvalid <= register_q_net;
  clk_net <= clk_1;
  ce_net <= ce_1;
  src_clk_net <= clk_20;
  src_ce_net <= ce_20;
  rising_edge_detector_enable : entity xil_defaultlib.bpsk_receiver_rising_edge_detector_enable 
  port map (
    input => enable_transfer_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    output => logical3_y_net_x0
  );
  rising_edge_detector_last : entity xil_defaultlib.bpsk_receiver_rising_edge_detector_last 
  port map (
    input => slice_y_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    output => logical3_y_net_x1
  );
  concat : entity xil_defaultlib.sysgen_concat_f0be93a506 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    in0 => up_sample4_q_net,
    in1 => up_sample1_q_net,
    y => concat_y_net
  );
  constant_x0 : entity xil_defaultlib.sysgen_constant_68b1d293da 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  constant1 : entity xil_defaultlib.sysgen_constant_fa24cb9652 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant1_op_net
  );
  constant2 : entity xil_defaultlib.sysgen_constant_acf1ac3a86 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant2_op_net
  );
  fifo : entity xil_defaultlib.bpsk_receiver_xlfifogen_u 
  generic map (
    core_name0 => "bpsk_receiver_fifo_generator_i0",
    data_count_width => 12,
    data_width => 9,
    extra_registers => 1,
    has_ae => 0,
    has_af => 0,
    has_rst => true,
    percent_full_width => 1
  )
  port map (
    en => '1',
    din => concat_y_net,
    we => logical_y_net,
    re => logical3_y_net,
    rst => reset_frame_sync_net(0),
    clk => clk_net,
    ce => ce_net,
    we_ce => ce_net,
    re_ce => ce_net,
    dout => fifo_dout_net,
    empty => fifo_empty_net,
    full => fifo_full_net,
    dcount => fifo_dcount_net
  );
  fifo1 : entity xil_defaultlib.bpsk_receiver_xlfifogen_u 
  generic map (
    core_name0 => "bpsk_receiver_fifo_generator_i1",
    data_count_width => 13,
    data_width => 8,
    extra_registers => 1,
    has_ae => 0,
    has_af => 0,
    has_rst => true,
    percent_full_width => 1
  )
  port map (
    en => '1',
    din => up_sample3_q_net,
    we => logical5_y_net,
    re => logical3_y_net_x1(0),
    rst => reset_frame_sync_net(0),
    clk => clk_net,
    ce => ce_net,
    we_ce => ce_net,
    re_ce => ce_net,
    dout => fifo1_dout_net,
    empty => fifo1_empty_net,
    full => fifo1_full_net,
    dcount => fifo1_dcount_net
  );
  inverter : entity xil_defaultlib.sysgen_inverter_8255e2898d 
  port map (
    clr => '0',
    ip(0) => fifo_full_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  inverter1 : entity xil_defaultlib.sysgen_inverter_8255e2898d 
  port map (
    clr => '0',
    ip(0) => fifo_empty_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter1_op_net
  );
  inverter2 : entity xil_defaultlib.sysgen_inverter_8255e2898d 
  port map (
    clr => '0',
    ip => logical3_y_net_x1,
    clk => clk_net,
    ce => ce_net,
    op => inverter2_op_net
  );
  inverter3 : entity xil_defaultlib.sysgen_inverter_8255e2898d 
  port map (
    clr => '0',
    ip => relational_op_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter3_op_net
  );
  logical : entity xil_defaultlib.sysgen_logical_4fdeb13a07 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => up_sample2_q_net,
    d1 => inverter_op_net,
    y(0) => logical_y_net
  );
  logical1 : entity xil_defaultlib.sysgen_logical_4fdeb13a07 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => m_axis_tready_net,
    d1 => inverter1_op_net,
    y => logical1_y_net
  );
  logical2 : entity xil_defaultlib.sysgen_logical_4fdeb13a07 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => mux_y_net,
    d1 => logical1_y_net,
    y => logical2_y_net
  );
  logical3 : entity xil_defaultlib.sysgen_logical_4fdeb13a07 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => logical2_y_net,
    d1 => inverter2_op_net,
    y(0) => logical3_y_net
  );
  logical4 : entity xil_defaultlib.sysgen_logical_47bfa502e0 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => logical3_y_net_x1,
    d1 => reset_frame_sync_net,
    y => logical4_y_net
  );
  logical5 : entity xil_defaultlib.sysgen_logical_4fdeb13a07 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0(0) => logical_y_net,
    d1 => up_sample1_q_net,
    y(0) => logical5_y_net
  );
  mux : entity xil_defaultlib.sysgen_mux_f17f497173 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => logical3_y_net_x0,
    d0 => register1_q_net,
    d1 => constant_op_net,
    y => mux_y_net
  );
  mux1 : entity xil_defaultlib.sysgen_mux_0755cd59e5 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => relational_op_net,
    d0 => fifo1_dout_net,
    d1 => constant2_op_net,
    y => mux1_y_net
  );
  register_x0 : entity xil_defaultlib.bpsk_receiver_xlregister 
  generic map (
    d_width => 1,
    init_value => b"0"
  )
  port map (
    en => "1",
    rst => "0",
    d(0) => logical3_y_net,
    clk => clk_net,
    ce => ce_net,
    q => register_q_net
  );
  register1 : entity xil_defaultlib.bpsk_receiver_xlregister 
  generic map (
    d_width => 1,
    init_value => b"0"
  )
  port map (
    en => "1",
    d => mux_y_net,
    rst => logical4_y_net,
    clk => clk_net,
    ce => ce_net,
    q => register1_q_net
  );
  relational : entity xil_defaultlib.sysgen_relational_c1f46b64b6 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    a => constant1_op_net,
    b => fifo1_dcount_net,
    op => relational_op_net
  );
  slice : entity xil_defaultlib.bpsk_receiver_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 0,
    x_width => 9,
    y_width => 1
  )
  port map (
    x => fifo_dout_net,
    y => slice_y_net
  );
  slice1 : entity xil_defaultlib.bpsk_receiver_xlslice 
  generic map (
    new_lsb => 1,
    new_msb => 8,
    x_width => 9,
    y_width => 8
  )
  port map (
    x => fifo_dout_net,
    y => slice1_y_net
  );
  up_sample1 : entity xil_defaultlib.bpsk_receiver_xlusamp 
  generic map (
    copy_samples => 0,
    d_arith => xlUnsigned,
    d_bin_pt => 0,
    d_width => 1,
    latency => 1,
    q_arith => xlUnsigned,
    q_bin_pt => 0,
    q_width => 1
  )
  port map (
    src_clr => '0',
    dest_clr => '0',
    en => "1",
    d => logical2_y_net_x0,
    src_clk => src_clk_net,
    src_ce => src_ce_net,
    dest_clk => clk_net,
    dest_ce => ce_net,
    q => up_sample1_q_net
  );
  up_sample2 : entity xil_defaultlib.bpsk_receiver_xlusamp 
  generic map (
    copy_samples => 0,
    d_arith => xlUnsigned,
    d_bin_pt => 0,
    d_width => 1,
    latency => 1,
    q_arith => xlUnsigned,
    q_bin_pt => 0,
    q_width => 1
  )
  port map (
    src_clr => '0',
    dest_clr => '0',
    en => "1",
    d => register3_q_net,
    src_clk => src_clk_net,
    src_ce => src_ce_net,
    dest_clk => clk_net,
    dest_ce => ce_net,
    q => up_sample2_q_net
  );
  up_sample3 : entity xil_defaultlib.bpsk_receiver_xlusamp 
  generic map (
    copy_samples => 0,
    d_arith => xlUnsigned,
    d_bin_pt => 0,
    d_width => 8,
    latency => 1,
    q_arith => xlUnsigned,
    q_bin_pt => 0,
    q_width => 8
  )
  port map (
    src_clr => '0',
    dest_clr => '0',
    en => "1",
    d => register6_q_net,
    src_clk => src_clk_net,
    src_ce => src_ce_net,
    dest_clk => clk_net,
    dest_ce => ce_net,
    q => up_sample3_q_net
  );
  up_sample4 : entity xil_defaultlib.bpsk_receiver_xlusamp 
  generic map (
    copy_samples => 0,
    d_arith => xlUnsigned,
    d_bin_pt => 0,
    d_width => 8,
    latency => 1,
    q_arith => xlUnsigned,
    q_bin_pt => 0,
    q_width => 8
  )
  port map (
    src_clr => '0',
    dest_clr => '0',
    en => "1",
    d => register5_q_net,
    src_clk => src_clk_net,
    src_ce => src_ce_net,
    dest_clk => clk_net,
    dest_ce => ce_net,
    q => up_sample4_q_net
  );
end structural;
-- Generated from Simulink block bpsk_receiver/CIC Decimator
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity bpsk_receiver_cic_decimator is
  port (
    real_in : in std_logic_vector( 16-1 downto 0 );
    imag_in : in std_logic_vector( 16-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    clk_5 : in std_logic;
    ce_5 : in std_logic;
    valid_out : out std_logic;
    real_out : out std_logic_vector( 16-1 downto 0 );
    imag_out : out std_logic_vector( 16-1 downto 0 )
  );
end bpsk_receiver_cic_decimator;
architecture structural of bpsk_receiver_cic_decimator is 
  signal cmult1_p_net : std_logic_vector( 16-1 downto 0 );
  signal cic_decimator_real_m_axis_data_tvalid_net : std_logic;
  signal cmult2_p_net : std_logic_vector( 16-1 downto 0 );
  signal cic_decimator_real_m_axis_data_tdata_real_net : std_logic_vector( 23-1 downto 0 );
  signal convert1_dout_net : std_logic_vector( 16-1 downto 0 );
  signal cic_decimator_imag_s_axis_data_tready_net : std_logic;
  signal ce_5_net : std_logic;
  signal ce_net : std_logic;
  signal clk_net : std_logic;
  signal cic_decimator_real_s_axis_data_tready_net : std_logic;
  signal clk_5_net : std_logic;
  signal convert_dout_net : std_logic_vector( 16-1 downto 0 );
  signal cic_decimator_imag_m_axis_data_tvalid_net : std_logic;
  signal cic_decimator_imag_m_axis_data_tdata_real_net : std_logic_vector( 23-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 23-1 downto 0 );
  signal shift2_op_net : std_logic_vector( 23-1 downto 0 );
begin
  valid_out <= cic_decimator_real_m_axis_data_tvalid_net;
  real_out <= cmult2_p_net;
  imag_out <= cmult1_p_net;
  convert_dout_net <= real_in;
  convert1_dout_net <= imag_in;
  clk_net <= clk_1;
  ce_net <= ce_1;
  clk_5_net <= clk_5;
  ce_5_net <= ce_5;
  cic_decimator_imag : entity xil_defaultlib.xlcic_compiler_18f16c88f5f633bb71e8b8e0d805f419 
  port map (
    s_axis_data_tdata_real => convert1_dout_net,
    clk => clk_net,
    ce => ce_net,
    clk_5 => clk_5_net,
    ce_5 => ce_5_net,
    clk_logic_1 => clk_net,
    ce_logic_1 => ce_net,
    s_axis_data_tready => cic_decimator_imag_s_axis_data_tready_net,
    m_axis_data_tvalid => cic_decimator_imag_m_axis_data_tvalid_net,
    m_axis_data_tdata_real => cic_decimator_imag_m_axis_data_tdata_real_net
  );
  cic_decimator_real : entity xil_defaultlib.xlcic_compiler_18f16c88f5f633bb71e8b8e0d805f419 
  port map (
    s_axis_data_tdata_real => convert_dout_net,
    clk => clk_net,
    ce => ce_net,
    clk_5 => clk_5_net,
    ce_5 => ce_5_net,
    clk_logic_1 => clk_net,
    ce_logic_1 => ce_net,
    s_axis_data_tready => cic_decimator_real_s_axis_data_tready_net,
    m_axis_data_tvalid => cic_decimator_real_m_axis_data_tvalid_net,
    m_axis_data_tdata_real => cic_decimator_real_m_axis_data_tdata_real_net
  );
  cmult1 : entity xil_defaultlib.bpsk_receiver_xlcmult 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 21,
    a_width => 23,
    b_bin_pt => 14,
    c_a_type => 0,
    c_a_width => 23,
    c_b_type => 1,
    c_b_width => 16,
    c_output_width => 39,
    core_name0 => "bpsk_receiver_mult_gen_v12_0_i0",
    extra_registers => 0,
    multsign => 2,
    overflow => 1,
    p_arith => xlSigned,
    p_bin_pt => 14,
    p_width => 16,
    quantization => 1,
    zero_const => 0
  )
  port map (
    clr => '0',
    core_clr => '1',
    en => "1",
    rst => "0",
    a => shift1_op_net,
    clk => clk_5_net,
    ce => ce_5_net,
    core_clk => clk_5_net,
    core_ce => ce_5_net,
    p => cmult1_p_net
  );
  cmult2 : entity xil_defaultlib.bpsk_receiver_xlcmult 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 21,
    a_width => 23,
    b_bin_pt => 14,
    c_a_type => 0,
    c_a_width => 23,
    c_b_type => 1,
    c_b_width => 16,
    c_output_width => 39,
    core_name0 => "bpsk_receiver_mult_gen_v12_0_i0",
    extra_registers => 0,
    multsign => 2,
    overflow => 1,
    p_arith => xlSigned,
    p_bin_pt => 14,
    p_width => 16,
    quantization => 1,
    zero_const => 0
  )
  port map (
    clr => '0',
    core_clr => '1',
    en => "1",
    rst => "0",
    a => shift2_op_net,
    clk => clk_5_net,
    ce => ce_5_net,
    core_clk => clk_5_net,
    core_ce => ce_5_net,
    p => cmult2_p_net
  );
  shift1 : entity xil_defaultlib.sysgen_shift_f662209704 
  port map (
    clr => '0',
    ip => cic_decimator_imag_m_axis_data_tdata_real_net,
    clk => clk_5_net,
    ce => ce_5_net,
    op => shift1_op_net
  );
  shift2 : entity xil_defaultlib.sysgen_shift_f662209704 
  port map (
    clr => '0',
    ip => cic_decimator_real_m_axis_data_tdata_real_net,
    clk => clk_5_net,
    ce => ce_5_net,
    op => shift2_op_net
  );
end structural;
-- Generated from Simulink block bpsk_receiver/Carrier Synchronisation/De-Rotate Constellation
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity bpsk_receiver_de_rotate_constellation is
  port (
    imag_in : in std_logic_vector( 16-1 downto 0 );
    real_in : in std_logic_vector( 16-1 downto 0 );
    valid_in : in std_logic_vector( 1-1 downto 0 );
    imag_error : in std_logic_vector( 16-1 downto 0 );
    real_error : in std_logic_vector( 16-1 downto 0 );
    valid_error : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    clk_20 : in std_logic;
    ce_20 : in std_logic;
    imag_out : out std_logic_vector( 33-1 downto 0 );
    real_out : out std_logic_vector( 33-1 downto 0 );
    valid_out : out std_logic_vector( 1-1 downto 0 )
  );
end bpsk_receiver_de_rotate_constellation;
architecture structural of bpsk_receiver_de_rotate_constellation is 
  signal register1_q_net : std_logic_vector( 33-1 downto 0 );
  signal register_q_net : std_logic_vector( 33-1 downto 0 );
  signal register4_q_net : std_logic_vector( 1-1 downto 0 );
  signal delay2_q_net : std_logic_vector( 16-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 16-1 downto 0 );
  signal delay3_q_net : std_logic_vector( 1-1 downto 0 );
  signal neg_sin_rom_data_net : std_logic_vector( 16-1 downto 0 );
  signal cos_rom_data_net : std_logic_vector( 16-1 downto 0 );
  signal register_q_net_x0 : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal src_clk_net : std_logic;
  signal src_ce_net : std_logic;
  signal delay_q_net : std_logic_vector( 1-1 downto 0 );
  signal product_p_re_net : std_logic_vector( 33-1 downto 0 );
  signal product_p_im_net : std_logic_vector( 33-1 downto 0 );
  signal register7_q_net : std_logic_vector( 1-1 downto 0 );
  signal register2_q_net : std_logic_vector( 16-1 downto 0 );
  signal register3_q_net : std_logic_vector( 16-1 downto 0 );
  signal register6_q_net : std_logic_vector( 16-1 downto 0 );
  signal register5_q_net : std_logic_vector( 16-1 downto 0 );
begin
  imag_out <= register1_q_net;
  real_out <= register_q_net;
  valid_out <= register4_q_net;
  delay2_q_net <= imag_in;
  delay1_q_net <= real_in;
  delay3_q_net <= valid_in;
  neg_sin_rom_data_net <= imag_error;
  cos_rom_data_net <= real_error;
  register_q_net_x0 <= valid_error;
  clk_net <= clk_1;
  ce_net <= ce_1;
  src_clk_net <= clk_20;
  src_ce_net <= ce_20;
  delay : entity xil_defaultlib.bpsk_receiver_xldelay 
  generic map (
    latency => 4,
    reg_retiming => 0,
    reset => 0,
    width => 1
  )
  port map (
    en => '1',
    rst => '0',
    d => register7_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    q => delay_q_net
  );
  product : entity xil_defaultlib.xlbpsk_receiver_cmpy_v6_0_i0_d0556cf8650161590d6ae6634c6d64fc 
  port map (
    a_re => register6_q_net,
    a_im => register5_q_net,
    b_re => register2_q_net,
    b_im => register3_q_net,
    clk => clk_net,
    ce => ce_net,
    clk_20 => src_clk_net,
    ce_20 => src_ce_net,
    p_re => product_p_re_net,
    p_im => product_p_im_net
  );
  register_x0 : entity xil_defaultlib.bpsk_receiver_xlregister 
  generic map (
    d_width => 33,
    init_value => b"000000000000000000000000000000000"
  )
  port map (
    rst => "0",
    d => product_p_re_net,
    en => delay_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    q => register_q_net
  );
  register1 : entity xil_defaultlib.bpsk_receiver_xlregister 
  generic map (
    d_width => 33,
    init_value => b"000000000000000000000000000000000"
  )
  port map (
    rst => "0",
    d => product_p_im_net,
    en => delay_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    q => register1_q_net
  );
  register2 : entity xil_defaultlib.bpsk_receiver_xlregister 
  generic map (
    d_width => 16,
    init_value => b"0000000000000000"
  )
  port map (
    rst => "0",
    d => cos_rom_data_net,
    en => register_q_net_x0,
    clk => src_clk_net,
    ce => src_ce_net,
    q => register2_q_net
  );
  register3 : entity xil_defaultlib.bpsk_receiver_xlregister 
  generic map (
    d_width => 16,
    init_value => b"0000000000000000"
  )
  port map (
    rst => "0",
    d => neg_sin_rom_data_net,
    en => register_q_net_x0,
    clk => src_clk_net,
    ce => src_ce_net,
    q => register3_q_net
  );
  register4 : entity xil_defaultlib.bpsk_receiver_xlregister 
  generic map (
    d_width => 1,
    init_value => b"0"
  )
  port map (
    en => "1",
    rst => "0",
    d => delay_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    q => register4_q_net
  );
  register5 : entity xil_defaultlib.bpsk_receiver_xlregister 
  generic map (
    d_width => 16,
    init_value => b"0000000000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => delay2_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    q => register5_q_net
  );
  register6 : entity xil_defaultlib.bpsk_receiver_xlregister 
  generic map (
    d_width => 16,
    init_value => b"0000000000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => delay1_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    q => register6_q_net
  );
  register7 : entity xil_defaultlib.bpsk_receiver_xlregister 
  generic map (
    d_width => 1,
    init_value => b"0"
  )
  port map (
    en => "1",
    rst => "0",
    d => delay3_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    q => register7_q_net
  );
end structural;
-- Generated from Simulink block bpsk_receiver/Carrier Synchronisation/Generate Angle Error/Circular CORDIC/Vectoring  Cell 0
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity bpsk_receiver_vectoring_cell_0 is
  port (
    x_in : in std_logic_vector( 16-1 downto 0 );
    y_in : in std_logic_vector( 16-1 downto 0 );
    z_in : in std_logic_vector( 16-1 downto 0 );
    clk_20 : in std_logic;
    ce_20 : in std_logic;
    x_out : out std_logic_vector( 15-1 downto 0 );
    y_out : out std_logic_vector( 15-1 downto 0 );
    z_out : out std_logic_vector( 20-1 downto 0 )
  );
end bpsk_receiver_vectoring_cell_0;
architecture structural of bpsk_receiver_vectoring_cell_0 is 
  signal constant_op_net_x0 : std_logic_vector( 20-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 15-1 downto 0 );
  signal shift_op_net : std_logic_vector( 15-1 downto 0 );
  signal logical_y_net : std_logic_vector( 1-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 1-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 15-1 downto 0 );
  signal constant_op_net : std_logic_vector( 16-1 downto 0 );
  signal src_clk_net : std_logic;
  signal addsub3_s_net : std_logic_vector( 15-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 20-1 downto 0 );
  signal register_q_net : std_logic_vector( 16-1 downto 0 );
  signal register1_q_net : std_logic_vector( 16-1 downto 0 );
  signal src_ce_net : std_logic;
begin
  x_out <= addsub2_s_net;
  y_out <= addsub3_s_net;
  z_out <= addsub1_s_net;
  register_q_net <= x_in;
  register1_q_net <= y_in;
  constant_op_net <= z_in;
  src_clk_net <= clk_20;
  src_ce_net <= ce_20;
  addsub1 : entity xil_defaultlib.sysgen_addsub_3f0701b106 
  port map (
    clr => '0',
    a => constant_op_net,
    b => constant_op_net_x0,
    mode => logical_y_net,
    clk => src_clk_net,
    ce => src_ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity xil_defaultlib.sysgen_addsub_49f0740868 
  port map (
    clr => '0',
    a => register_q_net,
    b => shift1_op_net,
    mode => logical_y_net,
    clk => src_clk_net,
    ce => src_ce_net,
    s => addsub2_s_net
  );
  addsub3 : entity xil_defaultlib.sysgen_addsub_49f0740868 
  port map (
    clr => '0',
    a => register1_q_net,
    b => shift_op_net,
    mode => inverter_op_net,
    clk => src_clk_net,
    ce => src_ce_net,
    s => addsub3_s_net
  );
  constant_x0 : entity xil_defaultlib.sysgen_constant_35751691c1 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net_x0
  );
  inverter : entity xil_defaultlib.sysgen_inverter_8255e2898d 
  port map (
    clr => '0',
    ip => logical_y_net,
    clk => src_clk_net,
    ce => src_ce_net,
    op => inverter_op_net
  );
  logical : entity xil_defaultlib.sysgen_logical_32952cfad3 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => slice_y_net,
    d1 => slice1_y_net,
    y => logical_y_net
  );
  shift : entity xil_defaultlib.sysgen_shift_7faf512458 
  port map (
    clr => '0',
    ip => register_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    op => shift_op_net
  );
  shift1 : entity xil_defaultlib.sysgen_shift_7faf512458 
  port map (
    clr => '0',
    ip => register1_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    op => shift1_op_net
  );
  slice : entity xil_defaultlib.bpsk_receiver_xlslice 
  generic map (
    new_lsb => 15,
    new_msb => 15,
    x_width => 16,
    y_width => 1
  )
  port map (
    x => register_q_net,
    y => slice_y_net
  );
  slice1 : entity xil_defaultlib.bpsk_receiver_xlslice 
  generic map (
    new_lsb => 15,
    new_msb => 15,
    x_width => 16,
    y_width => 1
  )
  port map (
    x => register1_q_net,
    y => slice1_y_net
  );
end structural;
-- Generated from Simulink block bpsk_receiver/Carrier Synchronisation/Generate Angle Error/Circular CORDIC/Vectoring  Cell 1
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity bpsk_receiver_vectoring_cell_1 is
  port (
    x_in : in std_logic_vector( 15-1 downto 0 );
    y_in : in std_logic_vector( 15-1 downto 0 );
    z_in : in std_logic_vector( 20-1 downto 0 );
    clk_20 : in std_logic;
    ce_20 : in std_logic;
    x_out : out std_logic_vector( 15-1 downto 0 );
    y_out : out std_logic_vector( 15-1 downto 0 );
    z_out : out std_logic_vector( 20-1 downto 0 )
  );
end bpsk_receiver_vectoring_cell_1;
architecture structural of bpsk_receiver_vectoring_cell_1 is 
  signal shift1_op_net : std_logic_vector( 15-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 1-1 downto 0 );
  signal shift_op_net : std_logic_vector( 15-1 downto 0 );
  signal constant_op_net : std_logic_vector( 20-1 downto 0 );
  signal logical_y_net : std_logic_vector( 1-1 downto 0 );
  signal addsub3_s_net : std_logic_vector( 15-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 20-1 downto 0 );
  signal delay_q_net : std_logic_vector( 15-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 15-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 15-1 downto 0 );
  signal delay2_q_net : std_logic_vector( 20-1 downto 0 );
  signal src_clk_net : std_logic;
  signal src_ce_net : std_logic;
begin
  x_out <= addsub2_s_net;
  y_out <= addsub3_s_net;
  z_out <= addsub1_s_net;
  delay_q_net <= x_in;
  delay1_q_net <= y_in;
  delay2_q_net <= z_in;
  src_clk_net <= clk_20;
  src_ce_net <= ce_20;
  addsub1 : entity xil_defaultlib.sysgen_addsub_4acee25cbc 
  port map (
    clr => '0',
    a => delay2_q_net,
    b => constant_op_net,
    mode => logical_y_net,
    clk => src_clk_net,
    ce => src_ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity xil_defaultlib.sysgen_addsub_ad3fc7a6b2 
  port map (
    clr => '0',
    a => delay_q_net,
    b => shift1_op_net,
    mode => logical_y_net,
    clk => src_clk_net,
    ce => src_ce_net,
    s => addsub2_s_net
  );
  addsub3 : entity xil_defaultlib.sysgen_addsub_ad3fc7a6b2 
  port map (
    clr => '0',
    a => delay1_q_net,
    b => shift_op_net,
    mode => inverter_op_net,
    clk => src_clk_net,
    ce => src_ce_net,
    s => addsub3_s_net
  );
  constant_x0 : entity xil_defaultlib.sysgen_constant_f1b04198f5 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity xil_defaultlib.sysgen_inverter_8255e2898d 
  port map (
    clr => '0',
    ip => logical_y_net,
    clk => src_clk_net,
    ce => src_ce_net,
    op => inverter_op_net
  );
  logical : entity xil_defaultlib.sysgen_logical_32952cfad3 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => slice_y_net,
    d1 => slice1_y_net,
    y => logical_y_net
  );
  shift : entity xil_defaultlib.sysgen_shift_1d44be3b16 
  port map (
    clr => '0',
    ip => delay_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    op => shift_op_net
  );
  shift1 : entity xil_defaultlib.sysgen_shift_1d44be3b16 
  port map (
    clr => '0',
    ip => delay1_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    op => shift1_op_net
  );
  slice : entity xil_defaultlib.bpsk_receiver_xlslice 
  generic map (
    new_lsb => 14,
    new_msb => 14,
    x_width => 15,
    y_width => 1
  )
  port map (
    x => delay_q_net,
    y => slice_y_net
  );
  slice1 : entity xil_defaultlib.bpsk_receiver_xlslice 
  generic map (
    new_lsb => 14,
    new_msb => 14,
    x_width => 15,
    y_width => 1
  )
  port map (
    x => delay1_q_net,
    y => slice1_y_net
  );
end structural;
-- Generated from Simulink block bpsk_receiver/Carrier Synchronisation/Generate Angle Error/Circular CORDIC/Vectoring  Cell 2
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity bpsk_receiver_vectoring_cell_2 is
  port (
    x_in : in std_logic_vector( 15-1 downto 0 );
    y_in : in std_logic_vector( 15-1 downto 0 );
    z_in : in std_logic_vector( 20-1 downto 0 );
    clk_20 : in std_logic;
    ce_20 : in std_logic;
    x_out : out std_logic_vector( 15-1 downto 0 );
    y_out : out std_logic_vector( 15-1 downto 0 );
    z_out : out std_logic_vector( 20-1 downto 0 )
  );
end bpsk_receiver_vectoring_cell_2;
architecture structural of bpsk_receiver_vectoring_cell_2 is 
  signal slice1_y_net : std_logic_vector( 1-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal shift_op_net : std_logic_vector( 15-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 15-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 15-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 20-1 downto 0 );
  signal addsub3_s_net : std_logic_vector( 15-1 downto 0 );
  signal delay3_q_net : std_logic_vector( 15-1 downto 0 );
  signal delay4_q_net : std_logic_vector( 15-1 downto 0 );
  signal delay5_q_net : std_logic_vector( 20-1 downto 0 );
  signal src_clk_net : std_logic;
  signal src_ce_net : std_logic;
  signal constant_op_net : std_logic_vector( 20-1 downto 0 );
  signal logical_y_net : std_logic_vector( 1-1 downto 0 );
begin
  x_out <= addsub2_s_net;
  y_out <= addsub3_s_net;
  z_out <= addsub1_s_net;
  delay3_q_net <= x_in;
  delay4_q_net <= y_in;
  delay5_q_net <= z_in;
  src_clk_net <= clk_20;
  src_ce_net <= ce_20;
  addsub1 : entity xil_defaultlib.sysgen_addsub_4acee25cbc 
  port map (
    clr => '0',
    a => delay5_q_net,
    b => constant_op_net,
    mode => logical_y_net,
    clk => src_clk_net,
    ce => src_ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity xil_defaultlib.sysgen_addsub_ad3fc7a6b2 
  port map (
    clr => '0',
    a => delay3_q_net,
    b => shift1_op_net,
    mode => logical_y_net,
    clk => src_clk_net,
    ce => src_ce_net,
    s => addsub2_s_net
  );
  addsub3 : entity xil_defaultlib.sysgen_addsub_ad3fc7a6b2 
  port map (
    clr => '0',
    a => delay4_q_net,
    b => shift_op_net,
    mode => inverter_op_net,
    clk => src_clk_net,
    ce => src_ce_net,
    s => addsub3_s_net
  );
  constant_x0 : entity xil_defaultlib.sysgen_constant_38aff91623 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity xil_defaultlib.sysgen_inverter_8255e2898d 
  port map (
    clr => '0',
    ip => logical_y_net,
    clk => src_clk_net,
    ce => src_ce_net,
    op => inverter_op_net
  );
  logical : entity xil_defaultlib.sysgen_logical_32952cfad3 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => slice_y_net,
    d1 => slice1_y_net,
    y => logical_y_net
  );
  shift : entity xil_defaultlib.sysgen_shift_ac92f8a886 
  port map (
    clr => '0',
    ip => delay3_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    op => shift_op_net
  );
  shift1 : entity xil_defaultlib.sysgen_shift_ac92f8a886 
  port map (
    clr => '0',
    ip => delay4_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    op => shift1_op_net
  );
  slice : entity xil_defaultlib.bpsk_receiver_xlslice 
  generic map (
    new_lsb => 14,
    new_msb => 14,
    x_width => 15,
    y_width => 1
  )
  port map (
    x => delay3_q_net,
    y => slice_y_net
  );
  slice1 : entity xil_defaultlib.bpsk_receiver_xlslice 
  generic map (
    new_lsb => 14,
    new_msb => 14,
    x_width => 15,
    y_width => 1
  )
  port map (
    x => delay4_q_net,
    y => slice1_y_net
  );
end structural;
-- Generated from Simulink block bpsk_receiver/Carrier Synchronisation/Generate Angle Error/Circular CORDIC/Vectoring  Cell 3
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity bpsk_receiver_vectoring_cell_3 is
  port (
    x_in : in std_logic_vector( 15-1 downto 0 );
    y_in : in std_logic_vector( 15-1 downto 0 );
    z_in : in std_logic_vector( 20-1 downto 0 );
    clk_20 : in std_logic;
    ce_20 : in std_logic;
    x_out : out std_logic_vector( 15-1 downto 0 );
    y_out : out std_logic_vector( 15-1 downto 0 );
    z_out : out std_logic_vector( 20-1 downto 0 )
  );
end bpsk_receiver_vectoring_cell_3;
architecture structural of bpsk_receiver_vectoring_cell_3 is 
  signal slice1_y_net : std_logic_vector( 1-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 15-1 downto 0 );
  signal addsub3_s_net : std_logic_vector( 15-1 downto 0 );
  signal shift_op_net : std_logic_vector( 15-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 20-1 downto 0 );
  signal delay6_q_net : std_logic_vector( 15-1 downto 0 );
  signal delay7_q_net : std_logic_vector( 15-1 downto 0 );
  signal delay8_q_net : std_logic_vector( 20-1 downto 0 );
  signal constant_op_net : std_logic_vector( 20-1 downto 0 );
  signal logical_y_net : std_logic_vector( 1-1 downto 0 );
  signal src_clk_net : std_logic;
  signal src_ce_net : std_logic;
  signal shift1_op_net : std_logic_vector( 15-1 downto 0 );
begin
  x_out <= addsub2_s_net;
  y_out <= addsub3_s_net;
  z_out <= addsub1_s_net;
  delay6_q_net <= x_in;
  delay7_q_net <= y_in;
  delay8_q_net <= z_in;
  src_clk_net <= clk_20;
  src_ce_net <= ce_20;
  addsub1 : entity xil_defaultlib.sysgen_addsub_4acee25cbc 
  port map (
    clr => '0',
    a => delay8_q_net,
    b => constant_op_net,
    mode => logical_y_net,
    clk => src_clk_net,
    ce => src_ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity xil_defaultlib.sysgen_addsub_ad3fc7a6b2 
  port map (
    clr => '0',
    a => delay6_q_net,
    b => shift1_op_net,
    mode => logical_y_net,
    clk => src_clk_net,
    ce => src_ce_net,
    s => addsub2_s_net
  );
  addsub3 : entity xil_defaultlib.sysgen_addsub_ad3fc7a6b2 
  port map (
    clr => '0',
    a => delay7_q_net,
    b => shift_op_net,
    mode => inverter_op_net,
    clk => src_clk_net,
    ce => src_ce_net,
    s => addsub3_s_net
  );
  constant_x0 : entity xil_defaultlib.sysgen_constant_aec6f71abc 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity xil_defaultlib.sysgen_inverter_8255e2898d 
  port map (
    clr => '0',
    ip => logical_y_net,
    clk => src_clk_net,
    ce => src_ce_net,
    op => inverter_op_net
  );
  logical : entity xil_defaultlib.sysgen_logical_32952cfad3 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => slice_y_net,
    d1 => slice1_y_net,
    y => logical_y_net
  );
  shift : entity xil_defaultlib.sysgen_shift_3347630dd4 
  port map (
    clr => '0',
    ip => delay6_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    op => shift_op_net
  );
  shift1 : entity xil_defaultlib.sysgen_shift_3347630dd4 
  port map (
    clr => '0',
    ip => delay7_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    op => shift1_op_net
  );
  slice : entity xil_defaultlib.bpsk_receiver_xlslice 
  generic map (
    new_lsb => 14,
    new_msb => 14,
    x_width => 15,
    y_width => 1
  )
  port map (
    x => delay6_q_net,
    y => slice_y_net
  );
  slice1 : entity xil_defaultlib.bpsk_receiver_xlslice 
  generic map (
    new_lsb => 14,
    new_msb => 14,
    x_width => 15,
    y_width => 1
  )
  port map (
    x => delay7_q_net,
    y => slice1_y_net
  );
end structural;
-- Generated from Simulink block bpsk_receiver/Carrier Synchronisation/Generate Angle Error/Circular CORDIC/Vectoring  Cell 4
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity bpsk_receiver_vectoring_cell_4 is
  port (
    x_in : in std_logic_vector( 15-1 downto 0 );
    y_in : in std_logic_vector( 15-1 downto 0 );
    z_in : in std_logic_vector( 20-1 downto 0 );
    clk_20 : in std_logic;
    ce_20 : in std_logic;
    x_out : out std_logic_vector( 15-1 downto 0 );
    y_out : out std_logic_vector( 15-1 downto 0 );
    z_out : out std_logic_vector( 20-1 downto 0 )
  );
end bpsk_receiver_vectoring_cell_4;
architecture structural of bpsk_receiver_vectoring_cell_4 is 
  signal addsub1_s_net : std_logic_vector( 20-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 15-1 downto 0 );
  signal addsub3_s_net : std_logic_vector( 15-1 downto 0 );
  signal delay10_q_net : std_logic_vector( 15-1 downto 0 );
  signal delay9_q_net : std_logic_vector( 15-1 downto 0 );
  signal src_clk_net : std_logic;
  signal delay11_q_net : std_logic_vector( 20-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal shift_op_net : std_logic_vector( 15-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 1-1 downto 0 );
  signal src_ce_net : std_logic;
  signal logical_y_net : std_logic_vector( 1-1 downto 0 );
  signal constant_op_net : std_logic_vector( 20-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 15-1 downto 0 );
begin
  x_out <= addsub2_s_net;
  y_out <= addsub3_s_net;
  z_out <= addsub1_s_net;
  delay9_q_net <= x_in;
  delay10_q_net <= y_in;
  delay11_q_net <= z_in;
  src_clk_net <= clk_20;
  src_ce_net <= ce_20;
  addsub1 : entity xil_defaultlib.sysgen_addsub_4acee25cbc 
  port map (
    clr => '0',
    a => delay11_q_net,
    b => constant_op_net,
    mode => logical_y_net,
    clk => src_clk_net,
    ce => src_ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity xil_defaultlib.sysgen_addsub_ad3fc7a6b2 
  port map (
    clr => '0',
    a => delay9_q_net,
    b => shift1_op_net,
    mode => logical_y_net,
    clk => src_clk_net,
    ce => src_ce_net,
    s => addsub2_s_net
  );
  addsub3 : entity xil_defaultlib.sysgen_addsub_ad3fc7a6b2 
  port map (
    clr => '0',
    a => delay10_q_net,
    b => shift_op_net,
    mode => inverter_op_net,
    clk => src_clk_net,
    ce => src_ce_net,
    s => addsub3_s_net
  );
  constant_x0 : entity xil_defaultlib.sysgen_constant_626268901e 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity xil_defaultlib.sysgen_inverter_8255e2898d 
  port map (
    clr => '0',
    ip => logical_y_net,
    clk => src_clk_net,
    ce => src_ce_net,
    op => inverter_op_net
  );
  logical : entity xil_defaultlib.sysgen_logical_32952cfad3 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => slice_y_net,
    d1 => slice1_y_net,
    y => logical_y_net
  );
  shift : entity xil_defaultlib.sysgen_shift_b72a171a60 
  port map (
    clr => '0',
    ip => delay9_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    op => shift_op_net
  );
  shift1 : entity xil_defaultlib.sysgen_shift_b72a171a60 
  port map (
    clr => '0',
    ip => delay10_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    op => shift1_op_net
  );
  slice : entity xil_defaultlib.bpsk_receiver_xlslice 
  generic map (
    new_lsb => 14,
    new_msb => 14,
    x_width => 15,
    y_width => 1
  )
  port map (
    x => delay9_q_net,
    y => slice_y_net
  );
  slice1 : entity xil_defaultlib.bpsk_receiver_xlslice 
  generic map (
    new_lsb => 14,
    new_msb => 14,
    x_width => 15,
    y_width => 1
  )
  port map (
    x => delay10_q_net,
    y => slice1_y_net
  );
end structural;
-- Generated from Simulink block bpsk_receiver/Carrier Synchronisation/Generate Angle Error/Circular CORDIC/Vectoring  Cell 5
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity bpsk_receiver_vectoring_cell_5 is
  port (
    x_in : in std_logic_vector( 15-1 downto 0 );
    y_in : in std_logic_vector( 15-1 downto 0 );
    z_in : in std_logic_vector( 20-1 downto 0 );
    clk_20 : in std_logic;
    ce_20 : in std_logic;
    x_out : out std_logic_vector( 15-1 downto 0 );
    y_out : out std_logic_vector( 15-1 downto 0 );
    z_out : out std_logic_vector( 20-1 downto 0 )
  );
end bpsk_receiver_vectoring_cell_5;
architecture structural of bpsk_receiver_vectoring_cell_5 is 
  signal addsub2_s_net : std_logic_vector( 15-1 downto 0 );
  signal src_clk_net : std_logic;
  signal shift_op_net : std_logic_vector( 15-1 downto 0 );
  signal logical_y_net : std_logic_vector( 1-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 1-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 20-1 downto 0 );
  signal delay13_q_net : std_logic_vector( 15-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 15-1 downto 0 );
  signal constant_op_net : std_logic_vector( 20-1 downto 0 );
  signal delay14_q_net : std_logic_vector( 20-1 downto 0 );
  signal addsub3_s_net : std_logic_vector( 15-1 downto 0 );
  signal delay12_q_net : std_logic_vector( 15-1 downto 0 );
  signal src_ce_net : std_logic;
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
begin
  x_out <= addsub2_s_net;
  y_out <= addsub3_s_net;
  z_out <= addsub1_s_net;
  delay12_q_net <= x_in;
  delay13_q_net <= y_in;
  delay14_q_net <= z_in;
  src_clk_net <= clk_20;
  src_ce_net <= ce_20;
  addsub1 : entity xil_defaultlib.sysgen_addsub_4acee25cbc 
  port map (
    clr => '0',
    a => delay14_q_net,
    b => constant_op_net,
    mode => logical_y_net,
    clk => src_clk_net,
    ce => src_ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity xil_defaultlib.sysgen_addsub_ad3fc7a6b2 
  port map (
    clr => '0',
    a => delay12_q_net,
    b => shift1_op_net,
    mode => logical_y_net,
    clk => src_clk_net,
    ce => src_ce_net,
    s => addsub2_s_net
  );
  addsub3 : entity xil_defaultlib.sysgen_addsub_ad3fc7a6b2 
  port map (
    clr => '0',
    a => delay13_q_net,
    b => shift_op_net,
    mode => inverter_op_net,
    clk => src_clk_net,
    ce => src_ce_net,
    s => addsub3_s_net
  );
  constant_x0 : entity xil_defaultlib.sysgen_constant_23e22f5036 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity xil_defaultlib.sysgen_inverter_8255e2898d 
  port map (
    clr => '0',
    ip => logical_y_net,
    clk => src_clk_net,
    ce => src_ce_net,
    op => inverter_op_net
  );
  logical : entity xil_defaultlib.sysgen_logical_32952cfad3 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => slice_y_net,
    d1 => slice1_y_net,
    y => logical_y_net
  );
  shift : entity xil_defaultlib.sysgen_shift_cfaefb5aac 
  port map (
    clr => '0',
    ip => delay12_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    op => shift_op_net
  );
  shift1 : entity xil_defaultlib.sysgen_shift_cfaefb5aac 
  port map (
    clr => '0',
    ip => delay13_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    op => shift1_op_net
  );
  slice : entity xil_defaultlib.bpsk_receiver_xlslice 
  generic map (
    new_lsb => 14,
    new_msb => 14,
    x_width => 15,
    y_width => 1
  )
  port map (
    x => delay12_q_net,
    y => slice_y_net
  );
  slice1 : entity xil_defaultlib.bpsk_receiver_xlslice 
  generic map (
    new_lsb => 14,
    new_msb => 14,
    x_width => 15,
    y_width => 1
  )
  port map (
    x => delay13_q_net,
    y => slice1_y_net
  );
end structural;
-- Generated from Simulink block bpsk_receiver/Carrier Synchronisation/Generate Angle Error/Circular CORDIC/Vectoring  Cell 6
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity bpsk_receiver_vectoring_cell_6 is
  port (
    x_in : in std_logic_vector( 15-1 downto 0 );
    y_in : in std_logic_vector( 15-1 downto 0 );
    z_in : in std_logic_vector( 20-1 downto 0 );
    clk_20 : in std_logic;
    ce_20 : in std_logic;
    x_out : out std_logic_vector( 15-1 downto 0 );
    y_out : out std_logic_vector( 15-1 downto 0 );
    z_out : out std_logic_vector( 20-1 downto 0 )
  );
end bpsk_receiver_vectoring_cell_6;
architecture structural of bpsk_receiver_vectoring_cell_6 is 
  signal shift1_op_net : std_logic_vector( 15-1 downto 0 );
  signal src_clk_net : std_logic;
  signal delay17_q_net : std_logic_vector( 20-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 15-1 downto 0 );
  signal logical_y_net : std_logic_vector( 1-1 downto 0 );
  signal addsub3_s_net : std_logic_vector( 15-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 20-1 downto 0 );
  signal delay15_q_net : std_logic_vector( 15-1 downto 0 );
  signal src_ce_net : std_logic;
  signal delay16_q_net : std_logic_vector( 15-1 downto 0 );
  signal shift_op_net : std_logic_vector( 15-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal constant_op_net : std_logic_vector( 20-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 1-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
begin
  x_out <= addsub2_s_net;
  y_out <= addsub3_s_net;
  z_out <= addsub1_s_net;
  delay15_q_net <= x_in;
  delay16_q_net <= y_in;
  delay17_q_net <= z_in;
  src_clk_net <= clk_20;
  src_ce_net <= ce_20;
  addsub1 : entity xil_defaultlib.sysgen_addsub_4acee25cbc 
  port map (
    clr => '0',
    a => delay17_q_net,
    b => constant_op_net,
    mode => logical_y_net,
    clk => src_clk_net,
    ce => src_ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity xil_defaultlib.sysgen_addsub_ad3fc7a6b2 
  port map (
    clr => '0',
    a => delay15_q_net,
    b => shift1_op_net,
    mode => logical_y_net,
    clk => src_clk_net,
    ce => src_ce_net,
    s => addsub2_s_net
  );
  addsub3 : entity xil_defaultlib.sysgen_addsub_ad3fc7a6b2 
  port map (
    clr => '0',
    a => delay16_q_net,
    b => shift_op_net,
    mode => inverter_op_net,
    clk => src_clk_net,
    ce => src_ce_net,
    s => addsub3_s_net
  );
  constant_x0 : entity xil_defaultlib.sysgen_constant_a08a7fa33f 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity xil_defaultlib.sysgen_inverter_8255e2898d 
  port map (
    clr => '0',
    ip => logical_y_net,
    clk => src_clk_net,
    ce => src_ce_net,
    op => inverter_op_net
  );
  logical : entity xil_defaultlib.sysgen_logical_32952cfad3 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => slice_y_net,
    d1 => slice1_y_net,
    y => logical_y_net
  );
  shift : entity xil_defaultlib.sysgen_shift_5f5915f8ca 
  port map (
    clr => '0',
    ip => delay15_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    op => shift_op_net
  );
  shift1 : entity xil_defaultlib.sysgen_shift_5f5915f8ca 
  port map (
    clr => '0',
    ip => delay16_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    op => shift1_op_net
  );
  slice : entity xil_defaultlib.bpsk_receiver_xlslice 
  generic map (
    new_lsb => 14,
    new_msb => 14,
    x_width => 15,
    y_width => 1
  )
  port map (
    x => delay15_q_net,
    y => slice_y_net
  );
  slice1 : entity xil_defaultlib.bpsk_receiver_xlslice 
  generic map (
    new_lsb => 14,
    new_msb => 14,
    x_width => 15,
    y_width => 1
  )
  port map (
    x => delay16_q_net,
    y => slice1_y_net
  );
end structural;
-- Generated from Simulink block bpsk_receiver/Carrier Synchronisation/Generate Angle Error/Circular CORDIC/Vectoring  Cell 7
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity bpsk_receiver_vectoring_cell_7 is
  port (
    x_in : in std_logic_vector( 15-1 downto 0 );
    y_in : in std_logic_vector( 15-1 downto 0 );
    z_in : in std_logic_vector( 20-1 downto 0 );
    clk_20 : in std_logic;
    ce_20 : in std_logic;
    z_out : out std_logic_vector( 20-1 downto 0 )
  );
end bpsk_receiver_vectoring_cell_7;
architecture structural of bpsk_receiver_vectoring_cell_7 is 
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 20-1 downto 0 );
  signal delay20_q_net : std_logic_vector( 20-1 downto 0 );
  signal constant_op_net : std_logic_vector( 20-1 downto 0 );
  signal src_ce_net : std_logic;
  signal logical_y_net : std_logic_vector( 1-1 downto 0 );
  signal delay19_q_net : std_logic_vector( 15-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 1-1 downto 0 );
  signal delay18_q_net : std_logic_vector( 15-1 downto 0 );
  signal src_clk_net : std_logic;
begin
  z_out <= addsub1_s_net;
  delay18_q_net <= x_in;
  delay19_q_net <= y_in;
  delay20_q_net <= z_in;
  src_clk_net <= clk_20;
  src_ce_net <= ce_20;
  addsub1 : entity xil_defaultlib.sysgen_addsub_4acee25cbc 
  port map (
    clr => '0',
    a => delay20_q_net,
    b => constant_op_net,
    mode => logical_y_net,
    clk => src_clk_net,
    ce => src_ce_net,
    s => addsub1_s_net
  );
  constant_x0 : entity xil_defaultlib.sysgen_constant_b828094eaa 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  logical : entity xil_defaultlib.sysgen_logical_32952cfad3 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => slice_y_net,
    d1 => slice1_y_net,
    y => logical_y_net
  );
  slice : entity xil_defaultlib.bpsk_receiver_xlslice 
  generic map (
    new_lsb => 14,
    new_msb => 14,
    x_width => 15,
    y_width => 1
  )
  port map (
    x => delay18_q_net,
    y => slice_y_net
  );
  slice1 : entity xil_defaultlib.bpsk_receiver_xlslice 
  generic map (
    new_lsb => 14,
    new_msb => 14,
    x_width => 15,
    y_width => 1
  )
  port map (
    x => delay19_q_net,
    y => slice1_y_net
  );
end structural;
-- Generated from Simulink block bpsk_receiver/Carrier Synchronisation/Generate Angle Error/Circular CORDIC
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity bpsk_receiver_circular_cordic is
  port (
    imag_in : in std_logic_vector( 16-1 downto 0 );
    real_in : in std_logic_vector( 16-1 downto 0 );
    clk_20 : in std_logic;
    ce_20 : in std_logic;
    angle : out std_logic_vector( 20-1 downto 0 )
  );
end bpsk_receiver_circular_cordic;
architecture structural of bpsk_receiver_circular_cordic is 
  signal register1_q_net : std_logic_vector( 16-1 downto 0 );
  signal register_q_net : std_logic_vector( 16-1 downto 0 );
  signal delay23_q_net : std_logic_vector( 20-1 downto 0 );
  signal addsub1_s_net_x4 : std_logic_vector( 20-1 downto 0 );
  signal delay7_q_net : std_logic_vector( 15-1 downto 0 );
  signal addsub1_s_net_x2 : std_logic_vector( 20-1 downto 0 );
  signal delay16_q_net : std_logic_vector( 15-1 downto 0 );
  signal addsub2_s_net_x3 : std_logic_vector( 15-1 downto 0 );
  signal addsub3_s_net_x6 : std_logic_vector( 15-1 downto 0 );
  signal addsub1_s_net_x3 : std_logic_vector( 20-1 downto 0 );
  signal delay2_q_net : std_logic_vector( 20-1 downto 0 );
  signal delay13_q_net : std_logic_vector( 15-1 downto 0 );
  signal delay5_q_net : std_logic_vector( 20-1 downto 0 );
  signal delay4_q_net : std_logic_vector( 15-1 downto 0 );
  signal addsub3_s_net_x4 : std_logic_vector( 15-1 downto 0 );
  signal addsub1_s_net_x1 : std_logic_vector( 20-1 downto 0 );
  signal addsub2_s_net_x6 : std_logic_vector( 15-1 downto 0 );
  signal addsub1_s_net_x6 : std_logic_vector( 20-1 downto 0 );
  signal delay6_q_net : std_logic_vector( 15-1 downto 0 );
  signal addsub2_s_net_x4 : std_logic_vector( 15-1 downto 0 );
  signal src_clk_net : std_logic;
  signal addsub3_s_net_x3 : std_logic_vector( 15-1 downto 0 );
  signal delay17_q_net : std_logic_vector( 20-1 downto 0 );
  signal addsub3_s_net_x1 : std_logic_vector( 15-1 downto 0 );
  signal delay14_q_net : std_logic_vector( 20-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 15-1 downto 0 );
  signal delay12_q_net : std_logic_vector( 15-1 downto 0 );
  signal delay20_q_net : std_logic_vector( 20-1 downto 0 );
  signal addsub1_s_net_x5 : std_logic_vector( 20-1 downto 0 );
  signal delay3_q_net : std_logic_vector( 15-1 downto 0 );
  signal delay8_q_net : std_logic_vector( 20-1 downto 0 );
  signal addsub2_s_net_x2 : std_logic_vector( 15-1 downto 0 );
  signal src_ce_net : std_logic;
  signal addsub3_s_net_x2 : std_logic_vector( 15-1 downto 0 );
  signal delay11_q_net : std_logic_vector( 20-1 downto 0 );
  signal addsub2_s_net_x1 : std_logic_vector( 15-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 20-1 downto 0 );
  signal delay15_q_net : std_logic_vector( 15-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 20-1 downto 0 );
  signal constant_op_net : std_logic_vector( 16-1 downto 0 );
  signal addsub2_s_net_x5 : std_logic_vector( 15-1 downto 0 );
  signal delay18_q_net : std_logic_vector( 15-1 downto 0 );
  signal addsub3_s_net_x5 : std_logic_vector( 15-1 downto 0 );
  signal delay_q_net : std_logic_vector( 15-1 downto 0 );
  signal delay19_q_net : std_logic_vector( 15-1 downto 0 );
  signal delay10_q_net : std_logic_vector( 15-1 downto 0 );
  signal addsub3_s_net_x0 : std_logic_vector( 15-1 downto 0 );
  signal delay9_q_net : std_logic_vector( 15-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 15-1 downto 0 );
begin
  angle <= delay23_q_net;
  register1_q_net <= imag_in;
  register_q_net <= real_in;
  src_clk_net <= clk_20;
  src_ce_net <= ce_20;
  vectoring_cell_0 : entity xil_defaultlib.bpsk_receiver_vectoring_cell_0 
  port map (
    x_in => register_q_net,
    y_in => register1_q_net,
    z_in => constant_op_net,
    clk_20 => src_clk_net,
    ce_20 => src_ce_net,
    x_out => addsub2_s_net_x6,
    y_out => addsub3_s_net_x6,
    z_out => addsub1_s_net_x6
  );
  vectoring_cell_1 : entity xil_defaultlib.bpsk_receiver_vectoring_cell_1 
  port map (
    x_in => delay_q_net,
    y_in => delay1_q_net,
    z_in => delay2_q_net,
    clk_20 => src_clk_net,
    ce_20 => src_ce_net,
    x_out => addsub2_s_net_x5,
    y_out => addsub3_s_net_x5,
    z_out => addsub1_s_net_x5
  );
  vectoring_cell_2 : entity xil_defaultlib.bpsk_receiver_vectoring_cell_2 
  port map (
    x_in => delay3_q_net,
    y_in => delay4_q_net,
    z_in => delay5_q_net,
    clk_20 => src_clk_net,
    ce_20 => src_ce_net,
    x_out => addsub2_s_net_x4,
    y_out => addsub3_s_net_x4,
    z_out => addsub1_s_net_x4
  );
  vectoring_cell_3 : entity xil_defaultlib.bpsk_receiver_vectoring_cell_3 
  port map (
    x_in => delay6_q_net,
    y_in => delay7_q_net,
    z_in => delay8_q_net,
    clk_20 => src_clk_net,
    ce_20 => src_ce_net,
    x_out => addsub2_s_net_x3,
    y_out => addsub3_s_net_x3,
    z_out => addsub1_s_net_x3
  );
  vectoring_cell_4 : entity xil_defaultlib.bpsk_receiver_vectoring_cell_4 
  port map (
    x_in => delay9_q_net,
    y_in => delay10_q_net,
    z_in => delay11_q_net,
    clk_20 => src_clk_net,
    ce_20 => src_ce_net,
    x_out => addsub2_s_net_x2,
    y_out => addsub3_s_net_x2,
    z_out => addsub1_s_net_x2
  );
  vectoring_cell_5 : entity xil_defaultlib.bpsk_receiver_vectoring_cell_5 
  port map (
    x_in => delay12_q_net,
    y_in => delay13_q_net,
    z_in => delay14_q_net,
    clk_20 => src_clk_net,
    ce_20 => src_ce_net,
    x_out => addsub2_s_net_x1,
    y_out => addsub3_s_net_x1,
    z_out => addsub1_s_net_x1
  );
  vectoring_cell_6 : entity xil_defaultlib.bpsk_receiver_vectoring_cell_6 
  port map (
    x_in => delay15_q_net,
    y_in => delay16_q_net,
    z_in => delay17_q_net,
    clk_20 => src_clk_net,
    ce_20 => src_ce_net,
    x_out => addsub2_s_net_x0,
    y_out => addsub3_s_net_x0,
    z_out => addsub1_s_net_x0
  );
  vectoring_cell_7 : entity xil_defaultlib.bpsk_receiver_vectoring_cell_7 
  port map (
    x_in => delay18_q_net,
    y_in => delay19_q_net,
    z_in => delay20_q_net,
    clk_20 => src_clk_net,
    ce_20 => src_ce_net,
    z_out => addsub1_s_net
  );
  constant_x0 : entity xil_defaultlib.sysgen_constant_0734ee2b25 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  delay : entity xil_defaultlib.bpsk_receiver_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 15
  )
  port map (
    en => '1',
    rst => '0',
    d => addsub2_s_net_x6,
    clk => src_clk_net,
    ce => src_ce_net,
    q => delay_q_net
  );
  delay1 : entity xil_defaultlib.bpsk_receiver_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 15
  )
  port map (
    en => '1',
    rst => '0',
    d => addsub3_s_net_x6,
    clk => src_clk_net,
    ce => src_ce_net,
    q => delay1_q_net
  );
  delay10 : entity xil_defaultlib.bpsk_receiver_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 15
  )
  port map (
    en => '1',
    rst => '0',
    d => addsub3_s_net_x3,
    clk => src_clk_net,
    ce => src_ce_net,
    q => delay10_q_net
  );
  delay11 : entity xil_defaultlib.bpsk_receiver_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 20
  )
  port map (
    en => '1',
    rst => '0',
    d => addsub1_s_net_x3,
    clk => src_clk_net,
    ce => src_ce_net,
    q => delay11_q_net
  );
  delay12 : entity xil_defaultlib.bpsk_receiver_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 15
  )
  port map (
    en => '1',
    rst => '0',
    d => addsub2_s_net_x2,
    clk => src_clk_net,
    ce => src_ce_net,
    q => delay12_q_net
  );
  delay13 : entity xil_defaultlib.bpsk_receiver_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 15
  )
  port map (
    en => '1',
    rst => '0',
    d => addsub3_s_net_x2,
    clk => src_clk_net,
    ce => src_ce_net,
    q => delay13_q_net
  );
  delay14 : entity xil_defaultlib.bpsk_receiver_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 20
  )
  port map (
    en => '1',
    rst => '0',
    d => addsub1_s_net_x2,
    clk => src_clk_net,
    ce => src_ce_net,
    q => delay14_q_net
  );
  delay15 : entity xil_defaultlib.bpsk_receiver_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 15
  )
  port map (
    en => '1',
    rst => '0',
    d => addsub2_s_net_x1,
    clk => src_clk_net,
    ce => src_ce_net,
    q => delay15_q_net
  );
  delay16 : entity xil_defaultlib.bpsk_receiver_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 15
  )
  port map (
    en => '1',
    rst => '0',
    d => addsub3_s_net_x1,
    clk => src_clk_net,
    ce => src_ce_net,
    q => delay16_q_net
  );
  delay17 : entity xil_defaultlib.bpsk_receiver_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 20
  )
  port map (
    en => '1',
    rst => '0',
    d => addsub1_s_net_x1,
    clk => src_clk_net,
    ce => src_ce_net,
    q => delay17_q_net
  );
  delay18 : entity xil_defaultlib.bpsk_receiver_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 15
  )
  port map (
    en => '1',
    rst => '0',
    d => addsub2_s_net_x0,
    clk => src_clk_net,
    ce => src_ce_net,
    q => delay18_q_net
  );
  delay19 : entity xil_defaultlib.bpsk_receiver_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 15
  )
  port map (
    en => '1',
    rst => '0',
    d => addsub3_s_net_x0,
    clk => src_clk_net,
    ce => src_ce_net,
    q => delay19_q_net
  );
  delay2 : entity xil_defaultlib.bpsk_receiver_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 20
  )
  port map (
    en => '1',
    rst => '0',
    d => addsub1_s_net_x6,
    clk => src_clk_net,
    ce => src_ce_net,
    q => delay2_q_net
  );
  delay20 : entity xil_defaultlib.bpsk_receiver_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 20
  )
  port map (
    en => '1',
    rst => '0',
    d => addsub1_s_net_x0,
    clk => src_clk_net,
    ce => src_ce_net,
    q => delay20_q_net
  );
  delay23 : entity xil_defaultlib.bpsk_receiver_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 20
  )
  port map (
    en => '1',
    rst => '0',
    d => addsub1_s_net,
    clk => src_clk_net,
    ce => src_ce_net,
    q => delay23_q_net
  );
  delay3 : entity xil_defaultlib.bpsk_receiver_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 15
  )
  port map (
    en => '1',
    rst => '0',
    d => addsub2_s_net_x5,
    clk => src_clk_net,
    ce => src_ce_net,
    q => delay3_q_net
  );
  delay4 : entity xil_defaultlib.bpsk_receiver_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 15
  )
  port map (
    en => '1',
    rst => '0',
    d => addsub3_s_net_x5,
    clk => src_clk_net,
    ce => src_ce_net,
    q => delay4_q_net
  );
  delay5 : entity xil_defaultlib.bpsk_receiver_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 20
  )
  port map (
    en => '1',
    rst => '0',
    d => addsub1_s_net_x5,
    clk => src_clk_net,
    ce => src_ce_net,
    q => delay5_q_net
  );
  delay6 : entity xil_defaultlib.bpsk_receiver_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 15
  )
  port map (
    en => '1',
    rst => '0',
    d => addsub2_s_net_x4,
    clk => src_clk_net,
    ce => src_ce_net,
    q => delay6_q_net
  );
  delay7 : entity xil_defaultlib.bpsk_receiver_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 15
  )
  port map (
    en => '1',
    rst => '0',
    d => addsub3_s_net_x4,
    clk => src_clk_net,
    ce => src_ce_net,
    q => delay7_q_net
  );
  delay8 : entity xil_defaultlib.bpsk_receiver_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 20
  )
  port map (
    en => '1',
    rst => '0',
    d => addsub1_s_net_x4,
    clk => src_clk_net,
    ce => src_ce_net,
    q => delay8_q_net
  );
  delay9 : entity xil_defaultlib.bpsk_receiver_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 15
  )
  port map (
    en => '1',
    rst => '0',
    d => addsub2_s_net_x3,
    clk => src_clk_net,
    ce => src_ce_net,
    q => delay9_q_net
  );
end structural;
-- Generated from Simulink block bpsk_receiver/Carrier Synchronisation/Generate Angle Error
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity bpsk_receiver_generate_angle_error is
  port (
    imag_in : in std_logic_vector( 16-1 downto 0 );
    real_in : in std_logic_vector( 16-1 downto 0 );
    valid_in : in std_logic_vector( 1-1 downto 0 );
    clk_20 : in std_logic;
    ce_20 : in std_logic;
    angle : out std_logic_vector( 20-1 downto 0 );
    valid_out : out std_logic_vector( 1-1 downto 0 )
  );
end bpsk_receiver_generate_angle_error;
architecture structural of bpsk_receiver_generate_angle_error is 
  signal delay23_q_net : std_logic_vector( 20-1 downto 0 );
  signal delay_q_net : std_logic_vector( 1-1 downto 0 );
  signal convert_dout_net : std_logic_vector( 16-1 downto 0 );
  signal register4_q_net : std_logic_vector( 1-1 downto 0 );
  signal register_q_net : std_logic_vector( 16-1 downto 0 );
  signal convert1_dout_net : std_logic_vector( 16-1 downto 0 );
  signal src_ce_net : std_logic;
  signal register1_q_net : std_logic_vector( 16-1 downto 0 );
  signal src_clk_net : std_logic;
  signal register3_q_net : std_logic_vector( 1-1 downto 0 );
begin
  angle <= delay23_q_net;
  valid_out <= delay_q_net;
  convert_dout_net <= imag_in;
  convert1_dout_net <= real_in;
  register4_q_net <= valid_in;
  src_clk_net <= clk_20;
  src_ce_net <= ce_20;
  circular_cordic : entity xil_defaultlib.bpsk_receiver_circular_cordic 
  port map (
    imag_in => register1_q_net,
    real_in => register_q_net,
    clk_20 => src_clk_net,
    ce_20 => src_ce_net,
    angle => delay23_q_net
  );
  delay : entity xil_defaultlib.bpsk_receiver_xldelay 
  generic map (
    latency => 8,
    reg_retiming => 0,
    reset => 0,
    width => 1
  )
  port map (
    en => '1',
    rst => '0',
    d => register3_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    q => delay_q_net
  );
  register_x0 : entity xil_defaultlib.bpsk_receiver_xlregister 
  generic map (
    d_width => 16,
    init_value => b"0000000000000000"
  )
  port map (
    rst => "0",
    d => convert1_dout_net,
    en => register4_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    q => register_q_net
  );
  register1 : entity xil_defaultlib.bpsk_receiver_xlregister 
  generic map (
    d_width => 16,
    init_value => b"0000000000000000"
  )
  port map (
    rst => "0",
    d => convert_dout_net,
    en => register4_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    q => register1_q_net
  );
  register3 : entity xil_defaultlib.bpsk_receiver_xlregister 
  generic map (
    d_width => 1,
    init_value => b"0"
  )
  port map (
    en => "1",
    rst => "0",
    d => register4_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    q => register3_q_net
  );
end structural;
-- Generated from Simulink block bpsk_receiver/Carrier Synchronisation/Generate NCO/Loop Filter
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity bpsk_receiver_loop_filter is
  port (
    signal_x0 : in std_logic_vector( 20-1 downto 0 );
    strobe : in std_logic_vector( 1-1 downto 0 );
    reset : in std_logic_vector( 1-1 downto 0 );
    clk_20 : in std_logic;
    ce_20 : in std_logic;
    error : out std_logic_vector( 37-1 downto 0 );
    valid : out std_logic_vector( 1-1 downto 0 )
  );
end bpsk_receiver_loop_filter;
architecture structural of bpsk_receiver_loop_filter is 
  signal addsub_s_net : std_logic_vector( 36-1 downto 0 );
  signal reset_phase_sync_net : std_logic_vector( 1-1 downto 0 );
  signal delay_q_net : std_logic_vector( 1-1 downto 0 );
  signal delay23_q_net : std_logic_vector( 20-1 downto 0 );
  signal src_clk_net : std_logic;
  signal src_ce_net : std_logic;
  signal register3_q_net : std_logic_vector( 37-1 downto 0 );
  signal register4_q_net : std_logic_vector( 1-1 downto 0 );
  signal k2_gain_p_net : std_logic_vector( 36-1 downto 0 );
  signal register_q_net : std_logic_vector( 36-1 downto 0 );
  signal k1_gain_p_net : std_logic_vector( 36-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 37-1 downto 0 );
  signal register1_q_net : std_logic_vector( 20-1 downto 0 );
begin
  error <= register3_q_net;
  valid <= register4_q_net;
  delay23_q_net <= signal_x0;
  delay_q_net <= strobe;
  reset_phase_sync_net <= reset;
  src_clk_net <= clk_20;
  src_ce_net <= ce_20;
  addsub : entity xil_defaultlib.bpsk_receiver_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 34,
    a_width => 36,
    b_arith => xlSigned,
    b_bin_pt => 34,
    b_width => 36,
    c_has_c_out => 0,
    c_latency => 0,
    c_output_width => 37,
    core_name0 => "bpsk_receiver_c_addsub_v12_0_i0",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 37,
    latency => 0,
    overflow => 3,
    quantization => 1,
    s_arith => xlSigned,
    s_bin_pt => 34,
    s_width => 36
  )
  port map (
    clr => '0',
    en => "1",
    a => k2_gain_p_net,
    b => register_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    s => addsub_s_net
  );
  addsub1 : entity xil_defaultlib.bpsk_receiver_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 34,
    a_width => 36,
    b_arith => xlSigned,
    b_bin_pt => 34,
    b_width => 36,
    c_has_c_out => 0,
    c_latency => 0,
    c_output_width => 37,
    core_name0 => "bpsk_receiver_c_addsub_v12_0_i0",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 37,
    latency => 0,
    overflow => 1,
    quantization => 1,
    s_arith => xlSigned,
    s_bin_pt => 34,
    s_width => 37
  )
  port map (
    clr => '0',
    en => "1",
    a => k1_gain_p_net,
    b => addsub_s_net,
    clk => src_clk_net,
    ce => src_ce_net,
    s => addsub1_s_net
  );
  k1_gain : entity xil_defaultlib.bpsk_receiver_xlcmult 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 18,
    a_width => 20,
    b_bin_pt => 16,
    c_a_type => 0,
    c_a_width => 20,
    c_b_type => 1,
    c_b_width => 16,
    c_output_width => 36,
    core_name0 => "bpsk_receiver_mult_gen_v12_0_i1",
    extra_registers => 0,
    multsign => 2,
    overflow => 1,
    p_arith => xlSigned,
    p_bin_pt => 34,
    p_width => 36,
    quantization => 1,
    zero_const => 0
  )
  port map (
    clr => '0',
    core_clr => '1',
    en => "1",
    rst => "0",
    a => register1_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    core_clk => src_clk_net,
    core_ce => src_ce_net,
    p => k1_gain_p_net
  );
  k2_gain : entity xil_defaultlib.bpsk_receiver_xlcmult 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 18,
    a_width => 20,
    b_bin_pt => 16,
    c_a_type => 0,
    c_a_width => 20,
    c_b_type => 1,
    c_b_width => 16,
    c_output_width => 36,
    core_name0 => "bpsk_receiver_mult_gen_v12_0_i2",
    extra_registers => 0,
    multsign => 2,
    overflow => 1,
    p_arith => xlSigned,
    p_bin_pt => 34,
    p_width => 36,
    quantization => 1,
    zero_const => 0
  )
  port map (
    clr => '0',
    core_clr => '1',
    en => "1",
    rst => "0",
    a => register1_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    core_clk => src_clk_net,
    core_ce => src_ce_net,
    p => k2_gain_p_net
  );
  register_x0 : entity xil_defaultlib.bpsk_receiver_xlregister 
  generic map (
    d_width => 36,
    init_value => b"000000000000000000000000000000000000"
  )
  port map (
    d => addsub_s_net,
    rst => reset_phase_sync_net,
    en => delay_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    q => register_q_net
  );
  register1 : entity xil_defaultlib.bpsk_receiver_xlregister 
  generic map (
    d_width => 20,
    init_value => b"00000000000000000000"
  )
  port map (
    d => delay23_q_net,
    rst => reset_phase_sync_net,
    en => delay_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    q => register1_q_net
  );
  register3 : entity xil_defaultlib.bpsk_receiver_xlregister 
  generic map (
    d_width => 37,
    init_value => b"0000000000000000000000000000000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => addsub1_s_net,
    clk => src_clk_net,
    ce => src_ce_net,
    q => register3_q_net
  );
  register4 : entity xil_defaultlib.bpsk_receiver_xlregister 
  generic map (
    d_width => 1,
    init_value => b"0"
  )
  port map (
    en => "1",
    rst => "0",
    d => delay_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    q => register4_q_net
  );
end structural;
-- Generated from Simulink block bpsk_receiver/Carrier Synchronisation/Generate NCO/NCO
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity bpsk_receiver_nco is
  port (
    step_size : in std_logic_vector( 37-1 downto 0 );
    en_in : in std_logic_vector( 1-1 downto 0 );
    clk_20 : in std_logic;
    ce_20 : in std_logic;
    cos : out std_logic_vector( 16-1 downto 0 );
    neg_sin : out std_logic_vector( 16-1 downto 0 );
    en_out : out std_logic_vector( 1-1 downto 0 )
  );
end bpsk_receiver_nco;
architecture structural of bpsk_receiver_nco is 
  signal cos_rom_data_net : std_logic_vector( 16-1 downto 0 );
  signal neg_sin_rom_data_net : std_logic_vector( 16-1 downto 0 );
  signal register_q_net : std_logic_vector( 1-1 downto 0 );
  signal register3_q_net : std_logic_vector( 37-1 downto 0 );
  signal register4_q_net : std_logic_vector( 1-1 downto 0 );
  signal src_clk_net : std_logic;
  signal src_ce_net : std_logic;
  signal cmult1_p_net : std_logic_vector( 32-1 downto 0 );
  signal addsub4_s_net : std_logic_vector( 32-1 downto 0 );
  signal register1_q_net : std_logic_vector( 32-1 downto 0 );
  signal convert1_dout_net : std_logic_vector( 8-1 downto 0 );
begin
  cos <= cos_rom_data_net;
  neg_sin <= neg_sin_rom_data_net;
  en_out <= register_q_net;
  register3_q_net <= step_size;
  register4_q_net <= en_in;
  src_clk_net <= clk_20;
  src_ce_net <= ce_20;
  addsub4 : entity xil_defaultlib.bpsk_receiver_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 24,
    a_width => 32,
    b_arith => xlSigned,
    b_bin_pt => 24,
    b_width => 32,
    c_has_c_out => 0,
    c_latency => 0,
    c_output_width => 33,
    core_name0 => "bpsk_receiver_c_addsub_v12_0_i1",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 33,
    latency => 0,
    overflow => 1,
    quantization => 1,
    s_arith => xlSigned,
    s_bin_pt => 24,
    s_width => 32
  )
  port map (
    clr => '0',
    en => "1",
    a => cmult1_p_net,
    b => register1_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    s => addsub4_s_net
  );
  cmult1 : entity xil_defaultlib.bpsk_receiver_xlcmult 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 34,
    a_width => 37,
    b_bin_pt => 24,
    c_a_type => 0,
    c_a_width => 37,
    c_b_type => 1,
    c_b_width => 30,
    c_output_width => 67,
    core_name0 => "bpsk_receiver_mult_gen_v12_0_i3",
    extra_registers => 0,
    multsign => 2,
    overflow => 1,
    p_arith => xlSigned,
    p_bin_pt => 24,
    p_width => 32,
    quantization => 1,
    zero_const => 0
  )
  port map (
    clr => '0',
    core_clr => '1',
    en => "1",
    rst => "0",
    a => register3_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    core_clk => src_clk_net,
    core_ce => src_ce_net,
    p => cmult1_p_net
  );
  convert1 : entity xil_defaultlib.bpsk_receiver_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 24,
    din_width => 32,
    dout_arith => 1,
    dout_bin_pt => 0,
    dout_width => 8,
    latency => 0,
    overflow => xlWrap,
    quantization => xlTruncate
  )
  port map (
    clr => '0',
    en => "1",
    din => addsub4_s_net,
    clk => src_clk_net,
    ce => src_ce_net,
    dout => convert1_dout_net
  );
  cos_rom : entity xil_defaultlib.bpsk_receiver_xlsprom 
  generic map (
    c_address_width => 8,
    c_width => 16,
    latency => 1,
    mem_init_file => "xpm_e5ca12_vivado.mem",
    mem_size => 4096,
    mem_type => "block",
    read_reset_val => "0"
  )
  port map (
    en => "1",
    rst => "0",
    addr => convert1_dout_net,
    clk => src_clk_net,
    ce => src_ce_net,
    data => cos_rom_data_net
  );
  neg_sin_rom : entity xil_defaultlib.bpsk_receiver_xlsprom 
  generic map (
    c_address_width => 8,
    c_width => 16,
    latency => 1,
    mem_init_file => "xpm_6f9821_vivado.mem",
    mem_size => 4096,
    mem_type => "block",
    read_reset_val => "0"
  )
  port map (
    en => "1",
    rst => "0",
    addr => convert1_dout_net,
    clk => src_clk_net,
    ce => src_ce_net,
    data => neg_sin_rom_data_net
  );
  register_x0 : entity xil_defaultlib.bpsk_receiver_xlregister 
  generic map (
    d_width => 1,
    init_value => b"0"
  )
  port map (
    en => "1",
    rst => "0",
    d => register4_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    q => register_q_net
  );
  register1 : entity xil_defaultlib.bpsk_receiver_xlregister 
  generic map (
    d_width => 32,
    init_value => b"00000000000000000000000000000000"
  )
  port map (
    rst => "0",
    d => addsub4_s_net,
    en => register4_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    q => register1_q_net
  );
end structural;
-- Generated from Simulink block bpsk_receiver/Carrier Synchronisation/Generate NCO
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity bpsk_receiver_generate_nco is
  port (
    angle : in std_logic_vector( 20-1 downto 0 );
    valid_in : in std_logic_vector( 1-1 downto 0 );
    reset : in std_logic_vector( 1-1 downto 0 );
    clk_20 : in std_logic;
    ce_20 : in std_logic;
    imag_out : out std_logic_vector( 16-1 downto 0 );
    real_out : out std_logic_vector( 16-1 downto 0 );
    valid_out : out std_logic_vector( 1-1 downto 0 )
  );
end bpsk_receiver_generate_nco;
architecture structural of bpsk_receiver_generate_nco is 
  signal reset_phase_sync_net : std_logic_vector( 1-1 downto 0 );
  signal cos_rom_data_net : std_logic_vector( 16-1 downto 0 );
  signal register_q_net : std_logic_vector( 1-1 downto 0 );
  signal delay23_q_net : std_logic_vector( 20-1 downto 0 );
  signal neg_sin_rom_data_net : std_logic_vector( 16-1 downto 0 );
  signal delay_q_net : std_logic_vector( 1-1 downto 0 );
  signal register3_q_net : std_logic_vector( 37-1 downto 0 );
  signal register4_q_net : std_logic_vector( 1-1 downto 0 );
  signal src_clk_net : std_logic;
  signal src_ce_net : std_logic;
begin
  imag_out <= neg_sin_rom_data_net;
  real_out <= cos_rom_data_net;
  valid_out <= register_q_net;
  delay23_q_net <= angle;
  delay_q_net <= valid_in;
  reset_phase_sync_net <= reset;
  src_clk_net <= clk_20;
  src_ce_net <= ce_20;
  loop_filter : entity xil_defaultlib.bpsk_receiver_loop_filter 
  port map (
    signal_x0 => delay23_q_net,
    strobe => delay_q_net,
    reset => reset_phase_sync_net,
    clk_20 => src_clk_net,
    ce_20 => src_ce_net,
    error => register3_q_net,
    valid => register4_q_net
  );
  nco : entity xil_defaultlib.bpsk_receiver_nco 
  port map (
    step_size => register3_q_net,
    en_in => register4_q_net,
    clk_20 => src_clk_net,
    ce_20 => src_ce_net,
    cos => cos_rom_data_net,
    neg_sin => neg_sin_rom_data_net,
    en_out => register_q_net
  );
end structural;
-- Generated from Simulink block bpsk_receiver/Carrier Synchronisation
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity bpsk_receiver_carrier_synchronisation is
  port (
    reset : in std_logic_vector( 1-1 downto 0 );
    valid_in : in std_logic_vector( 1-1 downto 0 );
    real_in : in std_logic_vector( 16-1 downto 0 );
    imag_in : in std_logic_vector( 16-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    clk_20 : in std_logic;
    ce_20 : in std_logic;
    valid_out : out std_logic_vector( 1-1 downto 0 );
    real_out : out std_logic_vector( 16-1 downto 0 );
    imag_out : out std_logic_vector( 16-1 downto 0 )
  );
end bpsk_receiver_carrier_synchronisation;
architecture structural of bpsk_receiver_carrier_synchronisation is 
  signal register_q_net_x0 : std_logic_vector( 1-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 16-1 downto 0 );
  signal clk_net : std_logic;
  signal neg_sin_rom_data_net : std_logic_vector( 16-1 downto 0 );
  signal src_ce_net : std_logic;
  signal register_q_net : std_logic_vector( 33-1 downto 0 );
  signal reset_phase_sync_net : std_logic_vector( 1-1 downto 0 );
  signal register1_q_net : std_logic_vector( 33-1 downto 0 );
  signal register4_q_net : std_logic_vector( 1-1 downto 0 );
  signal delay3_q_net : std_logic_vector( 1-1 downto 0 );
  signal delay2_q_net : std_logic_vector( 16-1 downto 0 );
  signal delay_q_net : std_logic_vector( 1-1 downto 0 );
  signal cos_rom_data_net : std_logic_vector( 16-1 downto 0 );
  signal ce_net : std_logic;
  signal delay23_q_net : std_logic_vector( 20-1 downto 0 );
  signal convert_dout_net : std_logic_vector( 16-1 downto 0 );
  signal src_clk_net : std_logic;
  signal convert1_dout_net : std_logic_vector( 16-1 downto 0 );
begin
  valid_out <= register4_q_net;
  real_out <= convert1_dout_net;
  imag_out <= convert_dout_net;
  reset_phase_sync_net <= reset;
  delay3_q_net <= valid_in;
  delay1_q_net <= real_in;
  delay2_q_net <= imag_in;
  clk_net <= clk_1;
  ce_net <= ce_1;
  src_clk_net <= clk_20;
  src_ce_net <= ce_20;
  de_rotate_constellation : entity xil_defaultlib.bpsk_receiver_de_rotate_constellation 
  port map (
    imag_in => delay2_q_net,
    real_in => delay1_q_net,
    valid_in => delay3_q_net,
    imag_error => neg_sin_rom_data_net,
    real_error => cos_rom_data_net,
    valid_error => register_q_net_x0,
    clk_1 => clk_net,
    ce_1 => ce_net,
    clk_20 => src_clk_net,
    ce_20 => src_ce_net,
    imag_out => register1_q_net,
    real_out => register_q_net,
    valid_out => register4_q_net
  );
  generate_angle_error : entity xil_defaultlib.bpsk_receiver_generate_angle_error 
  port map (
    imag_in => convert_dout_net,
    real_in => convert1_dout_net,
    valid_in => register4_q_net,
    clk_20 => src_clk_net,
    ce_20 => src_ce_net,
    angle => delay23_q_net,
    valid_out => delay_q_net
  );
  generate_nco : entity xil_defaultlib.bpsk_receiver_generate_nco 
  port map (
    angle => delay23_q_net,
    valid_in => delay_q_net,
    reset => reset_phase_sync_net,
    clk_20 => src_clk_net,
    ce_20 => src_ce_net,
    imag_out => neg_sin_rom_data_net,
    real_out => cos_rom_data_net,
    valid_out => register_q_net_x0
  );
  convert : entity xil_defaultlib.bpsk_receiver_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 28,
    din_width => 33,
    dout_arith => 2,
    dout_bin_pt => 14,
    dout_width => 16,
    latency => 0,
    overflow => xlWrap,
    quantization => xlTruncate
  )
  port map (
    clr => '0',
    en => "1",
    din => register1_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    dout => convert_dout_net
  );
  convert1 : entity xil_defaultlib.bpsk_receiver_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 28,
    din_width => 33,
    dout_arith => 2,
    dout_bin_pt => 14,
    dout_width => 16,
    latency => 0,
    overflow => xlWrap,
    quantization => xlTruncate
  )
  port map (
    clr => '0',
    en => "1",
    din => register_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    dout => convert1_dout_net
  );
end structural;
-- Generated from Simulink block bpsk_receiver/Coarse Frequency Synchronisation/Apply Frequency Offset Correction
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity bpsk_receiver_apply_frequency_offset_correction is
  port (
    imag_in : in std_logic_vector( 16-1 downto 0 );
    real_in : in std_logic_vector( 16-1 downto 0 );
    cos : in std_logic_vector( 16-1 downto 0 );
    sin : in std_logic_vector( 16-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    clk_5 : in std_logic;
    ce_5 : in std_logic;
    imag_out : out std_logic_vector( 16-1 downto 0 );
    real_out : out std_logic_vector( 16-1 downto 0 )
  );
end bpsk_receiver_apply_frequency_offset_correction;
architecture structural of bpsk_receiver_apply_frequency_offset_correction is 
  signal convert1_dout_net : std_logic_vector( 16-1 downto 0 );
  signal convert_dout_net : std_logic_vector( 16-1 downto 0 );
  signal cmult2_p_net : std_logic_vector( 16-1 downto 0 );
  signal cos_rom_data_net : std_logic_vector( 16-1 downto 0 );
  signal sin_rom_data_net : std_logic_vector( 16-1 downto 0 );
  signal clk_net : std_logic;
  signal cmult1_p_net : std_logic_vector( 16-1 downto 0 );
  signal ce_5_net : std_logic;
  signal ce_net : std_logic;
  signal product_p_im_net : std_logic_vector( 33-1 downto 0 );
  signal clk_5_net : std_logic;
  signal product_p_re_net : std_logic_vector( 33-1 downto 0 );
begin
  imag_out <= convert1_dout_net;
  real_out <= convert_dout_net;
  cmult1_p_net <= imag_in;
  cmult2_p_net <= real_in;
  cos_rom_data_net <= cos;
  sin_rom_data_net <= sin;
  clk_net <= clk_1;
  ce_net <= ce_1;
  clk_5_net <= clk_5;
  ce_5_net <= ce_5;
  convert : entity xil_defaultlib.bpsk_receiver_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 28,
    din_width => 33,
    dout_arith => 2,
    dout_bin_pt => 14,
    dout_width => 16,
    latency => 0,
    overflow => xlSaturate,
    quantization => xlTruncate
  )
  port map (
    clr => '0',
    en => "1",
    din => product_p_re_net,
    clk => clk_5_net,
    ce => ce_5_net,
    dout => convert_dout_net
  );
  convert1 : entity xil_defaultlib.bpsk_receiver_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 28,
    din_width => 33,
    dout_arith => 2,
    dout_bin_pt => 14,
    dout_width => 16,
    latency => 0,
    overflow => xlSaturate,
    quantization => xlTruncate
  )
  port map (
    clr => '0',
    en => "1",
    din => product_p_im_net,
    clk => clk_5_net,
    ce => ce_5_net,
    dout => convert1_dout_net
  );
  product : entity xil_defaultlib.xlbpsk_receiver_cmpy_v6_0_i0_b12635ef7921d62dc55bb019f70b2741 
  port map (
    a_re => cmult2_p_net,
    a_im => cmult1_p_net,
    b_re => cos_rom_data_net,
    b_im => sin_rom_data_net,
    clk => clk_net,
    ce => ce_net,
    clk_5 => clk_5_net,
    ce_5 => ce_5_net,
    p_re => product_p_re_net,
    p_im => product_p_im_net
  );
end structural;
-- Generated from Simulink block bpsk_receiver/Coarse Frequency Synchronisation/Get Frequency Offset
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity bpsk_receiver_get_frequency_offset is
  port (
    mag_in : in std_logic_vector( 32-1 downto 0 );
    sof : in std_logic_vector( 1-1 downto 0 );
    clk_5 : in std_logic;
    ce_5 : in std_logic;
    offset_out : out std_logic_vector( 32-1 downto 0 )
  );
end bpsk_receiver_get_frequency_offset;
architecture structural of bpsk_receiver_get_frequency_offset is 
  signal register2_q_net : std_logic_vector( 10-1 downto 0 );
  signal rom_data_net : std_logic_vector( 32-1 downto 0 );
  signal clk_5_net : std_logic;
  signal constant_op_net : std_logic_vector( 10-1 downto 0 );
  signal counter_op_net : std_logic_vector( 10-1 downto 0 );
  signal shift_op_net : std_logic_vector( 32-1 downto 0 );
  signal ce_5_net : std_logic;
  signal register_q_net : std_logic_vector( 1-1 downto 0 );
  signal register4_q_net : std_logic_vector( 32-1 downto 0 );
  signal register1_q_net : std_logic_vector( 10-1 downto 0 );
  signal relational_op_net : std_logic_vector( 1-1 downto 0 );
  signal register3_q_net : std_logic_vector( 1-1 downto 0 );
  signal register_q_net_x0 : std_logic_vector( 32-1 downto 0 );
  signal relational1_op_net : std_logic_vector( 1-1 downto 0 );
begin
  offset_out <= rom_data_net;
  shift_op_net <= mag_in;
  register_q_net <= sof;
  clk_5_net <= clk_5;
  ce_5_net <= ce_5;
  constant_x0 : entity xil_defaultlib.sysgen_constant_774a605eb4 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  counter : entity xil_defaultlib.bpsk_receiver_xlcounter_limit 
  generic map (
    cnt_15_0 => 1023,
    cnt_31_16 => 0,
    cnt_47_32 => 0,
    cnt_63_48 => 0,
    core_name0 => "bpsk_receiver_c_counter_binary_v12_0_i0",
    count_limited => 0,
    op_arith => xlUnsigned,
    op_width => 10
  )
  port map (
    en => "1",
    clr => '0',
    rst => register_q_net,
    clk => clk_5_net,
    ce => ce_5_net,
    op => counter_op_net
  );
  rom : entity xil_defaultlib.bpsk_receiver_xlsprom 
  generic map (
    c_address_width => 10,
    c_width => 32,
    latency => 1,
    mem_init_file => "xpm_e45989_vivado.mem",
    mem_size => 32768,
    mem_type => "block",
    read_reset_val => "0"
  )
  port map (
    en => "1",
    rst => "0",
    addr => register2_q_net,
    clk => clk_5_net,
    ce => ce_5_net,
    data => rom_data_net
  );
  register_x0 : entity xil_defaultlib.bpsk_receiver_xlregister 
  generic map (
    d_width => 32,
    init_value => b"00000000000000000000000000000000"
  )
  port map (
    d => register4_q_net,
    rst => relational_op_net,
    en => relational1_op_net,
    clk => clk_5_net,
    ce => ce_5_net,
    q => register_q_net_x0
  );
  register1 : entity xil_defaultlib.bpsk_receiver_xlregister 
  generic map (
    d_width => 10,
    init_value => b"0000000000"
  )
  port map (
    rst => "0",
    d => counter_op_net,
    en => relational1_op_net,
    clk => clk_5_net,
    ce => ce_5_net,
    q => register1_q_net
  );
  register2 : entity xil_defaultlib.bpsk_receiver_xlregister 
  generic map (
    d_width => 10,
    init_value => b"0000000000"
  )
  port map (
    rst => "0",
    d => register1_q_net,
    en => register3_q_net,
    clk => clk_5_net,
    ce => ce_5_net,
    q => register2_q_net
  );
  register3 : entity xil_defaultlib.bpsk_receiver_xlregister 
  generic map (
    d_width => 1,
    init_value => b"0"
  )
  port map (
    en => "1",
    rst => "0",
    d => relational_op_net,
    clk => clk_5_net,
    ce => ce_5_net,
    q => register3_q_net
  );
  register4 : entity xil_defaultlib.bpsk_receiver_xlregister 
  generic map (
    d_width => 32,
    init_value => b"00000000000000000000000000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => shift_op_net,
    clk => clk_5_net,
    ce => ce_5_net,
    q => register4_q_net
  );
  relational : entity xil_defaultlib.sysgen_relational_b7f2358c2c 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    a => constant_op_net,
    b => counter_op_net,
    op => relational_op_net
  );
  relational1 : entity xil_defaultlib.sysgen_relational_fd5ba174e9 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    a => register4_q_net,
    b => register_q_net_x0,
    op => relational1_op_net
  );
end structural;
-- Generated from Simulink block bpsk_receiver/Coarse Frequency Synchronisation/Get Spectrum Magnitude/Rising Edge Detector
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity bpsk_receiver_rising_edge_detector is
  port (
    input : in std_logic_vector( 1-1 downto 0 );
    clk_5 : in std_logic;
    ce_5 : in std_logic;
    output : out std_logic_vector( 1-1 downto 0 )
  );
end bpsk_receiver_rising_edge_detector;
architecture structural of bpsk_receiver_rising_edge_detector is 
  signal register1_q_net : std_logic_vector( 1-1 downto 0 );
  signal logical_y_net : std_logic_vector( 1-1 downto 0 );
  signal ce_5_net : std_logic;
  signal clk_5_net : std_logic;
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal relational_op_net : std_logic_vector( 1-1 downto 0 );
begin
  output <= logical_y_net;
  relational_op_net <= input;
  clk_5_net <= clk_5;
  ce_5_net <= ce_5;
  inverter : entity xil_defaultlib.sysgen_inverter_8255e2898d 
  port map (
    clr => '0',
    ip => register1_q_net,
    clk => clk_5_net,
    ce => ce_5_net,
    op => inverter_op_net
  );
  logical : entity xil_defaultlib.sysgen_logical_4fdeb13a07 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => inverter_op_net,
    d1 => relational_op_net,
    y => logical_y_net
  );
  register1 : entity xil_defaultlib.bpsk_receiver_xlregister 
  generic map (
    d_width => 1,
    init_value => b"0"
  )
  port map (
    en => "1",
    rst => "0",
    d => relational_op_net,
    clk => clk_5_net,
    ce => ce_5_net,
    q => register1_q_net
  );
end structural;
-- Generated from Simulink block bpsk_receiver/Coarse Frequency Synchronisation/Get Spectrum Magnitude
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity bpsk_receiver_get_spectrum_magnitude is
  port (
    imag_in : in std_logic_vector( 32-1 downto 0 );
    real_in : in std_logic_vector( 32-1 downto 0 );
    clk_5 : in std_logic;
    ce_5 : in std_logic;
    mag_out : out std_logic_vector( 32-1 downto 0 );
    sof_out : out std_logic_vector( 1-1 downto 0 )
  );
end bpsk_receiver_get_spectrum_magnitude;
architecture structural of bpsk_receiver_get_spectrum_magnitude is 
  signal fft_op_re_net : std_logic_vector( 32-1 downto 0 );
  signal fft_op_im_net : std_logic_vector( 32-1 downto 0 );
  signal register2_q_net : std_logic_vector( 32-1 downto 0 );
  signal convert1_dout_net : std_logic_vector( 32-1 downto 0 );
  signal relational_op_net : std_logic_vector( 1-1 downto 0 );
  signal clk_5_net : std_logic;
  signal convert3_dout_net : std_logic_vector( 32-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 64-1 downto 0 );
  signal constant_op_net : std_logic_vector( 1-1 downto 0 );
  signal register_q_net : std_logic_vector( 1-1 downto 0 );
  signal mult4_p_net : std_logic_vector( 63-1 downto 0 );
  signal counter_op_net : std_logic_vector( 10-1 downto 0 );
  signal ce_5_net : std_logic;
  signal logical_y_net : std_logic_vector( 1-1 downto 0 );
  signal delay_q_net : std_logic_vector( 1-1 downto 0 );
  signal shift_op_net : std_logic_vector( 32-1 downto 0 );
  signal mult1_p_net : std_logic_vector( 63-1 downto 0 );
  signal fft_start_frame_out_net : std_logic_vector( 1-1 downto 0 );
  signal register1_q_net : std_logic_vector( 32-1 downto 0 );
begin
  mag_out <= shift_op_net;
  sof_out <= register_q_net;
  convert3_dout_net <= imag_in;
  convert1_dout_net <= real_in;
  clk_5_net <= clk_5;
  ce_5_net <= ce_5;
  rising_edge_detector_x0 : entity xil_defaultlib.bpsk_receiver_rising_edge_detector 
  port map (
    input => relational_op_net,
    clk_5 => clk_5_net,
    ce_5 => ce_5_net,
    output => logical_y_net
  );
  addsub : entity xil_defaultlib.bpsk_receiver_xladdsub 
  generic map (
    a_arith => xlUnsigned,
    a_bin_pt => 62,
    a_width => 63,
    b_arith => xlUnsigned,
    b_bin_pt => 62,
    b_width => 63,
    c_has_c_out => 0,
    c_latency => 1,
    c_output_width => 64,
    core_name0 => "bpsk_receiver_c_addsub_v12_0_i2",
    extra_registers => 0,
    full_s_arith => 1,
    full_s_width => 64,
    latency => 1,
    overflow => 1,
    quantization => 1,
    s_arith => xlUnsigned,
    s_bin_pt => 62,
    s_width => 64
  )
  port map (
    clr => '0',
    en => "1",
    a => mult4_p_net,
    b => mult1_p_net,
    clk => clk_5_net,
    ce => ce_5_net,
    s => addsub_s_net
  );
  constant_x0 : entity xil_defaultlib.sysgen_constant_fa24cb9652 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  counter : entity xil_defaultlib.bpsk_receiver_xlcounter_limit 
  generic map (
    cnt_15_0 => 1023,
    cnt_31_16 => 0,
    cnt_47_32 => 0,
    cnt_63_48 => 0,
    core_name0 => "bpsk_receiver_c_counter_binary_v12_0_i0",
    count_limited => 0,
    op_arith => xlUnsigned,
    op_width => 10
  )
  port map (
    en => "1",
    rst => "0",
    clr => '0',
    clk => clk_5_net,
    ce => ce_5_net,
    op => counter_op_net
  );
  delay : entity xil_defaultlib.bpsk_receiver_xldelay 
  generic map (
    latency => 3,
    reg_retiming => 0,
    reset => 0,
    width => 1
  )
  port map (
    en => '1',
    rst => '0',
    d => fft_start_frame_out_net,
    clk => clk_5_net,
    ce => ce_5_net,
    q => delay_q_net
  );
  fft : entity xil_defaultlib.xlbpsk_receiver_xfft_v9_1_i0_3d1edced8406803b4d08989e855d8f73_wrapper 
  port map (
    in_re => register2_q_net,
    in_im => register1_q_net,
    start_frame_in => logical_y_net,
    clk => clk_5_net,
    ce => ce_5_net,
    op_re => fft_op_re_net,
    op_im => fft_op_im_net,
    start_frame_out => fft_start_frame_out_net
  );
  mult1 : entity xil_defaultlib.bpsk_receiver_xlmult 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 31,
    a_width => 32,
    b_arith => xlSigned,
    b_bin_pt => 31,
    b_width => 32,
    c_a_type => 0,
    c_a_width => 32,
    c_b_type => 0,
    c_b_width => 32,
    c_baat => 32,
    c_output_width => 64,
    c_type => 0,
    core_name0 => "bpsk_receiver_mult_gen_v12_0_i4",
    extra_registers => 1,
    multsign => 2,
    overflow => 2,
    p_arith => xlUnsigned,
    p_bin_pt => 62,
    p_width => 63,
    quantization => 1
  )
  port map (
    clr => '0',
    core_clr => '1',
    en => "1",
    rst => "0",
    a => fft_op_im_net,
    b => fft_op_im_net,
    clk => clk_5_net,
    ce => ce_5_net,
    core_clk => clk_5_net,
    core_ce => ce_5_net,
    p => mult1_p_net
  );
  mult4 : entity xil_defaultlib.bpsk_receiver_xlmult 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 31,
    a_width => 32,
    b_arith => xlSigned,
    b_bin_pt => 31,
    b_width => 32,
    c_a_type => 0,
    c_a_width => 32,
    c_b_type => 0,
    c_b_width => 32,
    c_baat => 32,
    c_output_width => 64,
    c_type => 0,
    core_name0 => "bpsk_receiver_mult_gen_v12_0_i4",
    extra_registers => 1,
    multsign => 2,
    overflow => 2,
    p_arith => xlUnsigned,
    p_bin_pt => 62,
    p_width => 63,
    quantization => 1
  )
  port map (
    clr => '0',
    core_clr => '1',
    en => "1",
    rst => "0",
    a => fft_op_re_net,
    b => fft_op_re_net,
    clk => clk_5_net,
    ce => ce_5_net,
    core_clk => clk_5_net,
    core_ce => ce_5_net,
    p => mult4_p_net
  );
  register_x0 : entity xil_defaultlib.bpsk_receiver_xlregister 
  generic map (
    d_width => 1,
    init_value => b"0"
  )
  port map (
    en => "1",
    rst => "0",
    d => delay_q_net,
    clk => clk_5_net,
    ce => ce_5_net,
    q => register_q_net
  );
  register1 : entity xil_defaultlib.bpsk_receiver_xlregister 
  generic map (
    d_width => 32,
    init_value => b"00000000000000000000000000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => convert3_dout_net,
    clk => clk_5_net,
    ce => ce_5_net,
    q => register1_q_net
  );
  register2 : entity xil_defaultlib.bpsk_receiver_xlregister 
  generic map (
    d_width => 32,
    init_value => b"00000000000000000000000000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => convert1_dout_net,
    clk => clk_5_net,
    ce => ce_5_net,
    q => register2_q_net
  );
  relational : entity xil_defaultlib.sysgen_relational_1bfb613ad3 
  port map (
    clr => '0',
    a => counter_op_net,
    b => constant_op_net,
    clk => clk_5_net,
    ce => ce_5_net,
    op => relational_op_net
  );
  shift : entity xil_defaultlib.sysgen_shift_bcb74114cc 
  port map (
    clr => '0',
    ip => addsub_s_net,
    clk => clk_5_net,
    ce => ce_5_net,
    op => shift_op_net
  );
end structural;
-- Generated from Simulink block bpsk_receiver/Coarse Frequency Synchronisation/Increase Signal Power
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity bpsk_receiver_increase_signal_power is
  port (
    imag_in : in std_logic_vector( 16-1 downto 0 );
    real_in : in std_logic_vector( 16-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    clk_5 : in std_logic;
    ce_5 : in std_logic;
    imag_out : out std_logic_vector( 32-1 downto 0 );
    real_out : out std_logic_vector( 32-1 downto 0 )
  );
end bpsk_receiver_increase_signal_power;
architecture structural of bpsk_receiver_increase_signal_power is 
  signal cmult1_p_net : std_logic_vector( 16-1 downto 0 );
  signal cmult2_p_net : std_logic_vector( 16-1 downto 0 );
  signal convert1_dout_net : std_logic_vector( 32-1 downto 0 );
  signal clk_net : std_logic;
  signal convert3_dout_net : std_logic_vector( 32-1 downto 0 );
  signal ce_net : std_logic;
  signal convert2_dout_net : std_logic_vector( 18-1 downto 0 );
  signal product_p_im_net : std_logic_vector( 33-1 downto 0 );
  signal convert_dout_net : std_logic_vector( 18-1 downto 0 );
  signal ce_5_net : std_logic;
  signal product_p_re_net : std_logic_vector( 33-1 downto 0 );
  signal clk_5_net : std_logic;
  signal product1_p_im_net : std_logic_vector( 37-1 downto 0 );
  signal product1_p_re_net : std_logic_vector( 37-1 downto 0 );
begin
  imag_out <= convert3_dout_net;
  real_out <= convert1_dout_net;
  cmult1_p_net <= imag_in;
  cmult2_p_net <= real_in;
  clk_net <= clk_1;
  ce_net <= ce_1;
  clk_5_net <= clk_5;
  ce_5_net <= ce_5;
  convert : entity xil_defaultlib.bpsk_receiver_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 28,
    din_width => 33,
    dout_arith => 2,
    dout_bin_pt => 15,
    dout_width => 18,
    latency => 0,
    overflow => xlWrap,
    quantization => xlTruncate
  )
  port map (
    clr => '0',
    en => "1",
    din => product_p_re_net,
    clk => clk_5_net,
    ce => ce_5_net,
    dout => convert_dout_net
  );
  convert1 : entity xil_defaultlib.bpsk_receiver_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 30,
    din_width => 37,
    dout_arith => 2,
    dout_bin_pt => 31,
    dout_width => 32,
    latency => 0,
    overflow => xlWrap,
    quantization => xlTruncate
  )
  port map (
    clr => '0',
    en => "1",
    din => product1_p_re_net,
    clk => clk_5_net,
    ce => ce_5_net,
    dout => convert1_dout_net
  );
  convert2 : entity xil_defaultlib.bpsk_receiver_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 28,
    din_width => 33,
    dout_arith => 2,
    dout_bin_pt => 15,
    dout_width => 18,
    latency => 0,
    overflow => xlWrap,
    quantization => xlTruncate
  )
  port map (
    clr => '0',
    en => "1",
    din => product_p_im_net,
    clk => clk_5_net,
    ce => ce_5_net,
    dout => convert2_dout_net
  );
  convert3 : entity xil_defaultlib.bpsk_receiver_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 30,
    din_width => 37,
    dout_arith => 2,
    dout_bin_pt => 31,
    dout_width => 32,
    latency => 0,
    overflow => xlWrap,
    quantization => xlTruncate
  )
  port map (
    clr => '0',
    en => "1",
    din => product1_p_im_net,
    clk => clk_5_net,
    ce => ce_5_net,
    dout => convert3_dout_net
  );
  product : entity xil_defaultlib.xlbpsk_receiver_cmpy_v6_0_i0_b12635ef7921d62dc55bb019f70b2741 
  port map (
    a_re => cmult2_p_net,
    a_im => cmult1_p_net,
    b_re => cmult2_p_net,
    b_im => cmult1_p_net,
    clk => clk_net,
    ce => ce_net,
    clk_5 => clk_5_net,
    ce_5 => ce_5_net,
    p_re => product_p_re_net,
    p_im => product_p_im_net
  );
  product1 : entity xil_defaultlib.xlbpsk_receiver_cmpy_v6_0_i1_2d5de8986c54f6ed817092c490b8264a 
  port map (
    a_re => convert_dout_net,
    a_im => convert2_dout_net,
    b_re => convert_dout_net,
    b_im => convert2_dout_net,
    clk => clk_net,
    ce => ce_net,
    clk_5 => clk_5_net,
    ce_5 => ce_5_net,
    p_re => product1_p_re_net,
    p_im => product1_p_im_net
  );
end structural;
-- Generated from Simulink block bpsk_receiver/Coarse Frequency Synchronisation/NCO
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity bpsk_receiver_nco_x0 is
  port (
    offset_in : in std_logic_vector( 32-1 downto 0 );
    clk_5 : in std_logic;
    ce_5 : in std_logic;
    cos : out std_logic_vector( 16-1 downto 0 );
    sin : out std_logic_vector( 16-1 downto 0 )
  );
end bpsk_receiver_nco_x0;
architecture structural of bpsk_receiver_nco_x0 is 
  signal clk_5_net : std_logic;
  signal sin_rom_data_net : std_logic_vector( 16-1 downto 0 );
  signal cos_rom_data_net : std_logic_vector( 16-1 downto 0 );
  signal rom_data_net : std_logic_vector( 32-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 41-1 downto 0 );
  signal delay2_q_net : std_logic_vector( 41-1 downto 0 );
  signal ce_5_net : std_logic;
  signal cmult_p_net : std_logic_vector( 42-1 downto 0 );
  signal convert4_dout_net : std_logic_vector( 10-1 downto 0 );
begin
  cos <= cos_rom_data_net;
  sin <= sin_rom_data_net;
  rom_data_net <= offset_in;
  clk_5_net <= clk_5;
  ce_5_net <= ce_5;
  addsub : entity xil_defaultlib.bpsk_receiver_xladdsub 
  generic map (
    a_arith => xlUnsigned,
    a_bin_pt => 31,
    a_width => 41,
    b_arith => xlSigned,
    b_bin_pt => 31,
    b_width => 42,
    c_has_c_out => 0,
    c_latency => 0,
    c_output_width => 43,
    core_name0 => "bpsk_receiver_c_addsub_v12_0_i3",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 43,
    latency => 0,
    overflow => 1,
    quantization => 1,
    s_arith => xlUnsigned,
    s_bin_pt => 31,
    s_width => 41
  )
  port map (
    clr => '0',
    en => "1",
    a => delay2_q_net,
    b => cmult_p_net,
    clk => clk_5_net,
    ce => ce_5_net,
    s => addsub_s_net
  );
  cmult : entity xil_defaultlib.bpsk_receiver_xlcmult 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 10,
    a_width => 32,
    b_bin_pt => 31,
    c_a_type => 0,
    c_a_width => 32,
    c_b_type => 1,
    c_b_width => 32,
    c_output_width => 64,
    core_name0 => "bpsk_receiver_mult_gen_v12_0_i5",
    extra_registers => 0,
    multsign => 2,
    overflow => 2,
    p_arith => xlSigned,
    p_bin_pt => 31,
    p_width => 42,
    quantization => 1,
    zero_const => 0
  )
  port map (
    clr => '0',
    core_clr => '1',
    en => "1",
    rst => "0",
    a => rom_data_net,
    clk => clk_5_net,
    ce => ce_5_net,
    core_clk => clk_5_net,
    core_ce => ce_5_net,
    p => cmult_p_net
  );
  convert4 : entity xil_defaultlib.bpsk_receiver_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 1,
    din_bin_pt => 31,
    din_width => 41,
    dout_arith => 1,
    dout_bin_pt => 0,
    dout_width => 10,
    latency => 0,
    overflow => xlWrap,
    quantization => xlTruncate
  )
  port map (
    clr => '0',
    en => "1",
    din => addsub_s_net,
    clk => clk_5_net,
    ce => ce_5_net,
    dout => convert4_dout_net
  );
  delay2 : entity xil_defaultlib.bpsk_receiver_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 41
  )
  port map (
    en => '1',
    rst => '0',
    d => addsub_s_net,
    clk => clk_5_net,
    ce => ce_5_net,
    q => delay2_q_net
  );
  sin_rom : entity xil_defaultlib.bpsk_receiver_xlsprom 
  generic map (
    c_address_width => 10,
    c_width => 16,
    latency => 1,
    mem_init_file => "xpm_62270a_vivado.mem",
    mem_size => 16384,
    mem_type => "block",
    read_reset_val => "0"
  )
  port map (
    en => "1",
    rst => "0",
    addr => convert4_dout_net,
    clk => clk_5_net,
    ce => ce_5_net,
    data => sin_rom_data_net
  );
  cos_rom : entity xil_defaultlib.bpsk_receiver_xlsprom 
  generic map (
    c_address_width => 10,
    c_width => 16,
    latency => 1,
    mem_init_file => "xpm_3986c8_vivado.mem",
    mem_size => 16384,
    mem_type => "block",
    read_reset_val => "0"
  )
  port map (
    en => "1",
    rst => "0",
    addr => convert4_dout_net,
    clk => clk_5_net,
    ce => ce_5_net,
    data => cos_rom_data_net
  );
end structural;
-- Generated from Simulink block bpsk_receiver/Coarse Frequency Synchronisation
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity bpsk_receiver_coarse_frequency_synchronisation is
  port (
    passthrough : in std_logic_vector( 1-1 downto 0 );
    valid_in : in std_logic;
    real_in : in std_logic_vector( 16-1 downto 0 );
    imag_in : in std_logic_vector( 16-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    clk_5 : in std_logic;
    ce_5 : in std_logic;
    valid_out : out std_logic_vector( 1-1 downto 0 );
    real_out : out std_logic_vector( 16-1 downto 0 );
    imag_out : out std_logic_vector( 16-1 downto 0 );
    freq_offset : out std_logic_vector( 32-1 downto 0 )
  );
end bpsk_receiver_coarse_frequency_synchronisation;
architecture structural of bpsk_receiver_coarse_frequency_synchronisation is 
  signal coarse_passthrough_net : std_logic_vector( 1-1 downto 0 );
  signal cic_decimator_real_m_axis_data_tvalid_net : std_logic;
  signal cmult2_p_net : std_logic_vector( 16-1 downto 0 );
  signal mux_y_net : std_logic_vector( 16-1 downto 0 );
  signal rom_data_net : std_logic_vector( 32-1 downto 0 );
  signal cmult1_p_net : std_logic_vector( 16-1 downto 0 );
  signal mux1_y_net : std_logic_vector( 16-1 downto 0 );
  signal delay_q_net : std_logic_vector( 1-1 downto 0 );
  signal convert3_dout_net : std_logic_vector( 32-1 downto 0 );
  signal cos_rom_data_net : std_logic_vector( 16-1 downto 0 );
  signal register_q_net : std_logic_vector( 1-1 downto 0 );
  signal clk_5_net : std_logic;
  signal convert_dout_net : std_logic_vector( 16-1 downto 0 );
  signal convert1_dout_net : std_logic_vector( 16-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 16-1 downto 0 );
  signal shift_op_net : std_logic_vector( 32-1 downto 0 );
  signal sin_rom_data_net : std_logic_vector( 16-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_5_net : std_logic;
  signal convert1_dout_net_x0 : std_logic_vector( 32-1 downto 0 );
  signal ce_net : std_logic;
  signal delay2_q_net : std_logic_vector( 16-1 downto 0 );
begin
  valid_out <= delay_q_net;
  real_out <= mux1_y_net;
  imag_out <= mux_y_net;
  freq_offset <= rom_data_net;
  coarse_passthrough_net <= passthrough;
  cic_decimator_real_m_axis_data_tvalid_net <= valid_in;
  cmult2_p_net <= real_in;
  cmult1_p_net <= imag_in;
  clk_net <= clk_1;
  ce_net <= ce_1;
  clk_5_net <= clk_5;
  ce_5_net <= ce_5;
  apply_frequency_offset_correction : entity xil_defaultlib.bpsk_receiver_apply_frequency_offset_correction 
  port map (
    imag_in => cmult1_p_net,
    real_in => cmult2_p_net,
    cos => cos_rom_data_net,
    sin => sin_rom_data_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    clk_5 => clk_5_net,
    ce_5 => ce_5_net,
    imag_out => convert1_dout_net,
    real_out => convert_dout_net
  );
  get_frequency_offset : entity xil_defaultlib.bpsk_receiver_get_frequency_offset 
  port map (
    mag_in => shift_op_net,
    sof => register_q_net,
    clk_5 => clk_5_net,
    ce_5 => ce_5_net,
    offset_out => rom_data_net
  );
  get_spectrum_magnitude : entity xil_defaultlib.bpsk_receiver_get_spectrum_magnitude 
  port map (
    imag_in => convert3_dout_net,
    real_in => convert1_dout_net_x0,
    clk_5 => clk_5_net,
    ce_5 => ce_5_net,
    mag_out => shift_op_net,
    sof_out => register_q_net
  );
  increase_signal_power : entity xil_defaultlib.bpsk_receiver_increase_signal_power 
  port map (
    imag_in => cmult1_p_net,
    real_in => cmult2_p_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    clk_5 => clk_5_net,
    ce_5 => ce_5_net,
    imag_out => convert3_dout_net,
    real_out => convert1_dout_net_x0
  );
  nco : entity xil_defaultlib.bpsk_receiver_nco_x0 
  port map (
    offset_in => rom_data_net,
    clk_5 => clk_5_net,
    ce_5 => ce_5_net,
    cos => cos_rom_data_net,
    sin => sin_rom_data_net
  );
  delay : entity xil_defaultlib.bpsk_receiver_xldelay 
  generic map (
    latency => 4,
    reg_retiming => 0,
    reset => 0,
    width => 1
  )
  port map (
    en => '1',
    rst => '0',
    d(0) => cic_decimator_real_m_axis_data_tvalid_net,
    clk => clk_5_net,
    ce => ce_5_net,
    q => delay_q_net
  );
  delay1 : entity xil_defaultlib.bpsk_receiver_xldelay 
  generic map (
    latency => 4,
    reg_retiming => 0,
    reset => 0,
    width => 16
  )
  port map (
    en => '1',
    rst => '0',
    d => cmult1_p_net,
    clk => clk_5_net,
    ce => ce_5_net,
    q => delay1_q_net
  );
  delay2 : entity xil_defaultlib.bpsk_receiver_xldelay 
  generic map (
    latency => 4,
    reg_retiming => 0,
    reset => 0,
    width => 16
  )
  port map (
    en => '1',
    rst => '0',
    d => cmult2_p_net,
    clk => clk_5_net,
    ce => ce_5_net,
    q => delay2_q_net
  );
  mux : entity xil_defaultlib.sysgen_mux_dc674f85ab 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => coarse_passthrough_net,
    d0 => convert1_dout_net,
    d1 => delay1_q_net,
    y => mux_y_net
  );
  mux1 : entity xil_defaultlib.sysgen_mux_dc674f85ab 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => coarse_passthrough_net,
    d0 => convert_dout_net,
    d1 => delay2_q_net,
    y => mux1_y_net
  );
end structural;
-- Generated from Simulink block bpsk_receiver/Complex AXI-Stream Slave Interface/Scalar2Vector
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity bpsk_receiver_scalar2vector is
  port (
    i : in std_logic_vector( 32-1 downto 0 );
    o_1 : out std_logic_vector( 16-1 downto 0 );
    o_2 : out std_logic_vector( 16-1 downto 0 )
  );
end bpsk_receiver_scalar2vector;
architecture structural of bpsk_receiver_scalar2vector is 
  signal slice0_y_net : std_logic_vector( 16-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 16-1 downto 0 );
  signal s_axis_tdata_re_net : std_logic_vector( 32-1 downto 0 );
begin
  o_1 <= slice0_y_net;
  o_2 <= slice1_y_net;
  s_axis_tdata_re_net <= i;
  slice0 : entity xil_defaultlib.bpsk_receiver_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 15,
    x_width => 32,
    y_width => 16
  )
  port map (
    x => s_axis_tdata_re_net,
    y => slice0_y_net
  );
  slice1 : entity xil_defaultlib.bpsk_receiver_xlslice 
  generic map (
    new_lsb => 16,
    new_msb => 31,
    x_width => 32,
    y_width => 16
  )
  port map (
    x => s_axis_tdata_re_net,
    y => slice1_y_net
  );
end structural;
-- Generated from Simulink block bpsk_receiver/Complex AXI-Stream Slave Interface/Scalar2Vector1
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity bpsk_receiver_scalar2vector1 is
  port (
    i : in std_logic_vector( 32-1 downto 0 );
    o_1 : out std_logic_vector( 16-1 downto 0 );
    o_2 : out std_logic_vector( 16-1 downto 0 )
  );
end bpsk_receiver_scalar2vector1;
architecture structural of bpsk_receiver_scalar2vector1 is 
  signal slice0_y_net : std_logic_vector( 16-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 16-1 downto 0 );
  signal s_axis_tdata_im_net : std_logic_vector( 32-1 downto 0 );
begin
  o_1 <= slice0_y_net;
  o_2 <= slice1_y_net;
  s_axis_tdata_im_net <= i;
  slice0 : entity xil_defaultlib.bpsk_receiver_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 15,
    x_width => 32,
    y_width => 16
  )
  port map (
    x => s_axis_tdata_im_net,
    y => slice0_y_net
  );
  slice1 : entity xil_defaultlib.bpsk_receiver_xlslice 
  generic map (
    new_lsb => 16,
    new_msb => 31,
    x_width => 32,
    y_width => 16
  )
  port map (
    x => s_axis_tdata_im_net,
    y => slice1_y_net
  );
end structural;
-- Generated from Simulink block bpsk_receiver/Complex AXI-Stream Slave Interface/Vector Reinterpret
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity bpsk_receiver_vector_reinterpret is
  port (
    in_1 : in std_logic_vector( 16-1 downto 0 );
    in_2 : in std_logic_vector( 16-1 downto 0 );
    out_1 : out std_logic_vector( 16-1 downto 0 );
    out_2 : out std_logic_vector( 16-1 downto 0 )
  );
end bpsk_receiver_vector_reinterpret;
architecture structural of bpsk_receiver_vector_reinterpret is 
  signal slice1_y_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret0_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret1_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal slice0_y_net : std_logic_vector( 16-1 downto 0 );
begin
  out_1 <= reinterpret0_output_port_net;
  out_2 <= reinterpret1_output_port_net;
  slice0_y_net <= in_1;
  slice1_y_net <= in_2;
  reinterpret0 : entity xil_defaultlib.sysgen_reinterpret_c636705b73 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice0_y_net,
    output_port => reinterpret0_output_port_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_c636705b73 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice1_y_net,
    output_port => reinterpret1_output_port_net
  );
end structural;
-- Generated from Simulink block bpsk_receiver/Complex AXI-Stream Slave Interface/Vector Reinterpret1
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity bpsk_receiver_vector_reinterpret1 is
  port (
    in_1 : in std_logic_vector( 16-1 downto 0 );
    in_2 : in std_logic_vector( 16-1 downto 0 );
    out_1 : out std_logic_vector( 16-1 downto 0 );
    out_2 : out std_logic_vector( 16-1 downto 0 )
  );
end bpsk_receiver_vector_reinterpret1;
architecture structural of bpsk_receiver_vector_reinterpret1 is 
  signal slice0_y_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret1_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret0_output_port_net : std_logic_vector( 16-1 downto 0 );
begin
  out_1 <= reinterpret0_output_port_net;
  out_2 <= reinterpret1_output_port_net;
  slice0_y_net <= in_1;
  slice1_y_net <= in_2;
  reinterpret0 : entity xil_defaultlib.sysgen_reinterpret_c636705b73 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice0_y_net,
    output_port => reinterpret0_output_port_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_c636705b73 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice1_y_net,
    output_port => reinterpret1_output_port_net
  );
end structural;
-- Generated from Simulink block bpsk_receiver/Complex AXI-Stream Slave Interface
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity bpsk_receiver_complex_axi_stream_slave_interface is
  port (
    ready_in : in std_logic;
    s_axis_tdata_im : in std_logic_vector( 32-1 downto 0 );
    s_axis_tdata_re : in std_logic_vector( 32-1 downto 0 );
    s_axis_tvalid_re : in std_logic_vector( 1-1 downto 0 );
    real_out_1 : out std_logic_vector( 16-1 downto 0 );
    imag_out_1 : out std_logic_vector( 16-1 downto 0 );
    real_out_2 : out std_logic_vector( 16-1 downto 0 );
    imag_out_2 : out std_logic_vector( 16-1 downto 0 )
  );
end bpsk_receiver_complex_axi_stream_slave_interface;
architecture structural of bpsk_receiver_complex_axi_stream_slave_interface is 
  signal fir_compiler_7_2_s_axis_data_tready_net : std_logic;
  signal reinterpret1_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal s_axis_tdata_im_net : std_logic_vector( 32-1 downto 0 );
  signal s_axis_tvalid_re_net : std_logic_vector( 1-1 downto 0 );
  signal reinterpret0_output_port_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal reinterpret1_output_port_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal s_axis_tdata_re_net : std_logic_vector( 32-1 downto 0 );
  signal slice0_y_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal slice1_y_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal reinterpret0_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 16-1 downto 0 );
  signal slice0_y_net : std_logic_vector( 16-1 downto 0 );
begin
  real_out_1 <= reinterpret0_output_port_net_x0;
  imag_out_1 <= reinterpret0_output_port_net;
  real_out_2 <= reinterpret1_output_port_net_x0;
  imag_out_2 <= reinterpret1_output_port_net;
  fir_compiler_7_2_s_axis_data_tready_net <= ready_in;
  s_axis_tdata_im_net <= s_axis_tdata_im;
  s_axis_tdata_re_net <= s_axis_tdata_re;
  s_axis_tvalid_re_net <= s_axis_tvalid_re;
  scalar2vector : entity xil_defaultlib.bpsk_receiver_scalar2vector 
  port map (
    i => s_axis_tdata_re_net,
    o_1 => slice0_y_net_x0,
    o_2 => slice1_y_net_x0
  );
  scalar2vector1 : entity xil_defaultlib.bpsk_receiver_scalar2vector1 
  port map (
    i => s_axis_tdata_im_net,
    o_1 => slice0_y_net,
    o_2 => slice1_y_net
  );
  vector_reinterpret : entity xil_defaultlib.bpsk_receiver_vector_reinterpret 
  port map (
    in_1 => slice0_y_net_x0,
    in_2 => slice1_y_net_x0,
    out_1 => reinterpret0_output_port_net_x0,
    out_2 => reinterpret1_output_port_net_x0
  );
  vector_reinterpret1 : entity xil_defaultlib.bpsk_receiver_vector_reinterpret1 
  port map (
    in_1 => slice0_y_net,
    in_2 => slice1_y_net,
    out_1 => reinterpret0_output_port_net,
    out_2 => reinterpret1_output_port_net
  );
end structural;
-- Generated from Simulink block bpsk_receiver/Frame Synchronisation/Convert to AXI-Stream
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity bpsk_receiver_convert_to_axi_stream is
  port (
    data_in : in std_logic_vector( 8-1 downto 0 );
    valid_in : in std_logic_vector( 1-1 downto 0 );
    clk_20 : in std_logic;
    ce_20 : in std_logic;
    data_out : out std_logic_vector( 8-1 downto 0 );
    valid_out : out std_logic_vector( 1-1 downto 0 );
    last_out : out std_logic_vector( 1-1 downto 0 );
    size : out std_logic_vector( 8-1 downto 0 );
    reset : out std_logic_vector( 1-1 downto 0 )
  );
end bpsk_receiver_convert_to_axi_stream;
architecture structural of bpsk_receiver_convert_to_axi_stream is 
  signal src_clk_net : std_logic;
  signal relational2_op_net : std_logic_vector( 1-1 downto 0 );
  signal concat_y_net : std_logic_vector( 8-1 downto 0 );
  signal constant1_op_net : std_logic_vector( 1-1 downto 0 );
  signal constant_op_net : std_logic_vector( 1-1 downto 0 );
  signal counter_op_net : std_logic_vector( 32-1 downto 0 );
  signal register2_q_net : std_logic_vector( 1-1 downto 0 );
  signal register5_q_net : std_logic_vector( 8-1 downto 0 );
  signal relational_op_net_x0 : std_logic_vector( 1-1 downto 0 );
  signal logical2_y_net : std_logic_vector( 1-1 downto 0 );
  signal counter1_op_net : std_logic_vector( 32-1 downto 0 );
  signal logical_y_net : std_logic_vector( 1-1 downto 0 );
  signal logical1_y_net : std_logic_vector( 1-1 downto 0 );
  signal register6_q_net : std_logic_vector( 8-1 downto 0 );
  signal src_ce_net : std_logic;
  signal register3_q_net : std_logic_vector( 1-1 downto 0 );
  signal relational_op_net : std_logic_vector( 1-1 downto 0 );
  signal register4_q_net : std_logic_vector( 8-1 downto 0 );
  signal register1_q_net : std_logic_vector( 8-1 downto 0 );
  signal relational1_op_net : std_logic_vector( 1-1 downto 0 );
  signal register_q_net : std_logic_vector( 8-1 downto 0 );
  signal relational3_op_net : std_logic_vector( 1-1 downto 0 );
begin
  data_out <= register5_q_net;
  valid_out <= register3_q_net;
  last_out <= logical2_y_net;
  size <= register6_q_net;
  reset <= logical2_y_net;
  concat_y_net <= data_in;
  relational_op_net_x0 <= valid_in;
  src_clk_net <= clk_20;
  src_ce_net <= ce_20;
  constant_x0 : entity xil_defaultlib.sysgen_constant_68b1d293da 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  constant1 : entity xil_defaultlib.sysgen_constant_fa24cb9652 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant1_op_net
  );
  counter : entity xil_defaultlib.bpsk_receiver_xlcounter_free 
  generic map (
    core_name0 => "bpsk_receiver_c_counter_binary_v12_0_i1",
    op_arith => xlUnsigned,
    op_width => 32
  )
  port map (
    clr => '0',
    rst => logical2_y_net,
    en => relational_op_net_x0,
    clk => src_clk_net,
    ce => src_ce_net,
    op => counter_op_net
  );
  counter1 : entity xil_defaultlib.bpsk_receiver_xlcounter_free 
  generic map (
    core_name0 => "bpsk_receiver_c_counter_binary_v12_0_i1",
    op_arith => xlUnsigned,
    op_width => 32
  )
  port map (
    clr => '0',
    rst => logical2_y_net,
    en => logical_y_net,
    clk => src_clk_net,
    ce => src_ce_net,
    op => counter1_op_net
  );
  logical : entity xil_defaultlib.sysgen_logical_ba6919b37d 
  port map (
    clr => '0',
    d0 => relational2_op_net,
    d1 => register2_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    y => logical_y_net
  );
  logical1 : entity xil_defaultlib.sysgen_logical_4fdeb13a07 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => relational_op_net,
    d1 => register2_q_net,
    y => logical1_y_net
  );
  logical2 : entity xil_defaultlib.sysgen_logical_4fdeb13a07 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => relational3_op_net,
    d1 => relational1_op_net,
    y => logical2_y_net
  );
  register_x0 : entity xil_defaultlib.bpsk_receiver_xlregister 
  generic map (
    d_width => 8,
    init_value => b"00000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => concat_y_net,
    clk => src_clk_net,
    ce => src_ce_net,
    q => register_q_net
  );
  register1 : entity xil_defaultlib.bpsk_receiver_xlregister 
  generic map (
    d_width => 8,
    init_value => b"00000000"
  )
  port map (
    rst => "0",
    d => register_q_net,
    en => logical1_y_net,
    clk => src_clk_net,
    ce => src_ce_net,
    q => register1_q_net
  );
  register2 : entity xil_defaultlib.bpsk_receiver_xlregister 
  generic map (
    d_width => 1,
    init_value => b"0"
  )
  port map (
    en => "1",
    rst => "0",
    d => relational_op_net_x0,
    clk => src_clk_net,
    ce => src_ce_net,
    q => register2_q_net
  );
  register3 : entity xil_defaultlib.bpsk_receiver_xlregister 
  generic map (
    d_width => 1,
    init_value => b"0"
  )
  port map (
    en => "1",
    rst => "0",
    d => logical_y_net,
    clk => src_clk_net,
    ce => src_ce_net,
    q => register3_q_net
  );
  register4 : entity xil_defaultlib.bpsk_receiver_xlregister 
  generic map (
    d_width => 8,
    init_value => b"00000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => register_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    q => register4_q_net
  );
  register5 : entity xil_defaultlib.bpsk_receiver_xlregister 
  generic map (
    d_width => 8,
    init_value => b"00000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => register4_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    q => register5_q_net
  );
  register6 : entity xil_defaultlib.bpsk_receiver_xlregister 
  generic map (
    d_width => 8,
    init_value => b"00000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => register1_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    q => register6_q_net
  );
  relational : entity xil_defaultlib.sysgen_relational_a92e51c8f5 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    a => counter_op_net,
    b => constant_op_net,
    op => relational_op_net
  );
  relational1 : entity xil_defaultlib.sysgen_relational_73bea09196 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    a => counter1_op_net,
    b => register1_q_net,
    op => relational1_op_net
  );
  relational2 : entity xil_defaultlib.sysgen_relational_533126e566 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    a => counter_op_net,
    b => constant_op_net,
    op => relational2_op_net
  );
  relational3 : entity xil_defaultlib.sysgen_relational_278ec2a502 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    a => register1_q_net,
    b => constant1_op_net,
    op => relational3_op_net
  );
end structural;
-- Generated from Simulink block bpsk_receiver/Frame Synchronisation/Frame Sync/DBPSK Convert
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity bpsk_receiver_dbpsk_convert is
  port (
    data_in : in std_logic_vector( 1-1 downto 0 );
    valid_in : in std_logic_vector( 1-1 downto 0 );
    data_out : out std_logic_vector( 2-1 downto 0 )
  );
end bpsk_receiver_dbpsk_convert;
architecture structural of bpsk_receiver_dbpsk_convert is 
  signal register5_q_net : std_logic_vector( 1-1 downto 0 );
  signal constant_op_net : std_logic_vector( 2-1 downto 0 );
  signal constant1_op_net : std_logic_vector( 2-1 downto 0 );
  signal mux_y_net : std_logic_vector( 2-1 downto 0 );
  signal register4_q_net : std_logic_vector( 1-1 downto 0 );
begin
  data_out <= mux_y_net;
  register4_q_net <= data_in;
  register5_q_net <= valid_in;
  constant_x0 : entity xil_defaultlib.sysgen_constant_50fec901e6 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  constant1 : entity xil_defaultlib.sysgen_constant_6e99f4f101 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant1_op_net
  );
  mux : entity xil_defaultlib.sysgen_mux_7415e294af 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => register4_q_net,
    d0 => constant_op_net,
    d1 => constant1_op_net,
    y => mux_y_net
  );
end structural;
-- Generated from Simulink block bpsk_receiver/Frame Synchronisation/Frame Sync/DBPSK Decision
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity bpsk_receiver_dbpsk_decision is
  port (
    data_in : in std_logic_vector( 1-1 downto 0 );
    valid_in : in std_logic_vector( 1-1 downto 0 );
    clk_20 : in std_logic;
    ce_20 : in std_logic;
    data_out : out std_logic_vector( 1-1 downto 0 );
    valid_out : out std_logic_vector( 1-1 downto 0 )
  );
end bpsk_receiver_dbpsk_decision;
architecture structural of bpsk_receiver_dbpsk_decision is 
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal register_q_net : std_logic_vector( 1-1 downto 0 );
  signal register4_q_net_x0 : std_logic_vector( 1-1 downto 0 );
  signal src_ce_net : std_logic;
  signal src_clk_net : std_logic;
  signal register4_q_net : std_logic_vector( 1-1 downto 0 );
  signal register5_q_net : std_logic_vector( 1-1 downto 0 );
  signal logical1_y_net : std_logic_vector( 1-1 downto 0 );
  signal register3_q_net : std_logic_vector( 1-1 downto 0 );
  signal register2_q_net : std_logic_vector( 1-1 downto 0 );
begin
  data_out <= register4_q_net;
  valid_out <= register5_q_net;
  slice_y_net <= data_in;
  register4_q_net_x0 <= valid_in;
  src_clk_net <= clk_20;
  src_ce_net <= ce_20;
  logical1 : entity xil_defaultlib.sysgen_logical_4178448b04 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => register3_q_net,
    d1 => register_q_net,
    y => logical1_y_net
  );
  register_x0 : entity xil_defaultlib.bpsk_receiver_xlregister 
  generic map (
    d_width => 1,
    init_value => b"0"
  )
  port map (
    rst => "0",
    d => slice_y_net,
    en => register4_q_net_x0,
    clk => src_clk_net,
    ce => src_ce_net,
    q => register_q_net
  );
  register2 : entity xil_defaultlib.bpsk_receiver_xlregister 
  generic map (
    d_width => 1,
    init_value => b"0"
  )
  port map (
    en => "1",
    rst => "0",
    d => register4_q_net_x0,
    clk => src_clk_net,
    ce => src_ce_net,
    q => register2_q_net
  );
  register3 : entity xil_defaultlib.bpsk_receiver_xlregister 
  generic map (
    d_width => 1,
    init_value => b"0"
  )
  port map (
    rst => "0",
    d => register_q_net,
    en => register2_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    q => register3_q_net
  );
  register4 : entity xil_defaultlib.bpsk_receiver_xlregister 
  generic map (
    d_width => 1,
    init_value => b"0"
  )
  port map (
    rst => "0",
    d => logical1_y_net,
    en => register2_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    q => register4_q_net
  );
  register5 : entity xil_defaultlib.bpsk_receiver_xlregister 
  generic map (
    d_width => 1,
    init_value => b"0"
  )
  port map (
    en => "1",
    rst => "0",
    d => register2_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    q => register5_q_net
  );
end structural;
-- Generated from Simulink block bpsk_receiver/Frame Synchronisation/Frame Sync/Rising Edge Detector
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity bpsk_receiver_rising_edge_detector_x0 is
  port (
    input : in std_logic_vector( 1-1 downto 0 );
    clk_20 : in std_logic;
    ce_20 : in std_logic;
    output : out std_logic_vector( 1-1 downto 0 )
  );
end bpsk_receiver_rising_edge_detector_x0;
architecture structural of bpsk_receiver_rising_edge_detector_x0 is 
  signal register2_q_net : std_logic_vector( 1-1 downto 0 );
  signal logical1_y_net : std_logic_vector( 1-1 downto 0 );
  signal src_clk_net : std_logic;
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal relational1_op_net : std_logic_vector( 1-1 downto 0 );
  signal src_ce_net : std_logic;
begin
  output <= logical1_y_net;
  relational1_op_net <= input;
  src_clk_net <= clk_20;
  src_ce_net <= ce_20;
  inverter : entity xil_defaultlib.sysgen_inverter_8255e2898d 
  port map (
    clr => '0',
    ip => register2_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    op => inverter_op_net
  );
  logical1 : entity xil_defaultlib.sysgen_logical_4fdeb13a07 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => inverter_op_net,
    d1 => relational1_op_net,
    y => logical1_y_net
  );
  register2 : entity xil_defaultlib.bpsk_receiver_xlregister 
  generic map (
    d_width => 1,
    init_value => b"0"
  )
  port map (
    en => "1",
    rst => "0",
    d => relational1_op_net,
    clk => src_clk_net,
    ce => src_ce_net,
    q => register2_q_net
  );
end structural;
-- Generated from Simulink block bpsk_receiver/Frame Synchronisation/Frame Sync/Shift Register
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity bpsk_receiver_shift_register is
  port (
    data_in : in std_logic_vector( 1-1 downto 0 );
    valid_in : in std_logic_vector( 1-1 downto 0 );
    clk_20 : in std_logic;
    ce_20 : in std_logic;
    data_out : out std_logic_vector( 8-1 downto 0 );
    valid_out : out std_logic_vector( 1-1 downto 0 )
  );
end bpsk_receiver_shift_register;
architecture structural of bpsk_receiver_shift_register is 
  signal concat_y_net : std_logic_vector( 8-1 downto 0 );
  signal relational_op_net : std_logic_vector( 1-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 1-1 downto 0 );
  signal logical_y_net : std_logic_vector( 1-1 downto 0 );
  signal register5_q_net : std_logic_vector( 1-1 downto 0 );
  signal register1_q_net : std_logic_vector( 1-1 downto 0 );
  signal constant_op_net : std_logic_vector( 4-1 downto 0 );
  signal register4_q_net : std_logic_vector( 1-1 downto 0 );
  signal register_q_net : std_logic_vector( 1-1 downto 0 );
  signal register6_q_net : std_logic_vector( 1-1 downto 0 );
  signal register7_q_net : std_logic_vector( 1-1 downto 0 );
  signal register3_q_net : std_logic_vector( 1-1 downto 0 );
  signal counter_op_net : std_logic_vector( 4-1 downto 0 );
  signal register2_q_net : std_logic_vector( 1-1 downto 0 );
  signal src_clk_net : std_logic;
  signal src_ce_net : std_logic;
begin
  data_out <= concat_y_net;
  valid_out <= relational_op_net;
  delay1_q_net <= data_in;
  logical_y_net <= valid_in;
  src_clk_net <= clk_20;
  src_ce_net <= ce_20;
  concat : entity xil_defaultlib.sysgen_concat_47385fdee3 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    in0 => register7_q_net,
    in1 => register6_q_net,
    in2 => register5_q_net,
    in3 => register4_q_net,
    in4 => register3_q_net,
    in5 => register2_q_net,
    in6 => register1_q_net,
    in7 => register_q_net,
    y => concat_y_net
  );
  constant_x0 : entity xil_defaultlib.sysgen_constant_1357d6b043 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  counter : entity xil_defaultlib.bpsk_receiver_xlcounter_limit 
  generic map (
    cnt_15_0 => 8,
    cnt_31_16 => 0,
    cnt_47_32 => 0,
    cnt_63_48 => 0,
    core_name0 => "bpsk_receiver_c_counter_binary_v12_0_i2",
    count_limited => 1,
    op_arith => xlUnsigned,
    op_width => 4
  )
  port map (
    clr => '0',
    rst => relational_op_net,
    en => logical_y_net,
    clk => src_clk_net,
    ce => src_ce_net,
    op => counter_op_net
  );
  register_x0 : entity xil_defaultlib.bpsk_receiver_xlregister 
  generic map (
    d_width => 1,
    init_value => b"0"
  )
  port map (
    rst => "0",
    d => register1_q_net,
    en => logical_y_net,
    clk => src_clk_net,
    ce => src_ce_net,
    q => register_q_net
  );
  register1 : entity xil_defaultlib.bpsk_receiver_xlregister 
  generic map (
    d_width => 1,
    init_value => b"0"
  )
  port map (
    rst => "0",
    d => register2_q_net,
    en => logical_y_net,
    clk => src_clk_net,
    ce => src_ce_net,
    q => register1_q_net
  );
  register2 : entity xil_defaultlib.bpsk_receiver_xlregister 
  generic map (
    d_width => 1,
    init_value => b"0"
  )
  port map (
    rst => "0",
    d => register3_q_net,
    en => logical_y_net,
    clk => src_clk_net,
    ce => src_ce_net,
    q => register2_q_net
  );
  register3 : entity xil_defaultlib.bpsk_receiver_xlregister 
  generic map (
    d_width => 1,
    init_value => b"0"
  )
  port map (
    rst => "0",
    d => register4_q_net,
    en => logical_y_net,
    clk => src_clk_net,
    ce => src_ce_net,
    q => register3_q_net
  );
  register4 : entity xil_defaultlib.bpsk_receiver_xlregister 
  generic map (
    d_width => 1,
    init_value => b"0"
  )
  port map (
    rst => "0",
    d => register5_q_net,
    en => logical_y_net,
    clk => src_clk_net,
    ce => src_ce_net,
    q => register4_q_net
  );
  register5 : entity xil_defaultlib.bpsk_receiver_xlregister 
  generic map (
    d_width => 1,
    init_value => b"0"
  )
  port map (
    rst => "0",
    d => register6_q_net,
    en => logical_y_net,
    clk => src_clk_net,
    ce => src_ce_net,
    q => register5_q_net
  );
  register6 : entity xil_defaultlib.bpsk_receiver_xlregister 
  generic map (
    d_width => 1,
    init_value => b"0"
  )
  port map (
    rst => "0",
    d => register7_q_net,
    en => logical_y_net,
    clk => src_clk_net,
    ce => src_ce_net,
    q => register6_q_net
  );
  register7 : entity xil_defaultlib.bpsk_receiver_xlregister 
  generic map (
    d_width => 1,
    init_value => b"0"
  )
  port map (
    rst => "0",
    d => delay1_q_net,
    en => logical_y_net,
    clk => src_clk_net,
    ce => src_ce_net,
    q => register7_q_net
  );
  relational : entity xil_defaultlib.sysgen_relational_9a9d4a060f 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    a => counter_op_net,
    b => constant_op_net,
    op => relational_op_net
  );
end structural;
-- Generated from Simulink block bpsk_receiver/Frame Synchronisation/Frame Sync
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity bpsk_receiver_frame_sync is
  port (
    threshold : in std_logic_vector( 32-1 downto 0 );
    data_in : in std_logic_vector( 16-1 downto 0 );
    valid_in : in std_logic_vector( 1-1 downto 0 );
    reset_count : in std_logic_vector( 1-1 downto 0 );
    reset : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    clk_20 : in std_logic;
    ce_20 : in std_logic;
    data_out : out std_logic_vector( 8-1 downto 0 );
    valid_out : out std_logic_vector( 1-1 downto 0 );
    count : out std_logic_vector( 32-1 downto 0 )
  );
end bpsk_receiver_frame_sync;
architecture structural of bpsk_receiver_frame_sync is 
  signal logical2_y_net : std_logic_vector( 1-1 downto 0 );
  signal mux_y_net : std_logic_vector( 2-1 downto 0 );
  signal logical_y_net : std_logic_vector( 1-1 downto 0 );
  signal reset_frame_sync_net : std_logic_vector( 1-1 downto 0 );
  signal src_ce_net : std_logic;
  signal delay1_q_net : std_logic_vector( 1-1 downto 0 );
  signal relational_op_net : std_logic_vector( 1-1 downto 0 );
  signal logical1_y_net_x0 : std_logic_vector( 1-1 downto 0 );
  signal concat_y_net : std_logic_vector( 8-1 downto 0 );
  signal ce_net : std_logic;
  signal register4_q_net : std_logic_vector( 1-1 downto 0 );
  signal src_clk_net : std_logic;
  signal clk_net : std_logic;
  signal register5_q_net : std_logic_vector( 1-1 downto 0 );
  signal counter1_op_net : std_logic_vector( 32-1 downto 0 );
  signal convert1_dout_net : std_logic_vector( 16-1 downto 0 );
  signal threshold_net : std_logic_vector( 32-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal relational1_op_net : std_logic_vector( 1-1 downto 0 );
  signal register4_q_net_x0 : std_logic_vector( 1-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net : std_logic;
  signal register1_q_net : std_logic_vector( 1-1 downto 0 );
  signal logical1_y_net : std_logic_vector( 1-1 downto 0 );
  signal fir_compiler_7_2_s_axis_data_tready_net : std_logic;
  signal delay_q_net : std_logic_vector( 1-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tdata_real_net : std_logic_vector( 8-1 downto 0 );
begin
  data_out <= concat_y_net;
  valid_out <= relational_op_net;
  count <= counter1_op_net;
  threshold_net <= threshold;
  convert1_dout_net <= data_in;
  register4_q_net_x0 <= valid_in;
  reset_frame_sync_net <= reset_count;
  logical2_y_net <= reset;
  clk_net <= clk_1;
  ce_net <= ce_1;
  src_clk_net <= clk_20;
  src_ce_net <= ce_20;
  dbpsk_convert : entity xil_defaultlib.bpsk_receiver_dbpsk_convert 
  port map (
    data_in => register4_q_net,
    valid_in => register5_q_net,
    data_out => mux_y_net
  );
  dbpsk_decision : entity xil_defaultlib.bpsk_receiver_dbpsk_decision 
  port map (
    data_in => slice_y_net,
    valid_in => register4_q_net_x0,
    clk_20 => src_clk_net,
    ce_20 => src_ce_net,
    data_out => register4_q_net,
    valid_out => register5_q_net
  );
  rising_edge_detector_x0 : entity xil_defaultlib.bpsk_receiver_rising_edge_detector_x0 
  port map (
    input => relational1_op_net,
    clk_20 => src_clk_net,
    ce_20 => src_ce_net,
    output => logical1_y_net_x0
  );
  shift_register : entity xil_defaultlib.bpsk_receiver_shift_register 
  port map (
    data_in => delay1_q_net,
    valid_in => logical_y_net,
    clk_20 => src_clk_net,
    ce_20 => src_ce_net,
    data_out => concat_y_net,
    valid_out => relational_op_net
  );
  counter1 : entity xil_defaultlib.bpsk_receiver_xlcounter_free 
  generic map (
    core_name0 => "bpsk_receiver_c_counter_binary_v12_0_i1",
    op_arith => xlUnsigned,
    op_width => 32
  )
  port map (
    clr => '0',
    rst => reset_frame_sync_net,
    en => logical1_y_net_x0,
    clk => src_clk_net,
    ce => src_ce_net,
    op => counter1_op_net
  );
  delay : entity xil_defaultlib.bpsk_receiver_xldelay 
  generic map (
    latency => 2,
    reg_retiming => 0,
    reset => 0,
    width => 1
  )
  port map (
    en => '1',
    rst => '0',
    d => register5_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    q => delay_q_net
  );
  delay1 : entity xil_defaultlib.bpsk_receiver_xldelay 
  generic map (
    latency => 2,
    reg_retiming => 0,
    reset => 0,
    width => 1
  )
  port map (
    rst => '0',
    d => register4_q_net,
    en => register5_q_net(0),
    clk => src_clk_net,
    ce => src_ce_net,
    q => delay1_q_net
  );
  fir_compiler_7_2 : entity xil_defaultlib.xlfir_compiler_d7ef8dda4c1b6290332b72f450e320a7 
  port map (
    s_axis_data_tdata_real => mux_y_net,
    en => register5_q_net(0),
    src_clk => src_clk_net,
    src_ce => src_ce_net,
    clk => clk_net,
    ce => ce_net,
    clk_20 => src_clk_net,
    ce_20 => src_ce_net,
    clk_logic_20 => src_clk_net,
    ce_logic_20 => src_ce_net,
    s_axis_data_tready => fir_compiler_7_2_s_axis_data_tready_net,
    m_axis_data_tvalid => fir_compiler_7_2_m_axis_data_tvalid_net,
    m_axis_data_tdata_real => fir_compiler_7_2_m_axis_data_tdata_real_net
  );
  logical : entity xil_defaultlib.sysgen_logical_4fdeb13a07 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => delay_q_net,
    d1 => register1_q_net,
    y => logical_y_net
  );
  logical1 : entity xil_defaultlib.sysgen_logical_47bfa502e0 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => reset_frame_sync_net,
    d1 => logical2_y_net,
    y => logical1_y_net
  );
  register1 : entity xil_defaultlib.bpsk_receiver_xlregister 
  generic map (
    d_width => 1,
    init_value => b"0"
  )
  port map (
    d => logical1_y_net_x0,
    rst => logical1_y_net,
    en => logical1_y_net_x0,
    clk => src_clk_net,
    ce => src_ce_net,
    q => register1_q_net
  );
  relational1 : entity xil_defaultlib.sysgen_relational_0e82eb1e91 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    a => fir_compiler_7_2_m_axis_data_tdata_real_net,
    b => threshold_net,
    op => relational1_op_net
  );
  slice : entity xil_defaultlib.bpsk_receiver_xlslice 
  generic map (
    new_lsb => 15,
    new_msb => 15,
    x_width => 16,
    y_width => 1
  )
  port map (
    x => convert1_dout_net,
    y => slice_y_net
  );
end structural;
-- Generated from Simulink block bpsk_receiver/Frame Synchronisation
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity bpsk_receiver_frame_synchronisation is
  port (
    reset : in std_logic_vector( 1-1 downto 0 );
    threshold : in std_logic_vector( 32-1 downto 0 );
    valid_in : in std_logic_vector( 1-1 downto 0 );
    real_in : in std_logic_vector( 16-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    clk_20 : in std_logic;
    ce_20 : in std_logic;
    valid_out : out std_logic_vector( 1-1 downto 0 );
    data_out : out std_logic_vector( 8-1 downto 0 );
    last_out : out std_logic_vector( 1-1 downto 0 );
    size : out std_logic_vector( 8-1 downto 0 );
    count : out std_logic_vector( 32-1 downto 0 )
  );
end bpsk_receiver_frame_synchronisation;
architecture structural of bpsk_receiver_frame_synchronisation is 
  signal logical2_y_net : std_logic_vector( 1-1 downto 0 );
  signal register3_q_net : std_logic_vector( 1-1 downto 0 );
  signal register5_q_net : std_logic_vector( 8-1 downto 0 );
  signal relational_op_net : std_logic_vector( 1-1 downto 0 );
  signal concat_y_net : std_logic_vector( 8-1 downto 0 );
  signal register4_q_net : std_logic_vector( 1-1 downto 0 );
  signal ce_net : std_logic;
  signal threshold_net : std_logic_vector( 32-1 downto 0 );
  signal src_ce_net : std_logic;
  signal clk_net : std_logic;
  signal src_clk_net : std_logic;
  signal counter1_op_net : std_logic_vector( 32-1 downto 0 );
  signal reset_frame_sync_net : std_logic_vector( 1-1 downto 0 );
  signal register6_q_net : std_logic_vector( 8-1 downto 0 );
  signal convert1_dout_net : std_logic_vector( 16-1 downto 0 );
begin
  valid_out <= register3_q_net;
  data_out <= register5_q_net;
  last_out <= logical2_y_net;
  size <= register6_q_net;
  count <= counter1_op_net;
  reset_frame_sync_net <= reset;
  threshold_net <= threshold;
  register4_q_net <= valid_in;
  convert1_dout_net <= real_in;
  clk_net <= clk_1;
  ce_net <= ce_1;
  src_clk_net <= clk_20;
  src_ce_net <= ce_20;
  convert_to_axi_stream : entity xil_defaultlib.bpsk_receiver_convert_to_axi_stream 
  port map (
    data_in => concat_y_net,
    valid_in => relational_op_net,
    clk_20 => src_clk_net,
    ce_20 => src_ce_net,
    data_out => register5_q_net,
    valid_out => register3_q_net,
    last_out => logical2_y_net,
    size => register6_q_net,
    reset => logical2_y_net
  );
  frame_sync : entity xil_defaultlib.bpsk_receiver_frame_sync 
  port map (
    threshold => threshold_net,
    data_in => convert1_dout_net,
    valid_in => register4_q_net,
    reset_count => reset_frame_sync_net,
    reset => logical2_y_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    clk_20 => src_clk_net,
    ce_20 => src_ce_net,
    data_out => concat_y_net,
    valid_out => relational_op_net,
    count => counter1_op_net
  );
end structural;
-- Generated from Simulink block bpsk_receiver/Observation Point
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity bpsk_receiver_observation_point is
  port (
    valid_b : in std_logic_vector( 1-1 downto 0 );
    valid_e : in std_logic;
    valid_d : in std_logic_vector( 1-1 downto 0 );
    valid_c : in std_logic;
    real_b : in std_logic_vector( 16-1 downto 0 );
    real_e : in std_logic_vector( 16-1 downto 0 );
    real_d : in std_logic_vector( 16-1 downto 0 );
    real_c : in std_logic_vector( 16-1 downto 0 );
    valid_a : in std_logic_vector( 1-1 downto 0 );
    imag_b : in std_logic_vector( 16-1 downto 0 );
    imag_e : in std_logic_vector( 16-1 downto 0 );
    imag_d : in std_logic_vector( 16-1 downto 0 );
    imag_c : in std_logic_vector( 16-1 downto 0 );
    real_a : in std_logic_vector( 16-1 downto 0 );
    imag_a : in std_logic_vector( 16-1 downto 0 );
    control : in std_logic_vector( 32-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    clk_5 : in std_logic;
    ce_5 : in std_logic;
    clk_20 : in std_logic;
    ce_20 : in std_logic;
    m_axis_op_tdata : out std_logic_vector( 32-1 downto 0 );
    m_axis_op_tvalid : out std_logic_vector( 1-1 downto 0 )
  );
end bpsk_receiver_observation_point;
architecture structural of bpsk_receiver_observation_point is 
  signal delay1_q_net : std_logic_vector( 16-1 downto 0 );
  signal register4_q_net : std_logic_vector( 1-1 downto 0 );
  signal convert_dout_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal delay_q_net : std_logic_vector( 1-1 downto 0 );
  signal mux_y_net : std_logic_vector( 16-1 downto 0 );
  signal ce_net : std_logic;
  signal cmult1_p_net : std_logic_vector( 16-1 downto 0 );
  signal cic_decimator_real_m_axis_data_tvalid_net : std_logic;
  signal convert_dout_net : std_logic_vector( 16-1 downto 0 );
  signal mux1_y_net : std_logic_vector( 16-1 downto 0 );
  signal convert1_dout_net : std_logic_vector( 16-1 downto 0 );
  signal delay3_q_net : std_logic_vector( 1-1 downto 0 );
  signal delay2_q_net : std_logic_vector( 16-1 downto 0 );
  signal convert1_dout_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal observation_point_net : std_logic_vector( 32-1 downto 0 );
  signal cmult2_p_net : std_logic_vector( 16-1 downto 0 );
  signal concat_y_net : std_logic_vector( 32-1 downto 0 );
  signal mux_valid_y_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal fir_compiler_7_2_m_axis_data_tvalid_net : std_logic;
  signal mux_re_y_net : std_logic_vector( 16-1 downto 0 );
  signal up_sample5_q_net : std_logic_vector( 16-1 downto 0 );
  signal up_sample6_q_net : std_logic_vector( 16-1 downto 0 );
  signal up_sample4_q_net : std_logic_vector( 16-1 downto 0 );
  signal up_sample10_q_net : std_logic_vector( 1-1 downto 0 );
  signal up_sample1_q_net : std_logic_vector( 16-1 downto 0 );
  signal up_sample3_q_net : std_logic_vector( 16-1 downto 0 );
  signal up_sample2_q_net : std_logic_vector( 16-1 downto 0 );
  signal up_sample14_q_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal up_sample9_q_net : std_logic_vector( 1-1 downto 0 );
  signal src_ce_net : std_logic;
  signal up_sample11_q_net : std_logic_vector( 1-1 downto 0 );
  signal up_sample7_q_net : std_logic_vector( 16-1 downto 0 );
  signal up_sample12_q_net : std_logic_vector( 1-1 downto 0 );
  signal reinterpret1_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal up_sample15_q_net : std_logic_vector( 1-1 downto 0 );
  signal clk_5_net : std_logic;
  signal up_sample8_q_net : std_logic_vector( 16-1 downto 0 );
  signal mux_im_y_net : std_logic_vector( 16-1 downto 0 );
  signal src_clk_net : std_logic;
  signal up_sample13_q_net : std_logic_vector( 16-1 downto 0 );
  signal ce_5_net : std_logic;
  signal slice_y_net : std_logic_vector( 3-1 downto 0 );
begin
  delay3_q_net <= valid_b;
  cic_decimator_real_m_axis_data_tvalid_net <= valid_e;
  delay_q_net <= valid_d;
  fir_compiler_7_2_m_axis_data_tvalid_net <= valid_c;
  delay1_q_net <= real_b;
  cmult2_p_net <= real_e;
  mux1_y_net <= real_d;
  convert_dout_net_x0 <= real_c;
  register4_q_net <= valid_a;
  delay2_q_net <= imag_b;
  cmult1_p_net <= imag_e;
  mux_y_net <= imag_d;
  convert1_dout_net_x0 <= imag_c;
  convert1_dout_net <= real_a;
  convert_dout_net <= imag_a;
  observation_point_net <= control;
  m_axis_op_tdata <= concat_y_net;
  m_axis_op_tvalid <= mux_valid_y_net;
  clk_net <= clk_1;
  ce_net <= ce_1;
  clk_5_net <= clk_5;
  ce_5_net <= ce_5;
  src_clk_net <= clk_20;
  src_ce_net <= ce_20;
  concat : entity xil_defaultlib.sysgen_concat_f7a6ead077 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    in0 => reinterpret1_output_port_net,
    in1 => reinterpret_output_port_net,
    y => concat_y_net
  );
  mux_im : entity xil_defaultlib.sysgen_mux_d235603cfd 
  port map (
    clr => '0',
    sel => slice_y_net,
    d0 => up_sample8_q_net,
    d1 => up_sample4_q_net,
    d2 => up_sample6_q_net,
    d3 => up_sample7_q_net,
    d4 => up_sample13_q_net,
    clk => clk_net,
    ce => ce_net,
    y => mux_im_y_net
  );
  mux_valid : entity xil_defaultlib.sysgen_mux_9acf3e3f4e 
  port map (
    clr => '0',
    sel => slice_y_net,
    d0 => up_sample9_q_net,
    d1 => up_sample10_q_net,
    d2 => up_sample11_q_net,
    d3 => up_sample12_q_net,
    d4 => up_sample15_q_net,
    clk => clk_net,
    ce => ce_net,
    y => mux_valid_y_net
  );
  mux_re : entity xil_defaultlib.sysgen_mux_d235603cfd 
  port map (
    clr => '0',
    sel => slice_y_net,
    d0 => up_sample5_q_net,
    d1 => up_sample1_q_net,
    d2 => up_sample2_q_net,
    d3 => up_sample3_q_net,
    d4 => up_sample14_q_net,
    clk => clk_net,
    ce => ce_net,
    y => mux_re_y_net
  );
  reinterpret : entity xil_defaultlib.sysgen_reinterpret_88664dc28e 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => mux_re_y_net,
    output_port => reinterpret_output_port_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_88664dc28e 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => mux_im_y_net,
    output_port => reinterpret1_output_port_net
  );
  slice : entity xil_defaultlib.bpsk_receiver_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 2,
    x_width => 32,
    y_width => 3
  )
  port map (
    x => observation_point_net,
    y => slice_y_net
  );
  up_sample1 : entity xil_defaultlib.bpsk_receiver_xlusamp 
  generic map (
    copy_samples => 1,
    d_arith => xlSigned,
    d_bin_pt => 14,
    d_width => 16,
    latency => 0,
    q_arith => xlSigned,
    q_bin_pt => 14,
    q_width => 16
  )
  port map (
    src_clr => '0',
    dest_clr => '0',
    en => "1",
    d => delay1_q_net,
    src_clk => src_clk_net,
    src_ce => src_ce_net,
    dest_clk => clk_net,
    dest_ce => ce_net,
    q => up_sample1_q_net
  );
  up_sample10 : entity xil_defaultlib.bpsk_receiver_xlusamp 
  generic map (
    copy_samples => 0,
    d_arith => xlUnsigned,
    d_bin_pt => 0,
    d_width => 1,
    latency => 0,
    q_arith => xlUnsigned,
    q_bin_pt => 0,
    q_width => 1
  )
  port map (
    src_clr => '0',
    dest_clr => '0',
    en => "1",
    d => delay3_q_net,
    src_clk => src_clk_net,
    src_ce => src_ce_net,
    dest_clk => clk_net,
    dest_ce => ce_net,
    q => up_sample10_q_net
  );
  up_sample11 : entity xil_defaultlib.bpsk_receiver_xlusamp 
  generic map (
    copy_samples => 0,
    d_arith => xlUnsigned,
    d_bin_pt => 0,
    d_width => 1,
    latency => 0,
    q_arith => xlUnsigned,
    q_bin_pt => 0,
    q_width => 1
  )
  port map (
    src_clr => '0',
    dest_clr => '0',
    en => "1",
    d(0) => fir_compiler_7_2_m_axis_data_tvalid_net,
    src_clk => src_clk_net,
    src_ce => src_ce_net,
    dest_clk => clk_net,
    dest_ce => ce_net,
    q => up_sample11_q_net
  );
  up_sample12 : entity xil_defaultlib.bpsk_receiver_xlusamp 
  generic map (
    copy_samples => 0,
    d_arith => xlUnsigned,
    d_bin_pt => 0,
    d_width => 1,
    latency => 0,
    q_arith => xlUnsigned,
    q_bin_pt => 0,
    q_width => 1
  )
  port map (
    src_clr => '0',
    dest_clr => '0',
    en => "1",
    d => delay_q_net,
    src_clk => clk_5_net,
    src_ce => ce_5_net,
    dest_clk => clk_net,
    dest_ce => ce_net,
    q => up_sample12_q_net
  );
  up_sample2 : entity xil_defaultlib.bpsk_receiver_xlusamp 
  generic map (
    copy_samples => 1,
    d_arith => xlSigned,
    d_bin_pt => 14,
    d_width => 16,
    latency => 0,
    q_arith => xlSigned,
    q_bin_pt => 14,
    q_width => 16
  )
  port map (
    src_clr => '0',
    dest_clr => '0',
    en => "1",
    d => convert_dout_net_x0,
    src_clk => src_clk_net,
    src_ce => src_ce_net,
    dest_clk => clk_net,
    dest_ce => ce_net,
    q => up_sample2_q_net
  );
  up_sample3 : entity xil_defaultlib.bpsk_receiver_xlusamp 
  generic map (
    copy_samples => 1,
    d_arith => xlSigned,
    d_bin_pt => 14,
    d_width => 16,
    latency => 0,
    q_arith => xlSigned,
    q_bin_pt => 14,
    q_width => 16
  )
  port map (
    src_clr => '0',
    dest_clr => '0',
    en => "1",
    d => mux1_y_net,
    src_clk => clk_5_net,
    src_ce => ce_5_net,
    dest_clk => clk_net,
    dest_ce => ce_net,
    q => up_sample3_q_net
  );
  up_sample4 : entity xil_defaultlib.bpsk_receiver_xlusamp 
  generic map (
    copy_samples => 1,
    d_arith => xlSigned,
    d_bin_pt => 14,
    d_width => 16,
    latency => 0,
    q_arith => xlSigned,
    q_bin_pt => 14,
    q_width => 16
  )
  port map (
    src_clr => '0',
    dest_clr => '0',
    en => "1",
    d => delay2_q_net,
    src_clk => src_clk_net,
    src_ce => src_ce_net,
    dest_clk => clk_net,
    dest_ce => ce_net,
    q => up_sample4_q_net
  );
  up_sample5 : entity xil_defaultlib.bpsk_receiver_xlusamp 
  generic map (
    copy_samples => 1,
    d_arith => xlSigned,
    d_bin_pt => 14,
    d_width => 16,
    latency => 0,
    q_arith => xlSigned,
    q_bin_pt => 14,
    q_width => 16
  )
  port map (
    src_clr => '0',
    dest_clr => '0',
    en => "1",
    d => convert1_dout_net,
    src_clk => src_clk_net,
    src_ce => src_ce_net,
    dest_clk => clk_net,
    dest_ce => ce_net,
    q => up_sample5_q_net
  );
  up_sample6 : entity xil_defaultlib.bpsk_receiver_xlusamp 
  generic map (
    copy_samples => 1,
    d_arith => xlSigned,
    d_bin_pt => 14,
    d_width => 16,
    latency => 0,
    q_arith => xlSigned,
    q_bin_pt => 14,
    q_width => 16
  )
  port map (
    src_clr => '0',
    dest_clr => '0',
    en => "1",
    d => convert1_dout_net_x0,
    src_clk => src_clk_net,
    src_ce => src_ce_net,
    dest_clk => clk_net,
    dest_ce => ce_net,
    q => up_sample6_q_net
  );
  up_sample7 : entity xil_defaultlib.bpsk_receiver_xlusamp 
  generic map (
    copy_samples => 1,
    d_arith => xlSigned,
    d_bin_pt => 14,
    d_width => 16,
    latency => 0,
    q_arith => xlSigned,
    q_bin_pt => 14,
    q_width => 16
  )
  port map (
    src_clr => '0',
    dest_clr => '0',
    en => "1",
    d => mux_y_net,
    src_clk => clk_5_net,
    src_ce => ce_5_net,
    dest_clk => clk_net,
    dest_ce => ce_net,
    q => up_sample7_q_net
  );
  up_sample8 : entity xil_defaultlib.bpsk_receiver_xlusamp 
  generic map (
    copy_samples => 1,
    d_arith => xlSigned,
    d_bin_pt => 14,
    d_width => 16,
    latency => 0,
    q_arith => xlSigned,
    q_bin_pt => 14,
    q_width => 16
  )
  port map (
    src_clr => '0',
    dest_clr => '0',
    en => "1",
    d => convert_dout_net,
    src_clk => src_clk_net,
    src_ce => src_ce_net,
    dest_clk => clk_net,
    dest_ce => ce_net,
    q => up_sample8_q_net
  );
  up_sample9 : entity xil_defaultlib.bpsk_receiver_xlusamp 
  generic map (
    copy_samples => 0,
    d_arith => xlUnsigned,
    d_bin_pt => 0,
    d_width => 1,
    latency => 0,
    q_arith => xlUnsigned,
    q_bin_pt => 0,
    q_width => 1
  )
  port map (
    src_clr => '0',
    dest_clr => '0',
    en => "1",
    d => register4_q_net,
    src_clk => src_clk_net,
    src_ce => src_ce_net,
    dest_clk => clk_net,
    dest_ce => ce_net,
    q => up_sample9_q_net
  );
  up_sample13 : entity xil_defaultlib.bpsk_receiver_xlusamp 
  generic map (
    copy_samples => 1,
    d_arith => xlSigned,
    d_bin_pt => 14,
    d_width => 16,
    latency => 0,
    q_arith => xlSigned,
    q_bin_pt => 14,
    q_width => 16
  )
  port map (
    src_clr => '0',
    dest_clr => '0',
    en => "1",
    d => cmult1_p_net,
    src_clk => clk_5_net,
    src_ce => ce_5_net,
    dest_clk => clk_net,
    dest_ce => ce_net,
    q => up_sample13_q_net
  );
  up_sample14 : entity xil_defaultlib.bpsk_receiver_xlusamp 
  generic map (
    copy_samples => 1,
    d_arith => xlSigned,
    d_bin_pt => 14,
    d_width => 16,
    latency => 0,
    q_arith => xlSigned,
    q_bin_pt => 14,
    q_width => 16
  )
  port map (
    src_clr => '0',
    dest_clr => '0',
    en => "1",
    d => cmult2_p_net,
    src_clk => clk_5_net,
    src_ce => ce_5_net,
    dest_clk => clk_net,
    dest_ce => ce_net,
    q => up_sample14_q_net
  );
  up_sample15 : entity xil_defaultlib.bpsk_receiver_xlusamp 
  generic map (
    copy_samples => 0,
    d_arith => xlUnsigned,
    d_bin_pt => 0,
    d_width => 1,
    latency => 0,
    q_arith => xlUnsigned,
    q_bin_pt => 0,
    q_width => 1
  )
  port map (
    src_clr => '0',
    dest_clr => '0',
    en => "1",
    d(0) => cic_decimator_real_m_axis_data_tvalid_net,
    src_clk => clk_5_net,
    src_ce => ce_5_net,
    dest_clk => clk_net,
    dest_ce => ce_net,
    q => up_sample15_q_net
  );
end structural;
-- Generated from Simulink block bpsk_receiver/RRC Receive Filter
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity bpsk_receiver_rrc_receive_filter is
  port (
    valid_in : in std_logic_vector( 1-1 downto 0 );
    real_in : in std_logic_vector( 16-1 downto 0 );
    imag_in : in std_logic_vector( 16-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    clk_5 : in std_logic;
    ce_5 : in std_logic;
    clk_20 : in std_logic;
    ce_20 : in std_logic;
    valid_out : out std_logic;
    real_out : out std_logic_vector( 16-1 downto 0 );
    imag_out : out std_logic_vector( 16-1 downto 0 )
  );
end bpsk_receiver_rrc_receive_filter;
architecture structural of bpsk_receiver_rrc_receive_filter is 
  signal ce_5_net : std_logic;
  signal mux1_y_net : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tdata_path0_net : std_logic_vector( 33-1 downto 0 );
  signal convert1_dout_net : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net : std_logic;
  signal src_clk_net : std_logic;
  signal convert_dout_net : std_logic_vector( 16-1 downto 0 );
  signal clk_net : std_logic;
  signal delay_q_net : std_logic_vector( 1-1 downto 0 );
  signal mux_y_net : std_logic_vector( 16-1 downto 0 );
  signal clk_5_net : std_logic;
  signal src_ce_net : std_logic;
  signal ce_net : std_logic;
  signal fir_compiler_7_2_m_axis_data_tdata_path1_net : std_logic_vector( 33-1 downto 0 );
  signal fir_compiler_7_2_s_axis_data_tready_net : std_logic;
begin
  valid_out <= fir_compiler_7_2_m_axis_data_tvalid_net;
  real_out <= convert_dout_net;
  imag_out <= convert1_dout_net;
  delay_q_net <= valid_in;
  mux1_y_net <= real_in;
  mux_y_net <= imag_in;
  clk_net <= clk_1;
  ce_net <= ce_1;
  clk_5_net <= clk_5;
  ce_5_net <= ce_5;
  src_clk_net <= clk_20;
  src_ce_net <= ce_20;
  convert : entity xil_defaultlib.bpsk_receiver_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 30,
    din_width => 33,
    dout_arith => 2,
    dout_bin_pt => 14,
    dout_width => 16,
    latency => 0,
    overflow => xlWrap,
    quantization => xlTruncate
  )
  port map (
    clr => '0',
    en => "1",
    din => fir_compiler_7_2_m_axis_data_tdata_path1_net,
    clk => src_clk_net,
    ce => src_ce_net,
    dout => convert_dout_net
  );
  convert1 : entity xil_defaultlib.bpsk_receiver_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 30,
    din_width => 33,
    dout_arith => 2,
    dout_bin_pt => 14,
    dout_width => 16,
    latency => 0,
    overflow => xlWrap,
    quantization => xlTruncate
  )
  port map (
    clr => '0',
    en => "1",
    din => fir_compiler_7_2_m_axis_data_tdata_path0_net,
    clk => src_clk_net,
    ce => src_ce_net,
    dout => convert1_dout_net
  );
  fir_compiler_7_2 : entity xil_defaultlib.xlfir_compiler_09459343d46851faff71140d16775729 
  port map (
    s_axis_data_tdata_path1 => mux1_y_net,
    s_axis_data_tdata_path0 => mux_y_net,
    src_clk => clk_5_net,
    src_ce => ce_5_net,
    clk => clk_net,
    ce => ce_net,
    clk_5 => clk_5_net,
    ce_5 => ce_5_net,
    clk_20 => src_clk_net,
    ce_20 => src_ce_net,
    clk_logic_5 => clk_5_net,
    ce_logic_5 => ce_5_net,
    s_axis_data_tready => fir_compiler_7_2_s_axis_data_tready_net,
    m_axis_data_tvalid => fir_compiler_7_2_m_axis_data_tvalid_net,
    m_axis_data_tdata_path1 => fir_compiler_7_2_m_axis_data_tdata_path1_net,
    m_axis_data_tdata_path0 => fir_compiler_7_2_m_axis_data_tdata_path0_net
  );
end structural;
-- Generated from Simulink block bpsk_receiver/SSR Halfband Lowpass Decimator/Vector FIR Im
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity bpsk_receiver_vector_fir_im is
  port (
    tvi : in std_logic_vector( 1-1 downto 0 );
    tdi_1 : in std_logic_vector( 16-1 downto 0 );
    tdi_2 : in std_logic_vector( 16-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    tdo : out std_logic_vector( 31-1 downto 0 )
  );
end bpsk_receiver_vector_fir_im;
architecture structural of bpsk_receiver_vector_fir_im is 
  signal fir_compiler_7_2_m_axis_data_tvalid_net : std_logic;
  signal reinterpret1_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_s_axis_data_tready_net : std_logic;
  signal ce_net : std_logic;
  signal fir_compiler_7_2_m_axis_data_tdata_real_net : std_logic_vector( 31-1 downto 0 );
  signal reinterpret0_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal s_axis_tvalid_re_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
begin
  tdo <= fir_compiler_7_2_m_axis_data_tdata_real_net;
  s_axis_tvalid_re_net <= tvi;
  reinterpret0_output_port_net <= tdi_1;
  reinterpret1_output_port_net <= tdi_2;
  clk_net <= clk_1;
  ce_net <= ce_1;
  fir_compiler_7_2 : entity xil_defaultlib.xlfir_compiler_ec3490f6707211816649400e84947579 
  port map (
    s_axis_data_tvalid => s_axis_tvalid_re_net(0),
    s_axis_data_tdata_vect1 => reinterpret1_output_port_net,
    s_axis_data_tdata_vect0 => reinterpret0_output_port_net,
    src_clk => clk_net,
    src_ce => ce_net,
    clk => clk_net,
    ce => ce_net,
    s_axis_data_tready => fir_compiler_7_2_s_axis_data_tready_net,
    m_axis_data_tvalid => fir_compiler_7_2_m_axis_data_tvalid_net,
    m_axis_data_tdata_real => fir_compiler_7_2_m_axis_data_tdata_real_net
  );
end structural;
-- Generated from Simulink block bpsk_receiver/SSR Halfband Lowpass Decimator/Vector FIR Re
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity bpsk_receiver_vector_fir_re is
  port (
    tvi : in std_logic_vector( 1-1 downto 0 );
    tdi_1 : in std_logic_vector( 16-1 downto 0 );
    tdi_2 : in std_logic_vector( 16-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    trdyo : out std_logic;
    tdo : out std_logic_vector( 31-1 downto 0 )
  );
end bpsk_receiver_vector_fir_re;
architecture structural of bpsk_receiver_vector_fir_re is 
  signal fir_compiler_7_2_m_axis_data_tvalid_net : std_logic;
  signal ce_net : std_logic;
  signal s_axis_tvalid_re_net : std_logic_vector( 1-1 downto 0 );
  signal reinterpret1_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_s_axis_data_tready_net : std_logic;
  signal reinterpret0_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal clk_net : std_logic;
  signal fir_compiler_7_2_m_axis_data_tdata_real_net : std_logic_vector( 31-1 downto 0 );
begin
  trdyo <= fir_compiler_7_2_s_axis_data_tready_net;
  tdo <= fir_compiler_7_2_m_axis_data_tdata_real_net;
  s_axis_tvalid_re_net <= tvi;
  reinterpret0_output_port_net <= tdi_1;
  reinterpret1_output_port_net <= tdi_2;
  clk_net <= clk_1;
  ce_net <= ce_1;
  fir_compiler_7_2 : entity xil_defaultlib.xlfir_compiler_ec3490f6707211816649400e84947579 
  port map (
    s_axis_data_tvalid => s_axis_tvalid_re_net(0),
    s_axis_data_tdata_vect1 => reinterpret1_output_port_net,
    s_axis_data_tdata_vect0 => reinterpret0_output_port_net,
    src_clk => clk_net,
    src_ce => ce_net,
    clk => clk_net,
    ce => ce_net,
    s_axis_data_tready => fir_compiler_7_2_s_axis_data_tready_net,
    m_axis_data_tvalid => fir_compiler_7_2_m_axis_data_tvalid_net,
    m_axis_data_tdata_real => fir_compiler_7_2_m_axis_data_tdata_real_net
  );
end structural;
-- Generated from Simulink block bpsk_receiver/SSR Halfband Lowpass Decimator
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity bpsk_receiver_ssr_halfband_lowpass_decimator is
  port (
    valid_in : in std_logic_vector( 1-1 downto 0 );
    real_in_1 : in std_logic_vector( 16-1 downto 0 );
    imag_in_1 : in std_logic_vector( 16-1 downto 0 );
    real_in_2 : in std_logic_vector( 16-1 downto 0 );
    imag_in_2 : in std_logic_vector( 16-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    real_out : out std_logic_vector( 16-1 downto 0 );
    imag_out : out std_logic_vector( 16-1 downto 0 );
    ready_out : out std_logic
  );
end bpsk_receiver_ssr_halfband_lowpass_decimator;
architecture structural of bpsk_receiver_ssr_halfband_lowpass_decimator is 
  signal convert_dout_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret1_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_s_axis_data_tready_net : std_logic;
  signal reinterpret1_output_port_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal reinterpret0_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal convert1_dout_net : std_logic_vector( 16-1 downto 0 );
  signal s_axis_tvalid_re_net : std_logic_vector( 1-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tdata_real_net : std_logic_vector( 31-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal reinterpret0_output_port_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tdata_real_net_x0 : std_logic_vector( 31-1 downto 0 );
begin
  real_out <= convert_dout_net;
  imag_out <= convert1_dout_net;
  ready_out <= fir_compiler_7_2_s_axis_data_tready_net;
  s_axis_tvalid_re_net <= valid_in;
  reinterpret0_output_port_net_x0 <= real_in_1;
  reinterpret0_output_port_net <= imag_in_1;
  reinterpret1_output_port_net_x0 <= real_in_2;
  reinterpret1_output_port_net <= imag_in_2;
  clk_net <= clk_1;
  ce_net <= ce_1;
  vector_fir_im : entity xil_defaultlib.bpsk_receiver_vector_fir_im 
  port map (
    tvi => s_axis_tvalid_re_net,
    tdi_1 => reinterpret0_output_port_net,
    tdi_2 => reinterpret1_output_port_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    tdo => fir_compiler_7_2_m_axis_data_tdata_real_net_x0
  );
  vector_fir_re : entity xil_defaultlib.bpsk_receiver_vector_fir_re 
  port map (
    tvi => s_axis_tvalid_re_net,
    tdi_1 => reinterpret0_output_port_net_x0,
    tdi_2 => reinterpret1_output_port_net_x0,
    clk_1 => clk_net,
    ce_1 => ce_net,
    trdyo => fir_compiler_7_2_s_axis_data_tready_net,
    tdo => fir_compiler_7_2_m_axis_data_tdata_real_net
  );
  convert : entity xil_defaultlib.bpsk_receiver_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 28,
    din_width => 31,
    dout_arith => 2,
    dout_bin_pt => 14,
    dout_width => 16,
    latency => 0,
    overflow => xlWrap,
    quantization => xlTruncate
  )
  port map (
    clr => '0',
    en => "1",
    din => fir_compiler_7_2_m_axis_data_tdata_real_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert_dout_net
  );
  convert1 : entity xil_defaultlib.bpsk_receiver_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 28,
    din_width => 31,
    dout_arith => 2,
    dout_bin_pt => 14,
    dout_width => 16,
    latency => 0,
    overflow => xlWrap,
    quantization => xlTruncate
  )
  port map (
    clr => '0',
    en => "1",
    din => fir_compiler_7_2_m_axis_data_tdata_real_net_x0,
    clk => clk_net,
    ce => ce_net,
    dout => convert1_dout_net
  );
end structural;
-- Generated from Simulink block bpsk_receiver/Time Synchronisation/Loop Filter
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity bpsk_receiver_loop_filter_x0 is
  port (
    real_in : in std_logic_vector( 16-1 downto 0 );
    imag_in : in std_logic_vector( 16-1 downto 0 );
    signal_in : in std_logic_vector( 34-1 downto 0 );
    valid_in : in std_logic_vector( 1-1 downto 0 );
    reset : in std_logic_vector( 1-1 downto 0 );
    clk_20 : in std_logic;
    ce_20 : in std_logic;
    real_out : out std_logic_vector( 16-1 downto 0 );
    imag_out : out std_logic_vector( 16-1 downto 0 );
    valid_out : out std_logic_vector( 1-1 downto 0 );
    error_out : out std_logic_vector( 53-1 downto 0 )
  );
end bpsk_receiver_loop_filter_x0;
architecture structural of bpsk_receiver_loop_filter_x0 is 
  signal delay1_q_net : std_logic_vector( 16-1 downto 0 );
  signal delay2_q_net : std_logic_vector( 16-1 downto 0 );
  signal delay3_q_net : std_logic_vector( 1-1 downto 0 );
  signal convert_dout_net : std_logic_vector( 16-1 downto 0 );
  signal convert1_dout_net : std_logic_vector( 16-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 34-1 downto 0 );
  signal reset_time_sync_net : std_logic_vector( 1-1 downto 0 );
  signal relational_op_net : std_logic_vector( 1-1 downto 0 );
  signal src_ce_net : std_logic;
  signal addsub1_s_net : std_logic_vector( 53-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 52-1 downto 0 );
  signal k2_gain_p_net : std_logic_vector( 52-1 downto 0 );
  signal src_clk_net : std_logic;
  signal register1_q_net : std_logic_vector( 34-1 downto 0 );
  signal register_q_net : std_logic_vector( 52-1 downto 0 );
  signal k1_gain_p_net : std_logic_vector( 52-1 downto 0 );
begin
  real_out <= delay1_q_net;
  imag_out <= delay2_q_net;
  valid_out <= delay3_q_net;
  error_out <= addsub1_s_net;
  convert_dout_net <= real_in;
  convert1_dout_net <= imag_in;
  addsub2_s_net <= signal_in;
  relational_op_net <= valid_in;
  reset_time_sync_net <= reset;
  src_clk_net <= clk_20;
  src_ce_net <= ce_20;
  addsub : entity xil_defaultlib.bpsk_receiver_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 44,
    a_width => 52,
    b_arith => xlSigned,
    b_bin_pt => 44,
    b_width => 52,
    c_has_c_out => 0,
    c_latency => 0,
    c_output_width => 53,
    core_name0 => "bpsk_receiver_c_addsub_v12_0_i4",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 53,
    latency => 0,
    overflow => 3,
    quantization => 1,
    s_arith => xlSigned,
    s_bin_pt => 44,
    s_width => 52
  )
  port map (
    clr => '0',
    en => "1",
    a => k2_gain_p_net,
    b => register_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    s => addsub_s_net
  );
  addsub1 : entity xil_defaultlib.bpsk_receiver_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 44,
    a_width => 52,
    b_arith => xlSigned,
    b_bin_pt => 44,
    b_width => 52,
    c_has_c_out => 0,
    c_latency => 0,
    c_output_width => 53,
    core_name0 => "bpsk_receiver_c_addsub_v12_0_i4",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 53,
    latency => 0,
    overflow => 1,
    quantization => 1,
    s_arith => xlSigned,
    s_bin_pt => 44,
    s_width => 53
  )
  port map (
    clr => '0',
    en => "1",
    a => k1_gain_p_net,
    b => addsub_s_net,
    clk => src_clk_net,
    ce => src_ce_net,
    s => addsub1_s_net
  );
  delay1 : entity xil_defaultlib.bpsk_receiver_xldelay 
  generic map (
    latency => 16,
    reg_retiming => 0,
    reset => 0,
    width => 16
  )
  port map (
    en => '1',
    rst => '0',
    d => convert_dout_net,
    clk => src_clk_net,
    ce => src_ce_net,
    q => delay1_q_net
  );
  delay2 : entity xil_defaultlib.bpsk_receiver_xldelay 
  generic map (
    latency => 16,
    reg_retiming => 0,
    reset => 0,
    width => 16
  )
  port map (
    en => '1',
    rst => '0',
    d => convert1_dout_net,
    clk => src_clk_net,
    ce => src_ce_net,
    q => delay2_q_net
  );
  delay3 : entity xil_defaultlib.bpsk_receiver_xldelay 
  generic map (
    latency => 16,
    reg_retiming => 0,
    reset => 0,
    width => 1
  )
  port map (
    en => '1',
    rst => '0',
    d => relational_op_net,
    clk => src_clk_net,
    ce => src_ce_net,
    q => delay3_q_net
  );
  k1_gain : entity xil_defaultlib.bpsk_receiver_xlcmult 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 28,
    a_width => 34,
    b_bin_pt => 16,
    c_a_type => 0,
    c_a_width => 34,
    c_b_type => 1,
    c_b_width => 18,
    c_output_width => 52,
    core_name0 => "bpsk_receiver_mult_gen_v12_0_i6",
    extra_registers => 0,
    multsign => 2,
    overflow => 1,
    p_arith => xlSigned,
    p_bin_pt => 44,
    p_width => 52,
    quantization => 1,
    zero_const => 0
  )
  port map (
    clr => '0',
    core_clr => '1',
    en => "1",
    rst => "0",
    a => register1_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    core_clk => src_clk_net,
    core_ce => src_ce_net,
    p => k1_gain_p_net
  );
  k2_gain : entity xil_defaultlib.bpsk_receiver_xlcmult 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 28,
    a_width => 34,
    b_bin_pt => 16,
    c_a_type => 0,
    c_a_width => 34,
    c_b_type => 1,
    c_b_width => 18,
    c_output_width => 52,
    core_name0 => "bpsk_receiver_mult_gen_v12_0_i7",
    extra_registers => 0,
    multsign => 2,
    overflow => 1,
    p_arith => xlSigned,
    p_bin_pt => 44,
    p_width => 52,
    quantization => 1,
    zero_const => 0
  )
  port map (
    clr => '0',
    core_clr => '1',
    en => "1",
    rst => "0",
    a => register1_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    core_clk => src_clk_net,
    core_ce => src_ce_net,
    p => k2_gain_p_net
  );
  register_x0 : entity xil_defaultlib.bpsk_receiver_xlregister 
  generic map (
    d_width => 52,
    init_value => b"0000000000000000000000000000000000000000000000000000"
  )
  port map (
    d => addsub_s_net,
    rst => reset_time_sync_net,
    en => relational_op_net,
    clk => src_clk_net,
    ce => src_ce_net,
    q => register_q_net
  );
  register1 : entity xil_defaultlib.bpsk_receiver_xlregister 
  generic map (
    d_width => 34,
    init_value => b"0000000000000000000000000000000000"
  )
  port map (
    d => addsub2_s_net,
    rst => reset_time_sync_net,
    en => relational_op_net,
    clk => src_clk_net,
    ce => src_ce_net,
    q => register1_q_net
  );
end structural;
-- Generated from Simulink block bpsk_receiver/Time Synchronisation/NCC
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity bpsk_receiver_ncc is
  port (
    error : in std_logic_vector( 53-1 downto 0 );
    clk_20 : in std_logic;
    ce_20 : in std_logic;
    strobe : out std_logic_vector( 1-1 downto 0 )
  );
end bpsk_receiver_ncc;
architecture structural of bpsk_receiver_ncc is 
  signal relational_op_net : std_logic_vector( 1-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 54-1 downto 0 );
  signal register_q_net : std_logic_vector( 49-1 downto 0 );
  signal src_ce_net : std_logic;
  signal src_clk_net : std_logic;
  signal addsub1_s_net_x0 : std_logic_vector( 53-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 49-1 downto 0 );
  signal constant_op_net : std_logic_vector( 1-1 downto 0 );
begin
  strobe <= relational_op_net;
  addsub1_s_net_x0 <= error;
  src_clk_net <= clk_20;
  src_ce_net <= ce_20;
  addsub : entity xil_defaultlib.bpsk_receiver_xladdsub 
  generic map (
    a_arith => xlUnsigned,
    a_bin_pt => 44,
    a_width => 49,
    b_arith => xlSigned,
    b_bin_pt => 44,
    b_width => 54,
    c_has_c_out => 0,
    c_latency => 0,
    c_output_width => 55,
    core_name0 => "bpsk_receiver_c_addsub_v12_0_i5",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 55,
    latency => 0,
    overflow => 1,
    quantization => 1,
    s_arith => xlUnsigned,
    s_bin_pt => 44,
    s_width => 49
  )
  port map (
    clr => '0',
    en => "1",
    a => register_q_net,
    b => addsub1_s_net,
    clk => src_clk_net,
    ce => src_ce_net,
    s => addsub_s_net
  );
  addsub1 : entity xil_defaultlib.bpsk_receiver_xladdsub 
  generic map (
    a_arith => xlUnsigned,
    a_bin_pt => 0,
    a_width => 1,
    b_arith => xlSigned,
    b_bin_pt => 44,
    b_width => 53,
    c_has_c_out => 0,
    c_latency => 0,
    c_output_width => 54,
    core_name0 => "bpsk_receiver_c_addsub_v12_0_i6",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 54,
    latency => 0,
    overflow => 3,
    quantization => 1,
    s_arith => xlSigned,
    s_bin_pt => 44,
    s_width => 54
  )
  port map (
    clr => '0',
    en => "1",
    a => constant_op_net,
    b => addsub1_s_net_x0,
    clk => src_clk_net,
    ce => src_ce_net,
    s => addsub1_s_net
  );
  constant_x0 : entity xil_defaultlib.sysgen_constant_68b1d293da 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  register_x0 : entity xil_defaultlib.bpsk_receiver_xlregister 
  generic map (
    d_width => 49,
    init_value => b"0000000000000000000000000000000000000000000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => addsub_s_net,
    clk => src_clk_net,
    ce => src_ce_net,
    q => register_q_net
  );
  relational : entity xil_defaultlib.sysgen_relational_3e3afcc8b6 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    a => addsub_s_net,
    b => register_q_net,
    op => relational_op_net
  );
end structural;
-- Generated from Simulink block bpsk_receiver/Time Synchronisation/Timing Error Detector
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity bpsk_receiver_timing_error_detector is
  port (
    real_in : in std_logic_vector( 16-1 downto 0 );
    imag_in : in std_logic_vector( 16-1 downto 0 );
    clk_20 : in std_logic;
    ce_20 : in std_logic;
    error : out std_logic_vector( 34-1 downto 0 )
  );
end bpsk_receiver_timing_error_detector;
architecture structural of bpsk_receiver_timing_error_detector is 
  signal addsub2_s_net : std_logic_vector( 34-1 downto 0 );
  signal src_clk_net : std_logic;
  signal convert_dout_net : std_logic_vector( 16-1 downto 0 );
  signal convert1_dout_net : std_logic_vector( 16-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 33-1 downto 0 );
  signal src_ce_net : std_logic;
  signal delay_q_net : std_logic_vector( 32-1 downto 0 );
  signal mult1_p_net : std_logic_vector( 32-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 33-1 downto 0 );
  signal mult2_p_net : std_logic_vector( 32-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 32-1 downto 0 );
begin
  error <= addsub2_s_net;
  convert_dout_net <= real_in;
  convert1_dout_net <= imag_in;
  src_clk_net <= clk_20;
  src_ce_net <= ce_20;
  addsub : entity xil_defaultlib.bpsk_receiver_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 28,
    a_width => 32,
    b_arith => xlSigned,
    b_bin_pt => 28,
    b_width => 32,
    c_has_c_out => 0,
    c_latency => 0,
    c_output_width => 33,
    core_name0 => "bpsk_receiver_c_addsub_v12_0_i7",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 33,
    latency => 0,
    overflow => 1,
    quantization => 1,
    s_arith => xlSigned,
    s_bin_pt => 28,
    s_width => 33
  )
  port map (
    clr => '0',
    en => "1",
    a => mult1_p_net,
    b => delay_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    s => addsub_s_net
  );
  addsub1 : entity xil_defaultlib.bpsk_receiver_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 28,
    a_width => 32,
    b_arith => xlSigned,
    b_bin_pt => 28,
    b_width => 32,
    c_has_c_out => 0,
    c_latency => 0,
    c_output_width => 33,
    core_name0 => "bpsk_receiver_c_addsub_v12_0_i7",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 33,
    latency => 0,
    overflow => 1,
    quantization => 1,
    s_arith => xlSigned,
    s_bin_pt => 28,
    s_width => 33
  )
  port map (
    clr => '0',
    en => "1",
    a => mult2_p_net,
    b => delay1_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity xil_defaultlib.bpsk_receiver_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 28,
    a_width => 33,
    b_arith => xlSigned,
    b_bin_pt => 28,
    b_width => 33,
    c_has_c_out => 0,
    c_latency => 0,
    c_output_width => 34,
    core_name0 => "bpsk_receiver_c_addsub_v12_0_i8",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 34,
    latency => 0,
    overflow => 2,
    quantization => 2,
    s_arith => xlSigned,
    s_bin_pt => 28,
    s_width => 34
  )
  port map (
    clr => '0',
    en => "1",
    a => addsub_s_net,
    b => addsub1_s_net,
    clk => src_clk_net,
    ce => src_ce_net,
    s => addsub2_s_net
  );
  delay : entity xil_defaultlib.bpsk_receiver_xldelay 
  generic map (
    latency => 32,
    reg_retiming => 0,
    reset => 0,
    width => 32
  )
  port map (
    en => '1',
    rst => '0',
    d => mult1_p_net,
    clk => src_clk_net,
    ce => src_ce_net,
    q => delay_q_net
  );
  delay1 : entity xil_defaultlib.bpsk_receiver_xldelay 
  generic map (
    latency => 32,
    reg_retiming => 0,
    reset => 0,
    width => 32
  )
  port map (
    en => '1',
    rst => '0',
    d => mult2_p_net,
    clk => src_clk_net,
    ce => src_ce_net,
    q => delay1_q_net
  );
  mult1 : entity xil_defaultlib.bpsk_receiver_xlmult 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 14,
    a_width => 16,
    b_arith => xlSigned,
    b_bin_pt => 14,
    b_width => 16,
    c_a_type => 0,
    c_a_width => 16,
    c_b_type => 0,
    c_b_width => 16,
    c_baat => 16,
    c_output_width => 32,
    c_type => 0,
    core_name0 => "bpsk_receiver_mult_gen_v12_0_i8",
    extra_registers => 0,
    multsign => 2,
    overflow => 1,
    p_arith => xlSigned,
    p_bin_pt => 28,
    p_width => 32,
    quantization => 1
  )
  port map (
    clr => '0',
    core_clr => '1',
    en => "1",
    rst => "0",
    a => convert_dout_net,
    b => convert_dout_net,
    clk => src_clk_net,
    ce => src_ce_net,
    core_clk => src_clk_net,
    core_ce => src_ce_net,
    p => mult1_p_net
  );
  mult2 : entity xil_defaultlib.bpsk_receiver_xlmult 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 14,
    a_width => 16,
    b_arith => xlSigned,
    b_bin_pt => 14,
    b_width => 16,
    c_a_type => 0,
    c_a_width => 16,
    c_b_type => 0,
    c_b_width => 16,
    c_baat => 16,
    c_output_width => 32,
    c_type => 0,
    core_name0 => "bpsk_receiver_mult_gen_v12_0_i8",
    extra_registers => 0,
    multsign => 2,
    overflow => 1,
    p_arith => xlSigned,
    p_bin_pt => 28,
    p_width => 32,
    quantization => 1
  )
  port map (
    clr => '0',
    core_clr => '1',
    en => "1",
    rst => "0",
    a => convert1_dout_net,
    b => convert1_dout_net,
    clk => src_clk_net,
    ce => src_ce_net,
    core_clk => src_clk_net,
    core_ce => src_ce_net,
    p => mult2_p_net
  );
end structural;
-- Generated from Simulink block bpsk_receiver/Time Synchronisation
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity bpsk_receiver_time_synchronisation is
  port (
    reset : in std_logic_vector( 1-1 downto 0 );
    valid_in : in std_logic;
    real_in : in std_logic_vector( 16-1 downto 0 );
    imag_in : in std_logic_vector( 16-1 downto 0 );
    clk_20 : in std_logic;
    ce_20 : in std_logic;
    valid_out : out std_logic_vector( 1-1 downto 0 );
    real_out : out std_logic_vector( 16-1 downto 0 );
    imag_out : out std_logic_vector( 16-1 downto 0 )
  );
end bpsk_receiver_time_synchronisation;
architecture structural of bpsk_receiver_time_synchronisation is 
  signal src_clk_net : std_logic;
  signal delay2_q_net : std_logic_vector( 16-1 downto 0 );
  signal delay3_q_net : std_logic_vector( 1-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 16-1 downto 0 );
  signal convert_dout_net : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net : std_logic;
  signal convert1_dout_net : std_logic_vector( 16-1 downto 0 );
  signal reset_time_sync_net : std_logic_vector( 1-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 53-1 downto 0 );
  signal src_ce_net : std_logic;
  signal relational_op_net : std_logic_vector( 1-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 34-1 downto 0 );
begin
  valid_out <= delay3_q_net;
  real_out <= delay1_q_net;
  imag_out <= delay2_q_net;
  reset_time_sync_net <= reset;
  fir_compiler_7_2_m_axis_data_tvalid_net <= valid_in;
  convert_dout_net <= real_in;
  convert1_dout_net <= imag_in;
  src_clk_net <= clk_20;
  src_ce_net <= ce_20;
  loop_filter : entity xil_defaultlib.bpsk_receiver_loop_filter_x0 
  port map (
    real_in => convert_dout_net,
    imag_in => convert1_dout_net,
    signal_in => addsub2_s_net,
    valid_in => relational_op_net,
    reset => reset_time_sync_net,
    clk_20 => src_clk_net,
    ce_20 => src_ce_net,
    real_out => delay1_q_net,
    imag_out => delay2_q_net,
    valid_out => delay3_q_net,
    error_out => addsub1_s_net
  );
  ncc : entity xil_defaultlib.bpsk_receiver_ncc 
  port map (
    error => addsub1_s_net,
    clk_20 => src_clk_net,
    ce_20 => src_ce_net,
    strobe => relational_op_net
  );
  timing_error_detector : entity xil_defaultlib.bpsk_receiver_timing_error_detector 
  port map (
    real_in => convert_dout_net,
    imag_in => convert1_dout_net,
    clk_20 => src_clk_net,
    ce_20 => src_ce_net,
    error => addsub2_s_net
  );
end structural;
-- Generated from Simulink block bpsk_receiver_struct
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity bpsk_receiver_struct is
  port (
    coarse_passthrough : in std_logic_vector( 1-1 downto 0 );
    enable_transfer : in std_logic_vector( 1-1 downto 0 );
    observation_point : in std_logic_vector( 32-1 downto 0 );
    reset_frame_sync : in std_logic_vector( 1-1 downto 0 );
    reset_phase_sync : in std_logic_vector( 1-1 downto 0 );
    reset_time_sync : in std_logic_vector( 1-1 downto 0 );
    threshold : in std_logic_vector( 32-1 downto 0 );
    m_axis_tready : in std_logic_vector( 1-1 downto 0 );
    s_axis_tdata_im : in std_logic_vector( 32-1 downto 0 );
    s_axis_tdata_re : in std_logic_vector( 32-1 downto 0 );
    s_axis_tvalid_im : in std_logic_vector( 1-1 downto 0 );
    s_axis_tvalid_re : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    clk_5 : in std_logic;
    ce_5 : in std_logic;
    clk_20 : in std_logic;
    ce_20 : in std_logic;
    freq_offset : out std_logic_vector( 32-1 downto 0 );
    data_count : out std_logic_vector( 12-1 downto 0 );
    frame_size : out std_logic_vector( 8-1 downto 0 );
    packet_count : out std_logic_vector( 32-1 downto 0 );
    packet_size : out std_logic_vector( 8-1 downto 0 );
    irq : out std_logic_vector( 1-1 downto 0 );
    m_axis_tdata : out std_logic_vector( 8-1 downto 0 );
    m_axis_tlast : out std_logic_vector( 1-1 downto 0 );
    m_axis_tvalid : out std_logic_vector( 1-1 downto 0 );
    s_axis_tready_im : out std_logic_vector( 1-1 downto 0 );
    s_axis_tready_re : out std_logic_vector( 1-1 downto 0 );
    m_axis_op_tdata : out std_logic_vector( 32-1 downto 0 );
    m_axis_op_tvalid : out std_logic_vector( 1-1 downto 0 )
  );
end bpsk_receiver_struct;
architecture structural of bpsk_receiver_struct is 
  signal reset_phase_sync_net : std_logic_vector( 1-1 downto 0 );
  signal s_axis_tvalid_re_net : std_logic_vector( 1-1 downto 0 );
  signal register6_q_net : std_logic_vector( 8-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal mux_valid_y_net : std_logic_vector( 1-1 downto 0 );
  signal enable_transfer_net : std_logic_vector( 1-1 downto 0 );
  signal s_axis_tvalid_im_net : std_logic_vector( 1-1 downto 0 );
  signal concat_y_net : std_logic_vector( 32-1 downto 0 );
  signal reset_frame_sync_net : std_logic_vector( 1-1 downto 0 );
  signal ce_net : std_logic;
  signal clk_5_net : std_logic;
  signal fifo_dcount_net : std_logic_vector( 12-1 downto 0 );
  signal observation_point_net : std_logic_vector( 32-1 downto 0 );
  signal threshold_net : std_logic_vector( 32-1 downto 0 );
  signal register_q_net : std_logic_vector( 1-1 downto 0 );
  signal coarse_passthrough_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal reset_time_sync_net : std_logic_vector( 1-1 downto 0 );
  signal ce_5_net : std_logic;
  signal inverter3_op_net : std_logic_vector( 1-1 downto 0 );
  signal rom_data_net : std_logic_vector( 32-1 downto 0 );
  signal m_axis_tready_net : std_logic_vector( 1-1 downto 0 );
  signal s_axis_tdata_re_net : std_logic_vector( 32-1 downto 0 );
  signal fir_compiler_7_2_s_axis_data_tready_net : std_logic_vector( 1-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 8-1 downto 0 );
  signal mux1_y_net_x0 : std_logic_vector( 8-1 downto 0 );
  signal counter1_op_net : std_logic_vector( 32-1 downto 0 );
  signal s_axis_tdata_im_net : std_logic_vector( 32-1 downto 0 );
  signal reinterpret1_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal convert_dout_net_x1 : std_logic_vector( 16-1 downto 0 );
  signal delay_q_net : std_logic_vector( 1-1 downto 0 );
  signal src_clk_net : std_logic;
  signal cmult1_p_net : std_logic_vector( 16-1 downto 0 );
  signal convert1_dout_net : std_logic_vector( 16-1 downto 0 );
  signal mux1_y_net : std_logic_vector( 16-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret0_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal register5_q_net : std_logic_vector( 8-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x0 : std_logic;
  signal logical2_y_net : std_logic_vector( 1-1 downto 0 );
  signal convert_dout_net : std_logic_vector( 16-1 downto 0 );
  signal cic_decimator_real_m_axis_data_tvalid_net : std_logic;
  signal convert_dout_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal reinterpret1_output_port_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal register3_q_net : std_logic_vector( 1-1 downto 0 );
  signal reinterpret0_output_port_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal mux_y_net : std_logic_vector( 16-1 downto 0 );
  signal register4_q_net : std_logic_vector( 1-1 downto 0 );
  signal src_ce_net : std_logic;
  signal convert1_dout_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal cmult2_p_net : std_logic_vector( 16-1 downto 0 );
  signal delay3_q_net : std_logic_vector( 1-1 downto 0 );
  signal convert1_dout_net_x1 : std_logic_vector( 16-1 downto 0 );
  signal delay2_q_net : std_logic_vector( 16-1 downto 0 );
begin
  freq_offset <= rom_data_net;
  coarse_passthrough_net <= coarse_passthrough;
  data_count <= fifo_dcount_net;
  enable_transfer_net <= enable_transfer;
  frame_size <= register6_q_net;
  observation_point_net <= observation_point;
  packet_count <= counter1_op_net;
  packet_size <= mux1_y_net_x0;
  reset_frame_sync_net <= reset_frame_sync;
  reset_phase_sync_net <= reset_phase_sync;
  reset_time_sync_net <= reset_time_sync;
  threshold_net <= threshold;
  irq <= inverter3_op_net;
  m_axis_tdata <= slice1_y_net;
  m_axis_tlast <= slice_y_net;
  m_axis_tready_net <= m_axis_tready;
  m_axis_tvalid <= register_q_net;
  s_axis_tdata_im_net <= s_axis_tdata_im;
  s_axis_tdata_re_net <= s_axis_tdata_re;
  s_axis_tready_im <= fir_compiler_7_2_s_axis_data_tready_net;
  s_axis_tready_re <= fir_compiler_7_2_s_axis_data_tready_net;
  s_axis_tvalid_im_net <= s_axis_tvalid_im;
  s_axis_tvalid_re_net <= s_axis_tvalid_re;
  m_axis_op_tdata <= concat_y_net;
  m_axis_op_tvalid <= mux_valid_y_net;
  clk_net <= clk_1;
  ce_net <= ce_1;
  clk_5_net <= clk_5;
  ce_5_net <= ce_5;
  src_clk_net <= clk_20;
  src_ce_net <= ce_20;
  axi_stream_master_interface : entity xil_defaultlib.bpsk_receiver_axi_stream_master_interface 
  port map (
    enable => enable_transfer_net,
    reset => reset_frame_sync_net,
    valid_in => register3_q_net,
    data_in => register5_q_net,
    last_in => logical2_y_net,
    size_in => register6_q_net,
    m_axis_tready => m_axis_tready_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    clk_20 => src_clk_net,
    ce_20 => src_ce_net,
    count => fifo_dcount_net,
    size_out => mux1_y_net_x0,
    irq => inverter3_op_net,
    m_axis_tdata => slice1_y_net,
    m_axis_tlast => slice_y_net,
    m_axis_tvalid => register_q_net
  );
  cic_decimator : entity xil_defaultlib.bpsk_receiver_cic_decimator 
  port map (
    real_in => convert_dout_net,
    imag_in => convert1_dout_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    clk_5 => clk_5_net,
    ce_5 => ce_5_net,
    valid_out => cic_decimator_real_m_axis_data_tvalid_net,
    real_out => cmult2_p_net,
    imag_out => cmult1_p_net
  );
  carrier_synchronisation : entity xil_defaultlib.bpsk_receiver_carrier_synchronisation 
  port map (
    reset => reset_phase_sync_net,
    valid_in => delay3_q_net,
    real_in => delay1_q_net,
    imag_in => delay2_q_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    clk_20 => src_clk_net,
    ce_20 => src_ce_net,
    valid_out => register4_q_net,
    real_out => convert1_dout_net_x1,
    imag_out => convert_dout_net_x1
  );
  coarse_frequency_synchronisation : entity xil_defaultlib.bpsk_receiver_coarse_frequency_synchronisation 
  port map (
    passthrough => coarse_passthrough_net,
    valid_in => cic_decimator_real_m_axis_data_tvalid_net,
    real_in => cmult2_p_net,
    imag_in => cmult1_p_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    clk_5 => clk_5_net,
    ce_5 => ce_5_net,
    valid_out => delay_q_net,
    real_out => mux1_y_net,
    imag_out => mux_y_net,
    freq_offset => rom_data_net
  );
  complex_axi_stream_slave_interface : entity xil_defaultlib.bpsk_receiver_complex_axi_stream_slave_interface 
  port map (
    ready_in => fir_compiler_7_2_s_axis_data_tready_net(0),
    s_axis_tdata_im => s_axis_tdata_im_net,
    s_axis_tdata_re => s_axis_tdata_re_net,
    s_axis_tvalid_re => s_axis_tvalid_re_net,
    real_out_1 => reinterpret0_output_port_net_x0,
    imag_out_1 => reinterpret0_output_port_net,
    real_out_2 => reinterpret1_output_port_net_x0,
    imag_out_2 => reinterpret1_output_port_net
  );
  frame_synchronisation : entity xil_defaultlib.bpsk_receiver_frame_synchronisation 
  port map (
    reset => reset_frame_sync_net,
    threshold => threshold_net,
    valid_in => register4_q_net,
    real_in => convert1_dout_net_x1,
    clk_1 => clk_net,
    ce_1 => ce_net,
    clk_20 => src_clk_net,
    ce_20 => src_ce_net,
    valid_out => register3_q_net,
    data_out => register5_q_net,
    last_out => logical2_y_net,
    size => register6_q_net,
    count => counter1_op_net
  );
  observation_point_x0 : entity xil_defaultlib.bpsk_receiver_observation_point 
  port map (
    valid_b => delay3_q_net,
    valid_e => cic_decimator_real_m_axis_data_tvalid_net,
    valid_d => delay_q_net,
    valid_c => fir_compiler_7_2_m_axis_data_tvalid_net_x0,
    real_b => delay1_q_net,
    real_e => cmult2_p_net,
    real_d => mux1_y_net,
    real_c => convert_dout_net_x0,
    valid_a => register4_q_net,
    imag_b => delay2_q_net,
    imag_e => cmult1_p_net,
    imag_d => mux_y_net,
    imag_c => convert1_dout_net_x0,
    real_a => convert1_dout_net_x1,
    imag_a => convert_dout_net_x1,
    control => observation_point_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    clk_5 => clk_5_net,
    ce_5 => ce_5_net,
    clk_20 => src_clk_net,
    ce_20 => src_ce_net,
    m_axis_op_tdata => concat_y_net,
    m_axis_op_tvalid => mux_valid_y_net
  );
  rrc_receive_filter : entity xil_defaultlib.bpsk_receiver_rrc_receive_filter 
  port map (
    valid_in => delay_q_net,
    real_in => mux1_y_net,
    imag_in => mux_y_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    clk_5 => clk_5_net,
    ce_5 => ce_5_net,
    clk_20 => src_clk_net,
    ce_20 => src_ce_net,
    valid_out => fir_compiler_7_2_m_axis_data_tvalid_net_x0,
    real_out => convert_dout_net_x0,
    imag_out => convert1_dout_net_x0
  );
  ssr_halfband_lowpass_decimator : entity xil_defaultlib.bpsk_receiver_ssr_halfband_lowpass_decimator 
  port map (
    valid_in => s_axis_tvalid_re_net,
    real_in_1 => reinterpret0_output_port_net_x0,
    imag_in_1 => reinterpret0_output_port_net,
    real_in_2 => reinterpret1_output_port_net_x0,
    imag_in_2 => reinterpret1_output_port_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    real_out => convert_dout_net,
    imag_out => convert1_dout_net,
    ready_out => fir_compiler_7_2_s_axis_data_tready_net(0)
  );
  time_synchronisation : entity xil_defaultlib.bpsk_receiver_time_synchronisation 
  port map (
    reset => reset_time_sync_net,
    valid_in => fir_compiler_7_2_m_axis_data_tvalid_net_x0,
    real_in => convert_dout_net_x0,
    imag_in => convert1_dout_net_x0,
    clk_20 => src_clk_net,
    ce_20 => src_ce_net,
    valid_out => delay3_q_net,
    real_out => delay1_q_net,
    imag_out => delay2_q_net
  );
end structural;
-- Generated from Simulink block 
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity bpsk_receiver_default_clock_driver is
  port (
    bpsk_receiver_sysclk : in std_logic;
    bpsk_receiver_sysce : in std_logic;
    bpsk_receiver_sysclr : in std_logic;
    bpsk_receiver_clk1 : out std_logic;
    bpsk_receiver_ce1 : out std_logic;
    bpsk_receiver_clk5 : out std_logic;
    bpsk_receiver_ce5 : out std_logic;
    bpsk_receiver_clk20 : out std_logic;
    bpsk_receiver_ce20 : out std_logic
  );
end bpsk_receiver_default_clock_driver;
architecture structural of bpsk_receiver_default_clock_driver is 
begin
  clockdriver_x1 : entity xil_defaultlib.xlclockdriver 
  generic map (
    period => 1,
    log_2_period => 1
  )
  port map (
    sysclk => bpsk_receiver_sysclk,
    sysce => bpsk_receiver_sysce,
    sysclr => bpsk_receiver_sysclr,
    clk => bpsk_receiver_clk1,
    ce => bpsk_receiver_ce1
  );
  clockdriver_x0 : entity xil_defaultlib.xlclockdriver 
  generic map (
    period => 5,
    log_2_period => 3
  )
  port map (
    sysclk => bpsk_receiver_sysclk,
    sysce => bpsk_receiver_sysce,
    sysclr => bpsk_receiver_sysclr,
    clk => bpsk_receiver_clk5,
    ce => bpsk_receiver_ce5
  );
  clockdriver : entity xil_defaultlib.xlclockdriver 
  generic map (
    period => 20,
    log_2_period => 5
  )
  port map (
    sysclk => bpsk_receiver_sysclk,
    sysce => bpsk_receiver_sysce,
    sysclr => bpsk_receiver_sysclr,
    clk => bpsk_receiver_clk20,
    ce => bpsk_receiver_ce20
  );
end structural;
-- Generated from Simulink block 
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity bpsk_receiver is
  port (
    m_axis_tready : in std_logic_vector( 1-1 downto 0 );
    s_axis_tdata_im : in std_logic_vector( 32-1 downto 0 );
    s_axis_tdata_re : in std_logic_vector( 32-1 downto 0 );
    s_axis_tvalid_im : in std_logic_vector( 1-1 downto 0 );
    s_axis_tvalid_re : in std_logic_vector( 1-1 downto 0 );
    clk : in std_logic;
    bpsk_receiver_aresetn : in std_logic;
    bpsk_receiver_s_axi_awaddr : in std_logic_vector( 6-1 downto 0 );
    bpsk_receiver_s_axi_awvalid : in std_logic;
    bpsk_receiver_s_axi_wdata : in std_logic_vector( 32-1 downto 0 );
    bpsk_receiver_s_axi_wstrb : in std_logic_vector( 4-1 downto 0 );
    bpsk_receiver_s_axi_wvalid : in std_logic;
    bpsk_receiver_s_axi_bready : in std_logic;
    bpsk_receiver_s_axi_araddr : in std_logic_vector( 6-1 downto 0 );
    bpsk_receiver_s_axi_arvalid : in std_logic;
    bpsk_receiver_s_axi_rready : in std_logic;
    irq : out std_logic_vector( 1-1 downto 0 );
    m_axis_tdata : out std_logic_vector( 8-1 downto 0 );
    m_axis_tlast : out std_logic_vector( 1-1 downto 0 );
    m_axis_tvalid : out std_logic_vector( 1-1 downto 0 );
    s_axis_tready_im : out std_logic_vector( 1-1 downto 0 );
    s_axis_tready_re : out std_logic_vector( 1-1 downto 0 );
    m_axis_op_tdata : out std_logic_vector( 32-1 downto 0 );
    m_axis_op_tvalid : out std_logic_vector( 1-1 downto 0 );
    bpsk_receiver_s_axi_awready : out std_logic;
    bpsk_receiver_s_axi_wready : out std_logic;
    bpsk_receiver_s_axi_bresp : out std_logic_vector( 2-1 downto 0 );
    bpsk_receiver_s_axi_bvalid : out std_logic;
    bpsk_receiver_s_axi_arready : out std_logic;
    bpsk_receiver_s_axi_rdata : out std_logic_vector( 32-1 downto 0 );
    bpsk_receiver_s_axi_rresp : out std_logic_vector( 2-1 downto 0 );
    bpsk_receiver_s_axi_rvalid : out std_logic
  );
end bpsk_receiver;
architecture structural of bpsk_receiver is 
  attribute core_generation_info : string;
  attribute core_generation_info of structural : architecture is "bpsk_receiver,sysgen_core_2019_1,{,compilation=IP Catalog,block_icon_display=Default,family=zynquplusRFSOC,part=xczu28dr,speed=-2-e,package=ffvg1517,synthesis_language=vhdl,hdl_library=xil_defaultlib,synthesis_strategy=Vivado Synthesis Defaults,implementation_strategy=Vivado Implementation Defaults,testbench=0,interface_doc=1,ce_clr=0,clock_period=15.625,system_simulink_period=1.5625e-08,waveform_viewer=0,axilite_interface=1,ip_catalog_plugin=0,hwcosim_burst_mode=0,simulation_time=0.003125,addsub=36,cic_compiler_v4_0=2,cmult=8,concat=3,constant=20,convert=14,counter=6,delay=36,fifo=2,fir_compiler_v7_2=4,inv=16,logical=24,mult=4,mux=8,product_macro=4,register=55,reinterpret=6,relational=11,shift=19,slice=24,sprom=5,usamp=19,xfft_forward=1,}";
  signal ce_1_net : std_logic;
  signal coarse_passthrough : std_logic_vector( 1-1 downto 0 );
  signal observation_point : std_logic_vector( 32-1 downto 0 );
  signal data_count : std_logic_vector( 12-1 downto 0 );
  signal freq_offset : std_logic_vector( 32-1 downto 0 );
  signal clk_5_net : std_logic;
  signal packet_size : std_logic_vector( 8-1 downto 0 );
  signal ce_20_net : std_logic;
  signal reset_frame_sync : std_logic_vector( 1-1 downto 0 );
  signal reset_phase_sync : std_logic_vector( 1-1 downto 0 );
  signal frame_size : std_logic_vector( 8-1 downto 0 );
  signal reset_time_sync : std_logic_vector( 1-1 downto 0 );
  signal threshold : std_logic_vector( 32-1 downto 0 );
  signal clk_1_net : std_logic;
  signal ce_5_net : std_logic;
  signal clk_20_net : std_logic;
  signal enable_transfer : std_logic_vector( 1-1 downto 0 );
  signal packet_count : std_logic_vector( 32-1 downto 0 );
  signal clk_net : std_logic;
begin
  bpsk_receiver_axi_lite_interface : entity xil_defaultlib.bpsk_receiver_axi_lite_interface 
  port map (
    freq_offset => freq_offset,
    data_count => data_count,
    frame_size => frame_size,
    packet_count => packet_count,
    packet_size => packet_size,
    bpsk_receiver_s_axi_awaddr => bpsk_receiver_s_axi_awaddr,
    bpsk_receiver_s_axi_awvalid => bpsk_receiver_s_axi_awvalid,
    bpsk_receiver_s_axi_wdata => bpsk_receiver_s_axi_wdata,
    bpsk_receiver_s_axi_wstrb => bpsk_receiver_s_axi_wstrb,
    bpsk_receiver_s_axi_wvalid => bpsk_receiver_s_axi_wvalid,
    bpsk_receiver_s_axi_bready => bpsk_receiver_s_axi_bready,
    bpsk_receiver_s_axi_araddr => bpsk_receiver_s_axi_araddr,
    bpsk_receiver_s_axi_arvalid => bpsk_receiver_s_axi_arvalid,
    bpsk_receiver_s_axi_rready => bpsk_receiver_s_axi_rready,
    bpsk_receiver_aresetn => bpsk_receiver_aresetn,
    bpsk_receiver_aclk => clk,
    threshold => threshold,
    reset_time_sync => reset_time_sync,
    reset_phase_sync => reset_phase_sync,
    reset_frame_sync => reset_frame_sync,
    observation_point => observation_point,
    enable_transfer => enable_transfer,
    coarse_passthrough => coarse_passthrough,
    bpsk_receiver_s_axi_awready => bpsk_receiver_s_axi_awready,
    bpsk_receiver_s_axi_wready => bpsk_receiver_s_axi_wready,
    bpsk_receiver_s_axi_bresp => bpsk_receiver_s_axi_bresp,
    bpsk_receiver_s_axi_bvalid => bpsk_receiver_s_axi_bvalid,
    bpsk_receiver_s_axi_arready => bpsk_receiver_s_axi_arready,
    bpsk_receiver_s_axi_rdata => bpsk_receiver_s_axi_rdata,
    bpsk_receiver_s_axi_rresp => bpsk_receiver_s_axi_rresp,
    bpsk_receiver_s_axi_rvalid => bpsk_receiver_s_axi_rvalid,
    clk => clk_net
  );
  bpsk_receiver_default_clock_driver : entity xil_defaultlib.bpsk_receiver_default_clock_driver 
  port map (
    bpsk_receiver_sysclk => clk_net,
    bpsk_receiver_sysce => '1',
    bpsk_receiver_sysclr => '0',
    bpsk_receiver_clk1 => clk_1_net,
    bpsk_receiver_ce1 => ce_1_net,
    bpsk_receiver_clk5 => clk_5_net,
    bpsk_receiver_ce5 => ce_5_net,
    bpsk_receiver_clk20 => clk_20_net,
    bpsk_receiver_ce20 => ce_20_net
  );
  bpsk_receiver_struct : entity xil_defaultlib.bpsk_receiver_struct 
  port map (
    coarse_passthrough => coarse_passthrough,
    enable_transfer => enable_transfer,
    observation_point => observation_point,
    reset_frame_sync => reset_frame_sync,
    reset_phase_sync => reset_phase_sync,
    reset_time_sync => reset_time_sync,
    threshold => threshold,
    m_axis_tready => m_axis_tready,
    s_axis_tdata_im => s_axis_tdata_im,
    s_axis_tdata_re => s_axis_tdata_re,
    s_axis_tvalid_im => s_axis_tvalid_im,
    s_axis_tvalid_re => s_axis_tvalid_re,
    clk_1 => clk_1_net,
    ce_1 => ce_1_net,
    clk_5 => clk_5_net,
    ce_5 => ce_5_net,
    clk_20 => clk_20_net,
    ce_20 => ce_20_net,
    freq_offset => freq_offset,
    data_count => data_count,
    frame_size => frame_size,
    packet_count => packet_count,
    packet_size => packet_size,
    irq => irq,
    m_axis_tdata => m_axis_tdata,
    m_axis_tlast => m_axis_tlast,
    m_axis_tvalid => m_axis_tvalid,
    s_axis_tready_im => s_axis_tready_im,
    s_axis_tready_re => s_axis_tready_re,
    m_axis_op_tdata => m_axis_op_tdata,
    m_axis_op_tvalid => m_axis_op_tvalid
  );
end structural;
