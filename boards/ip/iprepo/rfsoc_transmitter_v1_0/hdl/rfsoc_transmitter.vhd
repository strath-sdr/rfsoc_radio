-- Generated from Simulink block rfsoc_transmitter/DUT/AXI-Stream Master Interface
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity rfsoc_transmitter_axi_stream_master_interface is
  port (
    s_tdata : in std_logic_vector( 16-1 downto 0 );
    s_tvalid : in std_logic;
    m_axis_tdata : out std_logic_vector( 32-1 downto 0 )
  );
end rfsoc_transmitter_axi_stream_master_interface;
architecture structural of rfsoc_transmitter_axi_stream_master_interface is 
  signal cic_compiler_4_0_m_axis_data_tvalid_net : std_logic;
  signal concat_y_net : std_logic_vector( 32-1 downto 0 );
  signal cmult_p_net : std_logic_vector( 16-1 downto 0 );
  signal constant_op_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret_output_port_net : std_logic_vector( 16-1 downto 0 );
begin
  cmult_p_net <= s_tdata;
  cic_compiler_4_0_m_axis_data_tvalid_net <= s_tvalid;
  m_axis_tdata <= concat_y_net;
  concat : entity xil_defaultlib.sysgen_concat_94b7aa7b0c 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    in0 => constant_op_net,
    in1 => reinterpret_output_port_net,
    y => concat_y_net
  );
  constant_x0 : entity xil_defaultlib.sysgen_constant_74f7df692e 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  reinterpret : entity xil_defaultlib.sysgen_reinterpret_16bf01b703 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => cmult_p_net,
    output_port => reinterpret_output_port_net
  );
end structural;
-- Generated from Simulink block rfsoc_transmitter/DUT/AXI-Stream Slave Interface
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity rfsoc_transmitter_axi_stream_slave_interface is
  port (
    s_axis_tdata : in std_logic_vector( 8-1 downto 0 );
    s_axis_tlast : in std_logic_vector( 1-1 downto 0 );
    s_axis_tvalid : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    clk_10240 : in std_logic;
    ce_10240 : in std_logic;
    m_tdata : out std_logic_vector( 8-1 downto 0 );
    m_tvalid : out std_logic_vector( 1-1 downto 0 );
    s_axis_tready : out std_logic_vector( 1-1 downto 0 )
  );
end rfsoc_transmitter_axi_stream_slave_interface;
architecture structural of rfsoc_transmitter_axi_stream_slave_interface is 
  signal down_sample_q_net : std_logic_vector( 1-1 downto 0 );
  signal fifo_empty_net : std_logic_vector( 1-1 downto 0 );
  signal src_clk_net : std_logic;
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal src_ce_net : std_logic;
  signal s_axis_tvalid_net : std_logic_vector( 1-1 downto 0 );
  signal constant_op_net : std_logic_vector( 8-1 downto 0 );
  signal ce_net : std_logic;
  signal concat_y_net : std_logic_vector( 9-1 downto 0 );
  signal clk_net : std_logic;
  signal fifo_dout_net : std_logic_vector( 9-1 downto 0 );
  signal fifo_full_net : std_logic;
  signal inverter1_op_net : std_logic;
  signal slice_y_net : std_logic_vector( 8-1 downto 0 );
  signal mux_y_net : std_logic_vector( 8-1 downto 0 );
  signal s_axis_tlast_net : std_logic_vector( 1-1 downto 0 );
  signal register_q_net : std_logic_vector( 1-1 downto 0 );
  signal s_axis_tdata_net : std_logic_vector( 8-1 downto 0 );
