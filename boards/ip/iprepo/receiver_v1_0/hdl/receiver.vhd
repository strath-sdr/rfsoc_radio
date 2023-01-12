-- Generated from Simulink block receiver/AXI-Stream Master Interface/Rising Edge Detector Enable
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity receiver_rising_edge_detector_enable is
  port (
    input : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    output : out std_logic_vector( 1-1 downto 0 )
  );
end receiver_rising_edge_detector_enable;
architecture structural of receiver_rising_edge_detector_enable is 
  signal enable_transfer_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal logical3_y_net : std_logic_vector( 1-1 downto 0 );
  signal inverter2_op_net : std_logic_vector( 1-1 downto 0 );
  signal register1_q_net : std_logic_vector( 1-1 downto 0 );
begin
  output <= logical3_y_net;
  enable_transfer_net <= input;
  clk_net <= clk_1;
  ce_net <= ce_1;
  inverter2 : entity xil_defaultlib.sysgen_inverter_db20653b1e 
  port map (
    clr => '0',
    ip => enable_transfer_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter2_op_net
  );
  logical3 : entity xil_defaultlib.sysgen_logical_613abbe5d0 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => register1_q_net,
    d1 => enable_transfer_net,
    y => logical3_y_net
  );
  register1 : entity xil_defaultlib.receiver_xlregister 
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
-- Generated from Simulink block receiver/AXI-Stream Master Interface/Rising Edge Detector Last
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity receiver_rising_edge_detector_last is
  port (
    input : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    output : out std_logic_vector( 1-1 downto 0 )
  );
end receiver_rising_edge_detector_last;
architecture structural of receiver_rising_edge_detector_last is 
  signal logical3_y_net : std_logic_vector( 1-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal inverter2_op_net : std_logic_vector( 1-1 downto 0 );
  signal register1_q_net : std_logic_vector( 1-1 downto 0 );
begin
  output <= logical3_y_net;
  slice_y_net <= input;
  clk_net <= clk_1;
  ce_net <= ce_1;
  inverter2 : entity xil_defaultlib.sysgen_inverter_db20653b1e 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter2_op_net
  );
  logical3 : entity xil_defaultlib.sysgen_logical_613abbe5d0 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => register1_q_net,
    d1 => slice_y_net,
    y => logical3_y_net
  );
  register1 : entity xil_defaultlib.receiver_xlregister 
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
-- Generated from Simulink block receiver/AXI-Stream Master Interface
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity receiver_axi_stream_master_interface is
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
end receiver_axi_stream_master_interface;
architecture structural of receiver_axi_stream_master_interface is 
  signal up_sample4_q_net : std_logic_vector( 8-1 downto 0 );
  signal up_sample1_q_net : std_logic_vector( 1-1 downto 0 );
  signal constant_op_net : std_logic_vector( 1-1 downto 0 );
  signal mux1_y_net : std_logic_vector( 8-1 downto 0 );
  signal register3_q_net : std_logic_vector( 1-1 downto 0 );
  signal fifo_dcount_net : std_logic_vector( 12-1 downto 0 );
  signal register5_q_net : std_logic_vector( 8-1 downto 0 );
  signal enable_transfer_net : std_logic_vector( 1-1 downto 0 );
  signal logical2_y_net_x1 : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal logical3_y_net_x1 : std_logic_vector( 1-1 downto 0 );
  signal src_clk_net : std_logic;
  signal logical3_y_net_x0 : std_logic_vector( 1-1 downto 0 );
  signal concat_y_net : std_logic_vector( 9-1 downto 0 );
  signal register6_q_net : std_logic_vector( 8-1 downto 0 );
  signal register_q_net : std_logic_vector( 1-1 downto 0 );
  signal logical2_y_net_x0 : std_logic_vector( 1-1 downto 0 );
  signal inverter3_op_net : std_logic_vector( 1-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal m_axis_tready_net : std_logic_vector( 1-1 downto 0 );
  signal ce_net : std_logic;
  signal src_ce_net : std_logic;
  signal slice1_y_net : std_logic_vector( 8-1 downto 0 );
  signal constant1_op_net : std_logic_vector( 1-1 downto 0 );
  signal constant2_op_net : std_logic_vector( 8-1 downto 0 );
  signal fifo_dout_net : std_logic_vector( 9-1 downto 0 );
  signal fifo1_empty_net : std_logic;
  signal fifo1_dout_net : std_logic_vector( 8-1 downto 0 );
  signal fifo_empty_net : std_logic;
  signal fifo_full_net : std_logic;
  signal logical3_y_net : std_logic;
  signal fifo1_dcount_net : std_logic_vector( 13-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal up_sample3_q_net : std_logic_vector( 8-1 downto 0 );
  signal logical5_y_net : std_logic;
  signal inverter1_op_net : std_logic_vector( 1-1 downto 0 );
  signal logical_y_net : std_logic;
  signal fifo1_full_net : std_logic;
  signal relational_op_net : std_logic_vector( 1-1 downto 0 );
  signal up_sample2_q_net : std_logic_vector( 1-1 downto 0 );
  signal logical1_y_net : std_logic_vector( 1-1 downto 0 );
  signal inverter2_op_net : std_logic_vector( 1-1 downto 0 );
  signal register1_q_net : std_logic_vector( 1-1 downto 0 );
  signal logical2_y_net : std_logic_vector( 1-1 downto 0 );
  signal mux_y_net : std_logic_vector( 1-1 downto 0 );
  signal logical4_y_net : std_logic_vector( 1-1 downto 0 );
begin
  count <= fifo_dcount_net;
  size_out <= mux1_y_net;
  enable_transfer_net <= enable;
  logical2_y_net_x1 <= reset;
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
  rising_edge_detector_enable : entity xil_defaultlib.receiver_rising_edge_detector_enable 
  port map (
    input => enable_transfer_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    output => logical3_y_net_x0
  );
  rising_edge_detector_last : entity xil_defaultlib.receiver_rising_edge_detector_last 
  port map (
    input => slice_y_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    output => logical3_y_net_x1
  );
  concat : entity xil_defaultlib.sysgen_concat_b0a3468cf3 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    in0 => up_sample4_q_net,
    in1 => up_sample1_q_net,
    y => concat_y_net
  );
  constant_x0 : entity xil_defaultlib.sysgen_constant_291ac9f735 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  constant1 : entity xil_defaultlib.sysgen_constant_e1cbbe41f1 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant1_op_net
  );
  constant2 : entity xil_defaultlib.sysgen_constant_31e26c3c13 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant2_op_net
  );
  fifo : entity xil_defaultlib.receiver_xlfifogen_u 
  generic map (
    core_name0 => "receiver_fifo_generator_i0",
    data_count_width => 12,
    data_width => 9,
    extra_registers => 1,
    has_ae => 0,
    has_af => 0,
    has_rst => true,
    ignore_din_for_gcd => false,
    percent_full_width => 1
  )
  port map (
    en => '1',
    din => concat_y_net,
    we => logical_y_net,
    re => logical3_y_net,
    rst => logical2_y_net_x1(0),
    clk => clk_net,
    ce => ce_net,
    we_ce => ce_net,
    re_ce => ce_net,
    dout => fifo_dout_net,
    empty => fifo_empty_net,
    full => fifo_full_net,
    dcount => fifo_dcount_net
  );
  fifo1 : entity xil_defaultlib.receiver_xlfifogen_u 
  generic map (
    core_name0 => "receiver_fifo_generator_i1",
    data_count_width => 13,
    data_width => 8,
    extra_registers => 1,
    has_ae => 0,
    has_af => 0,
    has_rst => true,
    ignore_din_for_gcd => false,
    percent_full_width => 1
  )
  port map (
    en => '1',
    din => up_sample3_q_net,
    we => logical5_y_net,
    re => logical3_y_net_x1(0),
    rst => logical2_y_net_x1(0),
    clk => clk_net,
    ce => ce_net,
    we_ce => ce_net,
    re_ce => ce_net,
    dout => fifo1_dout_net,
    empty => fifo1_empty_net,
    full => fifo1_full_net,
    dcount => fifo1_dcount_net
  );
  inverter : entity xil_defaultlib.sysgen_inverter_db20653b1e 
  port map (
    clr => '0',
    ip(0) => fifo_full_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  inverter1 : entity xil_defaultlib.sysgen_inverter_db20653b1e 
  port map (
    clr => '0',
    ip(0) => fifo_empty_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter1_op_net
  );
  inverter2 : entity xil_defaultlib.sysgen_inverter_db20653b1e 
  port map (
    clr => '0',
    ip => logical3_y_net_x1,
    clk => clk_net,
    ce => ce_net,
    op => inverter2_op_net
  );
  inverter3 : entity xil_defaultlib.sysgen_inverter_db20653b1e 
  port map (
    clr => '0',
    ip => relational_op_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter3_op_net
  );
  logical : entity xil_defaultlib.sysgen_logical_613abbe5d0 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => up_sample2_q_net,
    d1 => inverter_op_net,
    y(0) => logical_y_net
  );
  logical1 : entity xil_defaultlib.sysgen_logical_613abbe5d0 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => m_axis_tready_net,
    d1 => inverter1_op_net,
    y => logical1_y_net
  );
  logical2 : entity xil_defaultlib.sysgen_logical_613abbe5d0 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => mux_y_net,
    d1 => logical1_y_net,
    y => logical2_y_net
  );
  logical3 : entity xil_defaultlib.sysgen_logical_613abbe5d0 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => logical2_y_net,
    d1 => inverter2_op_net,
    y(0) => logical3_y_net
  );
  logical4 : entity xil_defaultlib.sysgen_logical_4ec3e6b0b2 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => logical3_y_net_x1,
    d1 => logical2_y_net_x1,
    y => logical4_y_net
  );
  logical5 : entity xil_defaultlib.sysgen_logical_613abbe5d0 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0(0) => logical_y_net,
    d1 => up_sample1_q_net,
    y(0) => logical5_y_net
  );
  mux : entity xil_defaultlib.sysgen_mux_bc369b4d1c 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => logical3_y_net_x0,
    d0 => register1_q_net,
    d1 => constant_op_net,
    y => mux_y_net
  );
  mux1 : entity xil_defaultlib.sysgen_mux_75af721bdf 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => relational_op_net,
    d0 => fifo1_dout_net,
    d1 => constant2_op_net,
    y => mux1_y_net
  );
  register_x0 : entity xil_defaultlib.receiver_xlregister 
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
  register1 : entity xil_defaultlib.receiver_xlregister 
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
  relational : entity xil_defaultlib.sysgen_relational_ef14ae091d 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    a => constant1_op_net,
    b => fifo1_dcount_net,
    op => relational_op_net
  );
  slice : entity xil_defaultlib.receiver_xlslice 
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
  slice1 : entity xil_defaultlib.receiver_xlslice 
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
  up_sample1 : entity xil_defaultlib.receiver_xlusamp 
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
  up_sample2 : entity xil_defaultlib.receiver_xlusamp 
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
  up_sample3 : entity xil_defaultlib.receiver_xlusamp 
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
  up_sample4 : entity xil_defaultlib.receiver_xlusamp 
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
-- Generated from Simulink block receiver/CIC Decimator
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity receiver_cic_decimator is
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
end receiver_cic_decimator;
architecture structural of receiver_cic_decimator is 
  signal cic_decimator_real_s_axis_data_tready_net : std_logic;
  signal cic_decimator_real_m_axis_data_tdata_real_net : std_logic_vector( 23-1 downto 0 );
  signal convert_dout_net : std_logic_vector( 16-1 downto 0 );
  signal convert1_dout_net : std_logic_vector( 16-1 downto 0 );
  signal cmult2_p_net : std_logic_vector( 16-1 downto 0 );
  signal cic_decimator_real_m_axis_data_tvalid_net : std_logic;
  signal cmult1_p_net : std_logic_vector( 16-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal clk_5_net : std_logic;
  signal ce_5_net : std_logic;
  signal cic_decimator_imag_m_axis_data_tdata_real_net : std_logic_vector( 23-1 downto 0 );
  signal cic_decimator_imag_s_axis_data_tready_net : std_logic;
  signal cic_decimator_imag_m_axis_data_tvalid_net : std_logic;
  signal shift2_op_net : std_logic_vector( 23-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 23-1 downto 0 );
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
  cic_decimator_imag : entity xil_defaultlib.xlcic_compiler_ab7d75287b431a7c4f752b001883d8f6 
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
  cic_decimator_real : entity xil_defaultlib.xlcic_compiler_ab7d75287b431a7c4f752b001883d8f6 
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
  cmult1 : entity xil_defaultlib.receiver_xlcmult 
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
    core_name0 => "receiver_mult_gen_v12_0_i0",
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
  cmult2 : entity xil_defaultlib.receiver_xlcmult 
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
    core_name0 => "receiver_mult_gen_v12_0_i0",
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
  shift1 : entity xil_defaultlib.sysgen_shift_e52016e73f 
  port map (
    clr => '0',
    ip => cic_decimator_imag_m_axis_data_tdata_real_net,
    clk => clk_5_net,
    ce => ce_5_net,
    op => shift1_op_net
  );
  shift2 : entity xil_defaultlib.sysgen_shift_e52016e73f 
  port map (
    clr => '0',
    ip => cic_decimator_real_m_axis_data_tdata_real_net,
    clk => clk_5_net,
    ce => ce_5_net,
    op => shift2_op_net
  );
end structural;
-- Generated from Simulink block receiver/Carrier Synchronisation/De-Rotate Constellation
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity receiver_de_rotate_constellation is
  port (
    imag_in : in std_logic_vector( 16-1 downto 0 );
    real_in : in std_logic_vector( 16-1 downto 0 );
    valid_in : in std_logic_vector( 1-1 downto 0 );
    imag_error : in std_logic_vector( 18-1 downto 0 );
    real_error : in std_logic_vector( 18-1 downto 0 );
    valid_error : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    clk_20 : in std_logic;
    ce_20 : in std_logic;
    imag_out : out std_logic_vector( 35-1 downto 0 );
    real_out : out std_logic_vector( 35-1 downto 0 );
    valid_out : out std_logic_vector( 1-1 downto 0 )
  );
end receiver_de_rotate_constellation;
architecture structural of receiver_de_rotate_constellation is 
  signal neg_sin_rom_data_net : std_logic_vector( 18-1 downto 0 );
  signal cos_rom_data_net : std_logic_vector( 18-1 downto 0 );
  signal register_q_net_x0 : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal src_clk_net : std_logic;
  signal delay_q_net : std_logic_vector( 1-1 downto 0 );
  signal register7_q_net : std_logic_vector( 1-1 downto 0 );
  signal src_ce_net : std_logic;
  signal ce_net : std_logic;
  signal register1_q_net : std_logic_vector( 35-1 downto 0 );
  signal register_q_net : std_logic_vector( 35-1 downto 0 );
  signal register4_q_net : std_logic_vector( 1-1 downto 0 );
  signal delay2_q_net : std_logic_vector( 16-1 downto 0 );
  signal delay3_q_net : std_logic_vector( 1-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 16-1 downto 0 );
  signal product_p_re_net : std_logic_vector( 35-1 downto 0 );
  signal register6_q_net : std_logic_vector( 16-1 downto 0 );
  signal register5_q_net : std_logic_vector( 16-1 downto 0 );
  signal product_p_im_net : std_logic_vector( 35-1 downto 0 );
  signal register2_q_net : std_logic_vector( 18-1 downto 0 );
  signal register3_q_net : std_logic_vector( 18-1 downto 0 );
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
  delay : entity xil_defaultlib.receiver_xldelay 
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
  product : entity xil_defaultlib.xlreceiver_cmpy_v6_0_i0_3c580ae50e053964934daefdc6acd256 
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
  register_x0 : entity xil_defaultlib.receiver_xlregister 
  generic map (
    d_width => 35,
    init_value => b"00000000000000000000000000000000000"
  )
  port map (
    rst => "0",
    d => product_p_re_net,
    en => delay_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    q => register_q_net
  );
  register1 : entity xil_defaultlib.receiver_xlregister 
  generic map (
    d_width => 35,
    init_value => b"00000000000000000000000000000000000"
  )
  port map (
    rst => "0",
    d => product_p_im_net,
    en => delay_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    q => register1_q_net
  );
  register2 : entity xil_defaultlib.receiver_xlregister 
  generic map (
    d_width => 18,
    init_value => b"000000000000000000"
  )
  port map (
    rst => "0",
    d => cos_rom_data_net,
    en => register_q_net_x0,
    clk => src_clk_net,
    ce => src_ce_net,
    q => register2_q_net
  );
  register3 : entity xil_defaultlib.receiver_xlregister 
  generic map (
    d_width => 18,
    init_value => b"000000000000000000"
  )
  port map (
    rst => "0",
    d => neg_sin_rom_data_net,
    en => register_q_net_x0,
    clk => src_clk_net,
    ce => src_ce_net,
    q => register3_q_net
  );
  register4 : entity xil_defaultlib.receiver_xlregister 
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
  register5 : entity xil_defaultlib.receiver_xlregister 
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
  register6 : entity xil_defaultlib.receiver_xlregister 
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
  register7 : entity xil_defaultlib.receiver_xlregister 
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
-- Generated from Simulink block receiver/Carrier Synchronisation/Generate Angle Error/Circular CORDIC/Vectoring  Cell 0
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity receiver_vectoring_cell_0 is
  port (
    x_in : in std_logic_vector( 16-1 downto 0 );
    y_in : in std_logic_vector( 16-1 downto 0 );
    z_in : in std_logic_vector( 16-1 downto 0 );
    clk_20 : in std_logic;
    ce_20 : in std_logic;
    x_out : out std_logic_vector( 15-1 downto 0 );
    y_out : out std_logic_vector( 15-1 downto 0 );
    z_out : out std_logic_vector( 22-1 downto 0 )
  );
end receiver_vectoring_cell_0;
architecture structural of receiver_vectoring_cell_0 is 
  signal constant_op_net_x0 : std_logic_vector( 22-1 downto 0 );
  signal logical_y_net : std_logic_vector( 1-1 downto 0 );
  signal src_ce_net : std_logic;
  signal constant_op_net : std_logic_vector( 16-1 downto 0 );
  signal src_clk_net : std_logic;
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 15-1 downto 0 );
  signal addsub3_s_net : std_logic_vector( 15-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 22-1 downto 0 );
  signal register1_q_net : std_logic_vector( 16-1 downto 0 );
  signal register_q_net : std_logic_vector( 16-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 15-1 downto 0 );
  signal shift_op_net : std_logic_vector( 15-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 1-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
begin
  x_out <= addsub2_s_net;
  y_out <= addsub3_s_net;
  z_out <= addsub1_s_net;
  register_q_net <= x_in;
  register1_q_net <= y_in;
  constant_op_net <= z_in;
  src_clk_net <= clk_20;
  src_ce_net <= ce_20;
  addsub1 : entity xil_defaultlib.sysgen_addsub_1ce29be2fe 
  port map (
    clr => '0',
    a => constant_op_net,
    b => constant_op_net_x0,
    mode => logical_y_net,
    clk => src_clk_net,
    ce => src_ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity xil_defaultlib.sysgen_addsub_8d7c17c983 
  port map (
    clr => '0',
    a => register_q_net,
    b => shift1_op_net,
    mode => logical_y_net,
    clk => src_clk_net,
    ce => src_ce_net,
    s => addsub2_s_net
  );
  addsub3 : entity xil_defaultlib.sysgen_addsub_8d7c17c983 
  port map (
    clr => '0',
    a => register1_q_net,
    b => shift_op_net,
    mode => inverter_op_net,
    clk => src_clk_net,
    ce => src_ce_net,
    s => addsub3_s_net
  );
  constant_x0 : entity xil_defaultlib.sysgen_constant_e9e7d10164 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net_x0
  );
  inverter : entity xil_defaultlib.sysgen_inverter_db20653b1e 
  port map (
    clr => '0',
    ip => logical_y_net,
    clk => src_clk_net,
    ce => src_ce_net,
    op => inverter_op_net
  );
  logical : entity xil_defaultlib.sysgen_logical_e706ee99ae 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => slice_y_net,
    d1 => slice1_y_net,
    y => logical_y_net
  );
  shift : entity xil_defaultlib.sysgen_shift_57ee593aad 
  port map (
    clr => '0',
    ip => register_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    op => shift_op_net
  );
  shift1 : entity xil_defaultlib.sysgen_shift_57ee593aad 
  port map (
    clr => '0',
    ip => register1_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    op => shift1_op_net
  );
  slice : entity xil_defaultlib.receiver_xlslice 
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
  slice1 : entity xil_defaultlib.receiver_xlslice 
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
-- Generated from Simulink block receiver/Carrier Synchronisation/Generate Angle Error/Circular CORDIC/Vectoring  Cell 1
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity receiver_vectoring_cell_1 is
  port (
    x_in : in std_logic_vector( 15-1 downto 0 );
    y_in : in std_logic_vector( 15-1 downto 0 );
    z_in : in std_logic_vector( 22-1 downto 0 );
    clk_20 : in std_logic;
    ce_20 : in std_logic;
    x_out : out std_logic_vector( 15-1 downto 0 );
    y_out : out std_logic_vector( 15-1 downto 0 );
    z_out : out std_logic_vector( 22-1 downto 0 )
  );
