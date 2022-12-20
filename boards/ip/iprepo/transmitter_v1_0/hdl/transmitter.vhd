-- Generated from Simulink block transmitter/DUT/AXI-Stream Master Interface
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity transmitter_axi_stream_master_interface is
  port (
    s_re_tdata : in std_logic_vector( 16-1 downto 0 );
    s_im_tdata : in std_logic_vector( 16-1 downto 0 );
    s_tvalid : in std_logic;
    m_axis_tdata : out std_logic_vector( 32-1 downto 0 )
  );
end transmitter_axi_stream_master_interface;
architecture structural of transmitter_axi_stream_master_interface is 
  signal cmult_p_net : std_logic_vector( 16-1 downto 0 );
  signal cmult1_p_net : std_logic_vector( 16-1 downto 0 );
  signal concat_y_net : std_logic_vector( 32-1 downto 0 );
  signal cic_compiler_4_0_m_axis_data_tvalid_net : std_logic;
  signal reinterpret1_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret_output_port_net : std_logic_vector( 16-1 downto 0 );
begin
  cmult_p_net <= s_re_tdata;
  cmult1_p_net <= s_im_tdata;
  cic_compiler_4_0_m_axis_data_tvalid_net <= s_tvalid;
  m_axis_tdata <= concat_y_net;
  concat : entity xil_defaultlib.sysgen_concat_6c550c917a 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    in0 => reinterpret1_output_port_net,
    in1 => reinterpret_output_port_net,
    y => concat_y_net
  );
  reinterpret : entity xil_defaultlib.sysgen_reinterpret_c573d47a5b 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => cmult_p_net,
    output_port => reinterpret_output_port_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_c573d47a5b 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => cmult1_p_net,
    output_port => reinterpret1_output_port_net
  );
end structural;
-- Generated from Simulink block transmitter/DUT/AXI-Stream Slave Interface/BPSK Interface
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity transmitter_bpsk_interface is
  port (
    s_tlast : in std_logic_vector( 1-1 downto 0 );
    s_tdata : in std_logic_vector( 8-1 downto 0 );
    s_tvalid : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    clk_1280 : in std_logic;
    ce_1280 : in std_logic;
    clk_10240 : in std_logic;
    ce_10240 : in std_logic;
    m_tdata : out std_logic_vector( 1-1 downto 0 );
    m_tvalid : out std_logic_vector( 1-1 downto 0 );
    s_tready : out std_logic_vector( 1-1 downto 0 )
  );
end transmitter_bpsk_interface;
architecture structural of transmitter_bpsk_interface is 
  signal parallel_to_serial_dout_net : std_logic_vector( 1-1 downto 0 );
  signal src_clk_net_x0 : std_logic;
  signal register1_q_net : std_logic_vector( 8-1 downto 0 );
  signal s_axis_tlast_net : std_logic_vector( 1-1 downto 0 );
  signal src_ce_net_x0 : std_logic;
  signal mux_y_net : std_logic_vector( 8-1 downto 0 );
  signal logical1_y_net : std_logic_vector( 1-1 downto 0 );
  signal dest_ce_net : std_logic;
  signal up_sample_q_net : std_logic_vector( 1-1 downto 0 );
  signal src_clk_net : std_logic;
  signal src_ce_net : std_logic;
  signal dest_clk_net : std_logic;
  signal s_axis_tdata_net : std_logic_vector( 8-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal fifo_full_net : std_logic;
  signal fifo_dout_net : std_logic_vector( 9-1 downto 0 );
  signal down_sample_q_net : std_logic_vector( 1-1 downto 0 );
  signal inverter1_op_net : std_logic;
  signal fifo_empty_net : std_logic_vector( 1-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 8-1 downto 0 );
  signal concat_y_net : std_logic_vector( 9-1 downto 0 );
  signal constant_op_net : std_logic_vector( 8-1 downto 0 );
  signal register_q_net : std_logic_vector( 1-1 downto 0 );
begin
  m_tdata <= parallel_to_serial_dout_net;
  m_tvalid <= up_sample_q_net;
  s_tready <= inverter_op_net;
  s_axis_tlast_net <= s_tlast;
  s_axis_tdata_net <= s_tdata;
  logical1_y_net <= s_tvalid;
  src_clk_net <= clk_1;
  src_ce_net <= ce_1;
  dest_clk_net <= clk_1280;
  dest_ce_net <= ce_1280;
  src_clk_net_x0 <= clk_10240;
  src_ce_net_x0 <= ce_10240;
  parallel_to_serial : entity xil_defaultlib.transmitter_xlp2s 
  generic map (
    din_arith => xlUnsigned,
    din_bin_pt => 0,
    din_width => 8,
    dout_arith => xlUnsigned,
    dout_bin_pt => 0,
    dout_width => 1,
    latency => 0,
    lsb_first => 1,
    num_outputs => 8
  )
  port map (
    src_clr => '0',
    dest_clr => '0',
    en => "1",
    rst => "0",
    din => register1_q_net,
    src_clk => src_clk_net_x0,
    src_ce => src_ce_net_x0,
    dest_clk => dest_clk_net,
    dest_ce => dest_ce_net,
    dout => parallel_to_serial_dout_net
  );
  register1 : entity xil_defaultlib.transmitter_xlregister 
  generic map (
    d_width => 8,
    init_value => b"00000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => mux_y_net,
    clk => src_clk_net_x0,
    ce => src_ce_net_x0,
    q => register1_q_net
  );
  up_sample : entity xil_defaultlib.transmitter_xlusamp 
  generic map (
    copy_samples => 1,
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
    d => register_q_net,
    src_clk => src_clk_net_x0,
    src_ce => src_ce_net_x0,
    dest_clk => dest_clk_net,
    dest_ce => dest_ce_net,
    q => up_sample_q_net
  );
  concat : entity xil_defaultlib.sysgen_concat_5c2d28a2d6 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    in0 => s_axis_tlast_net,
    in1 => s_axis_tdata_net,
    y => concat_y_net
  );
  constant_x0 : entity xil_defaultlib.sysgen_constant_30184e3d5a 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  down_sample : entity xil_defaultlib.transmitter_xldsamp 
  generic map (
    d_arith => xlUnsigned,
    d_bin_pt => 0,
    d_width => 1,
    ds_ratio => 10240,
    latency => 0,
    phase => 0,
    q_arith => xlUnsigned,
    q_bin_pt => 0,
    q_width => 1
  )
  port map (
    src_clr => '0',
    dest_clr => '0',
    en => "1",
    rst => "0",
    d => fifo_empty_net,
    src_clk => src_clk_net,
    src_ce => src_ce_net,
    dest_clk => src_clk_net_x0,
    dest_ce => src_ce_net_x0,
    q => down_sample_q_net
  );
  fifo : entity xil_defaultlib.transmitter_xlfifogen_u 
  generic map (
    core_name0 => "transmitter_fifo_generator_i0",
    data_count_width => 10,
    data_width => 9,
    extra_registers => 1,
    has_ae => 0,
    has_af => 0,
    has_rst => false,
    ignore_din_for_gcd => false,
    percent_full_width => 2
  )
  port map (
    en => '1',
    rst => '0',
    din => concat_y_net,
    we => logical1_y_net(0),
    re => inverter1_op_net,
    clk => src_clk_net,
    ce => src_ce_net,
    we_ce => src_ce_net,
    re_ce => src_ce_net_x0,
    dout => fifo_dout_net,
    empty => fifo_empty_net(0),
    full => fifo_full_net
  );
  inverter : entity xil_defaultlib.sysgen_inverter_dbb2213157 
  port map (
    clr => '0',
    ip(0) => fifo_full_net,
    clk => src_clk_net,
    ce => src_ce_net,
    op => inverter_op_net
  );
  inverter1 : entity xil_defaultlib.sysgen_inverter_dbb2213157 
  port map (
    clr => '0',
    ip => down_sample_q_net,
    clk => src_clk_net_x0,
    ce => src_ce_net_x0,
    op(0) => inverter1_op_net
  );
  mux : entity xil_defaultlib.sysgen_mux_dd7c3a5195 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => register_q_net,
    d0 => constant_op_net,
    d1 => slice1_y_net,
    y => mux_y_net
  );
  register_x0 : entity xil_defaultlib.transmitter_xlregister 
  generic map (
    d_width => 1,
    init_value => b"0"
  )
  port map (
    en => "1",
    rst => "0",
    d(0) => inverter1_op_net,
    clk => src_clk_net_x0,
    ce => src_ce_net_x0,
    q => register_q_net
  );
  slice1 : entity xil_defaultlib.transmitter_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 7,
    x_width => 9,
    y_width => 8
  )
  port map (
    x => fifo_dout_net,
    y => slice1_y_net
  );