begin
  m_tdata <= mux_y_net;
  m_tvalid <= register_q_net;
  s_axis_tdata_net <= s_axis_tdata;
  s_axis_tlast_net <= s_axis_tlast;
  s_axis_tready <= inverter_op_net;
  s_axis_tvalid_net <= s_axis_tvalid;
  src_clk_net <= clk_1;
  src_ce_net <= ce_1;
  clk_net <= clk_10240;
  ce_net <= ce_10240;
  concat : entity xil_defaultlib.sysgen_concat_3be2a9eb7f 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    in0 => s_axis_tlast_net,
    in1 => s_axis_tdata_net,
    y => concat_y_net
  );
  constant_x0 : entity xil_defaultlib.sysgen_constant_79c4571525 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  down_sample : entity xil_defaultlib.rfsoc_transmitter_xldsamp 
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
    dest_clk => clk_net,
    dest_ce => ce_net,
    q => down_sample_q_net
  );
  fifo : entity xil_defaultlib.rfsoc_transmitter_xlfifogen_u 
  generic map (
    core_name0 => "rfsoc_transmitter_fifo_generator_i0",
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
    we => s_axis_tvalid_net(0),
    re => inverter1_op_net,
    clk => src_clk_net,
    ce => src_ce_net,
    we_ce => src_ce_net,
    re_ce => ce_net,
    dout => fifo_dout_net,
    empty => fifo_empty_net(0),
    full => fifo_full_net
  );
  inverter : entity xil_defaultlib.sysgen_inverter_d02fa8d6dc 
  port map (
    clr => '0',
    ip(0) => fifo_full_net,
    clk => src_clk_net,
    ce => src_ce_net,
    op => inverter_op_net
  );
  inverter1 : entity xil_defaultlib.sysgen_inverter_d02fa8d6dc 
  port map (
    clr => '0',
    ip => down_sample_q_net,
    clk => clk_net,
    ce => ce_net,
    op(0) => inverter1_op_net
  );
  mux : entity xil_defaultlib.sysgen_mux_f4ed60b2b8 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => register_q_net,
    d0 => constant_op_net,
    d1 => slice_y_net,
    y => mux_y_net
  );
  register_x0 : entity xil_defaultlib.rfsoc_transmitter_xlregister 
  generic map (
    d_width => 1,
    init_value => b"0"
  )
  port map (
    en => "1",
    rst => "0",
    d(0) => inverter1_op_net,
    clk => clk_net,
    ce => ce_net,
    q => register_q_net
  );
  slice : entity xil_defaultlib.rfsoc_transmitter_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 7,
    x_width => 9,
    y_width => 8
  )
  port map (
    x => fifo_dout_net,
    y => slice_y_net
  );
end structural;
-- Generated from Simulink block rfsoc_transmitter/DUT/Algorithm/BPSK Differential Encoder
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity rfsoc_transmitter_bpsk_differential_encoder is
  port (
    tx_output : in std_logic_vector( 1-1 downto 0 );
    s_tdata : in std_logic_vector( 1-1 downto 0 );
    clk_1280 : in std_logic;
    ce_1280 : in std_logic;
    m_tdata : out std_logic_vector( 16-1 downto 0 )
  );
end rfsoc_transmitter_bpsk_differential_encoder;
architecture structural of rfsoc_transmitter_bpsk_differential_encoder is 
  signal mux1_y_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal constant_op_net : std_logic_vector( 16-1 downto 0 );
  signal clk_net : std_logic;
  signal constant1_op_net : std_logic_vector( 16-1 downto 0 );
  signal ce_net : std_logic;
  signal mux1_y_net : std_logic_vector( 1-1 downto 0 );
  signal enable_tx_net : std_logic_vector( 1-1 downto 0 );
  signal logical_y_net : std_logic_vector( 1-1 downto 0 );
  signal constant2_op_net : std_logic_vector( 16-1 downto 0 );
  signal mux_y_net : std_logic_vector( 16-1 downto 0 );
  signal register_q_net : std_logic_vector( 1-1 downto 0 );
begin
  m_tdata <= mux1_y_net_x0;
  enable_tx_net <= tx_output;
  mux1_y_net <= s_tdata;
  clk_net <= clk_1280;
  ce_net <= ce_1280;
  constant_x0 : entity xil_defaultlib.sysgen_constant_dee388fa25 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  constant1 : entity xil_defaultlib.sysgen_constant_bcf29d51d8 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant1_op_net
  );
  constant2 : entity xil_defaultlib.sysgen_constant_74f7df692e 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant2_op_net
  );
  logical : entity xil_defaultlib.sysgen_logical_f6e84d60b5 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => register_q_net,
    d1 => mux1_y_net,
    y => logical_y_net
  );
  mux : entity xil_defaultlib.sysgen_mux_16fa93d9dc 
  port map (
    clr => '0',
    sel => logical_y_net,
    d0 => constant_op_net,
    d1 => constant1_op_net,
    clk => clk_net,
    ce => ce_net,
    y => mux_y_net
  );
  mux1 : entity xil_defaultlib.sysgen_mux_80af3b6bea 
  port map (
    clr => '0',
    sel => enable_tx_net,
    d0 => constant2_op_net,
    d1 => mux_y_net,
    clk => clk_net,
    ce => ce_net,
    y => mux1_y_net_x0
  );
  register_x0 : entity xil_defaultlib.rfsoc_transmitter_xlregister 
  generic map (
    d_width => 1,
    init_value => b"0"
  )
  port map (
    en => "1",
    rst => "0",
    d => logical_y_net,
    clk => clk_net,
    ce => ce_net,
    q => register_q_net
  );
end structural;
-- Generated from Simulink block rfsoc_transmitter/DUT/Algorithm/BPSK LFSR
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity rfsoc_transmitter_bpsk_lfsr is
  port (
    enable : in std_logic_vector( 1-1 downto 0 );
    s_tdata : in std_logic_vector( 8-1 downto 0 );
    s_tvalid : in std_logic_vector( 1-1 downto 0 );
    clk_1280 : in std_logic;
    ce_1280 : in std_logic;
    clk_10240 : in std_logic;
    ce_10240 : in std_logic;
    m_tdata : out std_logic_vector( 1-1 downto 0 )
  );