end receiver_vectoring_cell_1;
architecture structural of receiver_vectoring_cell_1 is 
  signal logical_y_net : std_logic_vector( 1-1 downto 0 );
  signal src_ce_net : std_logic;
  signal delay2_q_net : std_logic_vector( 22-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 15-1 downto 0 );
  signal delay_q_net : std_logic_vector( 15-1 downto 0 );
  signal constant_op_net : std_logic_vector( 22-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 15-1 downto 0 );
  signal addsub3_s_net : std_logic_vector( 15-1 downto 0 );
  signal src_clk_net : std_logic;
  signal addsub1_s_net : std_logic_vector( 22-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 15-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 1-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal shift_op_net : std_logic_vector( 15-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
begin
  x_out <= addsub2_s_net;
  y_out <= addsub3_s_net;
  z_out <= addsub1_s_net;
  delay_q_net <= x_in;
  delay1_q_net <= y_in;
  delay2_q_net <= z_in;
  src_clk_net <= clk_20;
  src_ce_net <= ce_20;
  addsub1 : entity xil_defaultlib.sysgen_addsub_b8c87ec6ec 
  port map (
    clr => '0',
    a => delay2_q_net,
    b => constant_op_net,
    mode => logical_y_net,
    clk => src_clk_net,
    ce => src_ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity xil_defaultlib.sysgen_addsub_d08d68c26b 
  port map (
    clr => '0',
    a => delay_q_net,
    b => shift1_op_net,
    mode => logical_y_net,
    clk => src_clk_net,
    ce => src_ce_net,
    s => addsub2_s_net
  );
  addsub3 : entity xil_defaultlib.sysgen_addsub_d08d68c26b 
  port map (
    clr => '0',
    a => delay1_q_net,
    b => shift_op_net,
    mode => inverter_op_net,
    clk => src_clk_net,
    ce => src_ce_net,
    s => addsub3_s_net
  );
  constant_x0 : entity xil_defaultlib.sysgen_constant_d4d8254f24 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity xil_defaultlib.sysgen_inverter_db20653b1e 
  port map (
    clr => '0',
    ip => logical_y_net,
    clk => src_clk_net,
    ce => src_ce_net,
    op => inverter_op_net
  );
  logical : entity xil_defaultlib.sysgen_logical_e706ee99ae 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => slice_y_net,
    d1 => slice1_y_net,
    y => logical_y_net
  );
  shift : entity xil_defaultlib.sysgen_shift_16a6fc976d 
  port map (
    clr => '0',
    ip => delay_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    op => shift_op_net
  );
  shift1 : entity xil_defaultlib.sysgen_shift_16a6fc976d 
  port map (
    clr => '0',
    ip => delay1_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    op => shift1_op_net
  );
  slice : entity xil_defaultlib.receiver_xlslice 
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
  slice1 : entity xil_defaultlib.receiver_xlslice 
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
-- Generated from Simulink block receiver/Carrier Synchronisation/Generate Angle Error/Circular CORDIC/Vectoring  Cell 10
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity receiver_vectoring_cell_10 is
  port (
    x_in : in std_logic_vector( 15-1 downto 0 );
    y_in : in std_logic_vector( 15-1 downto 0 );
    z_in : in std_logic_vector( 22-1 downto 0 );
    clk_20 : in std_logic;
    ce_20 : in std_logic;
    z_out : out std_logic_vector( 22-1 downto 0 )
  );
end receiver_vectoring_cell_10;
architecture structural of receiver_vectoring_cell_10 is 
  signal delay28_q_net : std_logic_vector( 15-1 downto 0 );
  signal delay29_q_net : std_logic_vector( 15-1 downto 0 );
  signal delay30_q_net : std_logic_vector( 22-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 22-1 downto 0 );
  signal src_ce_net : std_logic;
  signal src_clk_net : std_logic;
  signal constant_op_net : std_logic_vector( 22-1 downto 0 );
  signal logical_y_net : std_logic_vector( 1-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 1-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
begin
  z_out <= addsub1_s_net;
  delay28_q_net <= x_in;
  delay29_q_net <= y_in;
  delay30_q_net <= z_in;
  src_clk_net <= clk_20;
  src_ce_net <= ce_20;
  addsub1 : entity xil_defaultlib.sysgen_addsub_b8c87ec6ec 
  port map (
    clr => '0',
    a => delay30_q_net,
    b => constant_op_net,
    mode => logical_y_net,
    clk => src_clk_net,
    ce => src_ce_net,
    s => addsub1_s_net
  );
  constant_x0 : entity xil_defaultlib.sysgen_constant_1ac3e68a1c 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  logical : entity xil_defaultlib.sysgen_logical_e706ee99ae 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => slice_y_net,
    d1 => slice1_y_net,
    y => logical_y_net
  );
  slice : entity xil_defaultlib.receiver_xlslice 
  generic map (
    new_lsb => 14,
    new_msb => 14,
    x_width => 15,
    y_width => 1
  )
  port map (
    x => delay28_q_net,
    y => slice_y_net
  );
  slice1 : entity xil_defaultlib.receiver_xlslice 
  generic map (
    new_lsb => 14,
    new_msb => 14,
    x_width => 15,
    y_width => 1
  )
  port map (
    x => delay29_q_net,
    y => slice1_y_net
  );
end structural;
-- Generated from Simulink block receiver/Carrier Synchronisation/Generate Angle Error/Circular CORDIC/Vectoring  Cell 2
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity receiver_vectoring_cell_2 is
  port (
    x_in : in std_logic_vector( 15-1 downto 0 );
    y_in : in std_logic_vector( 15-1 downto 0 );
    z_in : in std_logic_vector( 22-1 downto 0 );
    clk_20 : in std_logic;
    ce_20 : in std_logic;
    x_out : out std_logic_vector( 15-1 downto 0 );
    y_out : out std_logic_vector( 15-1 downto 0 );
    z_out : out std_logic_vector( 22-1 downto 0 )
  );
end receiver_vectoring_cell_2;
architecture structural of receiver_vectoring_cell_2 is 
  signal src_clk_net : std_logic;
  signal logical_y_net : std_logic_vector( 1-1 downto 0 );
  signal addsub3_s_net : std_logic_vector( 15-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 15-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 22-1 downto 0 );
  signal constant_op_net : std_logic_vector( 22-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 15-1 downto 0 );
  signal delay5_q_net : std_logic_vector( 22-1 downto 0 );
  signal shift_op_net : std_logic_vector( 15-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal src_ce_net : std_logic;
  signal delay4_q_net : std_logic_vector( 15-1 downto 0 );
  signal delay3_q_net : std_logic_vector( 15-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 1-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
begin
  x_out <= addsub2_s_net;
  y_out <= addsub3_s_net;
  z_out <= addsub1_s_net;
  delay3_q_net <= x_in;
  delay4_q_net <= y_in;
  delay5_q_net <= z_in;
  src_clk_net <= clk_20;
  src_ce_net <= ce_20;
  addsub1 : entity xil_defaultlib.sysgen_addsub_b8c87ec6ec 
  port map (
    clr => '0',
    a => delay5_q_net,
    b => constant_op_net,
    mode => logical_y_net,
    clk => src_clk_net,
    ce => src_ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity xil_defaultlib.sysgen_addsub_d08d68c26b 
  port map (
    clr => '0',
    a => delay3_q_net,
    b => shift1_op_net,
    mode => logical_y_net,
    clk => src_clk_net,
    ce => src_ce_net,
    s => addsub2_s_net
  );
  addsub3 : entity xil_defaultlib.sysgen_addsub_d08d68c26b 
  port map (
    clr => '0',
    a => delay4_q_net,
    b => shift_op_net,
    mode => inverter_op_net,
    clk => src_clk_net,
    ce => src_ce_net,
    s => addsub3_s_net
  );
  constant_x0 : entity xil_defaultlib.sysgen_constant_97a2d1d222 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity xil_defaultlib.sysgen_inverter_db20653b1e 
  port map (
    clr => '0',
    ip => logical_y_net,
    clk => src_clk_net,
    ce => src_ce_net,
    op => inverter_op_net
  );
  logical : entity xil_defaultlib.sysgen_logical_e706ee99ae 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => slice_y_net,
    d1 => slice1_y_net,
    y => logical_y_net
  );
  shift : entity xil_defaultlib.sysgen_shift_7a05d19302 
  port map (
    clr => '0',
    ip => delay3_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    op => shift_op_net
  );
  shift1 : entity xil_defaultlib.sysgen_shift_7a05d19302 
  port map (
    clr => '0',
    ip => delay4_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    op => shift1_op_net
  );
  slice : entity xil_defaultlib.receiver_xlslice 
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
  slice1 : entity xil_defaultlib.receiver_xlslice 
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
-- Generated from Simulink block receiver/Carrier Synchronisation/Generate Angle Error/Circular CORDIC/Vectoring  Cell 3
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity receiver_vectoring_cell_3 is
  port (
    x_in : in std_logic_vector( 15-1 downto 0 );
    y_in : in std_logic_vector( 15-1 downto 0 );
    z_in : in std_logic_vector( 22-1 downto 0 );
    clk_20 : in std_logic;
    ce_20 : in std_logic;
    x_out : out std_logic_vector( 15-1 downto 0 );
    y_out : out std_logic_vector( 15-1 downto 0 );
    z_out : out std_logic_vector( 22-1 downto 0 )
  );
end receiver_vectoring_cell_3;
architecture structural of receiver_vectoring_cell_3 is 
  signal constant_op_net : std_logic_vector( 22-1 downto 0 );
  signal logical_y_net : std_logic_vector( 1-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 22-1 downto 0 );
  signal addsub3_s_net : std_logic_vector( 15-1 downto 0 );
  signal delay6_q_net : std_logic_vector( 15-1 downto 0 );
  signal delay7_q_net : std_logic_vector( 15-1 downto 0 );
  signal src_clk_net : std_logic;
  signal src_ce_net : std_logic;
  signal delay8_q_net : std_logic_vector( 22-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 15-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 15-1 downto 0 );
  signal shift_op_net : std_logic_vector( 15-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 1-1 downto 0 );
begin
  x_out <= addsub2_s_net;
  y_out <= addsub3_s_net;
  z_out <= addsub1_s_net;
  delay6_q_net <= x_in;
  delay7_q_net <= y_in;
  delay8_q_net <= z_in;
  src_clk_net <= clk_20;
  src_ce_net <= ce_20;
  addsub1 : entity xil_defaultlib.sysgen_addsub_b8c87ec6ec 
  port map (
    clr => '0',
    a => delay8_q_net,
    b => constant_op_net,
    mode => logical_y_net,
    clk => src_clk_net,
    ce => src_ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity xil_defaultlib.sysgen_addsub_d08d68c26b 
  port map (
    clr => '0',
    a => delay6_q_net,
    b => shift1_op_net,
    mode => logical_y_net,
    clk => src_clk_net,
    ce => src_ce_net,
    s => addsub2_s_net
  );
  addsub3 : entity xil_defaultlib.sysgen_addsub_d08d68c26b 
  port map (
    clr => '0',
    a => delay7_q_net,
    b => shift_op_net,
    mode => inverter_op_net,
    clk => src_clk_net,
    ce => src_ce_net,
    s => addsub3_s_net
  );
  constant_x0 : entity xil_defaultlib.sysgen_constant_e40c082fdf 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity xil_defaultlib.sysgen_inverter_db20653b1e 
  port map (
    clr => '0',
    ip => logical_y_net,
    clk => src_clk_net,
    ce => src_ce_net,
    op => inverter_op_net
  );
  logical : entity xil_defaultlib.sysgen_logical_e706ee99ae 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => slice_y_net,
    d1 => slice1_y_net,
    y => logical_y_net
  );
  shift : entity xil_defaultlib.sysgen_shift_6e3c700f38 
  port map (
    clr => '0',
    ip => delay6_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    op => shift_op_net
  );
  shift1 : entity xil_defaultlib.sysgen_shift_6e3c700f38 
  port map (
    clr => '0',
    ip => delay7_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    op => shift1_op_net
  );
  slice : entity xil_defaultlib.receiver_xlslice 
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
  slice1 : entity xil_defaultlib.receiver_xlslice 
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
-- Generated from Simulink block receiver/Carrier Synchronisation/Generate Angle Error/Circular CORDIC/Vectoring  Cell 4
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity receiver_vectoring_cell_4 is
  port (
    x_in : in std_logic_vector( 15-1 downto 0 );
    y_in : in std_logic_vector( 15-1 downto 0 );
    z_in : in std_logic_vector( 22-1 downto 0 );
    clk_20 : in std_logic;
    ce_20 : in std_logic;
    x_out : out std_logic_vector( 15-1 downto 0 );
    y_out : out std_logic_vector( 15-1 downto 0 );
    z_out : out std_logic_vector( 22-1 downto 0 )
  );
end receiver_vectoring_cell_4;
architecture structural of receiver_vectoring_cell_4 is 
  signal addsub2_s_net : std_logic_vector( 15-1 downto 0 );
  signal src_ce_net : std_logic;
  signal delay10_q_net : std_logic_vector( 15-1 downto 0 );
  signal delay11_q_net : std_logic_vector( 22-1 downto 0 );
  signal delay9_q_net : std_logic_vector( 15-1 downto 0 );
  signal src_clk_net : std_logic;
  signal logical_y_net : std_logic_vector( 1-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 22-1 downto 0 );
  signal addsub3_s_net : std_logic_vector( 15-1 downto 0 );
  signal constant_op_net : std_logic_vector( 22-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal shift_op_net : std_logic_vector( 15-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 1-1 downto 0 );
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
  addsub1 : entity xil_defaultlib.sysgen_addsub_b8c87ec6ec 
  port map (
    clr => '0',
    a => delay11_q_net,
    b => constant_op_net,
    mode => logical_y_net,
    clk => src_clk_net,
    ce => src_ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity xil_defaultlib.sysgen_addsub_d08d68c26b 
  port map (
    clr => '0',
    a => delay9_q_net,
    b => shift1_op_net,
    mode => logical_y_net,
    clk => src_clk_net,
    ce => src_ce_net,
    s => addsub2_s_net
  );
  addsub3 : entity xil_defaultlib.sysgen_addsub_d08d68c26b 
  port map (
    clr => '0',
    a => delay10_q_net,
    b => shift_op_net,
    mode => inverter_op_net,
    clk => src_clk_net,
    ce => src_ce_net,
    s => addsub3_s_net
  );
  constant_x0 : entity xil_defaultlib.sysgen_constant_9ee2402d4f 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity xil_defaultlib.sysgen_inverter_db20653b1e 
  port map (
    clr => '0',
    ip => logical_y_net,
    clk => src_clk_net,
    ce => src_ce_net,
    op => inverter_op_net
  );
  logical : entity xil_defaultlib.sysgen_logical_e706ee99ae 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => slice_y_net,
    d1 => slice1_y_net,
    y => logical_y_net
  );
  shift : entity xil_defaultlib.sysgen_shift_86f2a39b1b 
  port map (
    clr => '0',
    ip => delay9_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    op => shift_op_net
  );
  shift1 : entity xil_defaultlib.sysgen_shift_86f2a39b1b 
  port map (
    clr => '0',
    ip => delay10_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    op => shift1_op_net
  );
  slice : entity xil_defaultlib.receiver_xlslice 
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
  slice1 : entity xil_defaultlib.receiver_xlslice 
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
-- Generated from Simulink block receiver/Carrier Synchronisation/Generate Angle Error/Circular CORDIC/Vectoring  Cell 5
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity receiver_vectoring_cell_5 is
  port (
    x_in : in std_logic_vector( 15-1 downto 0 );
    y_in : in std_logic_vector( 15-1 downto 0 );
    z_in : in std_logic_vector( 22-1 downto 0 );
    clk_20 : in std_logic;
    ce_20 : in std_logic;
    x_out : out std_logic_vector( 15-1 downto 0 );
    y_out : out std_logic_vector( 15-1 downto 0 );
    z_out : out std_logic_vector( 22-1 downto 0 )
  );
end receiver_vectoring_cell_5;
architecture structural of receiver_vectoring_cell_5 is 
  signal addsub2_s_net : std_logic_vector( 15-1 downto 0 );
  signal delay14_q_net : std_logic_vector( 22-1 downto 0 );
  signal addsub3_s_net : std_logic_vector( 15-1 downto 0 );
  signal delay13_q_net : std_logic_vector( 15-1 downto 0 );
  signal src_clk_net : std_logic;
  signal delay12_q_net : std_logic_vector( 15-1 downto 0 );
  signal src_ce_net : std_logic;
  signal addsub1_s_net : std_logic_vector( 22-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 1-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 15-1 downto 0 );
  signal logical_y_net : std_logic_vector( 1-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal constant_op_net : std_logic_vector( 22-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal shift_op_net : std_logic_vector( 15-1 downto 0 );
begin
  x_out <= addsub2_s_net;
  y_out <= addsub3_s_net;
  z_out <= addsub1_s_net;
  delay12_q_net <= x_in;
  delay13_q_net <= y_in;
  delay14_q_net <= z_in;
  src_clk_net <= clk_20;
  src_ce_net <= ce_20;
  addsub1 : entity xil_defaultlib.sysgen_addsub_b8c87ec6ec 
  port map (
    clr => '0',
    a => delay14_q_net,
    b => constant_op_net,
    mode => logical_y_net,
    clk => src_clk_net,
    ce => src_ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity xil_defaultlib.sysgen_addsub_d08d68c26b 
  port map (
    clr => '0',
    a => delay12_q_net,
    b => shift1_op_net,
    mode => logical_y_net,
    clk => src_clk_net,
    ce => src_ce_net,
    s => addsub2_s_net
  );
  addsub3 : entity xil_defaultlib.sysgen_addsub_d08d68c26b 
  port map (
    clr => '0',
    a => delay13_q_net,
    b => shift_op_net,
    mode => inverter_op_net,
    clk => src_clk_net,
    ce => src_ce_net,
    s => addsub3_s_net
  );
  constant_x0 : entity xil_defaultlib.sysgen_constant_3b19b1af4d 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity xil_defaultlib.sysgen_inverter_db20653b1e 
  port map (
    clr => '0',
    ip => logical_y_net,
    clk => src_clk_net,
    ce => src_ce_net,
    op => inverter_op_net
  );
  logical : entity xil_defaultlib.sysgen_logical_e706ee99ae 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => slice_y_net,
    d1 => slice1_y_net,
    y => logical_y_net
  );
  shift : entity xil_defaultlib.sysgen_shift_0a5abab164 
  port map (
    clr => '0',
    ip => delay12_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    op => shift_op_net
  );
  shift1 : entity xil_defaultlib.sysgen_shift_0a5abab164 
  port map (
    clr => '0',
    ip => delay13_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    op => shift1_op_net
  );
  slice : entity xil_defaultlib.receiver_xlslice 
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
  slice1 : entity xil_defaultlib.receiver_xlslice 
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
-- Generated from Simulink block receiver/Carrier Synchronisation/Generate Angle Error/Circular CORDIC/Vectoring  Cell 6
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity receiver_vectoring_cell_6 is
  port (
    x_in : in std_logic_vector( 15-1 downto 0 );
    y_in : in std_logic_vector( 15-1 downto 0 );
    z_in : in std_logic_vector( 22-1 downto 0 );
    clk_20 : in std_logic;
    ce_20 : in std_logic;
    x_out : out std_logic_vector( 15-1 downto 0 );
    y_out : out std_logic_vector( 15-1 downto 0 );
    z_out : out std_logic_vector( 22-1 downto 0 )
  );
end receiver_vectoring_cell_6;
architecture structural of receiver_vectoring_cell_6 is 
  signal delay15_q_net : std_logic_vector( 15-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 15-1 downto 0 );
  signal addsub3_s_net : std_logic_vector( 15-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 22-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal logical_y_net : std_logic_vector( 1-1 downto 0 );
  signal delay16_q_net : std_logic_vector( 15-1 downto 0 );
  signal delay17_q_net : std_logic_vector( 22-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal shift_op_net : std_logic_vector( 15-1 downto 0 );
  signal src_ce_net : std_logic;
  signal shift1_op_net : std_logic_vector( 15-1 downto 0 );
  signal constant_op_net : std_logic_vector( 22-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 1-1 downto 0 );
  signal src_clk_net : std_logic;
begin
  x_out <= addsub2_s_net;
  y_out <= addsub3_s_net;
  z_out <= addsub1_s_net;
  delay15_q_net <= x_in;
  delay16_q_net <= y_in;
  delay17_q_net <= z_in;
  src_clk_net <= clk_20;
  src_ce_net <= ce_20;
  addsub1 : entity xil_defaultlib.sysgen_addsub_b8c87ec6ec 
  port map (
    clr => '0',
    a => delay17_q_net,
    b => constant_op_net,
    mode => logical_y_net,
    clk => src_clk_net,
    ce => src_ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity xil_defaultlib.sysgen_addsub_d08d68c26b 
  port map (
    clr => '0',
    a => delay15_q_net,
    b => shift1_op_net,
    mode => logical_y_net,
    clk => src_clk_net,
    ce => src_ce_net,
    s => addsub2_s_net
  );
  addsub3 : entity xil_defaultlib.sysgen_addsub_d08d68c26b 
  port map (
    clr => '0',
    a => delay16_q_net,
    b => shift_op_net,
    mode => inverter_op_net,
    clk => src_clk_net,
    ce => src_ce_net,
    s => addsub3_s_net
  );
  constant_x0 : entity xil_defaultlib.sysgen_constant_40acab5fa7 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity xil_defaultlib.sysgen_inverter_db20653b1e 
  port map (
    clr => '0',
    ip => logical_y_net,
    clk => src_clk_net,
    ce => src_ce_net,
    op => inverter_op_net
  );
  logical : entity xil_defaultlib.sysgen_logical_e706ee99ae 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => slice_y_net,
    d1 => slice1_y_net,
    y => logical_y_net
  );
  shift : entity xil_defaultlib.sysgen_shift_dbf5b0c1d6 
  port map (
    clr => '0',
    ip => delay15_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    op => shift_op_net
  );
  shift1 : entity xil_defaultlib.sysgen_shift_dbf5b0c1d6 
  port map (
    clr => '0',
    ip => delay16_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    op => shift1_op_net
  );
  slice : entity xil_defaultlib.receiver_xlslice 
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
  slice1 : entity xil_defaultlib.receiver_xlslice 
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
-- Generated from Simulink block receiver/Carrier Synchronisation/Generate Angle Error/Circular CORDIC/Vectoring  Cell 7
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity receiver_vectoring_cell_7 is
  port (
    x_in : in std_logic_vector( 15-1 downto 0 );
    y_in : in std_logic_vector( 15-1 downto 0 );
    z_in : in std_logic_vector( 22-1 downto 0 );
    clk_20 : in std_logic;
    ce_20 : in std_logic;
    x_out : out std_logic_vector( 15-1 downto 0 );
    y_out : out std_logic_vector( 15-1 downto 0 );
    z_out : out std_logic_vector( 22-1 downto 0 )
  );
end receiver_vectoring_cell_7;
architecture structural of receiver_vectoring_cell_7 is 
  signal addsub2_s_net : std_logic_vector( 15-1 downto 0 );
  signal delay20_q_net : std_logic_vector( 22-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal addsub3_s_net : std_logic_vector( 15-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 15-1 downto 0 );
  signal src_ce_net : std_logic;
  signal delay19_q_net : std_logic_vector( 15-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 22-1 downto 0 );
  signal constant_op_net : std_logic_vector( 22-1 downto 0 );
  signal shift_op_net : std_logic_vector( 15-1 downto 0 );
  signal logical_y_net : std_logic_vector( 1-1 downto 0 );
  signal delay18_q_net : std_logic_vector( 15-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal src_clk_net : std_logic;
  signal slice1_y_net : std_logic_vector( 1-1 downto 0 );
begin
  x_out <= addsub2_s_net;
  y_out <= addsub3_s_net;
  z_out <= addsub1_s_net;
  delay18_q_net <= x_in;
  delay19_q_net <= y_in;
  delay20_q_net <= z_in;
  src_clk_net <= clk_20;
  src_ce_net <= ce_20;
  addsub1 : entity xil_defaultlib.sysgen_addsub_b8c87ec6ec 
  port map (
    clr => '0',
    a => delay20_q_net,
    b => constant_op_net,
    mode => logical_y_net,
    clk => src_clk_net,
    ce => src_ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity xil_defaultlib.sysgen_addsub_d08d68c26b 
  port map (
    clr => '0',
    a => delay18_q_net,
    b => shift1_op_net,
    mode => logical_y_net,
    clk => src_clk_net,
    ce => src_ce_net,
    s => addsub2_s_net
  );
  addsub3 : entity xil_defaultlib.sysgen_addsub_d08d68c26b 
  port map (
    clr => '0',
    a => delay19_q_net,
    b => shift_op_net,
    mode => inverter_op_net,
    clk => src_clk_net,
    ce => src_ce_net,
    s => addsub3_s_net
  );
  constant_x0 : entity xil_defaultlib.sysgen_constant_0d23d62541 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity xil_defaultlib.sysgen_inverter_db20653b1e 
  port map (
    clr => '0',
    ip => logical_y_net,
    clk => src_clk_net,
    ce => src_ce_net,
    op => inverter_op_net
  );
  logical : entity xil_defaultlib.sysgen_logical_e706ee99ae 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => slice_y_net,
    d1 => slice1_y_net,
    y => logical_y_net
  );
  shift : entity xil_defaultlib.sysgen_shift_4ba794e2ce 
  port map (
    clr => '0',
    ip => delay18_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    op => shift_op_net
  );
  shift1 : entity xil_defaultlib.sysgen_shift_4ba794e2ce 
  port map (
    clr => '0',
    ip => delay19_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    op => shift1_op_net
  );
  slice : entity xil_defaultlib.receiver_xlslice 
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
  slice1 : entity xil_defaultlib.receiver_xlslice 
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
-- Generated from Simulink block receiver/Carrier Synchronisation/Generate Angle Error/Circular CORDIC/Vectoring  Cell 8
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity receiver_vectoring_cell_8 is
  port (
    x_in : in std_logic_vector( 15-1 downto 0 );
    y_in : in std_logic_vector( 15-1 downto 0 );
    z_in : in std_logic_vector( 22-1 downto 0 );
    clk_20 : in std_logic;
    ce_20 : in std_logic;
    x_out : out std_logic_vector( 15-1 downto 0 );
    y_out : out std_logic_vector( 15-1 downto 0 );
    z_out : out std_logic_vector( 22-1 downto 0 )
  );
end receiver_vectoring_cell_8;
architecture structural of receiver_vectoring_cell_8 is 
  signal addsub2_s_net : std_logic_vector( 15-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 22-1 downto 0 );
  signal delay22_q_net : std_logic_vector( 15-1 downto 0 );
  signal delay24_q_net : std_logic_vector( 22-1 downto 0 );
  signal addsub3_s_net : std_logic_vector( 15-1 downto 0 );
  signal constant_op_net : std_logic_vector( 22-1 downto 0 );
  signal src_ce_net : std_logic;
  signal logical_y_net : std_logic_vector( 1-1 downto 0 );
  signal delay21_q_net : std_logic_vector( 15-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal src_clk_net : std_logic;
  signal shift_op_net : std_logic_vector( 15-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 15-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 1-1 downto 0 );
begin
  x_out <= addsub2_s_net;
  y_out <= addsub3_s_net;
  z_out <= addsub1_s_net;
  delay21_q_net <= x_in;
  delay22_q_net <= y_in;
  delay24_q_net <= z_in;
  src_clk_net <= clk_20;
  src_ce_net <= ce_20;
  addsub1 : entity xil_defaultlib.sysgen_addsub_b8c87ec6ec 
  port map (
    clr => '0',
    a => delay24_q_net,
    b => constant_op_net,
    mode => logical_y_net,
    clk => src_clk_net,
    ce => src_ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity xil_defaultlib.sysgen_addsub_d08d68c26b 
  port map (
    clr => '0',
    a => delay21_q_net,
    b => shift1_op_net,
    mode => logical_y_net,
    clk => src_clk_net,
    ce => src_ce_net,
    s => addsub2_s_net
  );
  addsub3 : entity xil_defaultlib.sysgen_addsub_d08d68c26b 
  port map (
    clr => '0',
    a => delay22_q_net,
    b => shift_op_net,
    mode => inverter_op_net,
    clk => src_clk_net,
    ce => src_ce_net,
    s => addsub3_s_net
  );
  constant_x0 : entity xil_defaultlib.sysgen_constant_68c9d38ccb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity xil_defaultlib.sysgen_inverter_db20653b1e 
  port map (
    clr => '0',
    ip => logical_y_net,
    clk => src_clk_net,
    ce => src_ce_net,
    op => inverter_op_net
  );
  logical : entity xil_defaultlib.sysgen_logical_e706ee99ae 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => slice_y_net,
    d1 => slice1_y_net,
    y => logical_y_net
  );
  shift : entity xil_defaultlib.sysgen_shift_af5b82b0d2 
  port map (
    clr => '0',
    ip => delay21_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    op => shift_op_net
  );
  shift1 : entity xil_defaultlib.sysgen_shift_af5b82b0d2 
  port map (
    clr => '0',
    ip => delay22_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    op => shift1_op_net
  );
  slice : entity xil_defaultlib.receiver_xlslice 
  generic map (
    new_lsb => 14,
    new_msb => 14,
    x_width => 15,
    y_width => 1
  )
  port map (
    x => delay21_q_net,
    y => slice_y_net
  );
  slice1 : entity xil_defaultlib.receiver_xlslice 
  generic map (
    new_lsb => 14,
    new_msb => 14,
    x_width => 15,
    y_width => 1
  )
  port map (
    x => delay22_q_net,
    y => slice1_y_net
  );
end structural;
-- Generated from Simulink block receiver/Carrier Synchronisation/Generate Angle Error/Circular CORDIC/Vectoring  Cell 9
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity receiver_vectoring_cell_9 is
  port (
    x_in : in std_logic_vector( 15-1 downto 0 );
    y_in : in std_logic_vector( 15-1 downto 0 );
    z_in : in std_logic_vector( 22-1 downto 0 );
    clk_20 : in std_logic;
    ce_20 : in std_logic;
    x_out : out std_logic_vector( 15-1 downto 0 );
    y_out : out std_logic_vector( 15-1 downto 0 );
    z_out : out std_logic_vector( 22-1 downto 0 )
  );
end receiver_vectoring_cell_9;
architecture structural of receiver_vectoring_cell_9 is 
  signal constant_op_net : std_logic_vector( 22-1 downto 0 );
  signal addsub3_s_net : std_logic_vector( 15-1 downto 0 );
  signal src_ce_net : std_logic;
  signal addsub2_s_net : std_logic_vector( 15-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 22-1 downto 0 );
  signal delay25_q_net : std_logic_vector( 15-1 downto 0 );
  signal src_clk_net : std_logic;
  signal logical_y_net : std_logic_vector( 1-1 downto 0 );
  signal delay26_q_net : std_logic_vector( 15-1 downto 0 );
  signal delay27_q_net : std_logic_vector( 22-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 15-1 downto 0 );
  signal shift_op_net : std_logic_vector( 15-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 1-1 downto 0 );
begin
  x_out <= addsub2_s_net;
  y_out <= addsub3_s_net;
  z_out <= addsub1_s_net;
  delay25_q_net <= x_in;
  delay26_q_net <= y_in;
  delay27_q_net <= z_in;
  src_clk_net <= clk_20;
  src_ce_net <= ce_20;
  addsub1 : entity xil_defaultlib.sysgen_addsub_b8c87ec6ec 
  port map (
    clr => '0',
    a => delay27_q_net,
    b => constant_op_net,
    mode => logical_y_net,
    clk => src_clk_net,
    ce => src_ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity xil_defaultlib.sysgen_addsub_d08d68c26b 
  port map (
    clr => '0',
    a => delay25_q_net,
    b => shift1_op_net,
    mode => logical_y_net,
    clk => src_clk_net,
    ce => src_ce_net,
    s => addsub2_s_net
  );
  addsub3 : entity xil_defaultlib.sysgen_addsub_d08d68c26b 
  port map (
    clr => '0',
    a => delay26_q_net,
    b => shift_op_net,
    mode => inverter_op_net,
    clk => src_clk_net,
    ce => src_ce_net,
    s => addsub3_s_net
  );
  constant_x0 : entity xil_defaultlib.sysgen_constant_b3d37d93b5 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity xil_defaultlib.sysgen_inverter_db20653b1e 
  port map (
    clr => '0',
    ip => logical_y_net,
    clk => src_clk_net,
    ce => src_ce_net,
    op => inverter_op_net
  );
  logical : entity xil_defaultlib.sysgen_logical_e706ee99ae 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => slice_y_net,
    d1 => slice1_y_net,
    y => logical_y_net
  );
  shift : entity xil_defaultlib.sysgen_shift_9c56238928 
  port map (
    clr => '0',
    ip => delay25_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    op => shift_op_net
  );
  shift1 : entity xil_defaultlib.sysgen_shift_9c56238928 
  port map (
    clr => '0',
    ip => delay26_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    op => shift1_op_net
  );
  slice : entity xil_defaultlib.receiver_xlslice 
  generic map (
    new_lsb => 14,
    new_msb => 14,
    x_width => 15,
    y_width => 1
  )
  port map (
    x => delay25_q_net,
    y => slice_y_net
  );
  slice1 : entity xil_defaultlib.receiver_xlslice 
  generic map (
    new_lsb => 14,
    new_msb => 14,
    x_width => 15,
    y_width => 1
  )
  port map (
    x => delay26_q_net,
    y => slice1_y_net
  );
end structural;
-- Generated from Simulink block receiver/Carrier Synchronisation/Generate Angle Error/Circular CORDIC
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity receiver_circular_cordic is
  port (
    imag_in : in std_logic_vector( 16-1 downto 0 );
    real_in : in std_logic_vector( 16-1 downto 0 );
    clk_20 : in std_logic;
    ce_20 : in std_logic;
    angle : out std_logic_vector( 22-1 downto 0 )
  );
end receiver_circular_cordic;
architecture structural of receiver_circular_cordic is 
  signal register_q_net : std_logic_vector( 16-1 downto 0 );
  signal constant_op_net : std_logic_vector( 16-1 downto 0 );
  signal addsub2_s_net_x8 : std_logic_vector( 15-1 downto 0 );
  signal addsub1_s_net_x8 : std_logic_vector( 22-1 downto 0 );
  signal delay2_q_net : std_logic_vector( 22-1 downto 0 );
  signal delay28_q_net : std_logic_vector( 15-1 downto 0 );
  signal addsub3_s_net_x9 : std_logic_vector( 15-1 downto 0 );
  signal addsub2_s_net_x9 : std_logic_vector( 15-1 downto 0 );
  signal register1_q_net : std_logic_vector( 16-1 downto 0 );
  signal addsub3_s_net_x8 : std_logic_vector( 15-1 downto 0 );
  signal delay23_q_net : std_logic_vector( 22-1 downto 0 );
  signal addsub1_s_net_x7 : std_logic_vector( 22-1 downto 0 );
  signal delay29_q_net : std_logic_vector( 15-1 downto 0 );
  signal delay30_q_net : std_logic_vector( 22-1 downto 0 );
  signal addsub2_s_net_x6 : std_logic_vector( 15-1 downto 0 );
  signal addsub3_s_net_x6 : std_logic_vector( 15-1 downto 0 );
  signal addsub1_s_net_x6 : std_logic_vector( 22-1 downto 0 );
  signal delay_q_net : std_logic_vector( 15-1 downto 0 );
  signal delay4_q_net : std_logic_vector( 15-1 downto 0 );
  signal src_ce_net : std_logic;
  signal delay5_q_net : std_logic_vector( 22-1 downto 0 );
  signal addsub2_s_net_x5 : std_logic_vector( 15-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 15-1 downto 0 );
  signal addsub3_s_net_x5 : std_logic_vector( 15-1 downto 0 );
  signal delay3_q_net : std_logic_vector( 15-1 downto 0 );
  signal addsub1_s_net_x5 : std_logic_vector( 22-1 downto 0 );
  signal src_clk_net : std_logic;
  signal addsub1_s_net_x9 : std_logic_vector( 22-1 downto 0 );
  signal delay17_q_net : std_logic_vector( 22-1 downto 0 );
  signal delay13_q_net : std_logic_vector( 15-1 downto 0 );
  signal delay6_q_net : std_logic_vector( 15-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 15-1 downto 0 );
  signal delay12_q_net : std_logic_vector( 15-1 downto 0 );
  signal addsub2_s_net_x2 : std_logic_vector( 15-1 downto 0 );
  signal delay8_q_net : std_logic_vector( 22-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 22-1 downto 0 );
  signal addsub3_s_net : std_logic_vector( 15-1 downto 0 );
  signal delay27_q_net : std_logic_vector( 22-1 downto 0 );
  signal addsub1_s_net_x1 : std_logic_vector( 22-1 downto 0 );
  signal addsub3_s_net_x0 : std_logic_vector( 15-1 downto 0 );
  signal delay16_q_net : std_logic_vector( 15-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 22-1 downto 0 );
  signal delay22_q_net : std_logic_vector( 15-1 downto 0 );
  signal delay19_q_net : std_logic_vector( 15-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 15-1 downto 0 );
  signal addsub2_s_net_x4 : std_logic_vector( 15-1 downto 0 );
  signal addsub2_s_net_x3 : std_logic_vector( 15-1 downto 0 );
  signal addsub1_s_net_x3 : std_logic_vector( 22-1 downto 0 );
  signal delay10_q_net : std_logic_vector( 15-1 downto 0 );
  signal delay14_q_net : std_logic_vector( 22-1 downto 0 );
  signal delay7_q_net : std_logic_vector( 15-1 downto 0 );
  signal delay24_q_net : std_logic_vector( 22-1 downto 0 );
  signal delay9_q_net : std_logic_vector( 15-1 downto 0 );
  signal addsub1_s_net_x2 : std_logic_vector( 22-1 downto 0 );
  signal delay11_q_net : std_logic_vector( 22-1 downto 0 );
  signal addsub2_s_net_x1 : std_logic_vector( 15-1 downto 0 );
  signal delay21_q_net : std_logic_vector( 15-1 downto 0 );
  signal delay20_q_net : std_logic_vector( 22-1 downto 0 );
  signal delay25_q_net : std_logic_vector( 15-1 downto 0 );
  signal addsub1_s_net_x4 : std_logic_vector( 22-1 downto 0 );
  signal addsub3_s_net_x3 : std_logic_vector( 15-1 downto 0 );
  signal addsub3_s_net_x4 : std_logic_vector( 15-1 downto 0 );
  signal addsub3_s_net_x1 : std_logic_vector( 15-1 downto 0 );
  signal delay26_q_net : std_logic_vector( 15-1 downto 0 );
  signal addsub3_s_net_x2 : std_logic_vector( 15-1 downto 0 );
  signal delay18_q_net : std_logic_vector( 15-1 downto 0 );
  signal delay15_q_net : std_logic_vector( 15-1 downto 0 );
begin
  angle <= delay23_q_net;
  register1_q_net <= imag_in;
  register_q_net <= real_in;
  src_clk_net <= clk_20;
  src_ce_net <= ce_20;
  vectoring_cell_0 : entity xil_defaultlib.receiver_vectoring_cell_0 
  port map (
    x_in => register_q_net,
    y_in => register1_q_net,
    z_in => constant_op_net,
    clk_20 => src_clk_net,
    ce_20 => src_ce_net,
    x_out => addsub2_s_net_x9,
    y_out => addsub3_s_net_x9,
    z_out => addsub1_s_net_x9
  );
  vectoring_cell_1 : entity xil_defaultlib.receiver_vectoring_cell_1 
  port map (
    x_in => delay_q_net,
    y_in => delay1_q_net,
    z_in => delay2_q_net,
    clk_20 => src_clk_net,
    ce_20 => src_ce_net,
    x_out => addsub2_s_net_x8,
    y_out => addsub3_s_net_x8,
    z_out => addsub1_s_net_x8
  );
  vectoring_cell_10 : entity xil_defaultlib.receiver_vectoring_cell_10 
  port map (
    x_in => delay28_q_net,
    y_in => delay29_q_net,
    z_in => delay30_q_net,
    clk_20 => src_clk_net,
    ce_20 => src_ce_net,
    z_out => addsub1_s_net_x7
  );
  vectoring_cell_2 : entity xil_defaultlib.receiver_vectoring_cell_2 
  port map (
    x_in => delay3_q_net,
    y_in => delay4_q_net,
    z_in => delay5_q_net,
    clk_20 => src_clk_net,
    ce_20 => src_ce_net,
    x_out => addsub2_s_net_x6,
    y_out => addsub3_s_net_x6,
    z_out => addsub1_s_net_x6
  );
  vectoring_cell_3 : entity xil_defaultlib.receiver_vectoring_cell_3 
  port map (
    x_in => delay6_q_net,
    y_in => delay7_q_net,
    z_in => delay8_q_net,
    clk_20 => src_clk_net,
    ce_20 => src_ce_net,
    x_out => addsub2_s_net_x5,
    y_out => addsub3_s_net_x5,
    z_out => addsub1_s_net_x5
  );
  vectoring_cell_4 : entity xil_defaultlib.receiver_vectoring_cell_4 
  port map (
    x_in => delay9_q_net,
    y_in => delay10_q_net,
    z_in => delay11_q_net,
    clk_20 => src_clk_net,
    ce_20 => src_ce_net,
    x_out => addsub2_s_net_x4,
    y_out => addsub3_s_net_x4,
    z_out => addsub1_s_net_x4
  );
  vectoring_cell_5 : entity xil_defaultlib.receiver_vectoring_cell_5 
  port map (
    x_in => delay12_q_net,
    y_in => delay13_q_net,
    z_in => delay14_q_net,
    clk_20 => src_clk_net,
    ce_20 => src_ce_net,
    x_out => addsub2_s_net_x3,
    y_out => addsub3_s_net_x3,
    z_out => addsub1_s_net_x3
  );
  vectoring_cell_6 : entity xil_defaultlib.receiver_vectoring_cell_6 
  port map (
    x_in => delay15_q_net,
    y_in => delay16_q_net,
    z_in => delay17_q_net,
    clk_20 => src_clk_net,
    ce_20 => src_ce_net,
    x_out => addsub2_s_net_x2,
    y_out => addsub3_s_net_x2,
    z_out => addsub1_s_net_x2
  );
  vectoring_cell_7 : entity xil_defaultlib.receiver_vectoring_cell_7 
  port map (
    x_in => delay18_q_net,
    y_in => delay19_q_net,
    z_in => delay20_q_net,
    clk_20 => src_clk_net,
    ce_20 => src_ce_net,
    x_out => addsub2_s_net_x1,
    y_out => addsub3_s_net_x1,
    z_out => addsub1_s_net_x1
  );
  vectoring_cell_8 : entity xil_defaultlib.receiver_vectoring_cell_8 
  port map (
    x_in => delay21_q_net,
    y_in => delay22_q_net,
    z_in => delay24_q_net,
    clk_20 => src_clk_net,
    ce_20 => src_ce_net,
    x_out => addsub2_s_net_x0,
    y_out => addsub3_s_net_x0,
    z_out => addsub1_s_net
  );
  vectoring_cell_9 : entity xil_defaultlib.receiver_vectoring_cell_9 
  port map (
    x_in => delay25_q_net,
    y_in => delay26_q_net,
    z_in => delay27_q_net,
    clk_20 => src_clk_net,
    ce_20 => src_ce_net,
    x_out => addsub2_s_net,
    y_out => addsub3_s_net,
    z_out => addsub1_s_net_x0
  );
  constant_x0 : entity xil_defaultlib.sysgen_constant_a1ebb838d6 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  delay : entity xil_defaultlib.receiver_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 15
  )
  port map (
    en => '1',
    rst => '0',
    d => addsub2_s_net_x9,
    clk => src_clk_net,
    ce => src_ce_net,
    q => delay_q_net
  );
  delay1 : entity xil_defaultlib.receiver_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 15
  )
  port map (
    en => '1',
    rst => '0',
    d => addsub3_s_net_x9,
    clk => src_clk_net,
    ce => src_ce_net,
    q => delay1_q_net
  );
  delay10 : entity xil_defaultlib.receiver_xldelay 
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
    q => delay10_q_net
  );
  delay11 : entity xil_defaultlib.receiver_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 22
  )
  port map (
    en => '1',
    rst => '0',
    d => addsub1_s_net_x5,
    clk => src_clk_net,
    ce => src_ce_net,
    q => delay11_q_net
  );
  delay12 : entity xil_defaultlib.receiver_xldelay 
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
    q => delay12_q_net
  );
  delay13 : entity xil_defaultlib.receiver_xldelay 
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
    q => delay13_q_net
  );
  delay14 : entity xil_defaultlib.receiver_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 22
  )
  port map (
    en => '1',
    rst => '0',
    d => addsub1_s_net_x4,
    clk => src_clk_net,
    ce => src_ce_net,
    q => delay14_q_net
  );
  delay15 : entity xil_defaultlib.receiver_xldelay 
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
    q => delay15_q_net
  );
  delay16 : entity xil_defaultlib.receiver_xldelay 
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
    q => delay16_q_net
  );
  delay17 : entity xil_defaultlib.receiver_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 22
  )
  port map (
    en => '1',
    rst => '0',
    d => addsub1_s_net_x3,
    clk => src_clk_net,
    ce => src_ce_net,
    q => delay17_q_net
  );
  delay18 : entity xil_defaultlib.receiver_xldelay 
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
    q => delay18_q_net
  );
  delay19 : entity xil_defaultlib.receiver_xldelay 
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
    q => delay19_q_net
  );
  delay2 : entity xil_defaultlib.receiver_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 22
  )
  port map (
    en => '1',
    rst => '0',
    d => addsub1_s_net_x9,
    clk => src_clk_net,
    ce => src_ce_net,
    q => delay2_q_net
  );
  delay20 : entity xil_defaultlib.receiver_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 22
  )
  port map (
    en => '1',
    rst => '0',
    d => addsub1_s_net_x2,
    clk => src_clk_net,
    ce => src_ce_net,
    q => delay20_q_net
  );
  delay21 : entity xil_defaultlib.receiver_xldelay 
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
    q => delay21_q_net
  );
  delay22 : entity xil_defaultlib.receiver_xldelay 
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
    q => delay22_q_net
  );
  delay23 : entity xil_defaultlib.receiver_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 22
  )
  port map (
    en => '1',
    rst => '0',
    d => addsub1_s_net_x7,
    clk => src_clk_net,
    ce => src_ce_net,
    q => delay23_q_net
  );
  delay24 : entity xil_defaultlib.receiver_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 22
  )
  port map (
    en => '1',
    rst => '0',
    d => addsub1_s_net_x1,
    clk => src_clk_net,
    ce => src_ce_net,
    q => delay24_q_net
  );
  delay25 : entity xil_defaultlib.receiver_xldelay 
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
    q => delay25_q_net
  );
  delay26 : entity xil_defaultlib.receiver_xldelay 
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
    q => delay26_q_net
  );
  delay27 : entity xil_defaultlib.receiver_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 22
  )
  port map (
    en => '1',
    rst => '0',
    d => addsub1_s_net,
    clk => src_clk_net,
    ce => src_ce_net,
    q => delay27_q_net
  );
  delay28 : entity xil_defaultlib.receiver_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 15
  )
  port map (
    en => '1',
    rst => '0',
    d => addsub2_s_net,
    clk => src_clk_net,
    ce => src_ce_net,
    q => delay28_q_net
  );
  delay29 : entity xil_defaultlib.receiver_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 15
  )
  port map (
    en => '1',
    rst => '0',
    d => addsub3_s_net,
    clk => src_clk_net,
    ce => src_ce_net,
    q => delay29_q_net
  );
  delay3 : entity xil_defaultlib.receiver_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 15
  )
  port map (
    en => '1',
    rst => '0',
    d => addsub2_s_net_x8,
    clk => src_clk_net,
    ce => src_ce_net,
    q => delay3_q_net
  );
  delay30 : entity xil_defaultlib.receiver_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 22
  )
  port map (
    en => '1',
    rst => '0',
    d => addsub1_s_net_x0,
    clk => src_clk_net,
    ce => src_ce_net,
    q => delay30_q_net
  );
  delay4 : entity xil_defaultlib.receiver_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 15
  )
  port map (
    en => '1',
    rst => '0',
    d => addsub3_s_net_x8,
    clk => src_clk_net,
    ce => src_ce_net,
    q => delay4_q_net
  );
  delay5 : entity xil_defaultlib.receiver_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 22
  )
  port map (
    en => '1',
    rst => '0',
    d => addsub1_s_net_x8,
    clk => src_clk_net,
    ce => src_ce_net,
    q => delay5_q_net
  );
  delay6 : entity xil_defaultlib.receiver_xldelay 
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
    q => delay6_q_net
  );
  delay7 : entity xil_defaultlib.receiver_xldelay 
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
    q => delay7_q_net
  );
  delay8 : entity xil_defaultlib.receiver_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 22
  )
  port map (
    en => '1',
    rst => '0',
    d => addsub1_s_net_x6,
    clk => src_clk_net,
    ce => src_ce_net,
    q => delay8_q_net
  );
  delay9 : entity xil_defaultlib.receiver_xldelay 
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
    q => delay9_q_net
  );