end structural;
-- Generated from Simulink block transmitter/DUT/AXI-Stream Slave Interface/QPSK Interface
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity transmitter_qpsk_interface is
  port (
    s_tlast : in std_logic_vector( 1-1 downto 0 );
    s_tdata : in std_logic_vector( 8-1 downto 0 );
    s_tvalid : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    clk_1280 : in std_logic;
    ce_1280 : in std_logic;
    clk_5120 : in std_logic;
    ce_5120 : in std_logic;
    m_tdata : out std_logic_vector( 2-1 downto 0 );
    m_tvalid : out std_logic_vector( 1-1 downto 0 );
    s_tready : out std_logic_vector( 1-1 downto 0 )
  );
end transmitter_qpsk_interface;
architecture structural of transmitter_qpsk_interface is 
  signal dest_clk_net_x0 : std_logic;
  signal constant_op_net : std_logic_vector( 8-1 downto 0 );
  signal fifo_empty_net : std_logic_vector( 1-1 downto 0 );
  signal s_axis_tlast_net : std_logic_vector( 1-1 downto 0 );
  signal src_clk_net : std_logic;
  signal concat_y_net : std_logic_vector( 9-1 downto 0 );
  signal up_sample_q_net : std_logic_vector( 1-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal s_axis_tdata_net : std_logic_vector( 8-1 downto 0 );
  signal dest_clk_net : std_logic;
  signal dest_ce_net_x0 : std_logic;
  signal dest_ce_net : std_logic;
  signal down_sample_q_net : std_logic_vector( 1-1 downto 0 );
  signal logical_y_net : std_logic_vector( 1-1 downto 0 );
  signal src_ce_net : std_logic;
  signal parallel_to_serial_dout_net : std_logic_vector( 2-1 downto 0 );
  signal register_q_net : std_logic_vector( 1-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 8-1 downto 0 );
  signal inverter1_op_net : std_logic;
  signal fifo_full_net : std_logic;
  signal mux_y_net : std_logic_vector( 8-1 downto 0 );
  signal register1_q_net : std_logic_vector( 8-1 downto 0 );
  signal fifo_dout_net : std_logic_vector( 9-1 downto 0 );
begin
  m_tdata <= parallel_to_serial_dout_net;
  m_tvalid <= up_sample_q_net;
  s_tready <= inverter_op_net;
  s_axis_tlast_net <= s_tlast;
  s_axis_tdata_net <= s_tdata;
  logical_y_net <= s_tvalid;
  src_clk_net <= clk_1;
  src_ce_net <= ce_1;
  dest_clk_net_x0 <= clk_1280;
  dest_ce_net_x0 <= ce_1280;
  dest_clk_net <= clk_5120;
  dest_ce_net <= ce_5120;
  concat : entity xil_defaultlib.sysgen_concat_5c2d28a2d6 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    in0 => s_axis_tlast_net,
    in1 => s_axis_tdata_net,
    y => concat_y_net
  );
  constant_x0 : entity xil_defaultlib.sysgen_constant_30184e3d5a 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  down_sample : entity xil_defaultlib.transmitter_xldsamp 
  generic map (
    d_arith => xlUnsigned,
    d_bin_pt => 0,
    d_width => 1,
    ds_ratio => 5120,
    latency => 0,
    phase => 0,
    q_arith => xlUnsigned,
    q_bin_pt => 0,
    q_width => 1
  )
  port map (
    src_clr => '0',
    dest_clr => '0',
    en => "1",
    rst => "0",
    d => fifo_empty_net,
    src_clk => src_clk_net,
    src_ce => src_ce_net,
    dest_clk => dest_clk_net,
    dest_ce => dest_ce_net,
    q => down_sample_q_net
  );
  fifo : entity xil_defaultlib.transmitter_xlfifogen_u 
  generic map (
    core_name0 => "transmitter_fifo_generator_i0",
    data_count_width => 10,
    data_width => 9,
    extra_registers => 1,
    has_ae => 0,
    has_af => 0,
    has_rst => false,
    ignore_din_for_gcd => false,
    percent_full_width => 2
  )
  port map (
    en => '1',
    rst => '0',
    din => concat_y_net,
    we => logical_y_net(0),
    re => inverter1_op_net,
    clk => src_clk_net,
    ce => src_ce_net,
    we_ce => src_ce_net,
    re_ce => dest_ce_net,
    dout => fifo_dout_net,
    empty => fifo_empty_net(0),
    full => fifo_full_net
  );
  inverter : entity xil_defaultlib.sysgen_inverter_dbb2213157 
  port map (
    clr => '0',
    ip(0) => fifo_full_net,
    clk => src_clk_net,
    ce => src_ce_net,
    op => inverter_op_net
  );
  inverter1 : entity xil_defaultlib.sysgen_inverter_dbb2213157 
  port map (
    clr => '0',
    ip => down_sample_q_net,
    clk => dest_clk_net,
    ce => dest_ce_net,
    op(0) => inverter1_op_net
  );
  mux : entity xil_defaultlib.sysgen_mux_dd7c3a5195 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => register_q_net,
    d0 => constant_op_net,
    d1 => slice1_y_net,
    y => mux_y_net
  );
  register_x0 : entity xil_defaultlib.transmitter_xlregister 
  generic map (
    d_width => 1,
    init_value => b"0"
  )
  port map (
    en => "1",
    rst => "0",
    d(0) => inverter1_op_net,
    clk => dest_clk_net,
    ce => dest_ce_net,
    q => register_q_net
  );
  slice1 : entity xil_defaultlib.transmitter_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 7,
    x_width => 9,
    y_width => 8
  )
  port map (
    x => fifo_dout_net,
    y => slice1_y_net
  );
  parallel_to_serial : entity xil_defaultlib.transmitter_xlp2s 
  generic map (
    din_arith => xlUnsigned,
    din_bin_pt => 0,
    din_width => 8,
    dout_arith => xlUnsigned,
    dout_bin_pt => 0,
    dout_width => 2,
    latency => 0,
    lsb_first => 1,
    num_outputs => 4
  )
  port map (
    src_clr => '0',
    dest_clr => '0',
    en => "1",
    rst => "0",
    din => register1_q_net,
    src_clk => dest_clk_net,
    src_ce => dest_ce_net,
    dest_clk => dest_clk_net_x0,
    dest_ce => dest_ce_net_x0,
    dout => parallel_to_serial_dout_net
  );
  register1 : entity xil_defaultlib.transmitter_xlregister 
  generic map (
    d_width => 8,
    init_value => b"00000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => mux_y_net,
    clk => dest_clk_net,
    ce => dest_ce_net,
    q => register1_q_net
  );
  up_sample : entity xil_defaultlib.transmitter_xlusamp 
  generic map (
    copy_samples => 1,
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
    d => register_q_net,
    src_clk => dest_clk_net,
    src_ce => dest_ce_net,
    dest_clk => dest_clk_net_x0,
    dest_ce => dest_ce_net_x0,
    q => up_sample_q_net
  );