end rfsoc_transmitter_bpsk_lfsr;
architecture structural of rfsoc_transmitter_bpsk_lfsr is 
  signal ce_net : std_logic;
  signal mux1_y_net : std_logic_vector( 1-1 downto 0 );
  signal register_q_net_x0 : std_logic_vector( 1-1 downto 0 );
  signal mux_y_net : std_logic_vector( 8-1 downto 0 );
  signal enable_data_net : std_logic_vector( 1-1 downto 0 );
  signal ce_net_x0 : std_logic;
  signal clk_net_x0 : std_logic;
  signal clk_net : std_logic;
  signal up_sample_q_net : std_logic_vector( 1-1 downto 0 );
  signal lfsr_dout_net : std_logic_vector( 1-1 downto 0 );
  signal parallel_to_serial_dout_net : std_logic_vector( 1-1 downto 0 );
  signal register_q_net : std_logic_vector( 8-1 downto 0 );
begin
  m_tdata <= mux1_y_net;
  enable_data_net <= enable;
  mux_y_net <= s_tdata;
  register_q_net_x0 <= s_tvalid;
  clk_net <= clk_1280;
  ce_net <= ce_1280;
  clk_net_x0 <= clk_10240;
  ce_net_x0 <= ce_10240;
  lfsr : entity xil_defaultlib.sysgen_lfsr_a5e956b7fd 
  port map (
    clr => '0',
    en => enable_data_net,
    clk => clk_net,
    ce => ce_net,
    dout => lfsr_dout_net
  );
  mux1 : entity xil_defaultlib.sysgen_mux_f2b66b1cbd 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => up_sample_q_net,
    d0 => lfsr_dout_net,
    d1 => parallel_to_serial_dout_net,
    y => mux1_y_net
  );
  parallel_to_serial : entity xil_defaultlib.rfsoc_transmitter_xlp2s 
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
    din => register_q_net,
    src_clk => clk_net_x0,
    src_ce => ce_net_x0,
    dest_clk => clk_net,
    dest_ce => ce_net,
    dout => parallel_to_serial_dout_net
  );
  register_x0 : entity xil_defaultlib.rfsoc_transmitter_xlregister 
  generic map (
    d_width => 8,
    init_value => b"00000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => mux_y_net,
    clk => clk_net_x0,
    ce => ce_net_x0,
    q => register_q_net
  );
  up_sample : entity xil_defaultlib.rfsoc_transmitter_xlusamp 
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
    d => register_q_net_x0,
    src_clk => clk_net_x0,
    src_ce => ce_net_x0,
    dest_clk => clk_net,
    dest_ce => ce_net,
    q => up_sample_q_net
  );