end structural;
-- Generated from Simulink block receiver/Carrier Synchronisation/Generate Angle Error
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity receiver_generate_angle_error is
  port (
    imag_in : in std_logic_vector( 16-1 downto 0 );
    real_in : in std_logic_vector( 16-1 downto 0 );
    valid_in : in std_logic_vector( 1-1 downto 0 );
    modulation : in std_logic_vector( 1-1 downto 0 );
    clk_20 : in std_logic;
    ce_20 : in std_logic;
    angle : out std_logic_vector( 22-1 downto 0 );
    valid_out : out std_logic_vector( 1-1 downto 0 )
  );
end receiver_generate_angle_error;
architecture structural of receiver_generate_angle_error is 
  signal register2_q_net : std_logic_vector( 1-1 downto 0 );
  signal convert_dout_net : std_logic_vector( 16-1 downto 0 );
  signal delay23_q_net : std_logic_vector( 22-1 downto 0 );
  signal modulation_net : std_logic_vector( 1-1 downto 0 );
  signal convert1_dout_net : std_logic_vector( 16-1 downto 0 );
  signal src_ce_net : std_logic;
  signal register_q_net : std_logic_vector( 16-1 downto 0 );
  signal register4_q_net : std_logic_vector( 1-1 downto 0 );
  signal src_clk_net : std_logic;
  signal register1_q_net : std_logic_vector( 16-1 downto 0 );
  signal mux_y_net : std_logic_vector( 22-1 downto 0 );
  signal register4_q_net_x0 : std_logic_vector( 22-1 downto 0 );
  signal delay_q_net : std_logic_vector( 1-1 downto 0 );
  signal im_msb_y_net : std_logic_vector( 1-1 downto 0 );
  signal register3_q_net : std_logic_vector( 1-1 downto 0 );
  signal concat_y_net : std_logic_vector( 2-1 downto 0 );
  signal rom_data_net : std_logic_vector( 16-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 22-1 downto 0 );
  signal re_msb_y_net : std_logic_vector( 1-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 2-1 downto 0 );
begin
  angle <= mux_y_net;
  valid_out <= register2_q_net;
  convert_dout_net <= imag_in;
  convert1_dout_net <= real_in;
  register4_q_net <= valid_in;
  modulation_net <= modulation;
  src_clk_net <= clk_20;
  src_ce_net <= ce_20;
  circular_cordic : entity xil_defaultlib.receiver_circular_cordic 
  port map (
    imag_in => register1_q_net,
    real_in => register_q_net,
    clk_20 => src_clk_net,
    ce_20 => src_ce_net,
    angle => delay23_q_net
  );
  addsub : entity xil_defaultlib.receiver_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 20,
    a_width => 22,
    b_arith => xlSigned,
    b_bin_pt => 14,
    b_width => 16,
    c_has_c_out => 0,
    c_latency => 1,
    c_output_width => 23,
    core_name0 => "receiver_c_addsub_v12_0_i0",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 23,
    latency => 1,
    overflow => 1,
    quantization => 1,
    s_arith => xlSigned,
    s_bin_pt => 20,
    s_width => 22
  )
  port map (
    clr => '0',
    en => "1",
    a => delay23_q_net,
    b => rom_data_net,
    clk => src_clk_net,
    ce => src_ce_net,
    s => addsub_s_net
  );
  concat : entity xil_defaultlib.sysgen_concat_804ce16df3 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    in0 => re_msb_y_net,
    in1 => im_msb_y_net,
    y => concat_y_net
  );
  delay : entity xil_defaultlib.receiver_xldelay 
  generic map (
    latency => 11,
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
  delay1 : entity xil_defaultlib.receiver_xldelay 
  generic map (
    latency => 10,
    reg_retiming => 0,
    reset => 0,
    width => 2
  )
  port map (
    en => '1',
    rst => '0',
    d => concat_y_net,
    clk => src_clk_net,
    ce => src_ce_net,
    q => delay1_q_net
  );
  im_msb : entity xil_defaultlib.receiver_xlslice 
  generic map (
    new_lsb => 15,
    new_msb => 15,
    x_width => 16,
    y_width => 1
  )
  port map (
    x => register1_q_net,
    y => im_msb_y_net
  );
  mux : entity xil_defaultlib.sysgen_mux_d91aaccb20 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => modulation_net,
    d0 => register4_q_net_x0,
    d1 => addsub_s_net,
    y => mux_y_net
  );
  rom : entity xil_defaultlib.receiver_xlsprom 
  generic map (
    c_address_width => 2,
    c_width => 16,
    latency => 1,
    mem_init_file => "xpm_634a8b_vivado.mem",
    mem_size => 64,
    mem_type => "block",
    read_reset_val => "0"
  )
  port map (
    en => "1",
    rst => "0",
    addr => delay1_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    data => rom_data_net
  );
  re_msb : entity xil_defaultlib.receiver_xlslice 
  generic map (
    new_lsb => 15,
    new_msb => 15,
    x_width => 16,
    y_width => 1
  )
  port map (
    x => register_q_net,
    y => re_msb_y_net
  );
  register_x0 : entity xil_defaultlib.receiver_xlregister 
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
  register1 : entity xil_defaultlib.receiver_xlregister 
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
  register2 : entity xil_defaultlib.receiver_xlregister 
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
    q => register2_q_net
  );
  register3 : entity xil_defaultlib.receiver_xlregister 
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
  register4 : entity xil_defaultlib.receiver_xlregister 
  generic map (
    d_width => 22,
    init_value => b"0000000000000000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => delay23_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    q => register4_q_net_x0
  );
end structural;
-- Generated from Simulink block receiver/Carrier Synchronisation/Generate NCO/Loop Filter
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity receiver_loop_filter is
  port (
    signal_x0 : in std_logic_vector( 22-1 downto 0 );
    strobe : in std_logic_vector( 1-1 downto 0 );
    reset : in std_logic_vector( 1-1 downto 0 );
    clk_20 : in std_logic;
    ce_20 : in std_logic;
    error : out std_logic_vector( 40-1 downto 0 );
    valid : out std_logic_vector( 1-1 downto 0 )
  );
end receiver_loop_filter;
architecture structural of receiver_loop_filter is 
  signal mux_y_net : std_logic_vector( 22-1 downto 0 );
  signal register2_q_net_x0 : std_logic_vector( 1-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 40-1 downto 0 );
  signal k2_gain_p_net : std_logic_vector( 40-1 downto 0 );
  signal register_q_net : std_logic_vector( 40-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 40-1 downto 0 );
  signal register4_q_net : std_logic_vector( 1-1 downto 0 );
  signal register3_q_net : std_logic_vector( 40-1 downto 0 );
  signal src_ce_net : std_logic;
  signal logical1_y_net : std_logic_vector( 1-1 downto 0 );
  signal src_clk_net : std_logic;
  signal register1_q_net : std_logic_vector( 22-1 downto 0 );
  signal k1_gain_p_net : std_logic_vector( 38-1 downto 0 );
  signal register2_q_net : std_logic_vector( 1-1 downto 0 );
begin
  error <= register3_q_net;
  valid <= register4_q_net;
  mux_y_net <= signal_x0;
  register2_q_net_x0 <= strobe;
  logical1_y_net <= reset;
  src_clk_net <= clk_20;
  src_ce_net <= ce_20;
  addsub : entity xil_defaultlib.receiver_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 38,
    a_width => 40,
    b_arith => xlSigned,
    b_bin_pt => 38,
    b_width => 40,
    c_has_c_out => 0,
    c_latency => 0,
    c_output_width => 41,
    core_name0 => "receiver_c_addsub_v12_0_i1",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 41,
    latency => 0,
    overflow => 3,
    quantization => 1,
    s_arith => xlSigned,
    s_bin_pt => 38,
    s_width => 40
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
  addsub1 : entity xil_defaultlib.receiver_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 36,
    a_width => 38,
    b_arith => xlSigned,
    b_bin_pt => 38,
    b_width => 40,
    c_has_c_out => 0,
    c_latency => 0,
    c_output_width => 41,
    core_name0 => "receiver_c_addsub_v12_0_i1",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 41,
    latency => 0,
    overflow => 1,
    quantization => 1,
    s_arith => xlSigned,
    s_bin_pt => 38,
    s_width => 40
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
  k1_gain : entity xil_defaultlib.receiver_xlcmult 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 20,
    a_width => 22,
    b_bin_pt => 16,
    c_a_type => 0,
    c_a_width => 22,
    c_b_type => 1,
    c_b_width => 16,
    c_output_width => 38,
    core_name0 => "receiver_mult_gen_v12_0_i1",
    extra_registers => 0,
    multsign => 2,
    overflow => 1,
    p_arith => xlSigned,
    p_bin_pt => 36,
    p_width => 38,
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
  k2_gain : entity xil_defaultlib.receiver_xlcmult 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 20,
    a_width => 22,
    b_bin_pt => 18,
    c_a_type => 0,
    c_a_width => 22,
    c_b_type => 1,
    c_b_width => 18,
    c_output_width => 40,
    core_name0 => "receiver_mult_gen_v12_0_i2",
    extra_registers => 0,
    multsign => 2,
    overflow => 1,
    p_arith => xlSigned,
    p_bin_pt => 38,
    p_width => 40,
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
  register_x0 : entity xil_defaultlib.receiver_xlregister 
  generic map (
    d_width => 40,
    init_value => b"0000000000000000000000000000000000000000"
  )
  port map (
    d => addsub_s_net,
    rst => logical1_y_net,
    en => register2_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    q => register_q_net
  );
  register1 : entity xil_defaultlib.receiver_xlregister 
  generic map (
    d_width => 22,
    init_value => b"0000000000000000000000"
  )
  port map (
    d => mux_y_net,
    rst => logical1_y_net,
    en => register2_q_net_x0,
    clk => src_clk_net,
    ce => src_ce_net,
    q => register1_q_net
  );
  register2 : entity xil_defaultlib.receiver_xlregister 
  generic map (
    d_width => 1,
    init_value => b"0"
  )
  port map (
    en => "1",
    rst => "0",
    d => register2_q_net_x0,
    clk => src_clk_net,
    ce => src_ce_net,
    q => register2_q_net
  );
  register3 : entity xil_defaultlib.receiver_xlregister 
  generic map (
    d_width => 40,
    init_value => b"0000000000000000000000000000000000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => addsub1_s_net,
    clk => src_clk_net,
    ce => src_ce_net,
    q => register3_q_net
  );
  register4 : entity xil_defaultlib.receiver_xlregister 
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
    q => register4_q_net
  );
end structural;
-- Generated from Simulink block receiver/Carrier Synchronisation/Generate NCO/NCO
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity receiver_nco is
  port (
    step_size : in std_logic_vector( 40-1 downto 0 );
    en_in : in std_logic_vector( 1-1 downto 0 );
    clk_20 : in std_logic;
    ce_20 : in std_logic;
    cos : out std_logic_vector( 18-1 downto 0 );
    neg_sin : out std_logic_vector( 18-1 downto 0 );
    en_out : out std_logic_vector( 1-1 downto 0 )
  );
end receiver_nco;
architecture structural of receiver_nco is 
  signal neg_sin_rom_data_net : std_logic_vector( 18-1 downto 0 );
  signal register4_q_net : std_logic_vector( 1-1 downto 0 );
  signal src_clk_net : std_logic;
  signal register3_q_net : std_logic_vector( 40-1 downto 0 );
  signal src_ce_net : std_logic;
  signal cmult1_p_net : std_logic_vector( 48-1 downto 0 );
  signal register_q_net : std_logic_vector( 1-1 downto 0 );
  signal register1_q_net : std_logic_vector( 48-1 downto 0 );
  signal addsub4_s_net : std_logic_vector( 48-1 downto 0 );
  signal cos_rom_data_net : std_logic_vector( 18-1 downto 0 );
  signal convert1_dout_net : std_logic_vector( 12-1 downto 0 );