end structural;
-- Generated from Simulink block transmitter/DUT/AXI-Stream Slave Interface
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity transmitter_axi_stream_slave_interface is
  port (
    enable_tx : in std_logic_vector( 1-1 downto 0 );
    modulation : in std_logic_vector( 1-1 downto 0 );
    s_axis_tdata : in std_logic_vector( 8-1 downto 0 );
    s_axis_tlast : in std_logic_vector( 1-1 downto 0 );
    s_axis_tvalid : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    clk_1280 : in std_logic;
    ce_1280 : in std_logic;
    clk_5120 : in std_logic;
    ce_5120 : in std_logic;
    clk_10240 : in std_logic;
    ce_10240 : in std_logic;
    m_tdata : out std_logic_vector( 2-1 downto 0 );
    m_tvalid : out std_logic_vector( 1-1 downto 0 );
    s_axis_tready : out std_logic_vector( 1-1 downto 0 )
  );
end transmitter_axi_stream_slave_interface;
architecture structural of transmitter_axi_stream_slave_interface is 
  signal mux_y_net : std_logic_vector( 1-1 downto 0 );
  signal enable_tx_net : std_logic_vector( 1-1 downto 0 );
  signal mux1_y_net : std_logic_vector( 2-1 downto 0 );
  signal parallel_to_serial_dout_net : std_logic_vector( 2-1 downto 0 );
  signal inverter_op_net_x0 : std_logic_vector( 1-1 downto 0 );
  signal s_axis_tdata_net : std_logic_vector( 8-1 downto 0 );
  signal s_axis_tvalid_net : std_logic_vector( 1-1 downto 0 );
  signal src_clk_net : std_logic;
  signal dest_ce_net : std_logic;
  signal up_sample_q_net_x0 : std_logic_vector( 1-1 downto 0 );
  signal inverter_op_net_x1 : std_logic_vector( 1-1 downto 0 );
  signal dest_clk_net_x0 : std_logic;
  signal mux2_y_net : std_logic_vector( 1-1 downto 0 );
  signal src_ce_net : std_logic;
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal logical_y_net : std_logic_vector( 1-1 downto 0 );
  signal src_clk_net_x0 : std_logic;
  signal s_axis_tlast_net : std_logic_vector( 1-1 downto 0 );
  signal logical1_y_net : std_logic_vector( 1-1 downto 0 );
  signal parallel_to_serial_dout_net_x0 : std_logic_vector( 1-1 downto 0 );
  signal register_q_net : std_logic_vector( 1-1 downto 0 );
  signal dest_clk_net : std_logic;
  signal dest_ce_net_x0 : std_logic;
  signal modulation_net : std_logic_vector( 1-1 downto 0 );
  signal src_ce_net_x0 : std_logic;
  signal up_sample_q_net : std_logic_vector( 1-1 downto 0 );
  signal inverter1_op_net : std_logic_vector( 1-1 downto 0 );
begin
  m_tdata <= mux1_y_net;
  m_tvalid <= mux_y_net;
  enable_tx_net <= enable_tx;
  modulation_net <= modulation;
  s_axis_tdata_net <= s_axis_tdata;
  s_axis_tlast_net <= s_axis_tlast;
  s_axis_tready <= mux2_y_net;
  s_axis_tvalid_net <= s_axis_tvalid;
  src_clk_net_x0 <= clk_1;
  src_ce_net_x0 <= ce_1;
  dest_clk_net <= clk_1280;
  dest_ce_net_x0 <= ce_1280;
  dest_clk_net_x0 <= clk_5120;
  dest_ce_net <= ce_5120;
  src_clk_net <= clk_10240;
  src_ce_net <= ce_10240;
  bpsk_interface : entity xil_defaultlib.transmitter_bpsk_interface 
  port map (
    s_tlast => s_axis_tlast_net,
    s_tdata => s_axis_tdata_net,
    s_tvalid => logical1_y_net,
    clk_1 => src_clk_net_x0,
    ce_1 => src_ce_net_x0,
    clk_1280 => dest_clk_net,
    ce_1280 => dest_ce_net_x0,
    clk_10240 => src_clk_net,
    ce_10240 => src_ce_net,
    m_tdata => parallel_to_serial_dout_net_x0,
    m_tvalid => up_sample_q_net_x0,
    s_tready => inverter_op_net_x1
  );
  qpsk_interface : entity xil_defaultlib.transmitter_qpsk_interface 
  port map (
    s_tlast => s_axis_tlast_net,
    s_tdata => s_axis_tdata_net,
    s_tvalid => logical_y_net,
    clk_1 => src_clk_net_x0,
    ce_1 => src_ce_net_x0,
    clk_1280 => dest_clk_net,
    ce_1280 => dest_ce_net_x0,
    clk_5120 => dest_clk_net_x0,
    ce_5120 => dest_ce_net,
    m_tdata => parallel_to_serial_dout_net,
    m_tvalid => up_sample_q_net,
    s_tready => inverter_op_net
  );
  mux1 : entity xil_defaultlib.sysgen_mux_a3b8477e84 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => register_q_net,
    d0 => parallel_to_serial_dout_net_x0,
    d1 => parallel_to_serial_dout_net,
    y => mux1_y_net
  );
  logical : entity xil_defaultlib.sysgen_logical_5314756dce 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => register_q_net,
    d1 => s_axis_tvalid_net,
    y => logical_y_net
  );
  logical1 : entity xil_defaultlib.sysgen_logical_5314756dce 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => inverter_op_net_x0,
    d1 => s_axis_tvalid_net,
    y => logical1_y_net
  );
  mux2 : entity xil_defaultlib.sysgen_mux_a9922b7d67 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => register_q_net,
    d0 => inverter_op_net_x1,
    d1 => inverter_op_net,
    y => mux2_y_net
  );
  inverter1 : entity xil_defaultlib.sysgen_inverter_dbb2213157 
  port map (
    clr => '0',
    ip => enable_tx_net,
    clk => dest_clk_net,
    ce => dest_ce_net_x0,
    op => inverter1_op_net
  );
  mux : entity xil_defaultlib.sysgen_mux_a9922b7d67 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => register_q_net,
    d0 => up_sample_q_net_x0,
    d1 => up_sample_q_net,
    y => mux_y_net
  );
  inverter : entity xil_defaultlib.sysgen_inverter_dbb2213157 
  port map (
    clr => '0',
    ip => register_q_net,
    clk => dest_clk_net,
    ce => dest_ce_net_x0,
    op => inverter_op_net_x0
  );
  register_x0 : entity xil_defaultlib.transmitter_xlregister 
  generic map (
    d_width => 1,
    init_value => b"0"
  )
  port map (
    rst => "0",
    d => modulation_net,
    en => inverter1_op_net,
    clk => dest_clk_net,
    ce => dest_ce_net_x0,
    q => register_q_net
  );
end structural;
-- Generated from Simulink block transmitter/DUT/Algorithm/Differential Encoder
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity transmitter_differential_encoder is
  port (
    tx_output : in std_logic_vector( 1-1 downto 0 );
    s_re_tdata : in std_logic_vector( 1-1 downto 0 );
    s_im_tdata : in std_logic_vector( 1-1 downto 0 );
    clk_1280 : in std_logic;
    ce_1280 : in std_logic;
    m_re_tdata : out std_logic_vector( 16-1 downto 0 );
    m_im_tdata : out std_logic_vector( 16-1 downto 0 )
  );
end transmitter_differential_encoder;
architecture structural of transmitter_differential_encoder is 
  signal constant2_op_net : std_logic_vector( 16-1 downto 0 );
  signal constant_op_net : std_logic_vector( 16-1 downto 0 );
  signal mux1_y_net : std_logic_vector( 1-1 downto 0 );
  signal constant3_op_net : std_logic_vector( 16-1 downto 0 );
  signal mux3_y_net : std_logic_vector( 16-1 downto 0 );
  signal mux2_y_net : std_logic_vector( 1-1 downto 0 );
  signal mux1_y_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal enable_tx_net : std_logic_vector( 1-1 downto 0 );
  signal dest_clk_net : std_logic;
  signal dest_ce_net : std_logic;
  signal constant1_op_net : std_logic_vector( 16-1 downto 0 );
  signal register_q_net : std_logic_vector( 1-1 downto 0 );
  signal register1_q_net : std_logic_vector( 1-1 downto 0 );
  signal mux_y_net : std_logic_vector( 16-1 downto 0 );
  signal constant4_op_net : std_logic_vector( 16-1 downto 0 );
  signal constant5_op_net : std_logic_vector( 16-1 downto 0 );
  signal logical_y_net : std_logic_vector( 1-1 downto 0 );
  signal logical1_y_net : std_logic_vector( 1-1 downto 0 );
  signal mux2_y_net_x0 : std_logic_vector( 16-1 downto 0 );