end structural;
-- Generated from Simulink block rfsoc_transmitter/DUT/Algorithm/Interpolation
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity rfsoc_transmitter_interpolation is
  port (
    s_tdata : in std_logic_vector( 16-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    clk_320 : in std_logic;
    ce_320 : in std_logic;
    m_tdata : out std_logic_vector( 16-1 downto 0 );
    m_tvalid : out std_logic
  );
end rfsoc_transmitter_interpolation;
architecture structural of rfsoc_transmitter_interpolation is 
  signal src_ce_net : std_logic;
  signal ce_320_net : std_logic;
  signal cmult_p_net : std_logic_vector( 16-1 downto 0 );
  signal cic_compiler_4_0_m_axis_data_tvalid_net : std_logic;
  signal src_clk_net : std_logic;
  signal clk_320_net : std_logic;
  signal convert_dout_net : std_logic_vector( 16-1 downto 0 );
  signal cic_compiler_4_0_m_axis_data_tdata_real_net : std_logic_vector( 50-1 downto 0 );
  signal shift_op_net : std_logic_vector( 58-1 downto 0 );
  signal cic_compiler_4_0_s_axis_data_tready_net : std_logic;
begin
  m_tdata <= cmult_p_net;
  m_tvalid <= cic_compiler_4_0_m_axis_data_tvalid_net;
  convert_dout_net <= s_tdata;
  src_clk_net <= clk_1;
  src_ce_net <= ce_1;
  clk_320_net <= clk_320;
  ce_320_net <= ce_320;
  cic_compiler_4_0 : entity xil_defaultlib.xlcic_compiler_dbf269e11e14510fca9acc4f3e76cc41 
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
  cmult : entity xil_defaultlib.rfsoc_transmitter_xlcmult 
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
    core_name0 => "rfsoc_transmitter_mult_gen_v12_0_i0",
    extra_registers => 0,
    multsign => 2,
    overflow => 2,
    p_arith => xlSigned,
    p_bin_pt => 14,
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
  shift : entity xil_defaultlib.sysgen_shift_16a19a1464 
  port map (
    clr => '0',
    ip => cic_compiler_4_0_m_axis_data_tdata_real_net,
    clk => src_clk_net,
    ce => src_ce_net,
    op => shift_op_net
  );
end structural;
-- Generated from Simulink block rfsoc_transmitter/DUT/Algorithm/RRC
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity rfsoc_transmitter_rrc is
  port (
    s_tdata : in std_logic_vector( 16-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    clk_320 : in std_logic;
    ce_320 : in std_logic;
    clk_1280 : in std_logic;
    ce_1280 : in std_logic;
    m_tdata : out std_logic_vector( 16-1 downto 0 )
  );
end rfsoc_transmitter_rrc;
architecture structural of rfsoc_transmitter_rrc is 
  signal src_ce_net : std_logic;
  signal ce_320_net : std_logic;
  signal ce_net : std_logic;
  signal mux1_y_net : std_logic_vector( 16-1 downto 0 );
  signal clk_320_net : std_logic;
  signal src_clk_net : std_logic;
  signal clk_net : std_logic;
  signal convert_dout_net : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tdata_real_net : std_logic_vector( 31-1 downto 0 );
  signal fir_compiler_7_2_s_axis_data_tready_net : std_logic;
  signal fir_compiler_7_2_m_axis_data_tvalid_net : std_logic;
begin
  m_tdata <= convert_dout_net;
  mux1_y_net <= s_tdata;
  src_clk_net <= clk_1;
  src_ce_net <= ce_1;
  clk_320_net <= clk_320;
  ce_320_net <= ce_320;
  clk_net <= clk_1280;
  ce_net <= ce_1280;
  convert : entity xil_defaultlib.rfsoc_transmitter_xlconvert 
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
    clk => clk_320_net,
    ce => ce_320_net,
    dout => convert_dout_net
  );
  fir_compiler_7_2 : entity xil_defaultlib.xlfir_compiler_37f00839f3a2ae0d301dee662c702cf4 
  port map (
    s_axis_data_tdata_real => mux1_y_net,
    src_clk => clk_net,
    src_ce => ce_net,
    clk => src_clk_net,
    ce => src_ce_net,
    clk_320 => clk_320_net,
    ce_320 => ce_320_net,
    clk_1280 => clk_net,
    ce_1280 => ce_net,
    clk_logic_1280 => clk_net,
    ce_logic_1280 => ce_net,
    s_axis_data_tready => fir_compiler_7_2_s_axis_data_tready_net,
    m_axis_data_tvalid => fir_compiler_7_2_m_axis_data_tvalid_net,
    m_axis_data_tdata_real => fir_compiler_7_2_m_axis_data_tdata_real_net
  );
end structural;
-- Generated from Simulink block rfsoc_transmitter/DUT/Algorithm
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity rfsoc_transmitter_algorithm is
  port (
    enable_data : in std_logic_vector( 1-1 downto 0 );
    enable_tx : in std_logic_vector( 1-1 downto 0 );
    s_tdata : in std_logic_vector( 8-1 downto 0 );
    s_tvalid : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    clk_320 : in std_logic;
    ce_320 : in std_logic;
    clk_1280 : in std_logic;
    ce_1280 : in std_logic;
    clk_10240 : in std_logic;
    ce_10240 : in std_logic;
    m_tdata : out std_logic_vector( 16-1 downto 0 );
    m_tvalid : out std_logic
  );
end rfsoc_transmitter_algorithm;
architecture structural of rfsoc_transmitter_algorithm is 
  signal ce_net_x0 : std_logic;
  signal convert_dout_net : std_logic_vector( 16-1 downto 0 );
  signal mux1_y_net : std_logic_vector( 1-1 downto 0 );
  signal register_q_net : std_logic_vector( 1-1 downto 0 );
  signal enable_tx_net : std_logic_vector( 1-1 downto 0 );
  signal mux_y_net : std_logic_vector( 8-1 downto 0 );
  signal src_clk_net : std_logic;
  signal clk_net : std_logic;
  signal cic_compiler_4_0_m_axis_data_tvalid_net : std_logic;
  signal ce_net : std_logic;
  signal clk_320_net : std_logic;
  signal enable_data_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net_x0 : std_logic;
  signal mux1_y_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal ce_320_net : std_logic;
  signal src_ce_net : std_logic;
  signal cmult_p_net : std_logic_vector( 16-1 downto 0 );
begin
  m_tdata <= cmult_p_net;
  m_tvalid <= cic_compiler_4_0_m_axis_data_tvalid_net;
  enable_data_net <= enable_data;
  enable_tx_net <= enable_tx;
  mux_y_net <= s_tdata;
  register_q_net <= s_tvalid;
  src_clk_net <= clk_1;
  src_ce_net <= ce_1;
  clk_320_net <= clk_320;
  ce_320_net <= ce_320;
  clk_net <= clk_1280;
  ce_net <= ce_1280;
  clk_net_x0 <= clk_10240;
  ce_net_x0 <= ce_10240;
  bpsk_differential_encoder : entity xil_defaultlib.rfsoc_transmitter_bpsk_differential_encoder 
  port map (
    tx_output => enable_tx_net,
    s_tdata => mux1_y_net,
    clk_1280 => clk_net,
    ce_1280 => ce_net,
    m_tdata => mux1_y_net_x0
  );
  bpsk_lfsr : entity xil_defaultlib.rfsoc_transmitter_bpsk_lfsr 
  port map (
    enable => enable_data_net,
    s_tdata => mux_y_net,
    s_tvalid => register_q_net,
    clk_1280 => clk_net,
    ce_1280 => ce_net,
    clk_10240 => clk_net_x0,
    ce_10240 => ce_net_x0,
    m_tdata => mux1_y_net
  );
  interpolation : entity xil_defaultlib.rfsoc_transmitter_interpolation 
  port map (
    s_tdata => convert_dout_net,
    clk_1 => src_clk_net,
    ce_1 => src_ce_net,
    clk_320 => clk_320_net,
    ce_320 => ce_320_net,
    m_tdata => cmult_p_net,
    m_tvalid => cic_compiler_4_0_m_axis_data_tvalid_net
  );
  rrc : entity xil_defaultlib.rfsoc_transmitter_rrc 
  port map (
    s_tdata => mux1_y_net_x0,
    clk_1 => src_clk_net,
    ce_1 => src_ce_net,
    clk_320 => clk_320_net,
    ce_320 => ce_320_net,
    clk_1280 => clk_net,
    ce_1280 => ce_net,
    m_tdata => convert_dout_net
  );
end structural;
-- Generated from Simulink block rfsoc_transmitter/DUT
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity rfsoc_transmitter_dut is
  port (
    s_reg_enable : in std_logic_vector( 1-1 downto 0 );
    s_enable_tx : in std_logic_vector( 1-1 downto 0 );
    s_axis_tdata : in std_logic_vector( 8-1 downto 0 );
    s_axis_tlast : in std_logic_vector( 1-1 downto 0 );
    s_axis_tvalid : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    clk_320 : in std_logic;
    ce_320 : in std_logic;
    clk_1280 : in std_logic;
    ce_1280 : in std_logic;
    clk_10240 : in std_logic;
    ce_10240 : in std_logic;
    m_axis_tdata : out std_logic_vector( 32-1 downto 0 );
    m_axis_tvalid : out std_logic_vector( 1-1 downto 0 );
    s_axis_tready : out std_logic_vector( 1-1 downto 0 )
  );
end rfsoc_transmitter_dut;
architecture structural of rfsoc_transmitter_dut is 
  signal clk_320_net : std_logic;
  signal register_q_net : std_logic_vector( 1-1 downto 0 );
  signal ce_net_x0 : std_logic;
  signal src_clk_net : std_logic;
  signal ce_net : std_logic;
  signal clk_net : std_logic;
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net_x0 : std_logic;
  signal s_axis_tvalid_net : std_logic_vector( 1-1 downto 0 );
  signal ce_320_net : std_logic;
  signal cmult_p_net : std_logic_vector( 16-1 downto 0 );
  signal src_ce_net : std_logic;
  signal mux_y_net : std_logic_vector( 8-1 downto 0 );
  signal concat_y_net : std_logic_vector( 32-1 downto 0 );
  signal cic_compiler_4_0_m_axis_data_tvalid_net : std_logic_vector( 1-1 downto 0 );
  signal enable_data_net : std_logic_vector( 1-1 downto 0 );
  signal enable_tx_net : std_logic_vector( 1-1 downto 0 );
  signal s_axis_tdata_net : std_logic_vector( 8-1 downto 0 );
  signal s_axis_tlast_net : std_logic_vector( 1-1 downto 0 );
begin
  enable_data_net <= s_reg_enable;
  enable_tx_net <= s_enable_tx;
  m_axis_tdata <= concat_y_net;
  m_axis_tvalid <= cic_compiler_4_0_m_axis_data_tvalid_net;
  s_axis_tdata_net <= s_axis_tdata;
  s_axis_tlast_net <= s_axis_tlast;
  s_axis_tready <= inverter_op_net;
  s_axis_tvalid_net <= s_axis_tvalid;
  src_clk_net <= clk_1;
  src_ce_net <= ce_1;
  clk_320_net <= clk_320;
  ce_320_net <= ce_320;
  clk_net <= clk_1280;
  ce_net <= ce_1280;
  clk_net_x0 <= clk_10240;
  ce_net_x0 <= ce_10240;
  axi_stream_master_interface : entity xil_defaultlib.rfsoc_transmitter_axi_stream_master_interface 
  port map (
    s_tdata => cmult_p_net,
    s_tvalid => cic_compiler_4_0_m_axis_data_tvalid_net(0),
    m_axis_tdata => concat_y_net
  );
  axi_stream_slave_interface : entity xil_defaultlib.rfsoc_transmitter_axi_stream_slave_interface 
  port map (
    s_axis_tdata => s_axis_tdata_net,
    s_axis_tlast => s_axis_tlast_net,
    s_axis_tvalid => s_axis_tvalid_net,
    clk_1 => src_clk_net,
    ce_1 => src_ce_net,
    clk_10240 => clk_net_x0,
    ce_10240 => ce_net_x0,
    m_tdata => mux_y_net,
    m_tvalid => register_q_net,
    s_axis_tready => inverter_op_net
  );
  algorithm : entity xil_defaultlib.rfsoc_transmitter_algorithm 
  port map (
    enable_data => enable_data_net,
    enable_tx => enable_tx_net,
    s_tdata => mux_y_net,
    s_tvalid => register_q_net,
    clk_1 => src_clk_net,
    ce_1 => src_ce_net,
    clk_320 => clk_320_net,
    ce_320 => ce_320_net,
    clk_1280 => clk_net,
    ce_1280 => ce_net,
    clk_10240 => clk_net_x0,
    ce_10240 => ce_net_x0,
    m_tdata => cmult_p_net,
    m_tvalid => cic_compiler_4_0_m_axis_data_tvalid_net(0)
  );
end structural;
-- Generated from Simulink block rfsoc_transmitter_struct
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity rfsoc_transmitter_struct is
  port (
    enable_data : in std_logic_vector( 1-1 downto 0 );
    enable_tx : in std_logic_vector( 1-1 downto 0 );
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
    clk_10240 : in std_logic;
    ce_10240 : in std_logic;
    m_axis_tdata : out std_logic_vector( 32-1 downto 0 );
    m_axis_tvalid : out std_logic_vector( 1-1 downto 0 );
    s_axis_tready : out std_logic_vector( 1-1 downto 0 )
  );
end rfsoc_transmitter_struct;
architecture structural of rfsoc_transmitter_struct is 
  signal ce_320_net : std_logic;
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal clk_net_x0 : std_logic;
  signal ce_net_x0 : std_logic;
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal s_axis_tvalid_net : std_logic_vector( 1-1 downto 0 );
  signal src_clk_net : std_logic;
  signal enable_tx_net : std_logic_vector( 1-1 downto 0 );
  signal enable_data_net : std_logic_vector( 1-1 downto 0 );
  signal m_axis_tready_net : std_logic_vector( 1-1 downto 0 );
  signal concat_y_net : std_logic_vector( 32-1 downto 0 );
  signal cic_compiler_4_0_m_axis_data_tvalid_net : std_logic_vector( 1-1 downto 0 );
  signal s_axis_tdata_net : std_logic_vector( 8-1 downto 0 );
  signal s_axis_tlast_net : std_logic_vector( 1-1 downto 0 );
  signal clk_320_net : std_logic;
  signal src_ce_net : std_logic;
begin
  enable_data_net <= enable_data;
  enable_tx_net <= enable_tx;
  m_axis_tdata <= concat_y_net;
  m_axis_tready_net <= m_axis_tready;
  m_axis_tvalid <= cic_compiler_4_0_m_axis_data_tvalid_net;
  s_axis_tdata_net <= s_axis_tdata;
  s_axis_tlast_net <= s_axis_tlast;
  s_axis_tready <= inverter_op_net;
  s_axis_tvalid_net <= s_axis_tvalid;
  src_clk_net <= clk_1;
  src_ce_net <= ce_1;
  clk_320_net <= clk_320;
  ce_320_net <= ce_320;
  clk_net <= clk_1280;
  ce_net <= ce_1280;
  clk_net_x0 <= clk_10240;
  ce_net_x0 <= ce_10240;
  dut : entity xil_defaultlib.rfsoc_transmitter_dut 
  port map (
    s_reg_enable => enable_data_net,
    s_enable_tx => enable_tx_net,
    s_axis_tdata => s_axis_tdata_net,
    s_axis_tlast => s_axis_tlast_net,
    s_axis_tvalid => s_axis_tvalid_net,
    clk_1 => src_clk_net,
    ce_1 => src_ce_net,
    clk_320 => clk_320_net,
    ce_320 => ce_320_net,
    clk_1280 => clk_net,
    ce_1280 => ce_net,
    clk_10240 => clk_net_x0,
    ce_10240 => ce_net_x0,
    m_axis_tdata => concat_y_net,
    m_axis_tvalid => cic_compiler_4_0_m_axis_data_tvalid_net,
    s_axis_tready => inverter_op_net
  );
end structural;
-- Generated from Simulink block 
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity rfsoc_transmitter_default_clock_driver is
  port (
    rfsoc_transmitter_sysclk : in std_logic;
    rfsoc_transmitter_sysce : in std_logic;
    rfsoc_transmitter_sysclr : in std_logic;
    rfsoc_transmitter_clk1 : out std_logic;
    rfsoc_transmitter_ce1 : out std_logic;
    rfsoc_transmitter_clk320 : out std_logic;
    rfsoc_transmitter_ce320 : out std_logic;
    rfsoc_transmitter_clk1280 : out std_logic;
    rfsoc_transmitter_ce1280 : out std_logic;
    rfsoc_transmitter_clk10240 : out std_logic;
    rfsoc_transmitter_ce10240 : out std_logic
  );
end rfsoc_transmitter_default_clock_driver;
architecture structural of rfsoc_transmitter_default_clock_driver is 
begin
  clockdriver_x2 : entity xil_defaultlib.xlclockdriver 
  generic map (
    period => 1,
    log_2_period => 1
  )
  port map (
    sysclk => rfsoc_transmitter_sysclk,
    sysce => rfsoc_transmitter_sysce,
    sysclr => rfsoc_transmitter_sysclr,
    clk => rfsoc_transmitter_clk1,
    ce => rfsoc_transmitter_ce1
  );
  clockdriver_x1 : entity xil_defaultlib.xlclockdriver 
  generic map (
    period => 320,
    log_2_period => 9
  )
  port map (
    sysclk => rfsoc_transmitter_sysclk,
    sysce => rfsoc_transmitter_sysce,
    sysclr => rfsoc_transmitter_sysclr,
    clk => rfsoc_transmitter_clk320,
    ce => rfsoc_transmitter_ce320
  );
  clockdriver_x0 : entity xil_defaultlib.xlclockdriver 
  generic map (
    period => 1280,
    log_2_period => 11
  )
  port map (
    sysclk => rfsoc_transmitter_sysclk,
    sysce => rfsoc_transmitter_sysce,
    sysclr => rfsoc_transmitter_sysclr,
    clk => rfsoc_transmitter_clk1280,
    ce => rfsoc_transmitter_ce1280
  );
  clockdriver : entity xil_defaultlib.xlclockdriver 
  generic map (
    period => 10240,
    log_2_period => 14
  )
  port map (
    sysclk => rfsoc_transmitter_sysclk,
    sysce => rfsoc_transmitter_sysce,
    sysclr => rfsoc_transmitter_sysclr,
    clk => rfsoc_transmitter_clk10240,
    ce => rfsoc_transmitter_ce10240
  );
end structural;
-- Generated from Simulink block 
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity rfsoc_transmitter is
  port (
    m_axis_tready : in std_logic_vector( 1-1 downto 0 );
    s_axis_tdata : in std_logic_vector( 8-1 downto 0 );
    s_axis_tlast : in std_logic_vector( 1-1 downto 0 );
    s_axis_tvalid : in std_logic_vector( 1-1 downto 0 );
    clk : in std_logic;
    rfsoc_transmitter_aresetn : in std_logic;
    rfsoc_transmitter_s_axi_awaddr : in std_logic_vector( 3-1 downto 0 );
    rfsoc_transmitter_s_axi_awvalid : in std_logic;
    rfsoc_transmitter_s_axi_wdata : in std_logic_vector( 32-1 downto 0 );
    rfsoc_transmitter_s_axi_wstrb : in std_logic_vector( 4-1 downto 0 );
    rfsoc_transmitter_s_axi_wvalid : in std_logic;
    rfsoc_transmitter_s_axi_bready : in std_logic;
    rfsoc_transmitter_s_axi_araddr : in std_logic_vector( 3-1 downto 0 );
    rfsoc_transmitter_s_axi_arvalid : in std_logic;
    rfsoc_transmitter_s_axi_rready : in std_logic;
    m_axis_tdata : out std_logic_vector( 32-1 downto 0 );
    m_axis_tvalid : out std_logic_vector( 1-1 downto 0 );
    s_axis_tready : out std_logic_vector( 1-1 downto 0 );
    rfsoc_transmitter_s_axi_awready : out std_logic;
    rfsoc_transmitter_s_axi_wready : out std_logic;
    rfsoc_transmitter_s_axi_bresp : out std_logic_vector( 2-1 downto 0 );
    rfsoc_transmitter_s_axi_bvalid : out std_logic;
    rfsoc_transmitter_s_axi_arready : out std_logic;
    rfsoc_transmitter_s_axi_rdata : out std_logic_vector( 32-1 downto 0 );
    rfsoc_transmitter_s_axi_rresp : out std_logic_vector( 2-1 downto 0 );
    rfsoc_transmitter_s_axi_rvalid : out std_logic
  );
end rfsoc_transmitter;
architecture structural of rfsoc_transmitter is 
  attribute core_generation_info : string;
  attribute core_generation_info of structural : architecture is "rfsoc_transmitter,sysgen_core_2020_1,{,compilation=IP Catalog,block_icon_display=Default,family=zynquplusRFSOC,part=xczu28dr,speed=-2-e,package=ffvg1517,synthesis_language=vhdl,hdl_library=xil_defaultlib,synthesis_strategy=Vivado Synthesis Defaults,implementation_strategy=Vivado Implementation Defaults,testbench=0,interface_doc=0,ce_clr=0,clock_period=7.8125,system_simulink_period=7.8125e-09,waveform_viewer=0,axilite_interface=1,ip_catalog_plugin=0,hwcosim_burst_mode=0,simulation_time=0.0004,cic_compiler_v4_0=1,cmult=1,concat=2,constant=5,convert=2,dsamp=1,fifo=1,fir_compiler_v7_2=1,inv=2,lfsr=1,logical=2,mux=4,p2s=1,register=3,reinterpret=1,shift=1,slice=2,usamp=1,}";
  signal enable_data : std_logic_vector( 1-1 downto 0 );
  signal enable_tx : std_logic_vector( 1-1 downto 0 );
  signal ce_1280_net : std_logic;
  signal clk_1280_net : std_logic;
  signal clk_1_net : std_logic;
  signal ce_10240_net : std_logic;
  signal clk_10240_net : std_logic;
  signal ce_1_net : std_logic;
  signal clk_320_net : std_logic;
  signal ce_320_net : std_logic;
  signal clk_net : std_logic;
begin
  rfsoc_transmitter_axi_lite_interface : entity xil_defaultlib.rfsoc_transmitter_axi_lite_interface 
  port map (
    rfsoc_transmitter_s_axi_awaddr => rfsoc_transmitter_s_axi_awaddr,
    rfsoc_transmitter_s_axi_awvalid => rfsoc_transmitter_s_axi_awvalid,
    rfsoc_transmitter_s_axi_wdata => rfsoc_transmitter_s_axi_wdata,
    rfsoc_transmitter_s_axi_wstrb => rfsoc_transmitter_s_axi_wstrb,
    rfsoc_transmitter_s_axi_wvalid => rfsoc_transmitter_s_axi_wvalid,
    rfsoc_transmitter_s_axi_bready => rfsoc_transmitter_s_axi_bready,
    rfsoc_transmitter_s_axi_araddr => rfsoc_transmitter_s_axi_araddr,
    rfsoc_transmitter_s_axi_arvalid => rfsoc_transmitter_s_axi_arvalid,
    rfsoc_transmitter_s_axi_rready => rfsoc_transmitter_s_axi_rready,
    rfsoc_transmitter_aresetn => rfsoc_transmitter_aresetn,
    rfsoc_transmitter_aclk => clk,
    enable_tx => enable_tx,
    enable_data => enable_data,
    rfsoc_transmitter_s_axi_awready => rfsoc_transmitter_s_axi_awready,
    rfsoc_transmitter_s_axi_wready => rfsoc_transmitter_s_axi_wready,
    rfsoc_transmitter_s_axi_bresp => rfsoc_transmitter_s_axi_bresp,
    rfsoc_transmitter_s_axi_bvalid => rfsoc_transmitter_s_axi_bvalid,
    rfsoc_transmitter_s_axi_arready => rfsoc_transmitter_s_axi_arready,
    rfsoc_transmitter_s_axi_rdata => rfsoc_transmitter_s_axi_rdata,
    rfsoc_transmitter_s_axi_rresp => rfsoc_transmitter_s_axi_rresp,
    rfsoc_transmitter_s_axi_rvalid => rfsoc_transmitter_s_axi_rvalid,
    clk => clk_net
  );
  rfsoc_transmitter_default_clock_driver : entity xil_defaultlib.rfsoc_transmitter_default_clock_driver 
  port map (
    rfsoc_transmitter_sysclk => clk_net,
    rfsoc_transmitter_sysce => '1',
    rfsoc_transmitter_sysclr => '0',
    rfsoc_transmitter_clk1 => clk_1_net,
    rfsoc_transmitter_ce1 => ce_1_net,
    rfsoc_transmitter_clk320 => clk_320_net,
    rfsoc_transmitter_ce320 => ce_320_net,
    rfsoc_transmitter_clk1280 => clk_1280_net,
    rfsoc_transmitter_ce1280 => ce_1280_net,
    rfsoc_transmitter_clk10240 => clk_10240_net,
    rfsoc_transmitter_ce10240 => ce_10240_net
  );
  rfsoc_transmitter_struct : entity xil_defaultlib.rfsoc_transmitter_struct 
  port map (
    enable_data => enable_data,
    enable_tx => enable_tx,
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
    clk_10240 => clk_10240_net,
    ce_10240 => ce_10240_net,
    m_axis_tdata => m_axis_tdata,
    m_axis_tvalid => m_axis_tvalid,
    s_axis_tready => s_axis_tready
  );
end structural;