begin
  cos <= cos_rom_data_net;
  neg_sin <= neg_sin_rom_data_net;
  en_out <= register_q_net;
  register3_q_net <= step_size;
  register4_q_net <= en_in;
  src_clk_net <= clk_20;
  src_ce_net <= ce_20;
  addsub4 : entity xil_defaultlib.receiver_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 36,
    a_width => 48,
    b_arith => xlSigned,
    b_bin_pt => 36,
    b_width => 48,
    c_has_c_out => 0,
    c_latency => 0,
    c_output_width => 49,
    core_name0 => "receiver_c_addsub_v12_0_i2",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 49,
    latency => 0,
    overflow => 1,
    quantization => 1,
    s_arith => xlSigned,
    s_bin_pt => 36,
    s_width => 48
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
  cmult1 : entity xil_defaultlib.receiver_xlcmult 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 38,
    a_width => 40,
    b_bin_pt => 36,
    c_a_type => 0,
    c_a_width => 40,
    c_b_type => 1,
    c_b_width => 46,
    c_output_width => 86,
    core_name0 => "receiver_mult_gen_v12_0_i3",
    extra_registers => 0,
    multsign => 2,
    overflow => 1,
    p_arith => xlSigned,
    p_bin_pt => 36,
    p_width => 48,
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
  convert1 : entity xil_defaultlib.receiver_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 36,
    din_width => 48,
    dout_arith => 1,
    dout_bin_pt => 0,
    dout_width => 12,
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
  cos_rom : entity xil_defaultlib.receiver_xlsprom 
  generic map (
    c_address_width => 12,
    c_width => 18,
    latency => 1,
    mem_init_file => "xpm_47bbfb_vivado.mem",
    mem_size => 73728,
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
  neg_sin_rom : entity xil_defaultlib.receiver_xlsprom 
  generic map (
    c_address_width => 12,
    c_width => 18,
    latency => 1,
    mem_init_file => "xpm_77999f_vivado.mem",
    mem_size => 73728,
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
  register_x0 : entity xil_defaultlib.receiver_xlregister 
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
  register1 : entity xil_defaultlib.receiver_xlregister 
  generic map (
    d_width => 48,
    init_value => b"000000000000000000000000000000000000000000000000"
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
-- Generated from Simulink block receiver/Carrier Synchronisation/Generate NCO
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity receiver_generate_nco is
  port (
    angle : in std_logic_vector( 22-1 downto 0 );
    valid_in : in std_logic_vector( 1-1 downto 0 );
    reset : in std_logic_vector( 1-1 downto 0 );
    clk_20 : in std_logic;
    ce_20 : in std_logic;
    imag_out : out std_logic_vector( 18-1 downto 0 );
    real_out : out std_logic_vector( 18-1 downto 0 );
    valid_out : out std_logic_vector( 1-1 downto 0 )
  );
end receiver_generate_nco;
architecture structural of receiver_generate_nco is 
  signal src_clk_net : std_logic;
  signal src_ce_net : std_logic;
  signal register3_q_net : std_logic_vector( 40-1 downto 0 );
  signal register4_q_net : std_logic_vector( 1-1 downto 0 );
  signal register_q_net : std_logic_vector( 1-1 downto 0 );
  signal logical1_y_net : std_logic_vector( 1-1 downto 0 );
  signal cos_rom_data_net : std_logic_vector( 18-1 downto 0 );
  signal mux_y_net : std_logic_vector( 22-1 downto 0 );
  signal neg_sin_rom_data_net : std_logic_vector( 18-1 downto 0 );
  signal register2_q_net : std_logic_vector( 1-1 downto 0 );
begin
  imag_out <= neg_sin_rom_data_net;
  real_out <= cos_rom_data_net;
  valid_out <= register_q_net;
  mux_y_net <= angle;
  register2_q_net <= valid_in;
  logical1_y_net <= reset;
  src_clk_net <= clk_20;
  src_ce_net <= ce_20;
  loop_filter : entity xil_defaultlib.receiver_loop_filter 
  port map (
    signal_x0 => mux_y_net,
    strobe => register2_q_net,
    reset => logical1_y_net,
    clk_20 => src_clk_net,
    ce_20 => src_ce_net,
    error => register3_q_net,
    valid => register4_q_net
  );
  nco : entity xil_defaultlib.receiver_nco 
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
-- Generated from Simulink block receiver/Carrier Synchronisation
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity receiver_carrier_synchronisation is
  port (
    reset : in std_logic_vector( 1-1 downto 0 );
    modulation : in std_logic_vector( 1-1 downto 0 );
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
end receiver_carrier_synchronisation;
architecture structural of receiver_carrier_synchronisation is 
  signal delay1_q_net : std_logic_vector( 16-1 downto 0 );
  signal delay3_q_net : std_logic_vector( 1-1 downto 0 );
  signal register1_q_net : std_logic_vector( 35-1 downto 0 );
  signal register_q_net : std_logic_vector( 1-1 downto 0 );
  signal delay2_q_net : std_logic_vector( 16-1 downto 0 );
  signal mux_y_net : std_logic_vector( 22-1 downto 0 );
  signal register_q_net_x0 : std_logic_vector( 35-1 downto 0 );
  signal clk_net : std_logic;
  signal src_clk_net : std_logic;
  signal src_ce_net : std_logic;
  signal neg_sin_rom_data_net : std_logic_vector( 18-1 downto 0 );
  signal cos_rom_data_net : std_logic_vector( 18-1 downto 0 );
  signal modulation_net : std_logic_vector( 1-1 downto 0 );
  signal ce_net : std_logic;
  signal register2_q_net : std_logic_vector( 1-1 downto 0 );
  signal register4_q_net : std_logic_vector( 1-1 downto 0 );
  signal convert1_dout_net : std_logic_vector( 16-1 downto 0 );
  signal convert_dout_net : std_logic_vector( 16-1 downto 0 );
  signal logical1_y_net : std_logic_vector( 1-1 downto 0 );
begin
  valid_out <= register4_q_net;
  real_out <= convert1_dout_net;
  imag_out <= convert_dout_net;
  logical1_y_net <= reset;
  modulation_net <= modulation;
  delay3_q_net <= valid_in;
  delay1_q_net <= real_in;
  delay2_q_net <= imag_in;
  clk_net <= clk_1;
  ce_net <= ce_1;
  src_clk_net <= clk_20;
  src_ce_net <= ce_20;
  de_rotate_constellation : entity xil_defaultlib.receiver_de_rotate_constellation 
  port map (
    imag_in => delay2_q_net,
    real_in => delay1_q_net,
    valid_in => delay3_q_net,
    imag_error => neg_sin_rom_data_net,
    real_error => cos_rom_data_net,
    valid_error => register_q_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    clk_20 => src_clk_net,
    ce_20 => src_ce_net,
    imag_out => register1_q_net,
    real_out => register_q_net_x0,
    valid_out => register4_q_net
  );
  generate_angle_error : entity xil_defaultlib.receiver_generate_angle_error 
  port map (
    imag_in => convert_dout_net,
    real_in => convert1_dout_net,
    valid_in => register4_q_net,
    modulation => modulation_net,
    clk_20 => src_clk_net,
    ce_20 => src_ce_net,
    angle => mux_y_net,
    valid_out => register2_q_net
  );
  generate_nco : entity xil_defaultlib.receiver_generate_nco 
  port map (
    angle => mux_y_net,
    valid_in => register2_q_net,
    reset => logical1_y_net,
    clk_20 => src_clk_net,
    ce_20 => src_ce_net,
    imag_out => neg_sin_rom_data_net,
    real_out => cos_rom_data_net,
    valid_out => register_q_net
  );
  convert : entity xil_defaultlib.receiver_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 30,
    din_width => 35,
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
  convert1 : entity xil_defaultlib.receiver_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 30,
    din_width => 35,
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
    din => register_q_net_x0,
    clk => src_clk_net,
    ce => src_ce_net,
    dout => convert1_dout_net
  );
end structural;
-- Generated from Simulink block receiver/Coarse Frequency Synchronisation/Apply Frequency Offset Correction
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity receiver_apply_frequency_offset_correction is
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
end receiver_apply_frequency_offset_correction;
architecture structural of receiver_apply_frequency_offset_correction is 
  signal convert1_dout_net : std_logic_vector( 16-1 downto 0 );
  signal sin_rom_data_net : std_logic_vector( 16-1 downto 0 );
  signal convert_dout_net : std_logic_vector( 16-1 downto 0 );
  signal cos_rom_data_net : std_logic_vector( 16-1 downto 0 );
  signal clk_net : std_logic;
  signal cmult2_p_net : std_logic_vector( 16-1 downto 0 );
  signal ce_5_net : std_logic;
  signal product_p_re_net : std_logic_vector( 33-1 downto 0 );
  signal cmult1_p_net : std_logic_vector( 16-1 downto 0 );
  signal ce_net : std_logic;
  signal clk_5_net : std_logic;
  signal product_p_im_net : std_logic_vector( 33-1 downto 0 );
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
  convert : entity xil_defaultlib.receiver_xlconvert 
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
  convert1 : entity xil_defaultlib.receiver_xlconvert 
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
  product : entity xil_defaultlib.xlreceiver_cmpy_v6_0_i1_b59bcb8a637d0acbaf0c114f5a2740aa 
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
-- Generated from Simulink block receiver/Coarse Frequency Synchronisation/Get Frequency Offset
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity receiver_get_frequency_offset is
  port (
    mag_in : in std_logic_vector( 32-1 downto 0 );
    sof : in std_logic_vector( 1-1 downto 0 );
    clk_5 : in std_logic;
    ce_5 : in std_logic;
    offset_out : out std_logic_vector( 32-1 downto 0 )
  );
end receiver_get_frequency_offset;
architecture structural of receiver_get_frequency_offset is 
  signal ce_5_net : std_logic;
  signal clk_5_net : std_logic;
  signal mux_y_net : std_logic_vector( 32-1 downto 0 );
  signal constant_op_net : std_logic_vector( 13-1 downto 0 );
  signal register_q_net_x0 : std_logic_vector( 13-1 downto 0 );
  signal register_q_net : std_logic_vector( 1-1 downto 0 );
  signal register6_q_net : std_logic_vector( 13-1 downto 0 );
  signal counter_op_net : std_logic_vector( 13-1 downto 0 );
  signal relational2_op_net : std_logic_vector( 1-1 downto 0 );
  signal register1_q_net : std_logic_vector( 13-1 downto 0 );
  signal register2_q_net : std_logic_vector( 1-1 downto 0 );
  signal rom_data_net : std_logic_vector( 32-1 downto 0 );
  signal register3_q_net : std_logic_vector( 32-1 downto 0 );
  signal register4_q_net : std_logic_vector( 32-1 downto 0 );
  signal relational1_op_net : std_logic_vector( 1-1 downto 0 );
  signal register5_q_net : std_logic_vector( 13-1 downto 0 );
  signal relational_op_net : std_logic_vector( 1-1 downto 0 );
begin
  offset_out <= rom_data_net;
  mux_y_net <= mag_in;
  register_q_net <= sof;
  clk_5_net <= clk_5;
  ce_5_net <= ce_5;
  constant_x0 : entity xil_defaultlib.sysgen_constant_edd89ce943 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  counter : entity xil_defaultlib.receiver_xlcounter_limit 
  generic map (
    cnt_15_0 => 8191,
    cnt_31_16 => 0,
    cnt_47_32 => 0,
    cnt_63_48 => 0,
    core_name0 => "receiver_c_counter_binary_v12_0_i0",
    count_limited => 0,
    op_arith => xlUnsigned,
    op_width => 13
  )
  port map (
    en => "1",
    clr => '0',
    rst => register_q_net,
    clk => clk_5_net,
    ce => ce_5_net,
    op => counter_op_net
  );
  rom : entity xil_defaultlib.receiver_xlsprom 
  generic map (
    c_address_width => 13,
    c_width => 32,
    latency => 1,
    mem_init_file => "xpm_fef865_vivado.mem",
    mem_size => 262144,
    mem_type => "block",
    read_reset_val => "0"
  )
  port map (
    en => "1",
    rst => "0",
    addr => register6_q_net,
    clk => clk_5_net,
    ce => ce_5_net,
    data => rom_data_net
  );
  register_x0 : entity xil_defaultlib.receiver_xlregister 
  generic map (
    d_width => 13,
    init_value => b"0000000000000"
  )
  port map (
    rst => "0",
    d => counter_op_net,
    en => relational2_op_net,
    clk => clk_5_net,
    ce => ce_5_net,
    q => register_q_net_x0
  );
  register1 : entity xil_defaultlib.receiver_xlregister 
  generic map (
    d_width => 13,
    init_value => b"0000000000000"
  )
  port map (
    rst => "0",
    d => register_q_net_x0,
    en => register2_q_net,
    clk => clk_5_net,
    ce => ce_5_net,
    q => register1_q_net
  );
  register2 : entity xil_defaultlib.receiver_xlregister 
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
    q => register2_q_net
  );
  register3 : entity xil_defaultlib.receiver_xlregister 
  generic map (
    d_width => 32,
    init_value => b"00000000000000000000000000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => mux_y_net,
    clk => clk_5_net,
    ce => ce_5_net,
    q => register3_q_net
  );
  register4 : entity xil_defaultlib.receiver_xlregister 
  generic map (
    d_width => 32,
    init_value => b"00000000000000000000000000000000"
  )
  port map (
    d => register3_q_net,
    rst => relational_op_net,
    en => relational2_op_net,
    clk => clk_5_net,
    ce => ce_5_net,
    q => register4_q_net
  );
  register5 : entity xil_defaultlib.receiver_xlregister 
  generic map (
    d_width => 13,
    init_value => b"0000000000000"
  )
  port map (
    rst => "0",
    d => register1_q_net,
    en => register2_q_net,
    clk => clk_5_net,
    ce => ce_5_net,
    q => register5_q_net
  );
  register6 : entity xil_defaultlib.receiver_xlregister 
  generic map (
    d_width => 13,
    init_value => b"0000000000000"
  )
  port map (
    rst => "0",
    d => register5_q_net,
    en => relational1_op_net,
    clk => clk_5_net,
    ce => ce_5_net,
    q => register6_q_net
  );
  relational : entity xil_defaultlib.sysgen_relational_3416daf0b3 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    a => constant_op_net,
    b => counter_op_net,
    op => relational_op_net
  );
  relational1 : entity xil_defaultlib.sysgen_relational_3416daf0b3 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    a => register1_q_net,
    b => register5_q_net,
    op => relational1_op_net
  );
  relational2 : entity xil_defaultlib.sysgen_relational_c1f67a56e1 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    a => register3_q_net,
    b => register4_q_net,
    op => relational2_op_net
  );
end structural;
-- Generated from Simulink block receiver/Coarse Frequency Synchronisation/Get Spectrum Magnitude
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity receiver_get_spectrum_magnitude is
  port (
    imag_in : in std_logic_vector( 32-1 downto 0 );
    real_in : in std_logic_vector( 32-1 downto 0 );
    clk_5 : in std_logic;
    ce_5 : in std_logic;
    mag_out : out std_logic_vector( 32-1 downto 0 );
    sof_out : out std_logic_vector( 1-1 downto 0 )
  );
end receiver_get_spectrum_magnitude;
architecture structural of receiver_get_spectrum_magnitude is 
  signal mux_y_net : std_logic_vector( 32-1 downto 0 );
  signal register_q_net : std_logic_vector( 1-1 downto 0 );
  signal convert1_dout_net : std_logic_vector( 32-1 downto 0 );
  signal convert_dout_net : std_logic_vector( 32-1 downto 0 );
  signal clk_5_net : std_logic;
  signal ce_5_net : std_logic;
  signal mult4_p_net : std_logic_vector( 63-1 downto 0 );
  signal counter1_op_net : std_logic_vector( 13-1 downto 0 );
  signal counter2_op_net : std_logic_vector( 13-1 downto 0 );
  signal constant1_op_net : std_logic_vector( 1-1 downto 0 );
  signal constant5_op_net : std_logic_vector( 14-1 downto 0 );
  signal constant3_op_net : std_logic_vector( 10-1 downto 0 );
  signal constant_op_net : std_logic_vector( 13-1 downto 0 );
  signal constant6_op_net : std_logic_vector( 32-1 downto 0 );
  signal constant2_op_net : std_logic_vector( 1-1 downto 0 );
  signal constant4_op_net : std_logic_vector( 1-1 downto 0 );
  signal fast_fourier_transform_9_1_m_axis_data_tvalid_net : std_logic_vector( 1-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 64-1 downto 0 );
  signal mult1_p_net : std_logic_vector( 63-1 downto 0 );
  signal fast_fourier_transform_9_1_event_data_out_channel_halt_net : std_logic;
  signal register2_q_net : std_logic_vector( 32-1 downto 0 );
  signal fast_fourier_transform_9_1_m_axis_data_tdata_xn_im_0_net : std_logic_vector( 32-1 downto 0 );
  signal fast_fourier_transform_9_1_m_axis_data_tdata_xn_re_0_net : std_logic_vector( 32-1 downto 0 );
  signal delay_q_net : std_logic_vector( 1-1 downto 0 );
  signal register1_q_net : std_logic_vector( 32-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 1-1 downto 0 );
  signal fast_fourier_transform_9_1_event_tlast_missing_net : std_logic;
  signal fast_fourier_transform_9_1_s_axis_config_tready_net : std_logic;
  signal fast_fourier_transform_9_1_s_axis_data_tready_net : std_logic;
  signal fast_fourier_transform_9_1_m_axis_data_tlast_net : std_logic;
  signal fast_fourier_transform_9_1_event_tlast_unexpected_net : std_logic;
  signal fast_fourier_transform_9_1_event_frame_started_net : std_logic;
  signal relational_op_net : std_logic;
  signal fast_fourier_transform_9_1_event_data_in_channel_halt_net : std_logic;
  signal relational1_op_net : std_logic_vector( 1-1 downto 0 );
  signal fast_fourier_transform_9_1_event_status_channel_halt_net : std_logic;
  signal register3_q_net : std_logic_vector( 1-1 downto 0 );
  signal shift_op_net : std_logic_vector( 32-1 downto 0 );
begin
  mag_out <= mux_y_net;
  sof_out <= register_q_net;
  convert1_dout_net <= imag_in;
  convert_dout_net <= real_in;
  clk_5_net <= clk_5;
  ce_5_net <= ce_5;
  addsub : entity xil_defaultlib.receiver_xladdsub 
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
    core_name0 => "receiver_c_addsub_v12_0_i3",
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
  constant_x0 : entity xil_defaultlib.sysgen_constant_edd89ce943 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  constant1 : entity xil_defaultlib.sysgen_constant_e1cbbe41f1 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant1_op_net
  );
  constant2 : entity xil_defaultlib.sysgen_constant_291ac9f735 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant2_op_net
  );
  constant3 : entity xil_defaultlib.sysgen_constant_02c1b20566 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant3_op_net
  );
  constant4 : entity xil_defaultlib.sysgen_constant_e1cbbe41f1 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant4_op_net
  );
  constant5 : entity xil_defaultlib.sysgen_constant_2f28ab19df 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant5_op_net
  );
  constant6 : entity xil_defaultlib.sysgen_constant_ed7df6023e 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant6_op_net
  );
  counter1 : entity xil_defaultlib.receiver_xlcounter_limit 
  generic map (
    cnt_15_0 => 8191,
    cnt_31_16 => 0,
    cnt_47_32 => 0,
    cnt_63_48 => 0,
    core_name0 => "receiver_c_counter_binary_v12_0_i0",
    count_limited => 0,
    op_arith => xlUnsigned,
    op_width => 13
  )
  port map (
    en => "1",
    rst => "0",
    clr => '0',
    clk => clk_5_net,
    ce => ce_5_net,
    op => counter1_op_net
  );
  counter2 : entity xil_defaultlib.receiver_xlcounter_limit 
  generic map (
    cnt_15_0 => 8191,
    cnt_31_16 => 0,
    cnt_47_32 => 0,
    cnt_63_48 => 0,
    core_name0 => "receiver_c_counter_binary_v12_0_i0",
    count_limited => 0,
    op_arith => xlUnsigned,
    op_width => 13
  )
  port map (
    rst => "0",
    clr => '0',
    en => fast_fourier_transform_9_1_m_axis_data_tvalid_net,
    clk => clk_5_net,
    ce => ce_5_net,
    op => counter2_op_net
  );
  delay : entity xil_defaultlib.receiver_xldelay 
  generic map (
    latency => 3,
    reg_retiming => 0,
    reset => 0,
    width => 1
  )
  port map (
    en => '1',
    rst => '0',
    d => relational1_op_net,
    clk => clk_5_net,
    ce => ce_5_net,
    q => delay_q_net
  );
  delay1 : entity xil_defaultlib.receiver_xldelay 
  generic map (
    latency => 3,
    reg_retiming => 0,
    reset => 0,
    width => 1
  )
  port map (
    en => '1',
    rst => '0',
    d => fast_fourier_transform_9_1_m_axis_data_tvalid_net,
    clk => clk_5_net,
    ce => ce_5_net,
    q => delay1_q_net
  );
  fast_fourier_transform_9_1 : entity xil_defaultlib.xlfast_fourier_transform_1ea7c1bb5dc0834af6d1826c317af473 
  port map (
    s_axis_config_tdata_scale_sch => constant5_op_net,
    s_axis_config_tdata_fwd_inv => constant4_op_net,
    s_axis_config_tvalid => constant1_op_net(0),
    s_axis_data_tdata_xn_im_0 => register1_q_net,
    s_axis_data_tdata_xn_re_0 => register2_q_net,
    s_axis_data_tvalid => constant2_op_net(0),
    s_axis_data_tlast => relational_op_net,
    m_axis_data_tready => constant2_op_net(0),
    clk => clk_5_net,
    ce => ce_5_net,
    s_axis_config_tready => fast_fourier_transform_9_1_s_axis_config_tready_net,
    s_axis_data_tready => fast_fourier_transform_9_1_s_axis_data_tready_net,
    m_axis_data_tdata_xn_im_0 => fast_fourier_transform_9_1_m_axis_data_tdata_xn_im_0_net,
    m_axis_data_tdata_xn_re_0 => fast_fourier_transform_9_1_m_axis_data_tdata_xn_re_0_net,
    m_axis_data_tvalid => fast_fourier_transform_9_1_m_axis_data_tvalid_net(0),
    m_axis_data_tlast => fast_fourier_transform_9_1_m_axis_data_tlast_net,
    event_frame_started => fast_fourier_transform_9_1_event_frame_started_net,
    event_tlast_unexpected => fast_fourier_transform_9_1_event_tlast_unexpected_net,
    event_tlast_missing => fast_fourier_transform_9_1_event_tlast_missing_net,
    event_data_in_channel_halt => fast_fourier_transform_9_1_event_data_in_channel_halt_net,
    event_status_channel_halt => fast_fourier_transform_9_1_event_status_channel_halt_net,
    event_data_out_channel_halt => fast_fourier_transform_9_1_event_data_out_channel_halt_net
  );
  mult1 : entity xil_defaultlib.receiver_xlmult 
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
    core_name0 => "receiver_mult_gen_v12_0_i4",
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
    a => fast_fourier_transform_9_1_m_axis_data_tdata_xn_re_0_net,
    b => fast_fourier_transform_9_1_m_axis_data_tdata_xn_re_0_net,
    clk => clk_5_net,
    ce => ce_5_net,
    core_clk => clk_5_net,
    core_ce => ce_5_net,
    p => mult1_p_net
  );
  mult4 : entity xil_defaultlib.receiver_xlmult 
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
    core_name0 => "receiver_mult_gen_v12_0_i4",
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
    a => fast_fourier_transform_9_1_m_axis_data_tdata_xn_im_0_net,
    b => fast_fourier_transform_9_1_m_axis_data_tdata_xn_im_0_net,
    clk => clk_5_net,
    ce => ce_5_net,
    core_clk => clk_5_net,
    core_ce => ce_5_net,
    p => mult4_p_net
  );
  mux : entity xil_defaultlib.sysgen_mux_5ef768c070 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => register3_q_net,
    d0 => constant6_op_net,
    d1 => shift_op_net,
    y => mux_y_net
  );
  register_x0 : entity xil_defaultlib.receiver_xlregister 
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
  register1 : entity xil_defaultlib.receiver_xlregister 
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
    q => register1_q_net
  );
  register2 : entity xil_defaultlib.receiver_xlregister 
  generic map (
    d_width => 32,
    init_value => b"00000000000000000000000000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => convert_dout_net,
    clk => clk_5_net,
    ce => ce_5_net,
    q => register2_q_net
  );
  register3 : entity xil_defaultlib.receiver_xlregister 
  generic map (
    d_width => 1,
    init_value => b"0"
  )
  port map (
    en => "1",
    rst => "0",
    d => delay1_q_net,
    clk => clk_5_net,
    ce => ce_5_net,
    q => register3_q_net
  );
  relational : entity xil_defaultlib.sysgen_relational_3416daf0b3 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    a => constant_op_net,
    b => counter1_op_net,
    op(0) => relational_op_net
  );
  relational1 : entity xil_defaultlib.sysgen_relational_f6f3c4e942 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    a => constant3_op_net,
    b => counter2_op_net,
    op => relational1_op_net
  );
  shift : entity xil_defaultlib.sysgen_shift_fa69ff46d8 
  port map (
    clr => '0',
    ip => addsub_s_net,
    clk => clk_5_net,
    ce => ce_5_net,
    op => shift_op_net
  );
end structural;
-- Generated from Simulink block receiver/Coarse Frequency Synchronisation/Increase Signal Power
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity receiver_increase_signal_power is
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
end receiver_increase_signal_power;
architecture structural of receiver_increase_signal_power is 
  signal convert1_dout_net : std_logic_vector( 32-1 downto 0 );
  signal convert_dout_net : std_logic_vector( 32-1 downto 0 );
  signal cmult1_p_net : std_logic_vector( 16-1 downto 0 );
  signal cmult2_p_net : std_logic_vector( 16-1 downto 0 );
  signal clk_net : std_logic;
  signal product1_p_re_net : std_logic_vector( 37-1 downto 0 );
  signal convert4_dout_net : std_logic_vector( 18-1 downto 0 );
  signal ce_5_net : std_logic;
  signal product2_p_im_net : std_logic_vector( 33-1 downto 0 );
  signal ce_net : std_logic;
  signal convert2_dout_net : std_logic_vector( 18-1 downto 0 );
  signal clk_5_net : std_logic;
  signal product2_p_re_net : std_logic_vector( 33-1 downto 0 );
  signal product1_p_im_net : std_logic_vector( 37-1 downto 0 );
begin
  imag_out <= convert1_dout_net;
  real_out <= convert_dout_net;
  cmult1_p_net <= imag_in;
  cmult2_p_net <= real_in;
  clk_net <= clk_1;
  ce_net <= ce_1;
  clk_5_net <= clk_5;
  ce_5_net <= ce_5;
  convert : entity xil_defaultlib.receiver_xlconvert 
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
    dout => convert_dout_net
  );
  convert1 : entity xil_defaultlib.receiver_xlconvert 
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
    dout => convert1_dout_net
  );
  convert2 : entity xil_defaultlib.receiver_xlconvert 
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
    din => product2_p_im_net,
    clk => clk_5_net,
    ce => ce_5_net,
    dout => convert2_dout_net
  );
  convert4 : entity xil_defaultlib.receiver_xlconvert 
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
    din => product2_p_re_net,
    clk => clk_5_net,
    ce => ce_5_net,
    dout => convert4_dout_net
  );
  product1 : entity xil_defaultlib.xlreceiver_cmpy_v6_0_i2_50c91325e0e7dbcf8de2e084adad4455 
  port map (
    a_re => convert4_dout_net,
    a_im => convert2_dout_net,
    b_re => convert4_dout_net,
    b_im => convert2_dout_net,
    clk => clk_net,
    ce => ce_net,
    clk_5 => clk_5_net,
    ce_5 => ce_5_net,
    p_re => product1_p_re_net,
    p_im => product1_p_im_net
  );
  product2 : entity xil_defaultlib.xlreceiver_cmpy_v6_0_i1_b59bcb8a637d0acbaf0c114f5a2740aa 
  port map (
    a_re => cmult2_p_net,
    a_im => cmult1_p_net,
    b_re => cmult2_p_net,
    b_im => cmult1_p_net,
    clk => clk_net,
    ce => ce_net,
    clk_5 => clk_5_net,
    ce_5 => ce_5_net,
    p_re => product2_p_re_net,
    p_im => product2_p_im_net
  );