begin
  m_re_tdata <= mux1_y_net_x0;
  m_im_tdata <= mux3_y_net;
  enable_tx_net <= tx_output;
  mux1_y_net <= s_re_tdata;
  mux2_y_net <= s_im_tdata;
  dest_clk_net <= clk_1280;
  dest_ce_net <= ce_1280;
  constant_x0 : entity xil_defaultlib.sysgen_constant_c35d4af7aa 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  constant1 : entity xil_defaultlib.sysgen_constant_abcc65cec1 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant1_op_net
  );
  constant2 : entity xil_defaultlib.sysgen_constant_f74b79fe84 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant2_op_net
  );
  constant3 : entity xil_defaultlib.sysgen_constant_c35d4af7aa 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant3_op_net
  );
  constant4 : entity xil_defaultlib.sysgen_constant_abcc65cec1 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant4_op_net
  );
  constant5 : entity xil_defaultlib.sysgen_constant_f74b79fe84 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant5_op_net
  );
  logical : entity xil_defaultlib.sysgen_logical_ef8eaf66a9 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => register_q_net,
    d1 => mux1_y_net,
    y => logical_y_net
  );
  logical1 : entity xil_defaultlib.sysgen_logical_ef8eaf66a9 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => register1_q_net,
    d1 => mux2_y_net,
    y => logical1_y_net
  );
  mux : entity xil_defaultlib.sysgen_mux_9e90eee7ab 
  port map (
    clr => '0',
    sel => logical_y_net,
    d0 => constant_op_net,
    d1 => constant1_op_net,
    clk => dest_clk_net,
    ce => dest_ce_net,
    y => mux_y_net
  );
  mux1 : entity xil_defaultlib.sysgen_mux_6d08890a9e 
  port map (
    clr => '0',
    sel => enable_tx_net,
    d0 => constant2_op_net,
    d1 => mux_y_net,
    clk => dest_clk_net,
    ce => dest_ce_net,
    y => mux1_y_net_x0
  );
  mux2 : entity xil_defaultlib.sysgen_mux_9e90eee7ab 
  port map (
    clr => '0',
    sel => logical1_y_net,
    d0 => constant3_op_net,
    d1 => constant4_op_net,
    clk => dest_clk_net,
    ce => dest_ce_net,
    y => mux2_y_net_x0
  );
  mux3 : entity xil_defaultlib.sysgen_mux_6d08890a9e 
  port map (
    clr => '0',
    sel => enable_tx_net,
    d0 => constant5_op_net,
    d1 => mux2_y_net_x0,
    clk => dest_clk_net,
    ce => dest_ce_net,
    y => mux3_y_net
  );
  register_x0 : entity xil_defaultlib.transmitter_xlregister 
  generic map (
    d_width => 1,
    init_value => b"0"
  )
  port map (
    en => "1",
    rst => "0",
    d => logical_y_net,
    clk => dest_clk_net,
    ce => dest_ce_net,
    q => register_q_net
  );
  register1 : entity xil_defaultlib.transmitter_xlregister 
  generic map (
    d_width => 1,
    init_value => b"0"
  )
  port map (
    en => "1",
    rst => "0",
    d => logical1_y_net,
    clk => dest_clk_net,
    ce => dest_ce_net,
    q => register1_q_net
  );
end structural;
-- Generated from Simulink block transmitter/DUT/Algorithm/Interpolation
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity transmitter_interpolation is
  port (
    s_re_tdata : in std_logic_vector( 16-1 downto 0 );
    s_im_tdata : in std_logic_vector( 16-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    clk_320 : in std_logic;
    ce_320 : in std_logic;
    m_re_tdata : out std_logic_vector( 16-1 downto 0 );
    m_im_tdata : out std_logic_vector( 16-1 downto 0 );
    m_tvalid : out std_logic
  );
end transmitter_interpolation;
architecture structural of transmitter_interpolation is 
  signal convert_dout_net : std_logic_vector( 16-1 downto 0 );
  signal convert1_dout_net : std_logic_vector( 16-1 downto 0 );
  signal cmult_p_net : std_logic_vector( 16-1 downto 0 );
  signal cmult1_p_net : std_logic_vector( 16-1 downto 0 );
  signal cic_compiler_4_0_m_axis_data_tvalid_net : std_logic;
  signal src_clk_net : std_logic;
  signal cic_compiler_4_0_1_s_axis_data_tready_net : std_logic;
  signal cic_compiler_4_0_1_m_axis_data_tdata_real_net : std_logic_vector( 50-1 downto 0 );
  signal shift_op_net : std_logic_vector( 58-1 downto 0 );
  signal ce_320_net : std_logic;
  signal src_ce_net : std_logic;
  signal cic_compiler_4_0_m_axis_data_tdata_real_net : std_logic_vector( 50-1 downto 0 );
  signal cic_compiler_4_0_1_m_axis_data_tvalid_net : std_logic;
  signal clk_320_net : std_logic;
  signal cic_compiler_4_0_s_axis_data_tready_net : std_logic;
  signal shift1_op_net : std_logic_vector( 58-1 downto 0 );
begin
  m_re_tdata <= cmult_p_net;
  m_im_tdata <= cmult1_p_net;
  m_tvalid <= cic_compiler_4_0_m_axis_data_tvalid_net;
  convert_dout_net <= s_re_tdata;
  convert1_dout_net <= s_im_tdata;
  src_clk_net <= clk_1;
  src_ce_net <= ce_1;
  clk_320_net <= clk_320;
  ce_320_net <= ce_320;
  cic_compiler_4_0 : entity xil_defaultlib.xlcic_compiler_1550be3768d892b798d571eedcf4a1eb 
  port map (
    s_axis_data_tdata_real => convert_dout_net,
    clk => src_clk_net,
    ce => src_ce_net,
    clk_320 => clk_320_net,
    ce_320 => ce_320_net,
    clk_logic_320 => clk_320_net,
    ce_logic_320 => ce_320_net,
    s_axis_data_tready => cic_compiler_4_0_s_axis_data_tready_net,
    m_axis_data_tvalid => cic_compiler_4_0_m_axis_data_tvalid_net,
    m_axis_data_tdata_real => cic_compiler_4_0_m_axis_data_tdata_real_net
  );
  cic_compiler_4_0_1 : entity xil_defaultlib.xlcic_compiler_1550be3768d892b798d571eedcf4a1eb 
  port map (
    s_axis_data_tdata_real => convert1_dout_net,
    clk => src_clk_net,
    ce => src_ce_net,
    clk_320 => clk_320_net,
    ce_320 => ce_320_net,
    clk_logic_320 => clk_320_net,
    ce_logic_320 => ce_320_net,
    s_axis_data_tready => cic_compiler_4_0_1_s_axis_data_tready_net,
    m_axis_data_tvalid => cic_compiler_4_0_1_m_axis_data_tvalid_net,
    m_axis_data_tdata_real => cic_compiler_4_0_1_m_axis_data_tdata_real_net
  );
  cmult : entity xil_defaultlib.transmitter_xlcmult 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 56,
    a_width => 58,
    b_bin_pt => 15,
    c_a_type => 0,
    c_a_width => 58,
    c_b_type => 1,
    c_b_width => 16,
    c_output_width => 74,
    core_name0 => "transmitter_mult_gen_v12_0_i0",
    extra_registers => 0,
    multsign => 2,
    overflow => 2,
    p_arith => xlSigned,
    p_bin_pt => 15,
    p_width => 16,
    quantization => 2,
    zero_const => 0
  )
  port map (
    clr => '0',
    core_clr => '1',
    en => "1",
    rst => "0",
    a => shift_op_net,
    clk => src_clk_net,
    ce => src_ce_net,
    core_clk => src_clk_net,
    core_ce => src_ce_net,
    p => cmult_p_net
  );
  cmult1 : entity xil_defaultlib.transmitter_xlcmult 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 56,
    a_width => 58,
    b_bin_pt => 15,
    c_a_type => 0,
    c_a_width => 58,
    c_b_type => 1,
    c_b_width => 16,
    c_output_width => 74,
    core_name0 => "transmitter_mult_gen_v12_0_i0",
    extra_registers => 0,
    multsign => 2,
    overflow => 2,
    p_arith => xlSigned,
    p_bin_pt => 15,
    p_width => 16,
    quantization => 2,
    zero_const => 0
  )
  port map (
    clr => '0',
    core_clr => '1',
    en => "1",
    rst => "0",
    a => shift1_op_net,
    clk => src_clk_net,
    ce => src_ce_net,
    core_clk => src_clk_net,
    core_ce => src_ce_net,
    p => cmult1_p_net
  );
  shift : entity xil_defaultlib.sysgen_shift_46a06dc853 
  port map (
    clr => '0',
    ip => cic_compiler_4_0_m_axis_data_tdata_real_net,
    clk => src_clk_net,
    ce => src_ce_net,
    op => shift_op_net
  );
  shift1 : entity xil_defaultlib.sysgen_shift_46a06dc853 
  port map (
    clr => '0',
    ip => cic_compiler_4_0_1_m_axis_data_tdata_real_net,
    clk => src_clk_net,
    ce => src_ce_net,
    op => shift1_op_net
  );