end structural;
-- Generated from Simulink block receiver/Coarse Frequency Synchronisation/NCO
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity receiver_nco_x0 is
  port (
    offset_in : in std_logic_vector( 32-1 downto 0 );
    clk_5 : in std_logic;
    ce_5 : in std_logic;
    cos : out std_logic_vector( 16-1 downto 0 );
    sin : out std_logic_vector( 16-1 downto 0 )
  );
end receiver_nco_x0;
architecture structural of receiver_nco_x0 is 
  signal cos_rom_data_net : std_logic_vector( 16-1 downto 0 );
  signal sin_rom_data_net : std_logic_vector( 16-1 downto 0 );
  signal delay2_q_net : std_logic_vector( 42-1 downto 0 );
  signal rom_data_net : std_logic_vector( 32-1 downto 0 );
  signal convert4_dout_net : std_logic_vector( 11-1 downto 0 );
  signal clk_5_net : std_logic;
  signal ce_5_net : std_logic;
  signal cmult_p_net : std_logic_vector( 42-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 42-1 downto 0 );
begin
  cos <= cos_rom_data_net;
  sin <= sin_rom_data_net;
  rom_data_net <= offset_in;
  clk_5_net <= clk_5;
  ce_5_net <= ce_5;
  addsub : entity xil_defaultlib.receiver_xladdsub 
  generic map (
    a_arith => xlUnsigned,
    a_bin_pt => 31,
    a_width => 42,
    b_arith => xlSigned,
    b_bin_pt => 31,
    b_width => 42,
    c_has_c_out => 0,
    c_latency => 0,
    c_output_width => 44,
    core_name0 => "receiver_c_addsub_v12_0_i4",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 44,
    latency => 0,
    overflow => 1,
    quantization => 1,
    s_arith => xlUnsigned,
    s_bin_pt => 31,
    s_width => 42
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
  cmult : entity xil_defaultlib.receiver_xlcmult 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 10,
    a_width => 32,
    b_bin_pt => 31,
    c_a_type => 0,
    c_a_width => 32,
    c_b_type => 1,
    c_b_width => 42,
    c_output_width => 74,
    core_name0 => "receiver_mult_gen_v12_0_i5",
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
  convert4 : entity xil_defaultlib.receiver_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 1,
    din_bin_pt => 31,
    din_width => 42,
    dout_arith => 1,
    dout_bin_pt => 0,
    dout_width => 11,
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
  delay2 : entity xil_defaultlib.receiver_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 42
  )
  port map (
    en => '1',
    rst => '0',
    d => addsub_s_net,
    clk => clk_5_net,
    ce => ce_5_net,
    q => delay2_q_net
  );
  sin_rom : entity xil_defaultlib.receiver_xlsprom 
  generic map (
    c_address_width => 11,
    c_width => 16,
    latency => 1,
    mem_init_file => "xpm_491135_vivado.mem",
    mem_size => 32768,
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
  cos_rom : entity xil_defaultlib.receiver_xlsprom 
  generic map (
    c_address_width => 11,
    c_width => 16,
    latency => 1,
    mem_init_file => "xpm_77ff11_vivado.mem",
    mem_size => 32768,
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
-- Generated from Simulink block receiver/Coarse Frequency Synchronisation
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity receiver_coarse_frequency_synchronisation is
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
end receiver_coarse_frequency_synchronisation;
architecture structural of receiver_coarse_frequency_synchronisation is 
  signal mux1_y_net : std_logic_vector( 16-1 downto 0 );
  signal mux2_y_net : std_logic_vector( 16-1 downto 0 );
  signal delay3_q_net : std_logic_vector( 1-1 downto 0 );
  signal rom_data_net : std_logic_vector( 32-1 downto 0 );
  signal coarse_passthrough_net : std_logic_vector( 1-1 downto 0 );
  signal cic_decimator_real_m_axis_data_tvalid_net : std_logic;
  signal register_q_net : std_logic_vector( 1-1 downto 0 );
  signal delay2_q_net : std_logic_vector( 16-1 downto 0 );
  signal cmult2_p_net : std_logic_vector( 16-1 downto 0 );
  signal mux_y_net : std_logic_vector( 32-1 downto 0 );
  signal convert1_dout_net : std_logic_vector( 16-1 downto 0 );
  signal sin_rom_data_net : std_logic_vector( 16-1 downto 0 );
  signal ce_5_net : std_logic;
  signal clk_net : std_logic;
  signal convert_dout_net : std_logic_vector( 16-1 downto 0 );
  signal convert_dout_net_x0 : std_logic_vector( 32-1 downto 0 );
  signal cmult1_p_net : std_logic_vector( 16-1 downto 0 );
  signal cos_rom_data_net : std_logic_vector( 16-1 downto 0 );
  signal convert1_dout_net_x0 : std_logic_vector( 32-1 downto 0 );
  signal clk_5_net : std_logic;
  signal ce_net : std_logic;
  signal delay1_q_net : std_logic_vector( 16-1 downto 0 );
begin
  valid_out <= delay3_q_net;
  real_out <= mux1_y_net;
  imag_out <= mux2_y_net;
  freq_offset <= rom_data_net;
  coarse_passthrough_net <= passthrough;
  cic_decimator_real_m_axis_data_tvalid_net <= valid_in;
  cmult2_p_net <= real_in;
  cmult1_p_net <= imag_in;
  clk_net <= clk_1;
  ce_net <= ce_1;
  clk_5_net <= clk_5;
  ce_5_net <= ce_5;
  apply_frequency_offset_correction : entity xil_defaultlib.receiver_apply_frequency_offset_correction 
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
  get_frequency_offset : entity xil_defaultlib.receiver_get_frequency_offset 
  port map (
    mag_in => mux_y_net,
    sof => register_q_net,
    clk_5 => clk_5_net,
    ce_5 => ce_5_net,
    offset_out => rom_data_net
  );
  get_spectrum_magnitude : entity xil_defaultlib.receiver_get_spectrum_magnitude 
  port map (
    imag_in => convert1_dout_net_x0,
    real_in => convert_dout_net_x0,
    clk_5 => clk_5_net,
    ce_5 => ce_5_net,
    mag_out => mux_y_net,
    sof_out => register_q_net
  );
  increase_signal_power : entity xil_defaultlib.receiver_increase_signal_power 
  port map (
    imag_in => cmult1_p_net,
    real_in => cmult2_p_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    clk_5 => clk_5_net,
    ce_5 => ce_5_net,
    imag_out => convert1_dout_net_x0,
    real_out => convert_dout_net_x0
  );
  nco : entity xil_defaultlib.receiver_nco_x0 
  port map (
    offset_in => rom_data_net,
    clk_5 => clk_5_net,
    ce_5 => ce_5_net,
    cos => cos_rom_data_net,
    sin => sin_rom_data_net
  );
  delay1 : entity xil_defaultlib.receiver_xldelay 
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
  delay2 : entity xil_defaultlib.receiver_xldelay 
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
  delay3 : entity xil_defaultlib.receiver_xldelay 
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
    q => delay3_q_net
  );
  mux1 : entity xil_defaultlib.sysgen_mux_ae645d58f7 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => coarse_passthrough_net,
    d0 => convert_dout_net,
    d1 => delay2_q_net,
    y => mux1_y_net
  );
  mux2 : entity xil_defaultlib.sysgen_mux_ae645d58f7 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => coarse_passthrough_net,
    d0 => convert1_dout_net,
    d1 => delay1_q_net,
    y => mux2_y_net
  );
end structural;
-- Generated from Simulink block receiver/Complex AXI-Stream Slave Interface/Scalar2Vector
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity receiver_scalar2vector is
  port (
    i : in std_logic_vector( 32-1 downto 0 );
    o_1 : out std_logic_vector( 16-1 downto 0 );
    o_2 : out std_logic_vector( 16-1 downto 0 )
  );
end receiver_scalar2vector;
architecture structural of receiver_scalar2vector is 
  signal slice0_y_net : std_logic_vector( 16-1 downto 0 );
  signal s_axis_tdata_re_net : std_logic_vector( 32-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 16-1 downto 0 );
begin
  o_1 <= slice0_y_net;
  o_2 <= slice1_y_net;
  s_axis_tdata_re_net <= i;
  slice0 : entity xil_defaultlib.receiver_xlslice 
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
  slice1 : entity xil_defaultlib.receiver_xlslice 
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
-- Generated from Simulink block receiver/Complex AXI-Stream Slave Interface/Scalar2Vector1
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity receiver_scalar2vector1 is
  port (
    i : in std_logic_vector( 32-1 downto 0 );
    o_1 : out std_logic_vector( 16-1 downto 0 );
    o_2 : out std_logic_vector( 16-1 downto 0 )
  );
end receiver_scalar2vector1;
architecture structural of receiver_scalar2vector1 is 
  signal s_axis_tdata_im_net : std_logic_vector( 32-1 downto 0 );
  signal slice0_y_net : std_logic_vector( 16-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 16-1 downto 0 );
begin
  o_1 <= slice0_y_net;
  o_2 <= slice1_y_net;
  s_axis_tdata_im_net <= i;
  slice0 : entity xil_defaultlib.receiver_xlslice 
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
  slice1 : entity xil_defaultlib.receiver_xlslice 
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
-- Generated from Simulink block receiver/Complex AXI-Stream Slave Interface/Vector Reinterpret
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity receiver_vector_reinterpret is
  port (
    in_1 : in std_logic_vector( 16-1 downto 0 );
    in_2 : in std_logic_vector( 16-1 downto 0 );
    out_1 : out std_logic_vector( 16-1 downto 0 );
    out_2 : out std_logic_vector( 16-1 downto 0 )
  );
end receiver_vector_reinterpret;
architecture structural of receiver_vector_reinterpret is 
  signal slice1_y_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret0_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret1_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal slice0_y_net : std_logic_vector( 16-1 downto 0 );
begin
  out_1 <= reinterpret0_output_port_net;
  out_2 <= reinterpret1_output_port_net;
  slice0_y_net <= in_1;
  slice1_y_net <= in_2;
  reinterpret0 : entity xil_defaultlib.sysgen_reinterpret_469a743fd1 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice0_y_net,
    output_port => reinterpret0_output_port_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_469a743fd1 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice1_y_net,
    output_port => reinterpret1_output_port_net
  );
end structural;
-- Generated from Simulink block receiver/Complex AXI-Stream Slave Interface/Vector Reinterpret1
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity receiver_vector_reinterpret1 is
  port (
    in_1 : in std_logic_vector( 16-1 downto 0 );
    in_2 : in std_logic_vector( 16-1 downto 0 );
    out_1 : out std_logic_vector( 16-1 downto 0 );
    out_2 : out std_logic_vector( 16-1 downto 0 )
  );
end receiver_vector_reinterpret1;
architecture structural of receiver_vector_reinterpret1 is 
  signal reinterpret1_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret0_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal slice0_y_net : std_logic_vector( 16-1 downto 0 );
begin
  out_1 <= reinterpret0_output_port_net;
  out_2 <= reinterpret1_output_port_net;
  slice0_y_net <= in_1;
  slice1_y_net <= in_2;
  reinterpret0 : entity xil_defaultlib.sysgen_reinterpret_469a743fd1 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice0_y_net,
    output_port => reinterpret0_output_port_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_469a743fd1 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice1_y_net,
    output_port => reinterpret1_output_port_net
  );
end structural;
-- Generated from Simulink block receiver/Complex AXI-Stream Slave Interface
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity receiver_complex_axi_stream_slave_interface is
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
end receiver_complex_axi_stream_slave_interface;
architecture structural of receiver_complex_axi_stream_slave_interface is 
  signal reinterpret0_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret1_output_port_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_s_axis_data_tready_net : std_logic;
  signal s_axis_tdata_im_net : std_logic_vector( 32-1 downto 0 );
  signal reinterpret0_output_port_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal reinterpret1_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal s_axis_tdata_re_net : std_logic_vector( 32-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 16-1 downto 0 );
  signal s_axis_tvalid_re_net : std_logic_vector( 1-1 downto 0 );
  signal slice1_y_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal slice0_y_net : std_logic_vector( 16-1 downto 0 );
  signal slice0_y_net_x0 : std_logic_vector( 16-1 downto 0 );
begin
  real_out_1 <= reinterpret0_output_port_net_x0;
  imag_out_1 <= reinterpret0_output_port_net;
  real_out_2 <= reinterpret1_output_port_net_x0;
  imag_out_2 <= reinterpret1_output_port_net;
  fir_compiler_7_2_s_axis_data_tready_net <= ready_in;
  s_axis_tdata_im_net <= s_axis_tdata_im;
  s_axis_tdata_re_net <= s_axis_tdata_re;
  s_axis_tvalid_re_net <= s_axis_tvalid_re;
  scalar2vector : entity xil_defaultlib.receiver_scalar2vector 
  port map (
    i => s_axis_tdata_re_net,
    o_1 => slice0_y_net_x0,
    o_2 => slice1_y_net_x0
  );
  scalar2vector1 : entity xil_defaultlib.receiver_scalar2vector1 
  port map (
    i => s_axis_tdata_im_net,
    o_1 => slice0_y_net,
    o_2 => slice1_y_net
  );
  vector_reinterpret : entity xil_defaultlib.receiver_vector_reinterpret 
  port map (
    in_1 => slice0_y_net_x0,
    in_2 => slice1_y_net_x0,
    out_1 => reinterpret0_output_port_net_x0,
    out_2 => reinterpret1_output_port_net_x0
  );
  vector_reinterpret1 : entity xil_defaultlib.receiver_vector_reinterpret1 
  port map (
    in_1 => slice0_y_net,
    in_2 => slice1_y_net,
    out_1 => reinterpret0_output_port_net,
    out_2 => reinterpret1_output_port_net
  );
end structural;
-- Generated from Simulink block receiver/Frame Synchronisation/BPSK Frame Sync/DBPSK Convert
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity receiver_dbpsk_convert is
  port (
    data_in : in std_logic_vector( 1-1 downto 0 );
    valid_in : in std_logic_vector( 1-1 downto 0 );
    data_out : out std_logic_vector( 2-1 downto 0 )
  );
end receiver_dbpsk_convert;
architecture structural of receiver_dbpsk_convert is 
  signal register5_q_net : std_logic_vector( 1-1 downto 0 );
  signal mux_y_net : std_logic_vector( 2-1 downto 0 );
  signal constant_op_net : std_logic_vector( 2-1 downto 0 );
  signal constant1_op_net : std_logic_vector( 2-1 downto 0 );
  signal register4_q_net : std_logic_vector( 1-1 downto 0 );
begin
  data_out <= mux_y_net;
  register4_q_net <= data_in;
  register5_q_net <= valid_in;
  constant_x0 : entity xil_defaultlib.sysgen_constant_0bd11d8843 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  constant1 : entity xil_defaultlib.sysgen_constant_afb570504f 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant1_op_net
  );
  mux : entity xil_defaultlib.sysgen_mux_e22feec339 
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
-- Generated from Simulink block receiver/Frame Synchronisation/BPSK Frame Sync/DBPSK Decision
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity receiver_dbpsk_decision is
  port (
    data_in : in std_logic_vector( 1-1 downto 0 );
    valid_in : in std_logic_vector( 1-1 downto 0 );
    clk_20 : in std_logic;
    ce_20 : in std_logic;
    data_out : out std_logic_vector( 1-1 downto 0 );
    valid_out : out std_logic_vector( 1-1 downto 0 )
  );
end receiver_dbpsk_decision;
architecture structural of receiver_dbpsk_decision is 
  signal src_ce_net : std_logic;
  signal register_q_net : std_logic_vector( 1-1 downto 0 );
  signal register5_q_net : std_logic_vector( 1-1 downto 0 );
  signal logical_y_net : std_logic_vector( 1-1 downto 0 );
  signal src_clk_net : std_logic;
  signal logical1_y_net : std_logic_vector( 1-1 downto 0 );
  signal register4_q_net : std_logic_vector( 1-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal register3_q_net : std_logic_vector( 1-1 downto 0 );
  signal register2_q_net : std_logic_vector( 1-1 downto 0 );
begin
  data_out <= register4_q_net;
  valid_out <= register5_q_net;
  slice_y_net <= data_in;
  logical_y_net <= valid_in;
  src_clk_net <= clk_20;
  src_ce_net <= ce_20;
  logical1 : entity xil_defaultlib.sysgen_logical_e2cf0c6029 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => register3_q_net,
    d1 => register_q_net,
    y => logical1_y_net
  );
  register_x0 : entity xil_defaultlib.receiver_xlregister 
  generic map (
    d_width => 1,
    init_value => b"0"
  )
  port map (
    rst => "0",
    d => slice_y_net,
    en => logical_y_net,
    clk => src_clk_net,
    ce => src_ce_net,
    q => register_q_net
  );
  register2 : entity xil_defaultlib.receiver_xlregister 
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
    q => register2_q_net
  );
  register3 : entity xil_defaultlib.receiver_xlregister 
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
  register4 : entity xil_defaultlib.receiver_xlregister 
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
  register5 : entity xil_defaultlib.receiver_xlregister 
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
-- Generated from Simulink block receiver/Frame Synchronisation/BPSK Frame Sync/Rising Edge Detector
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity receiver_rising_edge_detector is
  port (
    input : in std_logic_vector( 1-1 downto 0 );
    clk_20 : in std_logic;
    ce_20 : in std_logic;
    output : out std_logic_vector( 1-1 downto 0 )
  );
end receiver_rising_edge_detector;
architecture structural of receiver_rising_edge_detector is 
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal logical1_y_net : std_logic_vector( 1-1 downto 0 );
  signal register2_q_net : std_logic_vector( 1-1 downto 0 );
  signal relational1_op_net : std_logic_vector( 1-1 downto 0 );
  signal src_ce_net : std_logic;
  signal src_clk_net : std_logic;
begin
  output <= logical1_y_net;
  relational1_op_net <= input;
  src_clk_net <= clk_20;
  src_ce_net <= ce_20;
  inverter : entity xil_defaultlib.sysgen_inverter_db20653b1e 
  port map (
    clr => '0',
    ip => register2_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    op => inverter_op_net
  );
  logical1 : entity xil_defaultlib.sysgen_logical_613abbe5d0 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => inverter_op_net,
    d1 => relational1_op_net,
    y => logical1_y_net
  );
  register2 : entity xil_defaultlib.receiver_xlregister 
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
-- Generated from Simulink block receiver/Frame Synchronisation/BPSK Frame Sync/Shift Register
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity receiver_shift_register_x0 is
  port (
    data_in : in std_logic_vector( 1-1 downto 0 );
    valid_in : in std_logic_vector( 1-1 downto 0 );
    clk_20 : in std_logic;
    ce_20 : in std_logic;
    data_out : out std_logic_vector( 8-1 downto 0 );
    valid_out : out std_logic_vector( 1-1 downto 0 )
  );
end receiver_shift_register_x0;
architecture structural of receiver_shift_register_x0 is 
  signal concat_y_net : std_logic_vector( 8-1 downto 0 );
  signal src_clk_net : std_logic;
  signal delay1_q_net : std_logic_vector( 1-1 downto 0 );
  signal relational_op_net : std_logic_vector( 1-1 downto 0 );
  signal logical_y_net : std_logic_vector( 1-1 downto 0 );
  signal src_ce_net : std_logic;
  signal register3_q_net : std_logic_vector( 1-1 downto 0 );
  signal register2_q_net : std_logic_vector( 1-1 downto 0 );
  signal register6_q_net : std_logic_vector( 1-1 downto 0 );
  signal register7_q_net : std_logic_vector( 1-1 downto 0 );
  signal register_q_net : std_logic_vector( 1-1 downto 0 );
  signal register4_q_net : std_logic_vector( 1-1 downto 0 );
  signal counter_op_net : std_logic_vector( 4-1 downto 0 );
  signal constant_op_net : std_logic_vector( 4-1 downto 0 );
  signal register5_q_net : std_logic_vector( 1-1 downto 0 );
  signal register1_q_net : std_logic_vector( 1-1 downto 0 );
begin
  data_out <= concat_y_net;
  valid_out <= relational_op_net;
  delay1_q_net <= data_in;
  logical_y_net <= valid_in;
  src_clk_net <= clk_20;
  src_ce_net <= ce_20;
  concat : entity xil_defaultlib.sysgen_concat_7e0de4e1ff 
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
  constant_x0 : entity xil_defaultlib.sysgen_constant_8a7891ef8e 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  counter : entity xil_defaultlib.receiver_xlcounter_limit 
  generic map (
    cnt_15_0 => 8,
    cnt_31_16 => 0,
    cnt_47_32 => 0,
    cnt_63_48 => 0,
    core_name0 => "receiver_c_counter_binary_v12_0_i2",
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
  register_x0 : entity xil_defaultlib.receiver_xlregister 
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
  register1 : entity xil_defaultlib.receiver_xlregister 
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
  register2 : entity xil_defaultlib.receiver_xlregister 
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
  register3 : entity xil_defaultlib.receiver_xlregister 
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
  register4 : entity xil_defaultlib.receiver_xlregister 
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
  register5 : entity xil_defaultlib.receiver_xlregister 
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
  register6 : entity xil_defaultlib.receiver_xlregister 
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
  register7 : entity xil_defaultlib.receiver_xlregister 
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
  relational : entity xil_defaultlib.sysgen_relational_d8e59a041c 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    a => counter_op_net,
    b => constant_op_net,
    op => relational_op_net
  );
end structural;
-- Generated from Simulink block receiver/Frame Synchronisation/BPSK Frame Sync
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity receiver_bpsk_frame_sync is
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
end receiver_bpsk_frame_sync;
architecture structural of receiver_bpsk_frame_sync is 
  signal logical_y_net_x0 : std_logic_vector( 1-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal concat_y_net : std_logic_vector( 8-1 downto 0 );
  signal logical2_y_net_x0 : std_logic_vector( 1-1 downto 0 );
  signal ce_net : std_logic;
  signal logical1_y_net_x0 : std_logic_vector( 1-1 downto 0 );
  signal threshold_net : std_logic_vector( 32-1 downto 0 );
  signal convert1_dout_net : std_logic_vector( 16-1 downto 0 );
  signal register5_q_net : std_logic_vector( 1-1 downto 0 );
  signal delay_q_net : std_logic_vector( 1-1 downto 0 );
  signal logical_y_net : std_logic_vector( 1-1 downto 0 );
  signal counter1_op_net : std_logic_vector( 32-1 downto 0 );
  signal relational_op_net : std_logic_vector( 1-1 downto 0 );
  signal mux_y_net : std_logic_vector( 2-1 downto 0 );
  signal clk_net : std_logic;
  signal relational1_op_net : std_logic_vector( 1-1 downto 0 );
  signal logical2_y_net : std_logic_vector( 1-1 downto 0 );
  signal register4_q_net : std_logic_vector( 1-1 downto 0 );
  signal src_clk_net : std_logic;
  signal src_ce_net : std_logic;
  signal delay1_q_net : std_logic_vector( 1-1 downto 0 );
  signal fir_compiler_7_2_s_axis_data_tready_net : std_logic;
  signal register1_q_net : std_logic_vector( 1-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net : std_logic;
  signal logical1_y_net : std_logic_vector( 1-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tdata_real_net : std_logic_vector( 8-1 downto 0 );
begin
  data_out <= concat_y_net;
  valid_out <= relational_op_net;
  count <= counter1_op_net;
  threshold_net <= threshold;
  convert1_dout_net <= data_in;
  logical_y_net_x0 <= valid_in;
  logical2_y_net_x0 <= reset_count;
  logical2_y_net <= reset;
  clk_net <= clk_1;
  ce_net <= ce_1;
  src_clk_net <= clk_20;
  src_ce_net <= ce_20;
  dbpsk_convert : entity xil_defaultlib.receiver_dbpsk_convert 
  port map (
    data_in => register4_q_net,
    valid_in => register5_q_net,
    data_out => mux_y_net
  );
  dbpsk_decision : entity xil_defaultlib.receiver_dbpsk_decision 
  port map (
    data_in => slice_y_net,
    valid_in => logical_y_net_x0,
    clk_20 => src_clk_net,
    ce_20 => src_ce_net,
    data_out => register4_q_net,
    valid_out => register5_q_net
  );
  rising_edge_detector_x0 : entity xil_defaultlib.receiver_rising_edge_detector 
  port map (
    input => relational1_op_net,
    clk_20 => src_clk_net,
    ce_20 => src_ce_net,
    output => logical1_y_net_x0
  );
  shift_register : entity xil_defaultlib.receiver_shift_register_x0 
  port map (
    data_in => delay1_q_net,
    valid_in => logical_y_net,
    clk_20 => src_clk_net,
    ce_20 => src_ce_net,
    data_out => concat_y_net,
    valid_out => relational_op_net
  );
  counter1 : entity xil_defaultlib.receiver_xlcounter_free 
  generic map (
    core_name0 => "receiver_c_counter_binary_v12_0_i1",
    op_arith => xlUnsigned,
    op_width => 32
  )
  port map (
    clr => '0',
    rst => logical2_y_net_x0,
    en => logical1_y_net_x0,
    clk => src_clk_net,
    ce => src_ce_net,
    op => counter1_op_net
  );
  delay : entity xil_defaultlib.receiver_xldelay 
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
  delay1 : entity xil_defaultlib.receiver_xldelay 
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
  fir_compiler_7_2 : entity xil_defaultlib.xlfir_compiler_c0f9b731039db4a27bce614b597d3b5d 
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
  logical : entity xil_defaultlib.sysgen_logical_613abbe5d0 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => delay_q_net,
    d1 => register1_q_net,
    y => logical_y_net
  );
  logical1 : entity xil_defaultlib.sysgen_logical_4ec3e6b0b2 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => logical2_y_net_x0,
    d1 => logical2_y_net,
    y => logical1_y_net
  );
  register1 : entity xil_defaultlib.receiver_xlregister 
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
  relational1 : entity xil_defaultlib.sysgen_relational_29fc886a67 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    a => fir_compiler_7_2_m_axis_data_tdata_real_net,
    b => threshold_net,
    op => relational1_op_net
  );
  slice : entity xil_defaultlib.receiver_xlslice 
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
-- Generated from Simulink block receiver/Frame Synchronisation/Convert to AXI-Stream
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity receiver_convert_to_axi_stream is
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
end receiver_convert_to_axi_stream;
architecture structural of receiver_convert_to_axi_stream is 
  signal logical2_y_net : std_logic_vector( 1-1 downto 0 );
  signal register6_q_net : std_logic_vector( 8-1 downto 0 );
  signal mux_y_net : std_logic_vector( 8-1 downto 0 );
  signal register5_q_net : std_logic_vector( 8-1 downto 0 );
  signal register3_q_net : std_logic_vector( 1-1 downto 0 );
  signal counter1_op_net : std_logic_vector( 32-1 downto 0 );
  signal relational1_op_net : std_logic_vector( 1-1 downto 0 );
  signal relational_op_net : std_logic_vector( 1-1 downto 0 );
  signal register2_q_net : std_logic_vector( 1-1 downto 0 );
  signal mux1_y_net : std_logic_vector( 1-1 downto 0 );
  signal relational2_op_net : std_logic_vector( 1-1 downto 0 );
  signal relational3_op_net : std_logic_vector( 1-1 downto 0 );
  signal logical_y_net : std_logic_vector( 1-1 downto 0 );
  signal register_q_net : std_logic_vector( 8-1 downto 0 );
  signal counter_op_net : std_logic_vector( 32-1 downto 0 );
  signal constant1_op_net : std_logic_vector( 1-1 downto 0 );
  signal logical1_y_net : std_logic_vector( 1-1 downto 0 );
  signal src_ce_net : std_logic;
  signal src_clk_net : std_logic;
  signal constant_op_net : std_logic_vector( 1-1 downto 0 );
  signal register4_q_net : std_logic_vector( 8-1 downto 0 );
  signal register1_q_net : std_logic_vector( 8-1 downto 0 );
begin
  data_out <= register5_q_net;
  valid_out <= register3_q_net;
  last_out <= logical2_y_net;
  size <= register6_q_net;
  reset <= logical2_y_net;
  mux_y_net <= data_in;
  mux1_y_net <= valid_in;
  src_clk_net <= clk_20;
  src_ce_net <= ce_20;
  constant_x0 : entity xil_defaultlib.sysgen_constant_291ac9f735 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  constant1 : entity xil_defaultlib.sysgen_constant_e1cbbe41f1 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant1_op_net
  );
  counter : entity xil_defaultlib.receiver_xlcounter_free 
  generic map (
    core_name0 => "receiver_c_counter_binary_v12_0_i1",
    op_arith => xlUnsigned,
    op_width => 32
  )
  port map (
    clr => '0',
    rst => logical2_y_net,
    en => mux1_y_net,
    clk => src_clk_net,
    ce => src_ce_net,
    op => counter_op_net
  );
  counter1 : entity xil_defaultlib.receiver_xlcounter_free 
  generic map (
    core_name0 => "receiver_c_counter_binary_v12_0_i1",
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
  logical : entity xil_defaultlib.sysgen_logical_c15cd3714c 
  port map (
    clr => '0',
    d0 => relational2_op_net,
    d1 => register2_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    y => logical_y_net
  );
  logical1 : entity xil_defaultlib.sysgen_logical_613abbe5d0 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => relational_op_net,
    d1 => register2_q_net,
    y => logical1_y_net
  );
  logical2 : entity xil_defaultlib.sysgen_logical_613abbe5d0 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => relational3_op_net,
    d1 => relational1_op_net,
    y => logical2_y_net
  );
  register_x0 : entity xil_defaultlib.receiver_xlregister 
  generic map (
    d_width => 8,
    init_value => b"00000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => mux_y_net,
    clk => src_clk_net,
    ce => src_ce_net,
    q => register_q_net
  );
  register1 : entity xil_defaultlib.receiver_xlregister 
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
  register2 : entity xil_defaultlib.receiver_xlregister 
  generic map (
    d_width => 1,
    init_value => b"0"
  )
  port map (
    en => "1",
    rst => "0",
    d => mux1_y_net,
    clk => src_clk_net,
    ce => src_ce_net,
    q => register2_q_net
  );
  register3 : entity xil_defaultlib.receiver_xlregister 
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
  register4 : entity xil_defaultlib.receiver_xlregister 
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
  register5 : entity xil_defaultlib.receiver_xlregister 
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
  register6 : entity xil_defaultlib.receiver_xlregister 
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
  relational : entity xil_defaultlib.sysgen_relational_2e0904a1c7 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    a => counter_op_net,
    b => constant_op_net,
    op => relational_op_net
  );
  relational1 : entity xil_defaultlib.sysgen_relational_aab3ce74ec 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    a => counter1_op_net,
    b => register1_q_net,
    op => relational1_op_net
  );
  relational2 : entity xil_defaultlib.sysgen_relational_fad5ec3b4f 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    a => counter_op_net,
    b => constant_op_net,
    op => relational2_op_net
  );
  relational3 : entity xil_defaultlib.sysgen_relational_ea187b9a7b 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    a => register1_q_net,
    b => constant1_op_net,
    op => relational3_op_net
  );
end structural;
-- Generated from Simulink block receiver/Frame Synchronisation/QPSK Frame Sync/DQPSK Convert
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity receiver_dqpsk_convert is
  port (
    data_in : in std_logic_vector( 1-1 downto 0 );
    valid_in : in std_logic_vector( 1-1 downto 0 );
    data_out : out std_logic_vector( 2-1 downto 0 )
  );
end receiver_dqpsk_convert;
architecture structural of receiver_dqpsk_convert is 
  signal mux_y_net : std_logic_vector( 2-1 downto 0 );
  signal register3_q_net : std_logic_vector( 1-1 downto 0 );
  signal constant1_op_net : std_logic_vector( 2-1 downto 0 );
  signal constant_op_net : std_logic_vector( 2-1 downto 0 );
  signal register5_q_net : std_logic_vector( 1-1 downto 0 );
begin
  data_out <= mux_y_net;
  register3_q_net <= data_in;
  register5_q_net <= valid_in;
  constant_x0 : entity xil_defaultlib.sysgen_constant_0bd11d8843 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  constant1 : entity xil_defaultlib.sysgen_constant_afb570504f 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant1_op_net
  );
  mux : entity xil_defaultlib.sysgen_mux_e22feec339 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => register3_q_net,
    d0 => constant_op_net,
    d1 => constant1_op_net,
    y => mux_y_net
  );
end structural;
-- Generated from Simulink block receiver/Frame Synchronisation/QPSK Frame Sync/Demodulator1
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity receiver_demodulator1 is
  port (
    iold : in std_logic_vector( 1-1 downto 0 );
    qold : in std_logic_vector( 1-1 downto 0 );
    valid_in : in std_logic_vector( 1-1 downto 0 );
    clk_20 : in std_logic;
    ce_20 : in std_logic;
    inew : out std_logic_vector( 1-1 downto 0 );
    qnew : out std_logic_vector( 1-1 downto 0 );
    valid_out : out std_logic_vector( 1-1 downto 0 )
  );
end receiver_demodulator1;
architecture structural of receiver_demodulator1 is 
  signal mux_y_net : std_logic_vector( 1-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 1-1 downto 0 );
  signal register5_q_net : std_logic_vector( 1-1 downto 0 );
  signal mux1_y_net : std_logic_vector( 1-1 downto 0 );
  signal concat_y_net : std_logic_vector( 2-1 downto 0 );
  signal register2_q_net : std_logic_vector( 1-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal src_ce_net : std_logic;
  signal register1_q_net : std_logic_vector( 1-1 downto 0 );
  signal inverter1_op_net : std_logic_vector( 1-1 downto 0 );
  signal logical1_y_net : std_logic_vector( 1-1 downto 0 );
  signal src_clk_net : std_logic;
  signal register3_q_net : std_logic_vector( 1-1 downto 0 );
  signal register_q_net : std_logic_vector( 1-1 downto 0 );
  signal register4_q_net : std_logic_vector( 1-1 downto 0 );
begin
  inew <= mux_y_net;
  qnew <= mux1_y_net;
  valid_out <= register5_q_net;
  slice_y_net <= iold;
  slice1_y_net <= qold;
  logical1_y_net <= valid_in;
  src_clk_net <= clk_20;
  src_ce_net <= ce_20;
  concat : entity xil_defaultlib.sysgen_concat_804ce16df3 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    in0 => register2_q_net,
    in1 => register3_q_net,
    y => concat_y_net
  );
  inverter : entity xil_defaultlib.sysgen_inverter_d6a105e894 
  port map (
    clr => '0',
    ip => register1_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    op => inverter_op_net
  );
  inverter1 : entity xil_defaultlib.sysgen_inverter_d6a105e894 
  port map (
    clr => '0',
    ip => register_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    op => inverter1_op_net
  );
  mux : entity xil_defaultlib.sysgen_mux_4229a76860 
  port map (
    clr => '0',
    sel => concat_y_net,
    d0 => inverter_op_net,
    d1 => inverter1_op_net,
    d2 => register_q_net,
    d3 => register1_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    y => mux_y_net
  );
  mux1 : entity xil_defaultlib.sysgen_mux_4229a76860 
  port map (
    clr => '0',
    sel => concat_y_net,
    d0 => inverter1_op_net,
    d1 => register1_q_net,
    d2 => inverter_op_net,
    d3 => register_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    y => mux1_y_net
  );
  register_x0 : entity xil_defaultlib.receiver_xlregister 
  generic map (
    d_width => 1,
    init_value => b"0"
  )
  port map (
    rst => "0",
    d => register2_q_net,
    en => register4_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    q => register_q_net
  );
  register1 : entity xil_defaultlib.receiver_xlregister 
  generic map (
    d_width => 1,
    init_value => b"0"
  )
  port map (
    rst => "0",
    d => register3_q_net,
    en => register4_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    q => register1_q_net
  );
  register2 : entity xil_defaultlib.receiver_xlregister 
  generic map (
    d_width => 1,
    init_value => b"0"
  )
  port map (
    rst => "0",
    d => slice1_y_net,
    en => logical1_y_net,
    clk => src_clk_net,
    ce => src_ce_net,
    q => register2_q_net
  );
  register3 : entity xil_defaultlib.receiver_xlregister 
  generic map (
    d_width => 1,
    init_value => b"0"
  )
  port map (
    rst => "0",
    d => slice_y_net,
    en => logical1_y_net,
    clk => src_clk_net,
    ce => src_ce_net,
    q => register3_q_net
  );
  register4 : entity xil_defaultlib.receiver_xlregister 
  generic map (
    d_width => 1,
    init_value => b"0"
  )
  port map (
    en => "1",
    rst => "0",
    d => logical1_y_net,
    clk => src_clk_net,
    ce => src_ce_net,
    q => register4_q_net
  );
  register5 : entity xil_defaultlib.receiver_xlregister 
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
    q => register5_q_net
  );
end structural;
-- Generated from Simulink block receiver/Frame Synchronisation/QPSK Frame Sync/Rising Edge Detector
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity receiver_rising_edge_detector_x0 is
  port (
    input : in std_logic_vector( 1-1 downto 0 );
    clk_20 : in std_logic;
    ce_20 : in std_logic;
    output : out std_logic_vector( 1-1 downto 0 )
  );
end receiver_rising_edge_detector_x0;
architecture structural of receiver_rising_edge_detector_x0 is 
  signal relational1_op_net : std_logic_vector( 1-1 downto 0 );
  signal src_clk_net : std_logic;
  signal logical1_y_net : std_logic_vector( 1-1 downto 0 );
  signal src_ce_net : std_logic;
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal register2_q_net : std_logic_vector( 1-1 downto 0 );
begin
  output <= logical1_y_net;
  relational1_op_net <= input;
  src_clk_net <= clk_20;
  src_ce_net <= ce_20;
  inverter : entity xil_defaultlib.sysgen_inverter_db20653b1e 
  port map (
    clr => '0',
    ip => register2_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    op => inverter_op_net
  );
  logical1 : entity xil_defaultlib.sysgen_logical_613abbe5d0 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => inverter_op_net,
    d1 => relational1_op_net,
    y => logical1_y_net
  );
  register2 : entity xil_defaultlib.receiver_xlregister 
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
-- Generated from Simulink block receiver/Frame Synchronisation/QPSK Frame Sync/Shift Register
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity receiver_shift_register is
  port (
    data_in : in std_logic_vector( 2-1 downto 0 );
    valid_in : in std_logic_vector( 1-1 downto 0 );
    clk_20 : in std_logic;
    ce_20 : in std_logic;
    data_out : out std_logic_vector( 8-1 downto 0 );
    valid_out : out std_logic_vector( 1-1 downto 0 )
  );
end receiver_shift_register;
architecture structural of receiver_shift_register is 
  signal register5_q_net : std_logic_vector( 2-1 downto 0 );
  signal concat_y_net : std_logic_vector( 8-1 downto 0 );
  signal register4_q_net : std_logic_vector( 2-1 downto 0 );
  signal relational_op_net : std_logic_vector( 1-1 downto 0 );
  signal register7_q_net : std_logic_vector( 2-1 downto 0 );
  signal constant_op_net : std_logic_vector( 3-1 downto 0 );
  signal src_ce_net : std_logic;
  signal src_clk_net : std_logic;
  signal counter_op_net : std_logic_vector( 3-1 downto 0 );
  signal delay_q_net : std_logic_vector( 2-1 downto 0 );
  signal register6_q_net : std_logic_vector( 2-1 downto 0 );
  signal logical_y_net : std_logic_vector( 1-1 downto 0 );
begin
  data_out <= concat_y_net;
  valid_out <= relational_op_net;
  delay_q_net <= data_in;
  logical_y_net <= valid_in;
  src_clk_net <= clk_20;
  src_ce_net <= ce_20;
  concat : entity xil_defaultlib.sysgen_concat_2215a67854 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    in0 => register7_q_net,
    in1 => register6_q_net,
    in2 => register5_q_net,
    in3 => register4_q_net,
    y => concat_y_net
  );
  constant_x0 : entity xil_defaultlib.sysgen_constant_5c37b4279b 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  counter : entity xil_defaultlib.receiver_xlcounter_limit 
  generic map (
    cnt_15_0 => 4,
    cnt_31_16 => 0,
    cnt_47_32 => 0,
    cnt_63_48 => 0,
    core_name0 => "receiver_c_counter_binary_v12_0_i3",
    count_limited => 1,
    op_arith => xlUnsigned,
    op_width => 3
  )
  port map (
    clr => '0',
    rst => relational_op_net,
    en => logical_y_net,
    clk => src_clk_net,
    ce => src_ce_net,
    op => counter_op_net
  );
  register4 : entity xil_defaultlib.receiver_xlregister 
  generic map (
    d_width => 2,
    init_value => b"00"
  )
  port map (
    rst => "0",
    d => register5_q_net,
    en => logical_y_net,
    clk => src_clk_net,
    ce => src_ce_net,
    q => register4_q_net
  );
  register5 : entity xil_defaultlib.receiver_xlregister 
  generic map (
    d_width => 2,
    init_value => b"00"
  )
  port map (
    rst => "0",
    d => register6_q_net,
    en => logical_y_net,
    clk => src_clk_net,
    ce => src_ce_net,
    q => register5_q_net
  );
  register6 : entity xil_defaultlib.receiver_xlregister 
  generic map (
    d_width => 2,
    init_value => b"00"
  )
  port map (
    rst => "0",
    d => register7_q_net,
    en => logical_y_net,
    clk => src_clk_net,
    ce => src_ce_net,
    q => register6_q_net
  );
  register7 : entity xil_defaultlib.receiver_xlregister 
  generic map (
    d_width => 2,
    init_value => b"00"
  )
  port map (
    rst => "0",
    d => delay_q_net,
    en => logical_y_net,
    clk => src_clk_net,
    ce => src_ce_net,
    q => register7_q_net
  );
  relational : entity xil_defaultlib.sysgen_relational_eb29c0185b 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    a => counter_op_net,
    b => constant_op_net,
    op => relational_op_net
  );
end structural;
-- Generated from Simulink block receiver/Frame Synchronisation/QPSK Frame Sync
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity receiver_qpsk_frame_sync is
  port (
    threshold : in std_logic_vector( 32-1 downto 0 );
    real : in std_logic_vector( 16-1 downto 0 );
    imag : in std_logic_vector( 16-1 downto 0 );
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
end receiver_qpsk_frame_sync;
architecture structural of receiver_qpsk_frame_sync is 
  signal slice1_y_net : std_logic_vector( 1-1 downto 0 );
  signal convert_dout_net : std_logic_vector( 16-1 downto 0 );
  signal mux_y_net : std_logic_vector( 1-1 downto 0 );
  signal delay_q_net : std_logic_vector( 2-1 downto 0 );
  signal logical_y_net : std_logic_vector( 1-1 downto 0 );
  signal logical1_y_net_x1 : std_logic_vector( 1-1 downto 0 );
  signal register5_q_net_x0 : std_logic_vector( 1-1 downto 0 );
  signal register5_q_net : std_logic_vector( 1-1 downto 0 );
  signal relational1_op_net : std_logic_vector( 1-1 downto 0 );
  signal threshold_net : std_logic_vector( 32-1 downto 0 );
  signal relational_op_net : std_logic_vector( 1-1 downto 0 );
  signal ce_net : std_logic;
  signal mux_y_net_x0 : std_logic_vector( 2-1 downto 0 );
  signal register3_q_net : std_logic_vector( 1-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal src_ce_net : std_logic;
  signal concat_y_net_x0 : std_logic_vector( 8-1 downto 0 );
  signal logical1_y_net : std_logic_vector( 1-1 downto 0 );
  signal logical2_y_net_x1 : std_logic_vector( 1-1 downto 0 );
  signal logical2_y_net : std_logic_vector( 1-1 downto 0 );
  signal counter1_op_net : std_logic_vector( 32-1 downto 0 );
  signal convert1_dout_net : std_logic_vector( 16-1 downto 0 );
  signal clk_net : std_logic;
  signal src_clk_net : std_logic;
  signal mux1_y_net : std_logic_vector( 1-1 downto 0 );
  signal fir_compiler_7_2_2_s_axis_data_tready_net : std_logic;
  signal logical1_y_net_x0 : std_logic_vector( 1-1 downto 0 );
  signal concat_y_net : std_logic_vector( 2-1 downto 0 );
  signal register1_q_net : std_logic_vector( 1-1 downto 0 );
  signal register12_q_net : std_logic_vector( 2-1 downto 0 );
  signal register_q_net : std_logic;
  signal delay1_q_net : std_logic_vector( 1-1 downto 0 );
  signal fir_compiler_7_2_2_m_axis_data_tvalid_net : std_logic;
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal fir_compiler_7_2_2_m_axis_data_tdata_real_net : std_logic_vector( 8-1 downto 0 );
  signal register6_q_net : std_logic_vector( 1-1 downto 0 );
  signal logical2_y_net_x0 : std_logic_vector( 1-1 downto 0 );
  signal mux_y_net_x1 : std_logic_vector( 1-1 downto 0 );
  signal logical3_y_net : std_logic_vector( 1-1 downto 0 );
  signal register4_q_net : std_logic_vector( 1-1 downto 0 );
begin
  data_out <= concat_y_net_x0;
  valid_out <= relational_op_net;
  count <= counter1_op_net;
  threshold_net <= threshold;
  convert1_dout_net <= real;
  convert_dout_net <= imag;
  logical1_y_net <= valid_in;
  logical2_y_net_x1 <= reset_count;
  logical2_y_net <= reset;
  clk_net <= clk_1;
  ce_net <= ce_1;
  src_clk_net <= clk_20;
  src_ce_net <= ce_20;
  dqpsk_convert : entity xil_defaultlib.receiver_dqpsk_convert 
  port map (
    data_in => register3_q_net,
    valid_in => register5_q_net_x0,
    data_out => mux_y_net_x0
  );
  demodulator1 : entity xil_defaultlib.receiver_demodulator1 
  port map (
    iold => slice_y_net,
    qold => slice1_y_net,
    valid_in => logical1_y_net,
    clk_20 => src_clk_net,
    ce_20 => src_ce_net,
    inew => mux_y_net,
    qnew => mux1_y_net,
    valid_out => register5_q_net
  );
  rising_edge_detector_x0 : entity xil_defaultlib.receiver_rising_edge_detector_x0 
  port map (
    input => relational1_op_net,
    clk_20 => src_clk_net,
    ce_20 => src_ce_net,
    output => logical1_y_net_x1
  );
  shift_register : entity xil_defaultlib.receiver_shift_register 
  port map (
    data_in => delay_q_net,
    valid_in => logical_y_net,
    clk_20 => src_clk_net,
    ce_20 => src_ce_net,
    data_out => concat_y_net_x0,
    valid_out => relational_op_net
  );
  concat : entity xil_defaultlib.sysgen_concat_804ce16df3 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    in0 => mux1_y_net,
    in1 => mux_y_net,
    y => concat_y_net
  );
  counter1 : entity xil_defaultlib.receiver_xlcounter_free 
  generic map (
    core_name0 => "receiver_c_counter_binary_v12_0_i1",
    op_arith => xlUnsigned,
    op_width => 32
  )
  port map (
    clr => '0',
    rst => logical2_y_net_x1,
    en => logical1_y_net_x1,
    clk => src_clk_net,
    ce => src_ce_net,
    op => counter1_op_net
  );
  delay : entity xil_defaultlib.receiver_xldelay 
  generic map (
    latency => 2,
    reg_retiming => 0,
    reset => 0,
    width => 2
  )
  port map (
    rst => '0',
    d => register12_q_net,
    en => register_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    q => delay_q_net
  );
  delay1 : entity xil_defaultlib.receiver_xldelay 
  generic map (
    latency => 2,
    reg_retiming => 0,
    reset => 0,
    width => 1
  )
  port map (
    en => '1',
    rst => '0',
    d(0) => register_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    q => delay1_q_net
  );
  fir_compiler_7_2_2 : entity xil_defaultlib.xlfir_compiler_c0f9b731039db4a27bce614b597d3b5d 
  port map (
    s_axis_data_tdata_real => mux_y_net_x0,
    en => register5_q_net_x0(0),
    src_clk => src_clk_net,
    src_ce => src_ce_net,
    clk => clk_net,
    ce => ce_net,
    clk_20 => src_clk_net,
    ce_20 => src_ce_net,
    clk_logic_20 => src_clk_net,
    ce_logic_20 => src_ce_net,
    s_axis_data_tready => fir_compiler_7_2_2_s_axis_data_tready_net,
    m_axis_data_tvalid => fir_compiler_7_2_2_m_axis_data_tvalid_net,
    m_axis_data_tdata_real => fir_compiler_7_2_2_m_axis_data_tdata_real_net
  );
  inverter : entity xil_defaultlib.sysgen_inverter_db20653b1e 
  port map (
    clr => '0',
    ip => register5_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    op => inverter_op_net
  );
  logical : entity xil_defaultlib.sysgen_logical_613abbe5d0 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => delay1_q_net,
    d1 => register1_q_net,
    y => logical_y_net
  );
  logical1 : entity xil_defaultlib.sysgen_logical_4ec3e6b0b2 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => logical2_y_net_x1,
    d1 => logical2_y_net,
    y => logical1_y_net_x0
  );
  logical2 : entity xil_defaultlib.sysgen_logical_4ec3e6b0b2 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => register6_q_net,
    d1 => register5_q_net,
    y => logical2_y_net_x0
  );
  logical3 : entity xil_defaultlib.sysgen_logical_613abbe5d0 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => inverter_op_net,
    d1 => register6_q_net,
    y => logical3_y_net
  );
  mux : entity xil_defaultlib.sysgen_mux_ea8d291d2e 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => logical3_y_net,
    d0 => mux_y_net,
    d1 => register4_q_net,
    y => mux_y_net_x1
  );
  register_x0 : entity xil_defaultlib.receiver_xlregister 
  generic map (
    d_width => 1,
    init_value => b"0"
  )
  port map (
    en => "1",
    rst => "0",
    d => register5_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    q(0) => register_q_net
  );
  register1 : entity xil_defaultlib.receiver_xlregister 
  generic map (
    d_width => 1,
    init_value => b"0"
  )
  port map (
    d => logical1_y_net_x1,
    rst => logical1_y_net_x0,
    en => logical1_y_net_x1,
    clk => src_clk_net,
    ce => src_ce_net,
    q => register1_q_net
  );
  register12 : entity xil_defaultlib.receiver_xlregister 
  generic map (
    d_width => 2,
    init_value => b"00"
  )
  port map (
    en => "1",
    rst => "0",
    d => concat_y_net,
    clk => src_clk_net,
    ce => src_ce_net,
    q => register12_q_net
  );
  register3 : entity xil_defaultlib.receiver_xlregister 
  generic map (
    d_width => 1,
    init_value => b"0"
  )
  port map (
    rst => "0",
    d => mux_y_net_x1,
    en => logical2_y_net_x0,
    clk => src_clk_net,
    ce => src_ce_net,
    q => register3_q_net
  );
  register4 : entity xil_defaultlib.receiver_xlregister 
  generic map (
    d_width => 1,
    init_value => b"0"
  )
  port map (
    rst => "0",
    d => mux1_y_net,
    en => register5_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    q => register4_q_net
  );
  register5 : entity xil_defaultlib.receiver_xlregister 
  generic map (
    d_width => 1,
    init_value => b"0"
  )
  port map (
    en => "1",
    rst => "0",
    d => logical2_y_net_x0,
    clk => src_clk_net,
    ce => src_ce_net,
    q => register5_q_net_x0
  );
  register6 : entity xil_defaultlib.receiver_xlregister 
  generic map (
    d_width => 1,
    init_value => b"0"
  )
  port map (
    en => "1",
    rst => "0",
    d => register5_q_net,
    clk => src_clk_net,
    ce => src_ce_net,
    q => register6_q_net
  );
  relational1 : entity xil_defaultlib.sysgen_relational_29fc886a67 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    a => fir_compiler_7_2_2_m_axis_data_tdata_real_net,
    b => threshold_net,
    op => relational1_op_net
  );
  slice : entity xil_defaultlib.receiver_xlslice 
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
  slice1 : entity xil_defaultlib.receiver_xlslice 
  generic map (
    new_lsb => 15,
    new_msb => 15,
    x_width => 16,
    y_width => 1
  )
  port map (
    x => convert_dout_net,
    y => slice1_y_net
  );