end structural;
-- Generated from Simulink block transmitter/DUT/Algorithm/LFSR
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity transmitter_lfsr is
  port (
    enable : in std_logic_vector( 1-1 downto 0 );
    s_tdata : in std_logic_vector( 2-1 downto 0 );
    s_tvalid : in std_logic_vector( 1-1 downto 0 );
    clk_1280 : in std_logic;
    ce_1280 : in std_logic;
    m_re_tdata : out std_logic_vector( 1-1 downto 0 );
    m_im_tdata : out std_logic_vector( 1-1 downto 0 )
  );
end transmitter_lfsr;
architecture structural of transmitter_lfsr is 
  signal lfsr_dout_net : std_logic_vector( 1-1 downto 0 );
  signal mux1_y_net : std_logic_vector( 1-1 downto 0 );
  signal mux1_y_net_x0 : std_logic_vector( 2-1 downto 0 );
  signal mux_y_net : std_logic_vector( 1-1 downto 0 );
  signal mux2_y_net : std_logic_vector( 1-1 downto 0 );
  signal dest_clk_net : std_logic;
  signal dest_ce_net : std_logic;
  signal enable_data_net : std_logic_vector( 1-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 1-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal lfsr1_dout_net : std_logic_vector( 1-1 downto 0 );
begin
  m_re_tdata <= mux1_y_net;
  m_im_tdata <= mux2_y_net;
  enable_data_net <= enable;
  mux1_y_net_x0 <= s_tdata;
  mux_y_net <= s_tvalid;
  dest_clk_net <= clk_1280;
  dest_ce_net <= ce_1280;
  lfsr : entity xil_defaultlib.sysgen_lfsr_f8990da5d1 
  port map (
    clr => '0',
    en => enable_data_net,
    clk => dest_clk_net,
    ce => dest_ce_net,
    dout => lfsr_dout_net
  );
  lfsr1 : entity xil_defaultlib.sysgen_lfsr_0bdcbb251b 
  port map (
    clr => '0',
    en => enable_data_net,
    clk => dest_clk_net,
    ce => dest_ce_net,
    dout => lfsr1_dout_net
  );
  mux1 : entity xil_defaultlib.sysgen_mux_81a2b1b804 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => mux_y_net,
    d0 => lfsr_dout_net,
    d1 => slice_y_net,
    y => mux1_y_net
  );
  mux2 : entity xil_defaultlib.sysgen_mux_81a2b1b804 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => mux_y_net,
    d0 => lfsr1_dout_net,
    d1 => slice1_y_net,
    y => mux2_y_net
  );
  slice : entity xil_defaultlib.transmitter_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 0,
    x_width => 2,
    y_width => 1
  )
  port map (
    x => mux1_y_net_x0,
    y => slice_y_net
  );
  slice1 : entity xil_defaultlib.transmitter_xlslice 
  generic map (
    new_lsb => 1,
    new_msb => 1,
    x_width => 2,
    y_width => 1
  )
  port map (
    x => mux1_y_net_x0,
    y => slice1_y_net
  );
end structural;
-- Generated from Simulink block transmitter/DUT/Algorithm/RRC
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity transmitter_rrc is
  port (
    s_re_tdata : in std_logic_vector( 16-1 downto 0 );
    s_im_tdata : in std_logic_vector( 16-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    clk_320 : in std_logic;
    ce_320 : in std_logic;
    clk_1280 : in std_logic;
    ce_1280 : in std_logic;
    m_re_tdata : out std_logic_vector( 16-1 downto 0 );
    m_im_tdata : out std_logic_vector( 16-1 downto 0 )
  );
end transmitter_rrc;
architecture structural of transmitter_rrc is 
  signal src_clk_net : std_logic;
  signal mux3_y_net : std_logic_vector( 16-1 downto 0 );
  signal src_ce_net : std_logic;
  signal ce_320_net : std_logic;
  signal dest_ce_net : std_logic;
  signal convert_dout_net : std_logic_vector( 16-1 downto 0 );
  signal convert1_dout_net : std_logic_vector( 16-1 downto 0 );
  signal clk_320_net : std_logic;
  signal mux1_y_net : std_logic_vector( 16-1 downto 0 );
  signal dest_clk_net : std_logic;
  signal fir_compiler_7_2_m_axis_data_tdata_path0_net : std_logic_vector( 31-1 downto 0 );
  signal fir_compiler_7_2_s_axis_data_tready_net : std_logic;
  signal fir_compiler_7_2_m_axis_data_tvalid_net : std_logic;
  signal fir_compiler_7_2_m_axis_data_tdata_path1_net : std_logic_vector( 31-1 downto 0 );
begin
  m_re_tdata <= convert_dout_net;
  m_im_tdata <= convert1_dout_net;
  mux1_y_net <= s_re_tdata;
  mux3_y_net <= s_im_tdata;
  src_clk_net <= clk_1;
  src_ce_net <= ce_1;
  clk_320_net <= clk_320;
  ce_320_net <= ce_320;
  dest_clk_net <= clk_1280;
  dest_ce_net <= ce_1280;
  convert : entity xil_defaultlib.transmitter_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 29,
    din_width => 31,
    dout_arith => 2,
    dout_bin_pt => 15,
    dout_width => 16,
    latency => 0,
    overflow => xlSaturate,
    quantization => xlRound
  )
  port map (
    clr => '0',
    en => "1",
    din => fir_compiler_7_2_m_axis_data_tdata_path1_net,
    clk => clk_320_net,
    ce => ce_320_net,
    dout => convert_dout_net
  );
  convert1 : entity xil_defaultlib.transmitter_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 29,
    din_width => 31,
    dout_arith => 2,
    dout_bin_pt => 15,
    dout_width => 16,
    latency => 0,
    overflow => xlSaturate,
    quantization => xlRound
  )
  port map (
    clr => '0',
    en => "1",
    din => fir_compiler_7_2_m_axis_data_tdata_path0_net,
    clk => clk_320_net,
    ce => ce_320_net,
    dout => convert1_dout_net
  );
  fir_compiler_7_2 : entity xil_defaultlib.xlfir_compiler_205c73803c3a1d01f8f0c298c8dd66b7 
  port map (
    s_axis_data_tdata_path1 => mux1_y_net,
    s_axis_data_tdata_path0 => mux3_y_net,
    src_clk => dest_clk_net,
    src_ce => dest_ce_net,
    clk => src_clk_net,
    ce => src_ce_net,
    clk_320 => clk_320_net,
    ce_320 => ce_320_net,
    clk_1280 => dest_clk_net,
    ce_1280 => dest_ce_net,
    clk_logic_1280 => dest_clk_net,
    ce_logic_1280 => dest_ce_net,
    s_axis_data_tready => fir_compiler_7_2_s_axis_data_tready_net,
    m_axis_data_tvalid => fir_compiler_7_2_m_axis_data_tvalid_net,
    m_axis_data_tdata_path1 => fir_compiler_7_2_m_axis_data_tdata_path1_net,
    m_axis_data_tdata_path0 => fir_compiler_7_2_m_axis_data_tdata_path0_net
  );
end structural;
-- Generated from Simulink block transmitter/DUT/Algorithm
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity transmitter_algorithm is
  port (
    enable_data : in std_logic_vector( 1-1 downto 0 );
    enable_tx : in std_logic_vector( 1-1 downto 0 );
    s_tdata : in std_logic_vector( 2-1 downto 0 );
    s_tvalid : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    clk_320 : in std_logic;
    ce_320 : in std_logic;
    clk_1280 : in std_logic;
    ce_1280 : in std_logic;
    m_re_tdata : out std_logic_vector( 16-1 downto 0 );
    m_im_tdata : out std_logic_vector( 16-1 downto 0 );
    m_tvalid : out std_logic
  );
end transmitter_algorithm;
architecture structural of transmitter_algorithm is 
  signal cmult1_p_net : std_logic_vector( 16-1 downto 0 );
  signal mux_y_net : std_logic_vector( 1-1 downto 0 );
  signal src_clk_net : std_logic;
  signal mux1_y_net_x1 : std_logic_vector( 2-1 downto 0 );
  signal cmult_p_net : std_logic_vector( 16-1 downto 0 );
  signal cic_compiler_4_0_m_axis_data_tvalid_net : std_logic;
  signal enable_data_net : std_logic_vector( 1-1 downto 0 );
  signal enable_tx_net : std_logic_vector( 1-1 downto 0 );
  signal mux2_y_net : std_logic_vector( 1-1 downto 0 );
  signal mux3_y_net : std_logic_vector( 16-1 downto 0 );
  signal src_ce_net : std_logic;
  signal mux1_y_net : std_logic_vector( 1-1 downto 0 );
  signal clk_320_net : std_logic;
  signal convert1_dout_net : std_logic_vector( 16-1 downto 0 );
  signal ce_320_net : std_logic;
  signal dest_ce_net : std_logic;
  signal mux1_y_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal dest_clk_net : std_logic;
  signal convert_dout_net : std_logic_vector( 16-1 downto 0 );
begin
  m_re_tdata <= cmult_p_net;
  m_im_tdata <= cmult1_p_net;
  m_tvalid <= cic_compiler_4_0_m_axis_data_tvalid_net;
  enable_data_net <= enable_data;
  enable_tx_net <= enable_tx;
  mux1_y_net_x1 <= s_tdata;
  mux_y_net <= s_tvalid;
  src_clk_net <= clk_1;
  src_ce_net <= ce_1;
  clk_320_net <= clk_320;
  ce_320_net <= ce_320;
  dest_clk_net <= clk_1280;
  dest_ce_net <= ce_1280;
  differential_encoder : entity xil_defaultlib.transmitter_differential_encoder 
  port map (
    tx_output => enable_tx_net,
    s_re_tdata => mux1_y_net,
    s_im_tdata => mux2_y_net,
    clk_1280 => dest_clk_net,
    ce_1280 => dest_ce_net,
    m_re_tdata => mux1_y_net_x0,
    m_im_tdata => mux3_y_net
  );
  interpolation : entity xil_defaultlib.transmitter_interpolation 
  port map (
    s_re_tdata => convert_dout_net,
    s_im_tdata => convert1_dout_net,
    clk_1 => src_clk_net,
    ce_1 => src_ce_net,
    clk_320 => clk_320_net,
    ce_320 => ce_320_net,
    m_re_tdata => cmult_p_net,
    m_im_tdata => cmult1_p_net,
    m_tvalid => cic_compiler_4_0_m_axis_data_tvalid_net
  );
  lfsr : entity xil_defaultlib.transmitter_lfsr 
  port map (
    enable => enable_data_net,
    s_tdata => mux1_y_net_x1,
    s_tvalid => mux_y_net,
    clk_1280 => dest_clk_net,
    ce_1280 => dest_ce_net,
    m_re_tdata => mux1_y_net,
    m_im_tdata => mux2_y_net
  );
  rrc : entity xil_defaultlib.transmitter_rrc 
  port map (
    s_re_tdata => mux1_y_net_x0,
    s_im_tdata => mux3_y_net,
    clk_1 => src_clk_net,
    ce_1 => src_ce_net,
    clk_320 => clk_320_net,
    ce_320 => ce_320_net,
    clk_1280 => dest_clk_net,
    ce_1280 => dest_ce_net,
    m_re_tdata => convert_dout_net,
    m_im_tdata => convert1_dout_net
  );
end structural;
-- Generated from Simulink block transmitter/DUT
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity transmitter_dut is
  port (
    s_reg_enable : in std_logic_vector( 1-1 downto 0 );
    s_enable_tx : in std_logic_vector( 1-1 downto 0 );
    s_modulation : in std_logic_vector( 1-1 downto 0 );
    s_axis_tdata : in std_logic_vector( 8-1 downto 0 );
    s_axis_tlast : in std_logic_vector( 1-1 downto 0 );
    s_axis_tvalid : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    clk_320 : in std_logic;
    ce_320 : in std_logic;
    clk_1280 : in std_logic;
    ce_1280 : in std_logic;
    clk_5120 : in std_logic;
    ce_5120 : in std_logic;
    clk_10240 : in std_logic;
    ce_10240 : in std_logic;
    m_axis_tdata : out std_logic_vector( 32-1 downto 0 );
    m_axis_tvalid : out std_logic_vector( 1-1 downto 0 );
    s_axis_tready : out std_logic_vector( 1-1 downto 0 )
  );
end transmitter_dut;
architecture structural of transmitter_dut is 
  signal src_ce_net : std_logic;
  signal src_clk_net : std_logic;
  signal clk_320_net : std_logic;
  signal s_axis_tlast_net : std_logic_vector( 1-1 downto 0 );
  signal concat_y_net : std_logic_vector( 32-1 downto 0 );
  signal dest_clk_net : std_logic;
  signal dest_clk_net_x0 : std_logic;
  signal dest_ce_net : std_logic;
  signal mux_y_net : std_logic_vector( 1-1 downto 0 );
  signal dest_ce_net_x0 : std_logic;
  signal mux2_y_net : std_logic_vector( 1-1 downto 0 );
  signal cic_compiler_4_0_m_axis_data_tvalid_net : std_logic_vector( 1-1 downto 0 );
  signal modulation_net : std_logic_vector( 1-1 downto 0 );
  signal s_axis_tdata_net : std_logic_vector( 8-1 downto 0 );
  signal ce_320_net : std_logic;
  signal s_axis_tvalid_net : std_logic_vector( 1-1 downto 0 );
  signal enable_tx_net : std_logic_vector( 1-1 downto 0 );
  signal src_clk_net_x0 : std_logic;
  signal enable_data_net : std_logic_vector( 1-1 downto 0 );
  signal src_ce_net_x0 : std_logic;
  signal cmult_p_net : std_logic_vector( 16-1 downto 0 );
  signal cmult1_p_net : std_logic_vector( 16-1 downto 0 );
  signal mux1_y_net : std_logic_vector( 2-1 downto 0 );