end structural;
-- Generated from Simulink block receiver/Frame Synchronisation
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity receiver_frame_synchronisation is
  port (
    modulation : in std_logic_vector( 1-1 downto 0 );
    reset : in std_logic_vector( 1-1 downto 0 );
    threshold : in std_logic_vector( 32-1 downto 0 );
    valid_in : in std_logic_vector( 1-1 downto 0 );
    real_in : in std_logic_vector( 16-1 downto 0 );
    imag_out : in std_logic_vector( 16-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    clk_20 : in std_logic;
    ce_20 : in std_logic;
    valid_out : out std_logic_vector( 1-1 downto 0 );
    data_out : out std_logic_vector( 8-1 downto 0 );
    last_out : out std_logic_vector( 1-1 downto 0 );
    size : out std_logic_vector( 8-1 downto 0 );
    qpsk_count : out std_logic_vector( 32-1 downto 0 );
    bpsk_count : out std_logic_vector( 32-1 downto 0 )
  );
end receiver_frame_synchronisation;
architecture structural of receiver_frame_synchronisation is 
  signal relational_op_net_x0 : std_logic_vector( 1-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal register4_q_net : std_logic_vector( 1-1 downto 0 );
  signal register3_q_net : std_logic_vector( 1-1 downto 0 );
  signal src_ce_net : std_logic;
  signal convert1_dout_net : std_logic_vector( 16-1 downto 0 );
  signal counter1_op_net_x0 : std_logic_vector( 32-1 downto 0 );
  signal convert_dout_net : std_logic_vector( 16-1 downto 0 );
  signal mux_y_net : std_logic_vector( 8-1 downto 0 );
  signal threshold_net : std_logic_vector( 32-1 downto 0 );
  signal logical2_y_net_x0 : std_logic_vector( 1-1 downto 0 );
  signal mux1_y_net : std_logic_vector( 1-1 downto 0 );
  signal modulation_net : std_logic_vector( 1-1 downto 0 );
  signal concat_y_net_x0 : std_logic_vector( 8-1 downto 0 );
  signal relational_op_net : std_logic_vector( 1-1 downto 0 );
  signal logical_y_net : std_logic_vector( 1-1 downto 0 );
  signal src_clk_net : std_logic;
  signal clk_net : std_logic;
  signal concat_y_net : std_logic_vector( 8-1 downto 0 );
  signal logical1_y_net : std_logic_vector( 1-1 downto 0 );
  signal register6_q_net : std_logic_vector( 8-1 downto 0 );
  signal register5_q_net : std_logic_vector( 8-1 downto 0 );
  signal logical2_y_net : std_logic_vector( 1-1 downto 0 );
  signal counter1_op_net : std_logic_vector( 32-1 downto 0 );
  signal ce_net : std_logic;
begin
  valid_out <= register3_q_net;
  data_out <= register5_q_net;
  last_out <= logical2_y_net;
  size <= register6_q_net;
  qpsk_count <= counter1_op_net;
  bpsk_count <= counter1_op_net_x0;
  modulation_net <= modulation;
  logical2_y_net_x0 <= reset;
  threshold_net <= threshold;
  register4_q_net <= valid_in;
  convert1_dout_net <= real_in;
  convert_dout_net <= imag_out;
  clk_net <= clk_1;
  ce_net <= ce_1;
  src_clk_net <= clk_20;
  src_ce_net <= ce_20;
  bpsk_frame_sync : entity xil_defaultlib.receiver_bpsk_frame_sync 
  port map (
    threshold => threshold_net,
    data_in => convert1_dout_net,
    valid_in => logical_y_net,
    reset_count => logical2_y_net_x0,
    reset => logical2_y_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    clk_20 => src_clk_net,
    ce_20 => src_ce_net,
    data_out => concat_y_net_x0,
    valid_out => relational_op_net,
    count => counter1_op_net_x0
  );
  convert_to_axi_stream : entity xil_defaultlib.receiver_convert_to_axi_stream 
  port map (
    data_in => mux_y_net,
    valid_in => mux1_y_net,
    clk_20 => src_clk_net,
    ce_20 => src_ce_net,
    data_out => register5_q_net,
    valid_out => register3_q_net,
    last_out => logical2_y_net,
    size => register6_q_net,
    reset => logical2_y_net
  );
  qpsk_frame_sync : entity xil_defaultlib.receiver_qpsk_frame_sync 
  port map (
    threshold => threshold_net,
    real => convert1_dout_net,
    imag => convert_dout_net,
    valid_in => logical1_y_net,
    reset_count => logical2_y_net_x0,
    reset => logical2_y_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    clk_20 => src_clk_net,
    ce_20 => src_ce_net,
    data_out => concat_y_net,
    valid_out => relational_op_net_x0,
    count => counter1_op_net
  );
  inverter : entity xil_defaultlib.sysgen_inverter_db20653b1e 
  port map (
    clr => '0',
    ip => modulation_net,
    clk => src_clk_net,
    ce => src_ce_net,
    op => inverter_op_net
  );
  logical : entity xil_defaultlib.sysgen_logical_613abbe5d0 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => inverter_op_net,
    d1 => register4_q_net,
    y => logical_y_net
  );
  logical1 : entity xil_defaultlib.sysgen_logical_613abbe5d0 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => modulation_net,
    d1 => register4_q_net,
    y => logical1_y_net
  );
  mux : entity xil_defaultlib.sysgen_mux_75af721bdf 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => modulation_net,
    d0 => concat_y_net_x0,
    d1 => concat_y_net,
    y => mux_y_net
  );
  mux1 : entity xil_defaultlib.sysgen_mux_bc369b4d1c 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => modulation_net,
    d0 => relational_op_net,
    d1 => relational_op_net_x0,
    y => mux1_y_net
  );
end structural;
-- Generated from Simulink block receiver/Observation Point
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity receiver_observation_point is
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
end receiver_observation_point;
architecture structural of receiver_observation_point is 
  signal clk_5_net : std_logic;
  signal convert1_dout_net : std_logic_vector( 16-1 downto 0 );
  signal convert_dout_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal ce_5_net : std_logic;
  signal src_clk_net : std_logic;
  signal delay1_q_net : std_logic_vector( 16-1 downto 0 );
  signal observation_point_net : std_logic_vector( 32-1 downto 0 );
  signal src_ce_net : std_logic;
  signal clk_net : std_logic;
  signal delay2_q_net : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net : std_logic;
  signal concat_y_net : std_logic_vector( 32-1 downto 0 );
  signal delay3_q_net_x0 : std_logic_vector( 1-1 downto 0 );
  signal mux_valid_y_net : std_logic_vector( 1-1 downto 0 );
  signal delay3_q_net : std_logic_vector( 1-1 downto 0 );
  signal convert1_dout_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal ce_net : std_logic;
  signal cmult2_p_net : std_logic_vector( 16-1 downto 0 );
  signal mux2_y_net : std_logic_vector( 16-1 downto 0 );
  signal convert_dout_net : std_logic_vector( 16-1 downto 0 );
  signal mux1_y_net : std_logic_vector( 16-1 downto 0 );
  signal register4_q_net : std_logic_vector( 1-1 downto 0 );
  signal cmult1_p_net : std_logic_vector( 16-1 downto 0 );
  signal cic_decimator_real_m_axis_data_tvalid_net : std_logic;
  signal up_sample14_q_net : std_logic_vector( 16-1 downto 0 );
  signal up_sample9_q_net : std_logic_vector( 1-1 downto 0 );
  signal up_sample15_q_net : std_logic_vector( 1-1 downto 0 );
  signal up_sample2_q_net : std_logic_vector( 16-1 downto 0 );
  signal up_sample5_q_net : std_logic_vector( 16-1 downto 0 );
  signal up_sample1_q_net : std_logic_vector( 16-1 downto 0 );
  signal up_sample3_q_net : std_logic_vector( 16-1 downto 0 );
  signal up_sample13_q_net : std_logic_vector( 16-1 downto 0 );
  signal up_sample11_q_net : std_logic_vector( 1-1 downto 0 );
  signal up_sample6_q_net : std_logic_vector( 16-1 downto 0 );
  signal up_sample10_q_net : std_logic_vector( 1-1 downto 0 );
  signal reinterpret1_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal mux_im_y_net : std_logic_vector( 16-1 downto 0 );
  signal up_sample12_q_net : std_logic_vector( 1-1 downto 0 );
  signal up_sample7_q_net : std_logic_vector( 16-1 downto 0 );
  signal mux_re_y_net : std_logic_vector( 16-1 downto 0 );
  signal slice_y_net : std_logic_vector( 3-1 downto 0 );
  signal reinterpret_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal up_sample4_q_net : std_logic_vector( 16-1 downto 0 );
  signal up_sample8_q_net : std_logic_vector( 16-1 downto 0 );
begin
  delay3_q_net_x0 <= valid_b;
  cic_decimator_real_m_axis_data_tvalid_net <= valid_e;
  delay3_q_net <= valid_d;
  fir_compiler_7_2_m_axis_data_tvalid_net <= valid_c;
  delay1_q_net <= real_b;
  cmult2_p_net <= real_e;
  mux1_y_net <= real_d;
  convert_dout_net_x0 <= real_c;
  register4_q_net <= valid_a;
  delay2_q_net <= imag_b;
  cmult1_p_net <= imag_e;
  mux2_y_net <= imag_d;
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
  concat : entity xil_defaultlib.sysgen_concat_4821ac8bad 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    in0 => reinterpret1_output_port_net,
    in1 => reinterpret_output_port_net,
    y => concat_y_net
  );
  mux_im : entity xil_defaultlib.sysgen_mux_acb687e974 
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
  mux_re : entity xil_defaultlib.sysgen_mux_acb687e974 
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
  mux_valid : entity xil_defaultlib.sysgen_mux_d0fe2bb2f7 
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
  reinterpret : entity xil_defaultlib.sysgen_reinterpret_3904df080b 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => mux_re_y_net,
    output_port => reinterpret_output_port_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_3904df080b 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => mux_im_y_net,
    output_port => reinterpret1_output_port_net
  );
  slice : entity xil_defaultlib.receiver_xlslice 
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
  up_sample1 : entity xil_defaultlib.receiver_xlusamp 
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
  up_sample10 : entity xil_defaultlib.receiver_xlusamp 
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
    d => delay3_q_net_x0,
    src_clk => src_clk_net,
    src_ce => src_ce_net,
    dest_clk => clk_net,
    dest_ce => ce_net,
    q => up_sample10_q_net
  );
  up_sample11 : entity xil_defaultlib.receiver_xlusamp 
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
  up_sample12 : entity xil_defaultlib.receiver_xlusamp 
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
    src_clk => clk_5_net,
    src_ce => ce_5_net,
    dest_clk => clk_net,
    dest_ce => ce_net,
    q => up_sample12_q_net
  );
  up_sample13 : entity xil_defaultlib.receiver_xlusamp 
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
  up_sample14 : entity xil_defaultlib.receiver_xlusamp 
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
  up_sample15 : entity xil_defaultlib.receiver_xlusamp 
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
  up_sample2 : entity xil_defaultlib.receiver_xlusamp 
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
  up_sample3 : entity xil_defaultlib.receiver_xlusamp 
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
  up_sample4 : entity xil_defaultlib.receiver_xlusamp 
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
  up_sample5 : entity xil_defaultlib.receiver_xlusamp 
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
  up_sample6 : entity xil_defaultlib.receiver_xlusamp 
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
  up_sample7 : entity xil_defaultlib.receiver_xlusamp 
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
    d => mux2_y_net,
    src_clk => clk_5_net,
    src_ce => ce_5_net,
    dest_clk => clk_net,
    dest_ce => ce_net,
    q => up_sample7_q_net
  );
  up_sample8 : entity xil_defaultlib.receiver_xlusamp 
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
  up_sample9 : entity xil_defaultlib.receiver_xlusamp 
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
end structural;
-- Generated from Simulink block receiver/RRC Receive Filter
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity receiver_rrc_receive_filter is
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
end receiver_rrc_receive_filter;
architecture structural of receiver_rrc_receive_filter is 
  signal mux2_y_net : std_logic_vector( 16-1 downto 0 );
  signal ce_net : std_logic;
  signal clk_5_net : std_logic;
  signal convert_dout_net : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tdata_path1_net : std_logic_vector( 33-1 downto 0 );
  signal ce_5_net : std_logic;
  signal src_clk_net : std_logic;
  signal convert1_dout_net : std_logic_vector( 16-1 downto 0 );
  signal mux1_y_net : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tdata_path0_net : std_logic_vector( 33-1 downto 0 );
  signal src_ce_net : std_logic;
  signal fir_compiler_7_2_m_axis_data_tvalid_net : std_logic;
  signal delay3_q_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal fir_compiler_7_2_s_axis_data_tready_net : std_logic;
begin
  valid_out <= fir_compiler_7_2_m_axis_data_tvalid_net;
  real_out <= convert_dout_net;
  imag_out <= convert1_dout_net;
  delay3_q_net <= valid_in;
  mux1_y_net <= real_in;
  mux2_y_net <= imag_in;
  clk_net <= clk_1;
  ce_net <= ce_1;
  clk_5_net <= clk_5;
  ce_5_net <= ce_5;
  src_clk_net <= clk_20;
  src_ce_net <= ce_20;
  convert : entity xil_defaultlib.receiver_xlconvert 
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
  convert1 : entity xil_defaultlib.receiver_xlconvert 
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
  fir_compiler_7_2 : entity xil_defaultlib.xlfir_compiler_01ac81c7a29be7199debebe97d3ee909 
  port map (
    s_axis_data_tdata_path1 => mux1_y_net,
    s_axis_data_tdata_path0 => mux2_y_net,
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
-- Generated from Simulink block receiver/Reset Subsystem
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity receiver_reset_subsystem is
  port (
    global_reset : in std_logic_vector( 1-1 downto 0 );
    time_reset_in : in std_logic_vector( 1-1 downto 0 );
    phase_reset_in : in std_logic_vector( 1-1 downto 0 );
    frame_reset_in : in std_logic_vector( 1-1 downto 0 );
    modulation : in std_logic_vector( 1-1 downto 0 );
    clk_20 : in std_logic;
    ce_20 : in std_logic;
    time_reset_out : out std_logic_vector( 1-1 downto 0 );
    phase_reset_out : out std_logic_vector( 1-1 downto 0 );
    frame_reset_out : out std_logic_vector( 1-1 downto 0 )
  );
end receiver_reset_subsystem;
architecture structural of receiver_reset_subsystem is 
  signal global_reset_sync_net : std_logic_vector( 1-1 downto 0 );
  signal src_clk_net : std_logic;
  signal logical4_y_net : std_logic_vector( 1-1 downto 0 );
  signal logical3_y_net : std_logic_vector( 1-1 downto 0 );
  signal logical2_y_net : std_logic_vector( 1-1 downto 0 );
  signal reset_phase_sync_net : std_logic_vector( 1-1 downto 0 );
  signal reset_frame_sync_net : std_logic_vector( 1-1 downto 0 );
  signal modulation_net : std_logic_vector( 1-1 downto 0 );
  signal logical1_y_net : std_logic_vector( 1-1 downto 0 );
  signal reset_time_sync_net : std_logic_vector( 1-1 downto 0 );
  signal register_q_net : std_logic_vector( 1-1 downto 0 );
  signal logical_y_net : std_logic_vector( 1-1 downto 0 );
  signal src_ce_net : std_logic;
begin
  time_reset_out <= logical_y_net;
  phase_reset_out <= logical1_y_net;
  frame_reset_out <= logical2_y_net;
  global_reset_sync_net <= global_reset;
  reset_time_sync_net <= time_reset_in;
  reset_phase_sync_net <= phase_reset_in;
  reset_frame_sync_net <= frame_reset_in;
  modulation_net <= modulation;
  src_clk_net <= clk_20;
  src_ce_net <= ce_20;
  logical : entity xil_defaultlib.sysgen_logical_4ec3e6b0b2 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => logical4_y_net,
    d1 => reset_time_sync_net,
    y => logical_y_net
  );
  logical1 : entity xil_defaultlib.sysgen_logical_4ec3e6b0b2 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => logical4_y_net,
    d1 => reset_phase_sync_net,
    y => logical1_y_net
  );
  logical2 : entity xil_defaultlib.sysgen_logical_4ec3e6b0b2 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => logical4_y_net,
    d1 => reset_frame_sync_net,
    y => logical2_y_net
  );
  logical3 : entity xil_defaultlib.sysgen_logical_e706ee99ae 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => modulation_net,
    d1 => register_q_net,
    y => logical3_y_net
  );
  logical4 : entity xil_defaultlib.sysgen_logical_4ec3e6b0b2 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => global_reset_sync_net,
    d1 => logical3_y_net,
    y => logical4_y_net
  );
  register_x0 : entity xil_defaultlib.receiver_xlregister 
  generic map (
    d_width => 1,
    init_value => b"0"
  )
  port map (
    en => "1",
    rst => "0",
    d => modulation_net,
    clk => src_clk_net,
    ce => src_ce_net,
    q => register_q_net
  );
end structural;
-- Generated from Simulink block receiver/SSR Halfband Lowpass Decimator/Vector FIR Im
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity receiver_vector_fir_im is
  port (
    tvi : in std_logic_vector( 1-1 downto 0 );
    tdi_1 : in std_logic_vector( 16-1 downto 0 );
    tdi_2 : in std_logic_vector( 16-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    tdo : out std_logic_vector( 31-1 downto 0 )
  );
end receiver_vector_fir_im;
architecture structural of receiver_vector_fir_im is 
  signal ce_net : std_logic;
  signal fir_compiler_7_2_m_axis_data_tdata_real_net : std_logic_vector( 31-1 downto 0 );
  signal s_axis_tvalid_re_net : std_logic_vector( 1-1 downto 0 );
  signal reinterpret0_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal clk_net : std_logic;
  signal fir_compiler_7_2_s_axis_data_tready_net : std_logic;
  signal fir_compiler_7_2_m_axis_data_tvalid_net : std_logic;
  signal reinterpret1_output_port_net : std_logic_vector( 16-1 downto 0 );
begin
  tdo <= fir_compiler_7_2_m_axis_data_tdata_real_net;
  s_axis_tvalid_re_net <= tvi;
  reinterpret0_output_port_net <= tdi_1;
  reinterpret1_output_port_net <= tdi_2;
  clk_net <= clk_1;
  ce_net <= ce_1;
  fir_compiler_7_2 : entity xil_defaultlib.xlfir_compiler_382353bead95e3b6b04a686443161e02 
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
-- Generated from Simulink block receiver/SSR Halfband Lowpass Decimator/Vector FIR Re
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity receiver_vector_fir_re is
  port (
    tvi : in std_logic_vector( 1-1 downto 0 );
    tdi_1 : in std_logic_vector( 16-1 downto 0 );
    tdi_2 : in std_logic_vector( 16-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    trdyo : out std_logic;
    tdo : out std_logic_vector( 31-1 downto 0 )
  );
end receiver_vector_fir_re;
architecture structural of receiver_vector_fir_re is 
  signal ce_net : std_logic;
  signal fir_compiler_7_2_m_axis_data_tdata_real_net : std_logic_vector( 31-1 downto 0 );
  signal s_axis_tvalid_re_net : std_logic_vector( 1-1 downto 0 );
  signal reinterpret0_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal clk_net : std_logic;
  signal fir_compiler_7_2_m_axis_data_tvalid_net : std_logic;
  signal fir_compiler_7_2_s_axis_data_tready_net : std_logic;
  signal reinterpret1_output_port_net : std_logic_vector( 16-1 downto 0 );
begin
  trdyo <= fir_compiler_7_2_s_axis_data_tready_net;
  tdo <= fir_compiler_7_2_m_axis_data_tdata_real_net;
  s_axis_tvalid_re_net <= tvi;
  reinterpret0_output_port_net <= tdi_1;
  reinterpret1_output_port_net <= tdi_2;
  clk_net <= clk_1;
  ce_net <= ce_1;
  fir_compiler_7_2 : entity xil_defaultlib.xlfir_compiler_382353bead95e3b6b04a686443161e02 
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
-- Generated from Simulink block receiver/SSR Halfband Lowpass Decimator
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity receiver_ssr_halfband_lowpass_decimator is
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
end receiver_ssr_halfband_lowpass_decimator;
architecture structural of receiver_ssr_halfband_lowpass_decimator is 
  signal convert_dout_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret0_output_port_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal reinterpret0_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal convert1_dout_net : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_s_axis_data_tready_net : std_logic;
  signal s_axis_tvalid_re_net : std_logic_vector( 1-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tdata_real_net : std_logic_vector( 31-1 downto 0 );
  signal ce_net : std_logic;
  signal fir_compiler_7_2_m_axis_data_tdata_real_net_x0 : std_logic_vector( 31-1 downto 0 );
  signal reinterpret1_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret1_output_port_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal clk_net : std_logic;
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
  vector_fir_im : entity xil_defaultlib.receiver_vector_fir_im 
  port map (
    tvi => s_axis_tvalid_re_net,
    tdi_1 => reinterpret0_output_port_net,
    tdi_2 => reinterpret1_output_port_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    tdo => fir_compiler_7_2_m_axis_data_tdata_real_net_x0
  );
  vector_fir_re : entity xil_defaultlib.receiver_vector_fir_re 
  port map (
    tvi => s_axis_tvalid_re_net,
    tdi_1 => reinterpret0_output_port_net_x0,
    tdi_2 => reinterpret1_output_port_net_x0,
    clk_1 => clk_net,
    ce_1 => ce_net,
    trdyo => fir_compiler_7_2_s_axis_data_tready_net,
    tdo => fir_compiler_7_2_m_axis_data_tdata_real_net
  );
  convert : entity xil_defaultlib.receiver_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 28,
    din_width => 31,
    dout_arith => 2,
    dout_bin_pt => 14,
    dout_width => 16,
    latency => 0,
    overflow => xlSaturate,
    quantization => xlRound
  )
  port map (
    clr => '0',
    en => "1",
    din => fir_compiler_7_2_m_axis_data_tdata_real_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert_dout_net
  );
  convert1 : entity xil_defaultlib.receiver_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 28,
    din_width => 31,
    dout_arith => 2,
    dout_bin_pt => 14,
    dout_width => 16,
    latency => 0,
    overflow => xlSaturate,
    quantization => xlRound
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
-- Generated from Simulink block receiver/Time Synchronisation/Loop Filter
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity receiver_loop_filter_x0 is
  port (
    real_in : in std_logic_vector( 16-1 downto 0 );
    imag_in : in std_logic_vector( 16-1 downto 0 );
    signal_in : in std_logic_vector( 32-1 downto 0 );
    valid_in : in std_logic_vector( 1-1 downto 0 );
    reset : in std_logic_vector( 1-1 downto 0 );
    clk_20 : in std_logic;
    ce_20 : in std_logic;
    real_out : out std_logic_vector( 16-1 downto 0 );
    imag_out : out std_logic_vector( 16-1 downto 0 );
    valid_out : out std_logic_vector( 1-1 downto 0 );
    error_out : out std_logic_vector( 64-1 downto 0 )
  );
end receiver_loop_filter_x0;
architecture structural of receiver_loop_filter_x0 is 
  signal delay2_q_net : std_logic_vector( 16-1 downto 0 );
  signal src_clk_net : std_logic;
  signal addsub_s_net : std_logic_vector( 64-1 downto 0 );
  signal k1_gain_p_net : std_logic_vector( 64-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 16-1 downto 0 );
  signal relational_op_net : std_logic_vector( 1-1 downto 0 );
  signal src_ce_net : std_logic;
  signal k2_gain_p_net : std_logic_vector( 64-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 32-1 downto 0 );
  signal register_q_net : std_logic_vector( 64-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 64-1 downto 0 );
  signal logical_y_net : std_logic_vector( 1-1 downto 0 );
  signal delay3_q_net : std_logic_vector( 1-1 downto 0 );
  signal convert_dout_net : std_logic_vector( 16-1 downto 0 );
  signal convert1_dout_net : std_logic_vector( 16-1 downto 0 );
  signal register1_q_net : std_logic_vector( 32-1 downto 0 );
begin
  real_out <= delay1_q_net;
  imag_out <= delay2_q_net;
  valid_out <= delay3_q_net;
  error_out <= addsub1_s_net;
  convert_dout_net <= real_in;
  convert1_dout_net <= imag_in;
  addsub2_s_net <= signal_in;
  relational_op_net <= valid_in;
  logical_y_net <= reset;
  src_clk_net <= clk_20;
  src_ce_net <= ce_20;
  addsub : entity xil_defaultlib.receiver_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 60,
    a_width => 64,
    b_arith => xlSigned,
    b_bin_pt => 60,
    b_width => 64,
    c_has_c_out => 0,
    c_latency => 0,
    c_output_width => 65,
    core_name0 => "receiver_c_addsub_v12_0_i5",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 65,
    latency => 0,
    overflow => 2,
    quantization => 1,
    s_arith => xlSigned,
    s_bin_pt => 60,
    s_width => 64
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
  addsub1 : entity xil_defaultlib.receiver_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 60,
    a_width => 64,
    b_arith => xlSigned,
    b_bin_pt => 60,
    b_width => 64,
    c_has_c_out => 0,
    c_latency => 0,
    c_output_width => 65,
    core_name0 => "receiver_c_addsub_v12_0_i5",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 65,
    latency => 0,
    overflow => 2,
    quantization => 1,
    s_arith => xlSigned,
    s_bin_pt => 60,
    s_width => 64
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
  delay1 : entity xil_defaultlib.receiver_xldelay 
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
  delay2 : entity xil_defaultlib.receiver_xldelay 
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
  delay3 : entity xil_defaultlib.receiver_xldelay 
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
  k1_gain : entity xil_defaultlib.receiver_xlcmult 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 30,
    a_width => 32,
    b_bin_pt => 30,
    c_a_type => 0,
    c_a_width => 32,
    c_b_type => 1,
    c_b_width => 32,
    c_output_width => 64,
    core_name0 => "receiver_mult_gen_v12_0_i6",
    extra_registers => 0,
    multsign => 2,
    overflow => 1,
    p_arith => xlSigned,
    p_bin_pt => 60,
    p_width => 64,
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
  k2_gain : entity xil_defaultlib.receiver_xlcmult 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 30,
    a_width => 32,
    b_bin_pt => 30,
    c_a_type => 0,
    c_a_width => 32,
    c_b_type => 1,
    c_b_width => 32,
    c_output_width => 64,
    core_name0 => "receiver_mult_gen_v12_0_i7",
    extra_registers => 0,
    multsign => 2,
    overflow => 1,
    p_arith => xlSigned,
    p_bin_pt => 60,
    p_width => 64,
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
  register_x0 : entity xil_defaultlib.receiver_xlregister 
  generic map (
    d_width => 64,
    init_value => b"0000000000000000000000000000000000000000000000000000000000000000"
  )
  port map (
    d => addsub_s_net,
    rst => logical_y_net,
    en => relational_op_net,
    clk => src_clk_net,
    ce => src_ce_net,
    q => register_q_net
  );
  register1 : entity xil_defaultlib.receiver_xlregister 
  generic map (
    d_width => 32,
    init_value => b"00000000000000000000000000000000"
  )
  port map (
    d => addsub2_s_net,
    rst => logical_y_net,
    en => relational_op_net,
    clk => src_clk_net,
    ce => src_ce_net,
    q => register1_q_net
  );
end structural;
-- Generated from Simulink block receiver/Time Synchronisation/NCC
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity receiver_ncc is
  port (
    error : in std_logic_vector( 64-1 downto 0 );
    clk_20 : in std_logic;
    ce_20 : in std_logic;
    strobe : out std_logic_vector( 1-1 downto 0 )
  );
end receiver_ncc;
architecture structural of receiver_ncc is 
  signal relational_op_net : std_logic_vector( 1-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 64-1 downto 0 );
  signal src_ce_net : std_logic;
  signal src_clk_net : std_logic;
  signal mux_y_net : std_logic_vector( 65-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 64-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 64-1 downto 0 );
  signal constant1_op_net : std_logic_vector( 6-1 downto 0 );
  signal relational1_op_net : std_logic_vector( 1-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 64-1 downto 0 );
  signal register_q_net : std_logic_vector( 64-1 downto 0 );
  signal constant_op_net : std_logic_vector( 1-1 downto 0 );
begin
  strobe <= relational_op_net;
  addsub1_s_net_x0 <= error;
  src_clk_net <= clk_20;
  src_ce_net <= ce_20;
  addsub : entity xil_defaultlib.receiver_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 58,
    a_width => 65,
    b_arith => xlSigned,
    b_bin_pt => 58,
    b_width => 64,
    c_has_c_out => 0,
    c_latency => 0,
    c_output_width => 66,
    core_name0 => "receiver_c_addsub_v12_0_i6",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 66,
    latency => 0,
    overflow => 1,
    quantization => 1,
    s_arith => xlUnsigned,
    s_bin_pt => 58,
    s_width => 64
  )
  port map (
    clr => '0',
    en => "1",
    a => mux_y_net,
    b => addsub1_s_net,
    clk => src_clk_net,
    ce => src_ce_net,
    s => addsub_s_net
  );
  addsub1 : entity xil_defaultlib.receiver_xladdsub 
  generic map (
    a_arith => xlUnsigned,
    a_bin_pt => 0,
    a_width => 1,
    b_arith => xlSigned,
    b_bin_pt => 60,
    b_width => 64,
    c_has_c_out => 0,
    c_latency => 0,
    c_output_width => 65,
    core_name0 => "receiver_c_addsub_v12_0_i5",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 65,
    latency => 0,
    overflow => 2,
    quantization => 1,
    s_arith => xlSigned,
    s_bin_pt => 58,
    s_width => 64
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
  addsub2 : entity xil_defaultlib.receiver_xladdsub 
  generic map (
    a_arith => xlUnsigned,
    a_bin_pt => 58,
    a_width => 64,
    b_arith => xlUnsigned,
    b_bin_pt => 0,
    b_width => 6,
    c_has_c_out => 0,
    c_latency => 0,
    c_output_width => 65,
    core_name0 => "receiver_c_addsub_v12_0_i7",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 65,
    latency => 0,
    overflow => 3,
    quantization => 1,
    s_arith => xlSigned,
    s_bin_pt => 58,
    s_width => 64
  )
  port map (
    clr => '0',
    en => "1",
    a => register_q_net,
    b => constant1_op_net,
    clk => src_clk_net,
    ce => src_ce_net,
    s => addsub2_s_net
  );
  constant_x0 : entity xil_defaultlib.sysgen_constant_291ac9f735 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  constant1 : entity xil_defaultlib.sysgen_constant_e6a76abd1d 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant1_op_net
  );
  mux : entity xil_defaultlib.sysgen_mux_4d2e5ff3e1 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => relational1_op_net,
    d0 => register_q_net,
    d1 => addsub2_s_net,
    y => mux_y_net
  );
  register_x0 : entity xil_defaultlib.receiver_xlregister 
  generic map (
    d_width => 64,
    init_value => b"0000000000000000000000000000000000000000000000000000000000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => addsub_s_net,
    clk => src_clk_net,
    ce => src_ce_net,
    q => register_q_net
  );
  relational : entity xil_defaultlib.sysgen_relational_0eaff1ae01 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    a => register_q_net,
    b => addsub_s_net,
    op => relational_op_net
  );
  relational1 : entity xil_defaultlib.sysgen_relational_77da886c64 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    a => register_q_net,
    b => constant1_op_net,
    op => relational1_op_net
  );
end structural;
-- Generated from Simulink block receiver/Time Synchronisation/Timing Error Detector
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity receiver_timing_error_detector is
  port (
    real_in : in std_logic_vector( 16-1 downto 0 );
    imag_in : in std_logic_vector( 16-1 downto 0 );
    clk_20 : in std_logic;
    ce_20 : in std_logic;
    error : out std_logic_vector( 32-1 downto 0 )
  );
end receiver_timing_error_detector;
architecture structural of receiver_timing_error_detector is 
  signal addsub2_s_net : std_logic_vector( 32-1 downto 0 );
  signal convert_dout_net : std_logic_vector( 16-1 downto 0 );
  signal convert1_dout_net : std_logic_vector( 16-1 downto 0 );
  signal delay_q_net : std_logic_vector( 31-1 downto 0 );
  signal reinterpret1_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 31-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 31-1 downto 0 );
  signal mult1_p_net : std_logic_vector( 31-1 downto 0 );
  signal mult2_p_net : std_logic_vector( 31-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 31-1 downto 0 );
  signal src_clk_net : std_logic;
  signal src_ce_net : std_logic;
  signal reinterpret_output_port_net : std_logic_vector( 16-1 downto 0 );
begin
  error <= addsub2_s_net;
  convert_dout_net <= real_in;
  convert1_dout_net <= imag_in;
  src_clk_net <= clk_20;
  src_ce_net <= ce_20;
  addsub : entity xil_defaultlib.receiver_xladdsub 
  generic map (
    a_arith => xlUnsigned,
    a_bin_pt => 30,
    a_width => 31,
    b_arith => xlUnsigned,
    b_bin_pt => 30,
    b_width => 31,
    c_has_c_out => 0,
    c_latency => 0,
    c_output_width => 32,
    core_name0 => "receiver_c_addsub_v12_0_i8",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 32,
    latency => 0,
    overflow => 2,
    quantization => 1,
    s_arith => xlSigned,
    s_bin_pt => 30,
    s_width => 31
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
  addsub1 : entity xil_defaultlib.receiver_xladdsub 
  generic map (
    a_arith => xlUnsigned,
    a_bin_pt => 30,
    a_width => 31,
    b_arith => xlUnsigned,
    b_bin_pt => 30,
    b_width => 31,
    c_has_c_out => 0,
    c_latency => 0,
    c_output_width => 32,
    core_name0 => "receiver_c_addsub_v12_0_i8",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 32,
    latency => 0,
    overflow => 2,
    quantization => 1,
    s_arith => xlSigned,
    s_bin_pt => 30,
    s_width => 31
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
  addsub2 : entity xil_defaultlib.receiver_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 30,
    a_width => 31,
    b_arith => xlSigned,
    b_bin_pt => 30,
    b_width => 31,
    c_has_c_out => 0,
    c_latency => 0,
    c_output_width => 32,
    core_name0 => "receiver_c_addsub_v12_0_i9",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 32,
    latency => 0,
    overflow => 2,
    quantization => 2,
    s_arith => xlSigned,
    s_bin_pt => 30,
    s_width => 32
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
  delay : entity xil_defaultlib.receiver_xldelay 
  generic map (
    latency => 32,
    reg_retiming => 0,
    reset => 0,
    width => 31
  )
  port map (
    en => '1',
    rst => '0',
    d => mult1_p_net,
    clk => src_clk_net,
    ce => src_ce_net,
    q => delay_q_net
  );
  delay1 : entity xil_defaultlib.receiver_xldelay 
  generic map (
    latency => 32,
    reg_retiming => 0,
    reset => 0,
    width => 31
  )
  port map (
    en => '1',
    rst => '0',
    d => mult2_p_net,
    clk => src_clk_net,
    ce => src_ce_net,
    q => delay1_q_net
  );
  mult1 : entity xil_defaultlib.receiver_xlmult 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 15,
    a_width => 16,
    b_arith => xlSigned,
    b_bin_pt => 15,
    b_width => 16,
    c_a_type => 0,
    c_a_width => 16,
    c_b_type => 0,
    c_b_width => 16,
    c_baat => 16,
    c_output_width => 32,
    c_type => 0,
    core_name0 => "receiver_mult_gen_v12_0_i8",
    extra_registers => 0,
    multsign => 2,
    overflow => 2,
    p_arith => xlUnsigned,
    p_bin_pt => 30,
    p_width => 31,
    quantization => 1
  )
  port map (
    clr => '0',
    core_clr => '1',
    en => "1",
    rst => "0",
    a => reinterpret1_output_port_net,
    b => reinterpret1_output_port_net,
    clk => src_clk_net,
    ce => src_ce_net,
    core_clk => src_clk_net,
    core_ce => src_ce_net,
    p => mult1_p_net
  );
  mult2 : entity xil_defaultlib.receiver_xlmult 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 15,
    a_width => 16,
    b_arith => xlSigned,
    b_bin_pt => 15,
    b_width => 16,
    c_a_type => 0,
    c_a_width => 16,
    c_b_type => 0,
    c_b_width => 16,
    c_baat => 16,
    c_output_width => 32,
    c_type => 0,
    core_name0 => "receiver_mult_gen_v12_0_i8",
    extra_registers => 0,
    multsign => 2,
    overflow => 2,
    p_arith => xlUnsigned,
    p_bin_pt => 30,
    p_width => 31,
    quantization => 1
  )
  port map (
    clr => '0',
    core_clr => '1',
    en => "1",
    rst => "0",
    a => reinterpret_output_port_net,
    b => reinterpret_output_port_net,
    clk => src_clk_net,
    ce => src_ce_net,
    core_clk => src_clk_net,
    core_ce => src_ce_net,
    p => mult2_p_net
  );
  reinterpret : entity xil_defaultlib.sysgen_reinterpret_d828f855c8 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => convert1_dout_net,
    output_port => reinterpret_output_port_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_d828f855c8 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => convert_dout_net,
    output_port => reinterpret1_output_port_net
  );
end structural;
-- Generated from Simulink block receiver/Time Synchronisation
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity receiver_time_synchronisation is
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
end receiver_time_synchronisation;
architecture structural of receiver_time_synchronisation is 
  signal addsub1_s_net : std_logic_vector( 64-1 downto 0 );
  signal delay3_q_net : std_logic_vector( 1-1 downto 0 );
  signal src_ce_net : std_logic;
  signal addsub2_s_net : std_logic_vector( 32-1 downto 0 );
  signal src_clk_net : std_logic;
  signal delay2_q_net : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net : std_logic;
  signal convert_dout_net : std_logic_vector( 16-1 downto 0 );
  signal convert1_dout_net : std_logic_vector( 16-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 16-1 downto 0 );
  signal relational_op_net : std_logic_vector( 1-1 downto 0 );
  signal logical_y_net : std_logic_vector( 1-1 downto 0 );
begin
  valid_out <= delay3_q_net;
  real_out <= delay1_q_net;
  imag_out <= delay2_q_net;
  logical_y_net <= reset;
  fir_compiler_7_2_m_axis_data_tvalid_net <= valid_in;
  convert_dout_net <= real_in;
  convert1_dout_net <= imag_in;
  src_clk_net <= clk_20;
  src_ce_net <= ce_20;
  loop_filter : entity xil_defaultlib.receiver_loop_filter_x0 
  port map (
    real_in => convert_dout_net,
    imag_in => convert1_dout_net,
    signal_in => addsub2_s_net,
    valid_in => relational_op_net,
    reset => logical_y_net,
    clk_20 => src_clk_net,
    ce_20 => src_ce_net,
    real_out => delay1_q_net,
    imag_out => delay2_q_net,
    valid_out => delay3_q_net,
    error_out => addsub1_s_net
  );
  ncc : entity xil_defaultlib.receiver_ncc 
  port map (
    error => addsub1_s_net,
    clk_20 => src_clk_net,
    ce_20 => src_ce_net,
    strobe => relational_op_net
  );
  timing_error_detector : entity xil_defaultlib.receiver_timing_error_detector 
  port map (
    real_in => convert_dout_net,
    imag_in => convert1_dout_net,
    clk_20 => src_clk_net,
    ce_20 => src_ce_net,
    error => addsub2_s_net
  );
end structural;
-- Generated from Simulink block receiver_struct
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity receiver_struct is
  port (
    coarse_passthrough : in std_logic_vector( 1-1 downto 0 );
    enable_transfer : in std_logic_vector( 1-1 downto 0 );
    global_reset_sync : in std_logic_vector( 1-1 downto 0 );
    modulation : in std_logic_vector( 1-1 downto 0 );
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
    bpsk_packet_count : out std_logic_vector( 32-1 downto 0 );
    data_count : out std_logic_vector( 12-1 downto 0 );
    frame_size : out std_logic_vector( 8-1 downto 0 );
    freq_offset : out std_logic_vector( 32-1 downto 0 );
    packet_size : out std_logic_vector( 8-1 downto 0 );
    qpsk_packet_count : out std_logic_vector( 32-1 downto 0 );
    irq : out std_logic_vector( 1-1 downto 0 );
    m_axis_tdata : out std_logic_vector( 8-1 downto 0 );
    m_axis_tlast : out std_logic_vector( 1-1 downto 0 );
    m_axis_tvalid : out std_logic_vector( 1-1 downto 0 );
    s_axis_tready_im : out std_logic_vector( 1-1 downto 0 );
    s_axis_tready_re : out std_logic_vector( 1-1 downto 0 );
    m_axis_op_tdata : out std_logic_vector( 32-1 downto 0 );
    m_axis_op_tvalid : out std_logic_vector( 1-1 downto 0 )
  );
end receiver_struct;
architecture structural of receiver_struct is 
  signal register6_q_net : std_logic_vector( 8-1 downto 0 );
  signal modulation_net : std_logic_vector( 1-1 downto 0 );
  signal coarse_passthrough_net : std_logic_vector( 1-1 downto 0 );
  signal mux1_y_net : std_logic_vector( 8-1 downto 0 );
  signal enable_transfer_net : std_logic_vector( 1-1 downto 0 );
  signal reset_frame_sync_net : std_logic_vector( 1-1 downto 0 );
  signal counter1_op_net : std_logic_vector( 32-1 downto 0 );
  signal reset_phase_sync_net : std_logic_vector( 1-1 downto 0 );
  signal reset_time_sync_net : std_logic_vector( 1-1 downto 0 );
  signal rom_data_net : std_logic_vector( 32-1 downto 0 );
  signal counter1_op_net_x0 : std_logic_vector( 32-1 downto 0 );
  signal fifo_dcount_net : std_logic_vector( 12-1 downto 0 );
  signal global_reset_sync_net : std_logic_vector( 1-1 downto 0 );
  signal observation_point_net : std_logic_vector( 32-1 downto 0 );
  signal convert1_dout_net_x1 : std_logic_vector( 16-1 downto 0 );
  signal delay3_q_net : std_logic_vector( 1-1 downto 0 );
  signal fir_compiler_7_2_s_axis_data_tready_net : std_logic_vector( 1-1 downto 0 );
  signal cic_decimator_real_m_axis_data_tvalid_net : std_logic;
  signal convert1_dout_net : std_logic_vector( 16-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal logical1_y_net : std_logic_vector( 1-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 16-1 downto 0 );
  signal delay3_q_net_x0 : std_logic_vector( 1-1 downto 0 );
  signal reinterpret1_output_port_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal reinterpret1_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal convert_dout_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal s_axis_tvalid_im_net : std_logic_vector( 1-1 downto 0 );
  signal mux_valid_y_net : std_logic_vector( 1-1 downto 0 );
  signal delay2_q_net : std_logic_vector( 16-1 downto 0 );
  signal ce_5_net : std_logic;
  signal reinterpret0_output_port_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal register_q_net : std_logic_vector( 1-1 downto 0 );
  signal register5_q_net : std_logic_vector( 8-1 downto 0 );
  signal concat_y_net : std_logic_vector( 32-1 downto 0 );
  signal cmult1_p_net : std_logic_vector( 16-1 downto 0 );
  signal convert_dout_net_x1 : std_logic_vector( 16-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 8-1 downto 0 );
  signal logical2_y_net_x0 : std_logic_vector( 1-1 downto 0 );
  signal clk_5_net : std_logic;
  signal mux1_y_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal mux2_y_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret0_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x0 : std_logic;
  signal clk_net : std_logic;
  signal src_ce_net : std_logic;
  signal s_axis_tdata_im_net : std_logic_vector( 32-1 downto 0 );
  signal s_axis_tdata_re_net : std_logic_vector( 32-1 downto 0 );
  signal threshold_net : std_logic_vector( 32-1 downto 0 );
  signal s_axis_tvalid_re_net : std_logic_vector( 1-1 downto 0 );
  signal ce_net : std_logic;
  signal src_clk_net : std_logic;
  signal inverter3_op_net : std_logic_vector( 1-1 downto 0 );
  signal logical2_y_net : std_logic_vector( 1-1 downto 0 );
  signal register3_q_net : std_logic_vector( 1-1 downto 0 );
  signal cmult2_p_net : std_logic_vector( 16-1 downto 0 );
  signal m_axis_tready_net : std_logic_vector( 1-1 downto 0 );
  signal convert_dout_net : std_logic_vector( 16-1 downto 0 );
  signal register4_q_net : std_logic_vector( 1-1 downto 0 );
  signal convert1_dout_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal logical_y_net : std_logic_vector( 1-1 downto 0 );
begin
  bpsk_packet_count <= counter1_op_net_x0;
  coarse_passthrough_net <= coarse_passthrough;
  data_count <= fifo_dcount_net;
  enable_transfer_net <= enable_transfer;
  frame_size <= register6_q_net;
  freq_offset <= rom_data_net;
  global_reset_sync_net <= global_reset_sync;
  modulation_net <= modulation;
  observation_point_net <= observation_point;
  packet_size <= mux1_y_net;
  qpsk_packet_count <= counter1_op_net;
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
  axi_stream_master_interface : entity xil_defaultlib.receiver_axi_stream_master_interface 
  port map (
    enable => enable_transfer_net,
    reset => logical2_y_net,
    valid_in => register3_q_net,
    data_in => register5_q_net,
    last_in => logical2_y_net_x0,
    size_in => register6_q_net,
    m_axis_tready => m_axis_tready_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    clk_20 => src_clk_net,
    ce_20 => src_ce_net,
    count => fifo_dcount_net,
    size_out => mux1_y_net,
    irq => inverter3_op_net,
    m_axis_tdata => slice1_y_net,
    m_axis_tlast => slice_y_net,
    m_axis_tvalid => register_q_net
  );
  cic_decimator : entity xil_defaultlib.receiver_cic_decimator 
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
  carrier_synchronisation : entity xil_defaultlib.receiver_carrier_synchronisation 
  port map (
    reset => logical1_y_net,
    modulation => modulation_net,
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
  coarse_frequency_synchronisation : entity xil_defaultlib.receiver_coarse_frequency_synchronisation 
  port map (
    passthrough => coarse_passthrough_net,
    valid_in => cic_decimator_real_m_axis_data_tvalid_net,
    real_in => cmult2_p_net,
    imag_in => cmult1_p_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    clk_5 => clk_5_net,
    ce_5 => ce_5_net,
    valid_out => delay3_q_net_x0,
    real_out => mux1_y_net_x0,
    imag_out => mux2_y_net,
    freq_offset => rom_data_net
  );
  complex_axi_stream_slave_interface : entity xil_defaultlib.receiver_complex_axi_stream_slave_interface 
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
  frame_synchronisation : entity xil_defaultlib.receiver_frame_synchronisation 
  port map (
    modulation => modulation_net,
    reset => logical2_y_net,
    threshold => threshold_net,
    valid_in => register4_q_net,
    real_in => convert1_dout_net_x1,
    imag_out => convert_dout_net_x1,
    clk_1 => clk_net,
    ce_1 => ce_net,
    clk_20 => src_clk_net,
    ce_20 => src_ce_net,
    valid_out => register3_q_net,
    data_out => register5_q_net,
    last_out => logical2_y_net_x0,
    size => register6_q_net,
    qpsk_count => counter1_op_net,
    bpsk_count => counter1_op_net_x0
  );
  observation_point_x0 : entity xil_defaultlib.receiver_observation_point 
  port map (
    valid_b => delay3_q_net,
    valid_e => cic_decimator_real_m_axis_data_tvalid_net,
    valid_d => delay3_q_net_x0,
    valid_c => fir_compiler_7_2_m_axis_data_tvalid_net_x0,
    real_b => delay1_q_net,
    real_e => cmult2_p_net,
    real_d => mux1_y_net_x0,
    real_c => convert_dout_net_x0,
    valid_a => register4_q_net,
    imag_b => delay2_q_net,
    imag_e => cmult1_p_net,
    imag_d => mux2_y_net,
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
  rrc_receive_filter : entity xil_defaultlib.receiver_rrc_receive_filter 
  port map (
    valid_in => delay3_q_net_x0,
    real_in => mux1_y_net_x0,
    imag_in => mux2_y_net,
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
  reset_subsystem : entity xil_defaultlib.receiver_reset_subsystem 
  port map (
    global_reset => global_reset_sync_net,
    time_reset_in => reset_time_sync_net,
    phase_reset_in => reset_phase_sync_net,
    frame_reset_in => reset_frame_sync_net,
    modulation => modulation_net,
    clk_20 => src_clk_net,
    ce_20 => src_ce_net,
    time_reset_out => logical_y_net,
    phase_reset_out => logical1_y_net,
    frame_reset_out => logical2_y_net
  );
  ssr_halfband_lowpass_decimator : entity xil_defaultlib.receiver_ssr_halfband_lowpass_decimator 
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
  time_synchronisation : entity xil_defaultlib.receiver_time_synchronisation 
  port map (
    reset => logical_y_net,
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
entity receiver_default_clock_driver is
  port (
    receiver_sysclk : in std_logic;
    receiver_sysce : in std_logic;
    receiver_sysclr : in std_logic;
    receiver_clk1 : out std_logic;
    receiver_ce1 : out std_logic;
    receiver_clk5 : out std_logic;
    receiver_ce5 : out std_logic;
    receiver_clk20 : out std_logic;
    receiver_ce20 : out std_logic
  );
end receiver_default_clock_driver;
architecture structural of receiver_default_clock_driver is 
begin
  clockdriver_x1 : entity xil_defaultlib.xlclockdriver 
  generic map (
    period => 1,
    log_2_period => 1
  )
  port map (
    sysclk => receiver_sysclk,
    sysce => receiver_sysce,
    sysclr => receiver_sysclr,
    clk => receiver_clk1,
    ce => receiver_ce1
  );
  clockdriver_x0 : entity xil_defaultlib.xlclockdriver 
  generic map (
    period => 5,
    log_2_period => 3
  )
  port map (
    sysclk => receiver_sysclk,
    sysce => receiver_sysce,
    sysclr => receiver_sysclr,
    clk => receiver_clk5,
    ce => receiver_ce5
  );
  clockdriver : entity xil_defaultlib.xlclockdriver 
  generic map (
    period => 20,
    log_2_period => 5
  )
  port map (
    sysclk => receiver_sysclk,
    sysce => receiver_sysce,
    sysclr => receiver_sysclr,
    clk => receiver_clk20,
    ce => receiver_ce20
  );
end structural;
-- Generated from Simulink block 
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity receiver is
  port (
    m_axis_tready : in std_logic_vector( 1-1 downto 0 );
    s_axis_tdata_im : in std_logic_vector( 32-1 downto 0 );
    s_axis_tdata_re : in std_logic_vector( 32-1 downto 0 );
    s_axis_tvalid_im : in std_logic_vector( 1-1 downto 0 );
    s_axis_tvalid_re : in std_logic_vector( 1-1 downto 0 );
    clk : in std_logic;
    receiver_aresetn : in std_logic;
    receiver_s_axi_awaddr : in std_logic_vector( 6-1 downto 0 );
    receiver_s_axi_awvalid : in std_logic;
    receiver_s_axi_wdata : in std_logic_vector( 32-1 downto 0 );
    receiver_s_axi_wstrb : in std_logic_vector( 4-1 downto 0 );
    receiver_s_axi_wvalid : in std_logic;
    receiver_s_axi_bready : in std_logic;
    receiver_s_axi_araddr : in std_logic_vector( 6-1 downto 0 );
    receiver_s_axi_arvalid : in std_logic;
    receiver_s_axi_rready : in std_logic;
    irq : out std_logic_vector( 1-1 downto 0 );
    m_axis_tdata : out std_logic_vector( 8-1 downto 0 );
    m_axis_tlast : out std_logic_vector( 1-1 downto 0 );
    m_axis_tvalid : out std_logic_vector( 1-1 downto 0 );
    s_axis_tready_im : out std_logic_vector( 1-1 downto 0 );
    s_axis_tready_re : out std_logic_vector( 1-1 downto 0 );
    m_axis_op_tdata : out std_logic_vector( 32-1 downto 0 );
    m_axis_op_tvalid : out std_logic_vector( 1-1 downto 0 );
    receiver_s_axi_awready : out std_logic;
    receiver_s_axi_wready : out std_logic;
    receiver_s_axi_bresp : out std_logic_vector( 2-1 downto 0 );
    receiver_s_axi_bvalid : out std_logic;
    receiver_s_axi_arready : out std_logic;
    receiver_s_axi_rdata : out std_logic_vector( 32-1 downto 0 );
    receiver_s_axi_rresp : out std_logic_vector( 2-1 downto 0 );
    receiver_s_axi_rvalid : out std_logic
  );
end receiver;
architecture structural of receiver is 
  attribute core_generation_info : string;
  attribute core_generation_info of structural : architecture is "receiver,sysgen_core_2020_2,{,compilation=IP Catalog,block_icon_display=Default,family=zynquplusRFSOC,part=xczu28dr,speed=-2-e,package=ffvg1517,synthesis_language=vhdl,hdl_library=xil_defaultlib,synthesis_strategy=Vivado Synthesis Defaults,implementation_strategy=Vivado Implementation Defaults,testbench=0,interface_doc=0,ce_clr=0,clock_period=15.625,system_simulink_period=1.5625e-08,waveform_viewer=0,axilite_interface=1,ip_catalog_plugin=0,hwcosim_burst_mode=0,simulation_time=0.003125,addsub=47,cic_compiler_v4_0=2,cmult=8,concat=7,constant=33,convert=14,counter=9,delay=49,fifo=2,fir_compiler_v7_2=5,inv=23,logical=38,mult=4,mux=17,product_macro=4,register=79,reinterpret=8,relational=16,shift=25,slice=34,sprom=6,usamp=19,xfft_v9_1=1,}";
  signal modulation : std_logic_vector( 1-1 downto 0 );
  signal observation_point : std_logic_vector( 32-1 downto 0 );
  signal ce_1_net : std_logic;
  signal ce_5_net : std_logic;
  signal qpsk_packet_count : std_logic_vector( 32-1 downto 0 );
  signal reset_frame_sync : std_logic_vector( 1-1 downto 0 );
  signal coarse_passthrough : std_logic_vector( 1-1 downto 0 );
  signal clk_20_net : std_logic;
  signal data_count : std_logic_vector( 12-1 downto 0 );
  signal clk_1_net : std_logic;
  signal clk_5_net : std_logic;
  signal freq_offset : std_logic_vector( 32-1 downto 0 );
  signal frame_size : std_logic_vector( 8-1 downto 0 );
  signal reset_time_sync : std_logic_vector( 1-1 downto 0 );
  signal bpsk_packet_count : std_logic_vector( 32-1 downto 0 );
  signal threshold : std_logic_vector( 32-1 downto 0 );
  signal global_reset_sync : std_logic_vector( 1-1 downto 0 );
  signal ce_20_net : std_logic;
  signal packet_size : std_logic_vector( 8-1 downto 0 );
  signal reset_phase_sync : std_logic_vector( 1-1 downto 0 );
  signal enable_transfer : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
begin
  receiver_axi_lite_interface : entity xil_defaultlib.receiver_axi_lite_interface 
  port map (
    bpsk_packet_count => bpsk_packet_count,
    data_count => data_count,
    frame_size => frame_size,
    freq_offset => freq_offset,
    packet_size => packet_size,
    qpsk_packet_count => qpsk_packet_count,
    receiver_s_axi_awaddr => receiver_s_axi_awaddr,
    receiver_s_axi_awvalid => receiver_s_axi_awvalid,
    receiver_s_axi_wdata => receiver_s_axi_wdata,
    receiver_s_axi_wstrb => receiver_s_axi_wstrb,
    receiver_s_axi_wvalid => receiver_s_axi_wvalid,
    receiver_s_axi_bready => receiver_s_axi_bready,
    receiver_s_axi_araddr => receiver_s_axi_araddr,
    receiver_s_axi_arvalid => receiver_s_axi_arvalid,
    receiver_s_axi_rready => receiver_s_axi_rready,
    receiver_aresetn => receiver_aresetn,
    receiver_aclk => clk,
    threshold => threshold,
    reset_time_sync => reset_time_sync,
    reset_phase_sync => reset_phase_sync,
    reset_frame_sync => reset_frame_sync,
    observation_point => observation_point,
    modulation => modulation,
    global_reset_sync => global_reset_sync,
    enable_transfer => enable_transfer,
    coarse_passthrough => coarse_passthrough,
    receiver_s_axi_awready => receiver_s_axi_awready,
    receiver_s_axi_wready => receiver_s_axi_wready,
    receiver_s_axi_bresp => receiver_s_axi_bresp,
    receiver_s_axi_bvalid => receiver_s_axi_bvalid,
    receiver_s_axi_arready => receiver_s_axi_arready,
    receiver_s_axi_rdata => receiver_s_axi_rdata,
    receiver_s_axi_rresp => receiver_s_axi_rresp,
    receiver_s_axi_rvalid => receiver_s_axi_rvalid,
    clk => clk_net
  );
  receiver_default_clock_driver : entity xil_defaultlib.receiver_default_clock_driver 
  port map (
    receiver_sysclk => clk_net,
    receiver_sysce => '1',
    receiver_sysclr => '0',
    receiver_clk1 => clk_1_net,
    receiver_ce1 => ce_1_net,
    receiver_clk5 => clk_5_net,
    receiver_ce5 => ce_5_net,
    receiver_clk20 => clk_20_net,
    receiver_ce20 => ce_20_net
  );
  receiver_struct : entity xil_defaultlib.receiver_struct 
  port map (
    coarse_passthrough => coarse_passthrough,
    enable_transfer => enable_transfer,
    global_reset_sync => global_reset_sync,
    modulation => modulation,
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
    bpsk_packet_count => bpsk_packet_count,
    data_count => data_count,
    frame_size => frame_size,
    freq_offset => freq_offset,
    packet_size => packet_size,
    qpsk_packet_count => qpsk_packet_count,
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