begin
  enable_data_net <= s_reg_enable;
  enable_tx_net <= s_enable_tx;
  modulation_net <= s_modulation;
  m_axis_tdata <= concat_y_net;
  m_axis_tvalid <= cic_compiler_4_0_m_axis_data_tvalid_net;
  s_axis_tdata_net <= s_axis_tdata;
  s_axis_tlast_net <= s_axis_tlast;
  s_axis_tready <= mux2_y_net;
  s_axis_tvalid_net <= s_axis_tvalid;
  src_clk_net <= clk_1;
  src_ce_net <= ce_1;
  clk_320_net <= clk_320;
  ce_320_net <= ce_320;
  dest_clk_net_x0 <= clk_1280;
  dest_ce_net_x0 <= ce_1280;
  dest_clk_net <= clk_5120;
  dest_ce_net <= ce_5120;
  src_clk_net_x0 <= clk_10240;
  src_ce_net_x0 <= ce_10240;
  axi_stream_master_interface : entity xil_defaultlib.transmitter_axi_stream_master_interface 
  port map (
    s_re_tdata => cmult_p_net,
    s_im_tdata => cmult1_p_net,
    s_tvalid => cic_compiler_4_0_m_axis_data_tvalid_net(0),
    m_axis_tdata => concat_y_net
  );
  axi_stream_slave_interface : entity xil_defaultlib.transmitter_axi_stream_slave_interface 
  port map (
    enable_tx => enable_tx_net,
    modulation => modulation_net,
    s_axis_tdata => s_axis_tdata_net,
    s_axis_tlast => s_axis_tlast_net,
    s_axis_tvalid => s_axis_tvalid_net,
    clk_1 => src_clk_net,
    ce_1 => src_ce_net,
    clk_1280 => dest_clk_net_x0,
    ce_1280 => dest_ce_net_x0,
    clk_5120 => dest_clk_net,
    ce_5120 => dest_ce_net,
    clk_10240 => src_clk_net_x0,
    ce_10240 => src_ce_net_x0,
    m_tdata => mux1_y_net,
    m_tvalid => mux_y_net,
    s_axis_tready => mux2_y_net
  );
  algorithm : entity xil_defaultlib.transmitter_algorithm 
  port map (
    enable_data => enable_data_net,
    enable_tx => enable_tx_net,
    s_tdata => mux1_y_net,
    s_tvalid => mux_y_net,
    clk_1 => src_clk_net,
    ce_1 => src_ce_net,
    clk_320 => clk_320_net,
    ce_320 => ce_320_net,
    clk_1280 => dest_clk_net_x0,
    ce_1280 => dest_ce_net_x0,
    m_re_tdata => cmult_p_net,
    m_im_tdata => cmult1_p_net,
    m_tvalid => cic_compiler_4_0_m_axis_data_tvalid_net(0)
  );
end structural;
-- Generated from Simulink block transmitter_struct
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity transmitter_struct is
  port (
    enable_data : in std_logic_vector( 1-1 downto 0 );
    enable_tx : in std_logic_vector( 1-1 downto 0 );
    modulation : in std_logic_vector( 1-1 downto 0 );
    m_axis_tready : in std_logic_vector( 1-1 downto 0 );
    s_axis_tdata : in std_logic_vector( 8-1 downto 0 );
    s_axis_tlast : in std_logic_vector( 1-1 downto 0 );
    s_axis_tvalid : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    clk_320 : in std_logic;
    ce_320 : in std_logic;
    clk_1280 : in std_logic;
    ce_1280 : in std_logic;
    clk_5120 : in std_logic;
    ce_5120 : in std_logic;
    clk_10240 : in std_logic;
    ce_10240 : in std_logic;
    m_axis_tdata : out std_logic_vector( 32-1 downto 0 );
    m_axis_tvalid : out std_logic_vector( 1-1 downto 0 );
    s_axis_tready : out std_logic_vector( 1-1 downto 0 )
  );
end transmitter_struct;
architecture structural of transmitter_struct is 
  signal enable_tx_net : std_logic_vector( 1-1 downto 0 );
  signal enable_data_net : std_logic_vector( 1-1 downto 0 );
  signal mux2_y_net : std_logic_vector( 1-1 downto 0 );
  signal src_clk_net : std_logic;
  signal cic_compiler_4_0_m_axis_data_tvalid_net : std_logic_vector( 1-1 downto 0 );
  signal src_ce_net_x0 : std_logic;
  signal modulation_net : std_logic_vector( 1-1 downto 0 );
  signal concat_y_net : std_logic_vector( 32-1 downto 0 );
  signal dest_ce_net : std_logic;
  signal clk_320_net : std_logic;
  signal src_clk_net_x0 : std_logic;
  signal m_axis_tready_net : std_logic_vector( 1-1 downto 0 );
  signal s_axis_tvalid_net : std_logic_vector( 1-1 downto 0 );
  signal s_axis_tdata_net : std_logic_vector( 8-1 downto 0 );
  signal s_axis_tlast_net : std_logic_vector( 1-1 downto 0 );
  signal src_ce_net : std_logic;
  signal ce_320_net : std_logic;
  signal dest_clk_net_x0 : std_logic;
  signal dest_ce_net_x0 : std_logic;
  signal dest_clk_net : std_logic;
begin
  enable_data_net <= enable_data;
  enable_tx_net <= enable_tx;
  modulation_net <= modulation;
  m_axis_tdata <= concat_y_net;
  m_axis_tready_net <= m_axis_tready;
  m_axis_tvalid <= cic_compiler_4_0_m_axis_data_tvalid_net;
  s_axis_tdata_net <= s_axis_tdata;
  s_axis_tlast_net <= s_axis_tlast;
  s_axis_tready <= mux2_y_net;
  s_axis_tvalid_net <= s_axis_tvalid;
  src_clk_net <= clk_1;
  src_ce_net <= ce_1;
  clk_320_net <= clk_320;
  ce_320_net <= ce_320;
  dest_clk_net_x0 <= clk_1280;
  dest_ce_net_x0 <= ce_1280;
  dest_clk_net <= clk_5120;
  dest_ce_net <= ce_5120;
  src_clk_net_x0 <= clk_10240;
  src_ce_net_x0 <= ce_10240;
  dut : entity xil_defaultlib.transmitter_dut 
  port map (
    s_reg_enable => enable_data_net,
    s_enable_tx => enable_tx_net,
    s_modulation => modulation_net,
    s_axis_tdata => s_axis_tdata_net,
    s_axis_tlast => s_axis_tlast_net,
    s_axis_tvalid => s_axis_tvalid_net,
    clk_1 => src_clk_net,
    ce_1 => src_ce_net,
    clk_320 => clk_320_net,
    ce_320 => ce_320_net,
    clk_1280 => dest_clk_net_x0,
    ce_1280 => dest_ce_net_x0,
    clk_5120 => dest_clk_net,
    ce_5120 => dest_ce_net,
    clk_10240 => src_clk_net_x0,
    ce_10240 => src_ce_net_x0,
    m_axis_tdata => concat_y_net,
    m_axis_tvalid => cic_compiler_4_0_m_axis_data_tvalid_net,
    s_axis_tready => mux2_y_net
  );
end structural;
-- Generated from Simulink block 
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity transmitter_default_clock_driver is
  port (
    transmitter_sysclk : in std_logic;
    transmitter_sysce : in std_logic;
    transmitter_sysclr : in std_logic;
    transmitter_clk1 : out std_logic;
    transmitter_ce1 : out std_logic;
    transmitter_clk320 : out std_logic;
    transmitter_ce320 : out std_logic;
    transmitter_clk1280 : out std_logic;
    transmitter_ce1280 : out std_logic;
    transmitter_clk5120 : out std_logic;
    transmitter_ce5120 : out std_logic;
    transmitter_clk10240 : out std_logic;
    transmitter_ce10240 : out std_logic
  );
end transmitter_default_clock_driver;
architecture structural of transmitter_default_clock_driver is 
begin
  clockdriver_x3 : entity xil_defaultlib.xlclockdriver 
  generic map (
    period => 1,
    log_2_period => 1
  )
  port map (
    sysclk => transmitter_sysclk,
    sysce => transmitter_sysce,
    sysclr => transmitter_sysclr,
    clk => transmitter_clk1,
    ce => transmitter_ce1
  );
  clockdriver_x2 : entity xil_defaultlib.xlclockdriver 
  generic map (
    period => 320,
    log_2_period => 9
  )
  port map (
    sysclk => transmitter_sysclk,
    sysce => transmitter_sysce,
    sysclr => transmitter_sysclr,
    clk => transmitter_clk320,
    ce => transmitter_ce320
  );
  clockdriver_x1 : entity xil_defaultlib.xlclockdriver 
  generic map (
    period => 1280,
    log_2_period => 11
  )
  port map (
    sysclk => transmitter_sysclk,
    sysce => transmitter_sysce,
    sysclr => transmitter_sysclr,
    clk => transmitter_clk1280,
    ce => transmitter_ce1280
  );
  clockdriver_x0 : entity xil_defaultlib.xlclockdriver 
  generic map (
    period => 5120,
    log_2_period => 13
  )
  port map (
    sysclk => transmitter_sysclk,
    sysce => transmitter_sysce,
    sysclr => transmitter_sysclr,
    clk => transmitter_clk5120,
    ce => transmitter_ce5120
  );
  clockdriver : entity xil_defaultlib.xlclockdriver 
  generic map (
    period => 10240,
    log_2_period => 14
  )
  port map (
    sysclk => transmitter_sysclk,
    sysce => transmitter_sysce,
    sysclr => transmitter_sysclr,
    clk => transmitter_clk10240,
    ce => transmitter_ce10240
  );
end structural;
-- Generated from Simulink block 
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity transmitter is
  port (
    m_axis_tready : in std_logic_vector( 1-1 downto 0 );
    s_axis_tdata : in std_logic_vector( 8-1 downto 0 );
    s_axis_tlast : in std_logic_vector( 1-1 downto 0 );
    s_axis_tvalid : in std_logic_vector( 1-1 downto 0 );
    clk : in std_logic;
    transmitter_aresetn : in std_logic;
    transmitter_s_axi_awaddr : in std_logic_vector( 4-1 downto 0 );
    transmitter_s_axi_awvalid : in std_logic;
    transmitter_s_axi_wdata : in std_logic_vector( 32-1 downto 0 );
    transmitter_s_axi_wstrb : in std_logic_vector( 4-1 downto 0 );
    transmitter_s_axi_wvalid : in std_logic;
    transmitter_s_axi_bready : in std_logic;
    transmitter_s_axi_araddr : in std_logic_vector( 4-1 downto 0 );
    transmitter_s_axi_arvalid : in std_logic;
    transmitter_s_axi_rready : in std_logic;
    m_axis_tdata : out std_logic_vector( 32-1 downto 0 );
    m_axis_tvalid : out std_logic_vector( 1-1 downto 0 );
    s_axis_tready : out std_logic_vector( 1-1 downto 0 );
    transmitter_s_axi_awready : out std_logic;
    transmitter_s_axi_wready : out std_logic;
    transmitter_s_axi_bresp : out std_logic_vector( 2-1 downto 0 );
    transmitter_s_axi_bvalid : out std_logic;
    transmitter_s_axi_arready : out std_logic;
    transmitter_s_axi_rdata : out std_logic_vector( 32-1 downto 0 );
    transmitter_s_axi_rresp : out std_logic_vector( 2-1 downto 0 );
    transmitter_s_axi_rvalid : out std_logic
  );
end transmitter;
architecture structural of transmitter is 
  attribute core_generation_info : string;
  attribute core_generation_info of structural : architecture is "transmitter,sysgen_core_2020_2,{,compilation=IP Catalog,block_icon_display=Default,family=zynquplusRFSOC,part=xczu28dr,speed=-2-e,package=ffvg1517,synthesis_language=vhdl,hdl_library=xil_defaultlib,synthesis_strategy=Vivado Synthesis Defaults,implementation_strategy=Vivado Implementation Defaults,testbench=0,interface_doc=0,ce_clr=0,clock_period=7.8125,system_simulink_period=7.8125e-09,waveform_viewer=0,axilite_interface=1,ip_catalog_plugin=0,hwcosim_burst_mode=0,simulation_time=0.002,cic_compiler_v4_0=2,cmult=2,concat=3,constant=8,convert=2,dsamp=2,fifo=2,fir_compiler_v7_2=1,inv=6,lfsr=2,logical=4,mux=11,p2s=2,register=7,reinterpret=2,shift=2,slice=4,usamp=2,}";
  signal clk_net : std_logic;
  signal ce_320_net : std_logic;
  signal clk_10240_net : std_logic;
  signal clk_1_net : std_logic;
  signal ce_10240_net : std_logic;
  signal clk_5120_net : std_logic;
  signal ce_1_net : std_logic;
  signal clk_1280_net : std_logic;
  signal ce_5120_net : std_logic;
  signal clk_320_net : std_logic;
  signal ce_1280_net : std_logic;
  signal enable_tx : std_logic_vector( 1-1 downto 0 );
  signal enable_data : std_logic_vector( 1-1 downto 0 );
  signal modulation : std_logic_vector( 1-1 downto 0 );
begin
  transmitter_axi_lite_interface : entity xil_defaultlib.transmitter_axi_lite_interface 
  port map (
    transmitter_s_axi_awaddr => transmitter_s_axi_awaddr,
    transmitter_s_axi_awvalid => transmitter_s_axi_awvalid,
    transmitter_s_axi_wdata => transmitter_s_axi_wdata,
    transmitter_s_axi_wstrb => transmitter_s_axi_wstrb,
    transmitter_s_axi_wvalid => transmitter_s_axi_wvalid,
    transmitter_s_axi_bready => transmitter_s_axi_bready,
    transmitter_s_axi_araddr => transmitter_s_axi_araddr,
    transmitter_s_axi_arvalid => transmitter_s_axi_arvalid,
    transmitter_s_axi_rready => transmitter_s_axi_rready,
    transmitter_aresetn => transmitter_aresetn,
    transmitter_aclk => clk,
    modulation => modulation,
    enable_tx => enable_tx,
    enable_data => enable_data,
    transmitter_s_axi_awready => transmitter_s_axi_awready,
    transmitter_s_axi_wready => transmitter_s_axi_wready,
    transmitter_s_axi_bresp => transmitter_s_axi_bresp,
    transmitter_s_axi_bvalid => transmitter_s_axi_bvalid,
    transmitter_s_axi_arready => transmitter_s_axi_arready,
    transmitter_s_axi_rdata => transmitter_s_axi_rdata,
    transmitter_s_axi_rresp => transmitter_s_axi_rresp,
    transmitter_s_axi_rvalid => transmitter_s_axi_rvalid,
    clk => clk_net
  );
  transmitter_default_clock_driver : entity xil_defaultlib.transmitter_default_clock_driver 
  port map (
    transmitter_sysclk => clk_net,
    transmitter_sysce => '1',
    transmitter_sysclr => '0',
    transmitter_clk1 => clk_1_net,
    transmitter_ce1 => ce_1_net,
    transmitter_clk320 => clk_320_net,
    transmitter_ce320 => ce_320_net,
    transmitter_clk1280 => clk_1280_net,
    transmitter_ce1280 => ce_1280_net,
    transmitter_clk5120 => clk_5120_net,
    transmitter_ce5120 => ce_5120_net,
    transmitter_clk10240 => clk_10240_net,
    transmitter_ce10240 => ce_10240_net
  );
  transmitter_struct : entity xil_defaultlib.transmitter_struct 
  port map (
    enable_data => enable_data,
    enable_tx => enable_tx,
    modulation => modulation,
    m_axis_tready => m_axis_tready,
    s_axis_tdata => s_axis_tdata,
    s_axis_tlast => s_axis_tlast,
    s_axis_tvalid => s_axis_tvalid,
    clk_1 => clk_1_net,
    ce_1 => ce_1_net,
    clk_320 => clk_320_net,
    ce_320 => ce_320_net,
    clk_1280 => clk_1280_net,
    ce_1280 => ce_1280_net,
    clk_5120 => clk_5120_net,
    ce_5120 => ce_5120_net,
    clk_10240 => clk_10240_net,
    ce_10240 => ce_10240_net,
    m_axis_tdata => m_axis_tdata,
    m_axis_tvalid => m_axis_tvalid,
    s_axis_tready => s_axis_tready
  );
end structural;
