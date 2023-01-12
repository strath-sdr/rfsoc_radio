-------------------------------------------------------------------
-- System Generator version 2020.2 VHDL source file.
--
-- Copyright(C) 2020 by Xilinx, Inc.  All rights reserved.  This
-- text/file contains proprietary, confidential information of Xilinx,
-- Inc., is distributed under license from Xilinx, Inc., and may be used,
-- copied and/or disclosed only pursuant to the terms of a valid license
-- agreement with Xilinx, Inc.  Xilinx hereby grants you a license to use
-- this text/file solely for design, simulation, implementation and
-- creation of design files limited to Xilinx devices or technologies.
-- Use with non-Xilinx devices or technologies is expressly prohibited
-- and immediately terminates your license unless covered by a separate
-- agreement.
--
-- Xilinx is providing this design, code, or information "as is" solely
-- for use in developing programs and solutions for Xilinx devices.  By
-- providing this design, code, or information as one possible
-- implementation of this feature, application or standard, Xilinx is
-- making no representation that this implementation is free from any
-- claims of infringement.  You are responsible for obtaining any rights
-- you may require for your implementation.  Xilinx expressly disclaims
-- any warranty whatsoever with respect to the adequacy of the
-- implementation, including but not limited to warranties of
-- merchantability or fitness for a particular purpose.
--
-- Xilinx products are not intended for use in life support appliances,
-- devices, or systems.  Use in such applications is expressly prohibited.
--
-- Any modifications that are made to the source code are done at the user's
-- sole risk and will be unsupported.
--
-- This copyright and support notice must be retained as part of this
-- text at all times.  (c) Copyright 1995-2020 Xilinx, Inc.  All rights
-- reserved.
-------------------------------------------------------------------

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_concat_6c550c917a is
  port (
    in0 : in std_logic_vector((16 - 1) downto 0);
    in1 : in std_logic_vector((16 - 1) downto 0);
    y : out std_logic_vector((32 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_concat_6c550c917a;
architecture behavior of sysgen_concat_6c550c917a
is
  signal in0_1_23: unsigned((16 - 1) downto 0);
  signal in1_1_27: unsigned((16 - 1) downto 0);
  signal y_2_1_concat: unsigned((32 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_reinterpret_c573d47a5b is
  port (
    input_port : in std_logic_vector((16 - 1) downto 0);
    output_port : out std_logic_vector((16 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_reinterpret_c573d47a5b;
architecture behavior of sysgen_reinterpret_c573d47a5b
is
  signal input_port_1_40: signed((16 - 1) downto 0);
  signal output_port_5_5_force: unsigned((16 - 1) downto 0);
begin
  input_port_1_40 <= std_logic_vector_to_signed(input_port);
  output_port_5_5_force <= signed_to_unsigned(input_port_1_40);
  output_port <= unsigned_to_std_logic_vector(output_port_5_5_force);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

---------------------------------------------------------------------
--
--  Filename      : xldsamp.vhd
--
--  Description   : VHDL description of a block that is inserted into the
--                  data path to down sample the data betwen two blocks
--                  where the period is different between two blocks.
--
--  Mod. History  : Changed clock timing on the down sampler.  The
--                  destination enable is delayed by one system clock
--                  cycle and held until the next consecutive source
--                  enable pulse.  This change allows downsampler data
--                  transitions to occur on the rising clock edge when
--                  the destination ce is asserted.
--                : Added optional latency is the downsampler.  Note, if
--                  the latency is greater than 0, no shutter is used.
--                : Removed valid bit logic from wrapper
--
--
---------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;


-- synthesis translate_off
library unisim;
use unisim.vcomponents.all;
-- synthesis translate_on

entity transmitter_xldsamp is
  generic (
    d_width: integer := 12;
    d_bin_pt: integer := 0;
    d_arith: integer := xlUnsigned;
    q_width: integer := 12;
    q_bin_pt: integer := 0;
    q_arith: integer := xlUnsigned;
    en_width: integer := 1;
    en_bin_pt: integer := 0;
    en_arith: integer := xlUnsigned;
    rst_width: integer := 1;
    rst_bin_pt: integer := 0;
    rst_arith: integer := xlUnsigned;
    ds_ratio: integer := 2;
    phase: integer := 0;
    latency: integer := 1
  );
  port (
    d: in std_logic_vector(d_width - 1 downto 0);
    src_clk: in std_logic;
    src_ce: in std_logic;
    src_clr: in std_logic;
    dest_clk: in std_logic;
    dest_ce: in std_logic;
    dest_clr: in std_logic;
    en: in std_logic_vector(en_width - 1 downto 0);
    rst: in std_logic_vector(rst_width - 1 downto 0);
    q: out std_logic_vector(q_width - 1 downto 0)
  );
end transmitter_xldsamp;

architecture struct of transmitter_xldsamp is
  component synth_reg
    generic (
      width: integer := 16;
      latency: integer := 5
    );
    port (
      i: in std_logic_vector(width - 1 downto 0);
      ce: in std_logic;
      clr: in std_logic;
      clk: in std_logic;
      o: out std_logic_vector(width - 1 downto 0)
    );
  end component; -- end synth_reg

  component synth_reg_reg
     generic (width       : integer;
              latency     : integer);
     port (i       : in std_logic_vector(width-1 downto 0);
           ce      : in std_logic;
           clr     : in std_logic;
           clk     : in std_logic;
           o       : out std_logic_vector(width-1 downto 0));
  end component;

  component fdse
    port (
      q: out   std_ulogic;
      d: in    std_ulogic;
      c: in    std_ulogic;
      s: in    std_ulogic;
      ce: in    std_ulogic
    );
  end component; -- end fdse
  attribute syn_black_box of fdse: component is true;
  attribute fpga_dont_touch of fdse: component is "true";

  signal adjusted_dest_ce: std_logic;
  signal adjusted_dest_ce_w_en: std_logic;
  signal dest_ce_w_en: std_logic;
  signal smpld_d: std_logic_vector(d_width-1 downto 0);
  signal sclr:std_logic;
begin
  -- An 'adjusted' destination clock enable signal must be generated for
  -- the zero latency and double registered down-sampler implementations.
  -- For both cases, it is necassary to adjust the timing of the clock
  -- enable so that it is asserted at the start of the sample period,
  -- instead of the end.  This is realized using an fdse prim. to register
  -- the destination clock enable.  The fdse itself is enabled with the
  -- source clock enable.  Enabling the fdse holds the adjusted CE high
  -- for the duration of the fast sample period and is needed to satisfy
  -- the multicycle constraint if the input data is running at a non-system
  -- rate.
  adjusted_ce_needed: if ((latency = 0) or (phase /= (ds_ratio - 1))) generate
    dest_ce_reg: fdse
      port map (
        q => adjusted_dest_ce,
        d => dest_ce,
        c => src_clk,
        s => sclr,
        ce => src_ce
      );
  end generate; -- adjusted_ce_needed

  -- A shutter (mux/reg pair) is used to implement a 0 latency downsampler.
  -- The shutter uses the adjusted destination clock enable to select between
  -- the current input and the sampled input.
  latency_eq_0: if (latency = 0) generate
    shutter_d_reg: synth_reg
      generic map (
        width => d_width,
        latency => 1
      )
      port map (
        i => d,
        ce => adjusted_dest_ce,
        clr => sclr,
        clk => src_clk,
        o => smpld_d
      );

    -- Mux selects current input value or register value.
    shutter_mux: process (adjusted_dest_ce, d, smpld_d)
    begin
	  if adjusted_dest_ce = '0' then
        q <= smpld_d;
      else
        q <= d;
      end if;
    end process; -- end select_mux
  end generate; -- end latency_eq_0

  -- A more efficient downsampler can be implemented if a latency > 0 is
  -- allowed.  There are two possible implementations, depending on the
  -- requested sampling phase.  A double register downsampler is needed
  -- for all cases except when the sample phase is the last input frame
  -- of the sample period.  In this case, only one register is needed.

  latency_gt_0: if (latency > 0) generate
    -- The first register in the double reg implementation is used to
    -- sample the correct frame (phase) of the input data.  Both the
    -- data and valid bit must be sampled.
    dbl_reg_test: if (phase /= (ds_ratio-1)) generate
        smpl_d_reg: synth_reg_reg
          generic map (
            width => d_width,
            latency => 1
          )
          port map (
            i => d,
            ce => adjusted_dest_ce_w_en,
            clr => sclr,
            clk => src_clk,
            o => smpld_d
          );
    end generate; -- end dbl_reg_test

    sngl_reg_test: if (phase = (ds_ratio -1)) generate
      smpld_d <= d;
    end generate; -- sngl_reg_test

    -- The latency pipe captures the sampled data and the END of the sample
    -- period.  Note that if the requested sample phase is the last input
    -- frame in the period, the first register (smpl_reg) is not needed.
    latency_pipe: synth_reg_reg
      generic map (
        width => d_width,
        latency => latency
      )
      port map (
        i => smpld_d,
        ce => dest_ce_w_en,
        clr => sclr,
        clk => dest_clk,
        o => q
      );
  end generate; -- end latency_gt_0

  -- Signal assignments
  dest_ce_w_en <= dest_ce and en(0);
  adjusted_dest_ce_w_en <= adjusted_dest_ce and en(0);
  sclr <= (src_clr or rst(0)) and dest_ce;
end architecture struct;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_inverter_dbb2213157 is
  port (
    ip : in std_logic_vector((1 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_inverter_dbb2213157;
architecture behavior of sysgen_inverter_dbb2213157
is
  signal ip_1_26: boolean;
  type array_type_op_mem_22_20 is array (0 to (1 - 1)) of boolean;
  signal op_mem_22_20: array_type_op_mem_22_20 := (
    0 => false);
  signal op_mem_22_20_front_din: boolean;
  signal op_mem_22_20_back: boolean;
  signal op_mem_22_20_push_front_pop_back_en: std_logic;
  signal internal_ip_12_1_bitnot: boolean;
begin
  ip_1_26 <= ((ip) = "1");
  op_mem_22_20_back <= op_mem_22_20(0);
  proc_op_mem_22_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_22_20_push_front_pop_back_en = '1')) then
        op_mem_22_20(0) <= op_mem_22_20_front_din;
      end if;
    end if;
  end process proc_op_mem_22_20;
  internal_ip_12_1_bitnot <= ((not boolean_to_vector(ip_1_26)) = "1");
  op_mem_22_20_push_front_pop_back_en <= '0';
  op <= boolean_to_vector(internal_ip_12_1_bitnot);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_logical_5314756dce is
  port (
    d0 : in std_logic_vector((1 - 1) downto 0);
    d1 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_logical_5314756dce;
architecture behavior of sysgen_logical_5314756dce
is
  signal d0_1_24: std_logic;
  signal d1_1_27: std_logic;
  signal fully_2_1_bit: std_logic;
begin
  d0_1_24 <= d0(0);
  d1_1_27 <= d1(0);
  fully_2_1_bit <= d0_1_24 and d1_1_27;
  y <= std_logic_to_vector(fully_2_1_bit);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_mux_a9922b7d67 is
  port (
    sel : in std_logic_vector((1 - 1) downto 0);
    d0 : in std_logic_vector((1 - 1) downto 0);
    d1 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_mux_a9922b7d67;
architecture behavior of sysgen_mux_a9922b7d67
is
  signal sel_1_20: std_logic;
  signal d0_1_24: std_logic;
  signal d1_1_27: std_logic;
  signal sel_internal_2_1_convert: std_logic_vector((1 - 1) downto 0);
  signal unregy_join_6_1: std_logic;
begin
  sel_1_20 <= sel(0);
  d0_1_24 <= d0(0);
  d1_1_27 <= d1(0);
  sel_internal_2_1_convert <= cast(std_logic_to_vector(sel_1_20), 0, 1, 0, xlUnsigned);
  proc_switch_6_1: process (d0_1_24, d1_1_27, sel_internal_2_1_convert)
  is
  begin
    case sel_internal_2_1_convert is 
      when "0" =>
        unregy_join_6_1 <= d0_1_24;
      when others =>
        unregy_join_6_1 <= d1_1_27;
    end case;
  end process proc_switch_6_1;
  y <= std_logic_to_vector(unregy_join_6_1);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_mux_a3b8477e84 is
  port (
    sel : in std_logic_vector((1 - 1) downto 0);
    d0 : in std_logic_vector((1 - 1) downto 0);
    d1 : in std_logic_vector((2 - 1) downto 0);
    y : out std_logic_vector((2 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_mux_a3b8477e84;
architecture behavior of sysgen_mux_a3b8477e84
is
  signal sel_1_20: std_logic;
  signal d0_1_24: std_logic_vector((1 - 1) downto 0);
  signal d1_1_27: std_logic_vector((2 - 1) downto 0);
  signal sel_internal_2_1_convert: std_logic_vector((1 - 1) downto 0);
  signal unregy_join_6_1: std_logic_vector((2 - 1) downto 0);
begin
  sel_1_20 <= sel(0);
  d0_1_24 <= d0;
  d1_1_27 <= d1;
  sel_internal_2_1_convert <= cast(std_logic_to_vector(sel_1_20), 0, 1, 0, xlUnsigned);
  proc_switch_6_1: process (d0_1_24, d1_1_27, sel_internal_2_1_convert)
  is
  begin
    case sel_internal_2_1_convert is 
      when "0" =>
        unregy_join_6_1 <= cast(d0_1_24, 0, 2, 0, xlUnsigned);
      when others =>
        unregy_join_6_1 <= d1_1_27;
    end case;
  end process proc_switch_6_1;
  y <= unregy_join_6_1;
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

---------------------------------------------------------------------
--
--  Filename      : xlregister.vhd
--
--  Description   : VHDL description of an arbitrary wide register.
--                  Unlike the delay block, an initial value is
--                  specified and is considered valid at the start
--                  of simulation.  The register is only one word
--                  deep.
--
--  Mod. History  : Removed valid bit logic from wrapper.
--                : Changed VHDL to use a bit_vector generic for its
--
---------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;


entity transmitter_xlregister is

   generic (d_width          : integer := 5;          -- Width of d input
            init_value       : bit_vector := b"00");  -- Binary init value string

   port (d   : in std_logic_vector (d_width-1 downto 0);
         rst : in std_logic_vector(0 downto 0) := "0";
         en  : in std_logic_vector(0 downto 0) := "1";
         ce  : in std_logic;
         clk : in std_logic;
         q   : out std_logic_vector (d_width-1 downto 0));

end transmitter_xlregister;

architecture behavior of transmitter_xlregister is

   component synth_reg_w_init
      generic (width      : integer;
               init_index : integer;
               init_value : bit_vector;
               latency    : integer);
      port (i   : in std_logic_vector(width-1 downto 0);
            ce  : in std_logic;
            clr : in std_logic;
            clk : in std_logic;
            o   : out std_logic_vector(width-1 downto 0));
   end component; -- end synth_reg_w_init

   -- synthesis translate_off
   signal real_d, real_q           : real;    -- For debugging info ports
   -- synthesis translate_on
   signal internal_clr             : std_logic;
   signal internal_ce              : std_logic;

begin

   internal_clr <= rst(0) and ce;
   internal_ce  <= en(0) and ce;

   -- Synthesizable behavioral model
   synth_reg_inst : synth_reg_w_init
      generic map (width      => d_width,
                   init_index => 2,
                   init_value => init_value,
                   latency    => 1)
      port map (i   => d,
                ce  => internal_ce,
                clr => internal_clr,
                clk => clk,
                o   => q);

end architecture behavior;


library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_concat_5c2d28a2d6 is
  port (
    in0 : in std_logic_vector((1 - 1) downto 0);
    in1 : in std_logic_vector((8 - 1) downto 0);
    y : out std_logic_vector((9 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_concat_5c2d28a2d6;
architecture behavior of sysgen_concat_5c2d28a2d6
is
  signal in0_1_23: unsigned((1 - 1) downto 0);
  signal in1_1_27: unsigned((8 - 1) downto 0);
  signal y_2_1_concat: unsigned((9 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_30184e3d5a is
  port (
    op : out std_logic_vector((8 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_30184e3d5a;
architecture behavior of sysgen_constant_30184e3d5a
is
begin
  op <= "00000000";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_9079c173aa is
  port (
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_9079c173aa;
architecture behavior of sysgen_constant_9079c173aa
is
begin
  op <= "0";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_mux_dd7c3a5195 is
  port (
    sel : in std_logic_vector((1 - 1) downto 0);
    d0 : in std_logic_vector((8 - 1) downto 0);
    d1 : in std_logic_vector((8 - 1) downto 0);
    y : out std_logic_vector((8 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_mux_dd7c3a5195;
architecture behavior of sysgen_mux_dd7c3a5195
is
  signal sel_1_20: std_logic;
  signal d0_1_24: std_logic_vector((8 - 1) downto 0);
  signal d1_1_27: std_logic_vector((8 - 1) downto 0);
  signal sel_internal_2_1_convert: std_logic_vector((1 - 1) downto 0);
  signal unregy_join_6_1: std_logic_vector((8 - 1) downto 0);
begin
  sel_1_20 <= sel(0);
  d0_1_24 <= d0;
  d1_1_27 <= d1;
  sel_internal_2_1_convert <= cast(std_logic_to_vector(sel_1_20), 0, 1, 0, xlUnsigned);
  proc_switch_6_1: process (d0_1_24, d1_1_27, sel_internal_2_1_convert)
  is
  begin
    case sel_internal_2_1_convert is 
      when "0" =>
        unregy_join_6_1 <= d0_1_24;
      when others =>
        unregy_join_6_1 <= d1_1_27;
    end case;
  end process proc_switch_6_1;
  y <= unregy_join_6_1;
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;


--------------------------------------------------------------------------
--
--  Filename      : xlp2s.vhd
--
--  Description   : Synthesizable vhdl for a parallel to serial
--                  conversion block.
--
--  Mod. History  : Modified VHDL to work with new clock enable scheme.
--                  Made valid bit a pasthru.  Added a register to generate
--                  the select line for the mux that switches between the
--                  input data and shift register outputs.
--                : Added rst/en support
--
-------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;


-- synthesis translate_off
library unisim;
use unisim.vcomponents.all;
-- synthesis translate_on

entity transmitter_xlp2s is
    generic (dout_width  : integer := 8;          -- output width
             dout_arith  : integer := xlSigned;   -- output arith type
             dout_bin_pt : integer := 0;          -- output binary point location
             din_width   : integer := 1;          -- input width
             din_arith   : integer := xlUnsigned; -- input arith type
             din_bin_pt  : integer := 0;          -- input binary point location
             rst_width   : integer := 1;          -- width of input rst
             rst_bin_pt  : integer := 0;          -- binary point of input rst
             rst_arith   : integer := xlUnsigned; -- type of arith of input rst
             en_width    : integer := 1;          -- width of input en
             en_bin_pt   : integer := 0;          -- binary point of input en
             en_arith    : integer := xlUnsigned; -- type of arith of input en
             lsb_first   : integer := 0;          -- lsb or msb
             latency     : integer := 0;          -- latency from mask
             num_outputs : integer := 0);         -- num of outputs per input

    port (din        : in std_logic_vector (din_width-1 downto 0);
          src_ce     : in std_logic;     -- slower input clock
          src_clr    : in std_logic;
          src_clk    : in std_logic;
          dest_ce    : in std_logic;     -- faster output clock
          dest_clr   : in std_logic;
          dest_clk   : in std_logic;
          rst        : in std_logic_vector(rst_width-1 downto 0);
          en         : in std_logic_vector(en_width-1 downto 0);
          dout       : out std_logic_vector (dout_width-1 downto 0));

end transmitter_xlp2s;

architecture synth_behavioral of transmitter_xlp2s is

    component FDSE
        port(q  : out STD_ULOGIC;
             d  : in  STD_ULOGIC;
             c  : in  STD_ULOGIC;
             ce : in  STD_ULOGIC;
             s  : in  STD_ULOGIC);
    end component; -- end FDSE

    attribute syn_black_box of FDSE : component is true;
    attribute fpga_dont_touch of FDSE : component is "true";

    component synth_reg
        generic (width   : integer;
                 latency : integer);
        port (i   : in std_logic_vector(width-1 downto 0);
              ce  : in std_logic;
              clr : in std_logic;
              clk : in std_logic;
              o   : out std_logic_vector(width-1 downto 0));
    end component;

    component synth_reg_w_init
        generic (width      : integer;
                 init_index : integer;
                 latency    : integer);
        port (i   : in std_logic_vector(width-1 downto 0);
              ce  : in std_logic;
              clr : in std_logic;
              clk : in std_logic;
              o   : out std_logic_vector(width-1 downto 0));
    end component; -- end synth_reg_w_init

    type temp_array is array (0 to num_outputs-1) of std_logic_vector(dout_width-1 downto 0);

    signal i : temp_array; -- put input into capture register
    signal o : temp_array; -- outputfrom capture
    signal dout_temp        : std_logic_vector(dout_width -1 downto 0);
    signal src_ce_hold      : std_logic;
    signal internal_src_ce  : std_logic;
    signal internal_dest_ce : std_logic;
    signal internal_clr     : std_logic;

begin

    internal_src_ce   <= src_ce_hold and (en(0));
    internal_dest_ce  <= dest_ce and (en(0));
    internal_clr      <= ((dest_clr or src_clr ) and dest_ce) or rst(0);

    -- Register and hold the source enable signal until the next consecutive
    -- destination enable.  This signal is used as the mux select line for
    -- the mux in front of the shift register and the data output mux.

    src_ce_reg : FDSE
    port map (q  => src_ce_hold,
              d  => src_ce,
              c  => src_clk,
              ce => dest_ce,
              s  => src_clr);

    -- input is put into the capture register

    lsb_is_first: if(lsb_first = 1) generate

       fd_array: for index in num_outputs - 1 downto 0 generate
          capture : synth_reg_w_init
             generic map (width      => dout_width,
                          init_index => 0,
                          latency    => 1)
             port map (i   => i(index),
                       ce  => internal_dest_ce,
                       clr => internal_clr,
                       clk => dest_clk,
                       o   => o(index));
       end generate; -- end fd_array

       -- put new input into the capture register or put the same data back
       -- into the capture register
       -- the when statements are inferred into muxes by xst

       signal_select : for idx in num_outputs -1 downto 0 generate
          signal_0: if(idx < num_outputs-1)generate
             i(idx) <=  din((idx+1)*dout_width+dout_width-1 downto (idx+1)*dout_width)
                        when internal_src_ce = '1' else o(idx+1);
          end generate;  -- end signal_0
          signal_1: if(idx = num_outputs-1)generate
             i(idx) <=  din(idx*dout_width+dout_width-1 downto idx*dout_width)
                        when internal_src_ce = '1' else o(idx);
          end generate;  -- end signal_1
      end generate;  -- end signal_select

      -- Output the least sig bits when the delayed src_ce_hold is 1 else output
      -- bits from the capture register.  This line will infer a mux on the
      -- output data.

      dout_temp <= o(0) when internal_src_ce = '0' else din(dout_width-1 downto 0);

    end generate; -- end lsb_is_first

    msb_is_first: if(lsb_first = 0) generate

       fd_array: for index in num_outputs - 1 downto 0 generate
          capture : synth_reg_w_init
             generic map (width      => dout_width,
                          init_index => 0,
                          latency    => 1)
             port map (i   => i(index),
                       ce  => internal_dest_ce,
                       clr => internal_clr,
                       clk => dest_clk,
                       o   => o(index));
       end generate; -- end fd_array

       signal_select : for idx in num_outputs -1 downto 0 generate
          signal_0: if(idx < num_outputs-1)generate
             i(idx) <=  din(din_width-1-(idx+1)*dout_width downto din_width-1 - (idx+1)*dout_width-dout_width+1)
                        when internal_src_ce = '1' else o(idx+1);
          end generate; -- end signal_0
          signal_1: if(idx = num_outputs-1)generate
             i(idx) <=  din(din_width-1-idx*dout_width downto din_width-1-idx*dout_width-dout_width+1)
                        when internal_src_ce = '1' else o(idx);
          end generate; -- end signal_1
       end generate; -- end signal_select

       -- when src_ce is 1 output the most significant bits block has 0 latency

       dout_temp <= o(0) when internal_src_ce = '0'
                         else din(din_width-1 downto din_width-dout_width);

    end generate; -- end msb_is_first

    -- add registers for output data to compensate for
    -- the requested latency

    latency_gt_0 : if (latency > 0) generate
      data_reg : synth_reg
          generic map (width   => dout_width,
                       latency => latency)
          port map (i   => dout_temp,
                    ce  => internal_dest_ce,
                    clr => internal_clr,
                    clk => dest_clk,
                    o   => dout);
    end generate; -- end latency_gt_0

    latency0 : if (latency = 0 ) generate
       dout       <= dout_temp;
    end generate; -- end latency0

end architecture synth_behavioral;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_relational_6f5c4058bd is
  port (
    a : in std_logic_vector((10 - 1) downto 0);
    b : in std_logic_vector((1 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_relational_6f5c4058bd;
architecture behavior of sysgen_relational_6f5c4058bd
is
  signal a_1_31: unsigned((10 - 1) downto 0);
  signal b_1_34: unsigned((1 - 1) downto 0);
  signal cast_12_17: unsigned((10 - 1) downto 0);
  signal result_12_3_rel: boolean;
begin
  a_1_31 <= std_logic_vector_to_unsigned(a);
  b_1_34 <= std_logic_vector_to_unsigned(b);
  cast_12_17 <= u2u_cast(b_1_34, 0, 10, 0);
  result_12_3_rel <= a_1_31 = cast_12_17;
  op <= boolean_to_vector(result_12_3_rel);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

---------------------------------------------------------------------
--
--  Filename      : xlslice.vhd
--
--  Description   : VHDL description of a block that sets the output to a
--                  specified range of the input bits. The output is always
--                  set to an unsigned type with it's binary point at zero.
--
---------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;


entity transmitter_xlslice is
    generic (
        new_msb      : integer := 9;           -- position of new msb
        new_lsb      : integer := 1;           -- position of new lsb
        x_width      : integer := 16;          -- Width of x input
        y_width      : integer := 8);          -- Width of y output
    port (
        x : in std_logic_vector (x_width-1 downto 0);
        y : out std_logic_vector (y_width-1 downto 0));
end transmitter_xlslice;

architecture behavior of transmitter_xlslice is
begin
    y <= x(new_msb downto new_lsb);
end  behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

----------------------------------------------------------------------------
--
--  Filename      : xlusamp.vhd
--
--  Description   : VHDL description of an up sampler.  The input signal
--                  has a larger period than the output signal's period
--                  and the blocks's period is set on the Simulink mask
--                  GUI.
--
--  Assumptions   : Input size, bin_pt, etc. are the same as the output
--
--  Mod. History  : Removed the shutter from the upsampler.  A mux is used
--                  to zero pad the data samples.  The mux select line is
--                  generated by registering the source enable signal
--                  when the destination ce is asserted.
--                : Removed valid bits from wrapper.
--
----------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;


-- synthesis translate_off
library unisim;
use unisim.vcomponents.all;
-- synthesis translate_on

entity transmitter_xlusamp is

    generic (
             d_width      : integer := 5;          -- Width of d input
             d_bin_pt     : integer := 2;          -- Binary point of input d
             d_arith      : integer := xlUnsigned; -- Type of arith of d input
             q_width      : integer := 5;          -- Width of q output
             q_bin_pt     : integer := 2;          -- Binary point of output q
             q_arith      : integer := xlUnsigned; -- Type of arith of output
             en_width     : integer := 1;
             en_bin_pt    : integer := 0;
             en_arith     : integer := xlUnsigned;
             sampling_ratio     : integer := 2;
             latency      : integer := 1;
             copy_samples : integer := 0);         -- if 0, output q = 0
                                                   -- when ce = 0, else sample
                                                   -- is held until next clk

    port (
          d        : in std_logic_vector (d_width-1 downto 0);
          src_clk  : in std_logic;
          src_ce   : in std_logic;
          src_clr  : in std_logic;
          dest_clk : in std_logic;
          dest_ce  : in std_logic;
          dest_clr : in std_logic;
          en       : in std_logic_vector(en_width-1 downto 0);
          q        : out std_logic_vector (q_width-1 downto 0)
         );
end transmitter_xlusamp;

architecture struct of transmitter_xlusamp is
    component synth_reg
      generic (
        width: integer := 16;
        latency: integer := 5
      );
      port (
        i: in std_logic_vector(width - 1 downto 0);
        ce: in std_logic;
        clr: in std_logic;
        clk: in std_logic;
        o: out std_logic_vector(width - 1 downto 0)
      );
    end component; -- end synth_reg

    component FDSE
        port (q  : out   std_ulogic;
              d  : in    std_ulogic;
              c  : in    std_ulogic;
              s  : in    std_ulogic;
              ce : in    std_ulogic);
    end component; -- end FDSE

    attribute syn_black_box of FDSE : component is true;
    attribute fpga_dont_touch of FDSE : component is "true";

    signal zero    : std_logic_vector (d_width-1 downto 0);
    signal mux_sel : std_logic;
    signal sampled_d  : std_logic_vector (d_width-1 downto 0);
    signal internal_ce : std_logic;

begin


   -- If zero padding is required, a mux is used to switch between data input
   -- and zeros.  The mux select is generated by registering the source enable
   -- signal.  This register is enabled by the destination enable signal. This
   -- has the effect of holding the select line high until the next consecutive
   -- destination enable pulse, and thereby satisfying the timing constraints.
   -- Signal assignments

   -- register the source enable signal with the register enabled
   -- by the destination enable
   sel_gen : FDSE
       port map (q  => mux_sel,
           d  => src_ce,
            c  => src_clk,
            s  => src_clr,
            ce => dest_ce);
  -- Generate the user enable
  internal_ce <= src_ce and en(0);

  copy_samples_false : if (copy_samples = 0) generate

      -- signal assignments
      zero <= (others => '0');

      -- purpose: latency is 0 and copy_samples is 0
      -- type   : combinational
      -- inputs : mux_sel, d, zero
      -- outputs: q
      gen_q_cp_smpls_0_and_lat_0: if (latency = 0) generate
        cp_smpls_0_and_lat_0: process (mux_sel, d, zero)
        begin  -- process cp_smpls_0_and_lat_0
          if (mux_sel = '1') then
            q <= d;
          else
            q <= zero;
          end if;
        end process cp_smpls_0_and_lat_0;
      end generate; -- end gen_q_cp_smpls_0_and_lat_0

      gen_q_cp_smpls_0_and_lat_gt_0: if (latency > 0) generate
        sampled_d_reg: synth_reg
          generic map (
            width => d_width,
            latency => latency
          )

          port map (
            i => d,
            ce => internal_ce,
            clr => src_clr,
            clk => src_clk,
            o => sampled_d
          );

        gen_q_check_mux_sel: process (mux_sel, sampled_d, zero)
        begin
          if (mux_sel = '1') then
            q <= sampled_d;
          else
            q <= zero;
          end if;
        end process gen_q_check_mux_sel;
      end generate; -- end gen_q_cp_smpls_0_and_lat_gt_0
   end generate; -- end copy_samples_false

   -- If zero padding is not required, we can short the upsampler data inputs
   -- to the upsampler data outputs when latency is 0.
   -- This option uses no hardware resources.

   copy_samples_true : if (copy_samples = 1) generate

     gen_q_cp_smpls_1_and_lat_0: if (latency = 0) generate
       q <= d;
     end generate; -- end gen_q_cp_smpls_1_and_lat_0

     gen_q_cp_smpls_1_and_lat_gt_0: if (latency > 0) generate
       q <= sampled_d;
       sampled_d_reg2: synth_reg
         generic map (
           width => d_width,
           latency => latency
         )

         port map (
           i => d,
           ce => internal_ce,
           clr => src_clr,
           clk => src_clk,
           o => sampled_d
         );
     end generate; -- end gen_q_cp_smpls_1_and_lat_gt_0
   end generate; -- end copy_samples_true
end architecture struct;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_c35d4af7aa is
  port (
    op : out std_logic_vector((16 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_c35d4af7aa;
architecture behavior of sysgen_constant_c35d4af7aa
is
begin
  op <= "0101101010000010";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_abcc65cec1 is
  port (
    op : out std_logic_vector((16 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_abcc65cec1;
architecture behavior of sysgen_constant_abcc65cec1
is
begin
  op <= "1010010101111110";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_f74b79fe84 is
  port (
    op : out std_logic_vector((16 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_f74b79fe84;
architecture behavior of sysgen_constant_f74b79fe84
is
begin
  op <= "0000000000000000";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_mux_9e90eee7ab is
  port (
    sel : in std_logic_vector((1 - 1) downto 0);
    d0 : in std_logic_vector((16 - 1) downto 0);
    d1 : in std_logic_vector((16 - 1) downto 0);
    y : out std_logic_vector((16 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_mux_9e90eee7ab;
architecture behavior of sysgen_mux_9e90eee7ab
is
  signal sel_1_20: std_logic_vector((1 - 1) downto 0);
  signal d0_1_24: std_logic_vector((16 - 1) downto 0);
  signal d1_1_27: std_logic_vector((16 - 1) downto 0);
  type array_type_pipe_16_22 is array (0 to (1 - 1)) of std_logic_vector((16 - 1) downto 0);
  signal pipe_16_22: array_type_pipe_16_22 := (
    0 => "0000000000000000");
  signal pipe_16_22_front_din: std_logic_vector((16 - 1) downto 0);
  signal pipe_16_22_back: std_logic_vector((16 - 1) downto 0);
  signal pipe_16_22_push_front_pop_back_en: std_logic;
  signal unregy_join_6_1: std_logic_vector((16 - 1) downto 0);
begin
  sel_1_20 <= sel;
  d0_1_24 <= d0;
  d1_1_27 <= d1;
  pipe_16_22_back <= pipe_16_22(0);
  proc_pipe_16_22: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (pipe_16_22_push_front_pop_back_en = '1')) then
        pipe_16_22(0) <= pipe_16_22_front_din;
      end if;
    end if;
  end process proc_pipe_16_22;
  proc_switch_6_1: process (d0_1_24, d1_1_27, sel_1_20)
  is
  begin
    case sel_1_20 is 
      when "0" =>
        unregy_join_6_1 <= d0_1_24;
      when others =>
        unregy_join_6_1 <= d1_1_27;
    end case;
  end process proc_switch_6_1;
  pipe_16_22_front_din <= unregy_join_6_1;
  pipe_16_22_push_front_pop_back_en <= '1';
  y <= pipe_16_22_back;
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_mux_6d08890a9e is
  port (
    sel : in std_logic_vector((1 - 1) downto 0);
    d0 : in std_logic_vector((16 - 1) downto 0);
    d1 : in std_logic_vector((16 - 1) downto 0);
    y : out std_logic_vector((16 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_mux_6d08890a9e;
architecture behavior of sysgen_mux_6d08890a9e
is
  signal sel_1_20: std_logic;
  signal d0_1_24: std_logic_vector((16 - 1) downto 0);
  signal d1_1_27: std_logic_vector((16 - 1) downto 0);
  type array_type_pipe_16_22 is array (0 to (1 - 1)) of std_logic_vector((16 - 1) downto 0);
  signal pipe_16_22: array_type_pipe_16_22 := (
    0 => "0000000000000000");
  signal pipe_16_22_front_din: std_logic_vector((16 - 1) downto 0);
  signal pipe_16_22_back: std_logic_vector((16 - 1) downto 0);
  signal pipe_16_22_push_front_pop_back_en: std_logic;
  signal sel_internal_2_1_convert: std_logic_vector((1 - 1) downto 0);
  signal unregy_join_6_1: std_logic_vector((16 - 1) downto 0);
begin
  sel_1_20 <= sel(0);
  d0_1_24 <= d0;
  d1_1_27 <= d1;
  pipe_16_22_back <= pipe_16_22(0);
  proc_pipe_16_22: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (pipe_16_22_push_front_pop_back_en = '1')) then
        pipe_16_22(0) <= pipe_16_22_front_din;
      end if;
    end if;
  end process proc_pipe_16_22;
  sel_internal_2_1_convert <= cast(std_logic_to_vector(sel_1_20), 0, 1, 0, xlUnsigned);
  proc_switch_6_1: process (d0_1_24, d1_1_27, sel_internal_2_1_convert)
  is
  begin
    case sel_internal_2_1_convert is 
      when "0" =>
        unregy_join_6_1 <= d0_1_24;
      when others =>
        unregy_join_6_1 <= d1_1_27;
    end case;
  end process proc_switch_6_1;
  pipe_16_22_front_din <= unregy_join_6_1;
  pipe_16_22_push_front_pop_back_en <= '1';
  y <= pipe_16_22_back;
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_mux_6be70fcaaf is
  port (
    sel : in std_logic_vector((1 - 1) downto 0);
    d0 : in std_logic_vector((1 - 1) downto 0);
    d1 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_mux_6be70fcaaf;
architecture behavior of sysgen_mux_6be70fcaaf
is
  signal sel_1_20: std_logic;
  signal d0_1_24: std_logic_vector((1 - 1) downto 0);
  signal d1_1_27: std_logic_vector((1 - 1) downto 0);
  type array_type_pipe_16_22 is array (0 to (1 - 1)) of std_logic_vector((1 - 1) downto 0);
  signal pipe_16_22: array_type_pipe_16_22 := (
    0 => "0");
  signal pipe_16_22_front_din: std_logic_vector((1 - 1) downto 0);
  signal pipe_16_22_back: std_logic_vector((1 - 1) downto 0);
  signal pipe_16_22_push_front_pop_back_en: std_logic;
  signal sel_internal_2_1_convert: std_logic_vector((1 - 1) downto 0);
  signal unregy_join_6_1: std_logic_vector((1 - 1) downto 0);
begin
  sel_1_20 <= sel(0);
  d0_1_24 <= d0;
  d1_1_27 <= d1;
  pipe_16_22_back <= pipe_16_22(0);
  proc_pipe_16_22: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (pipe_16_22_push_front_pop_back_en = '1')) then
        pipe_16_22(0) <= pipe_16_22_front_din;
      end if;
    end if;
  end process proc_pipe_16_22;
  sel_internal_2_1_convert <= cast(std_logic_to_vector(sel_1_20), 0, 1, 0, xlUnsigned);
  proc_switch_6_1: process (d0_1_24, d1_1_27, sel_internal_2_1_convert)
  is
  begin
    case sel_internal_2_1_convert is 
      when "0" =>
        unregy_join_6_1 <= d0_1_24;
      when others =>
        unregy_join_6_1 <= d1_1_27;
    end case;
  end process proc_switch_6_1;
  pipe_16_22_front_din <= unregy_join_6_1;
  pipe_16_22_push_front_pop_back_en <= '1';
  y <= pipe_16_22_back;
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_logical_ef8eaf66a9 is
  port (
    d0 : in std_logic_vector((1 - 1) downto 0);
    d1 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_logical_ef8eaf66a9;
architecture behavior of sysgen_logical_ef8eaf66a9
is
  signal d0_1_24: std_logic_vector((1 - 1) downto 0);
  signal d1_1_27: std_logic_vector((1 - 1) downto 0);
  signal fully_2_1_bit: std_logic_vector((1 - 1) downto 0);
begin
  d0_1_24 <= d0;
  d1_1_27 <= d1;
  fully_2_1_bit <= d0_1_24 xor d1_1_27;
  y <= fully_2_1_bit;
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

--$Header: /devl/xcs/repo/env/Jobs/sysgen/src/xbs/hdl_pkg/xlpassthrough.vhd,v 1.1 2005/07/11 00:50:55 alexc Exp $
---------------------------------------------------------------------
--
--  Filename      : xlpassthrough.vhd
--
--  Created       : 07/09/05
--
--  Description   : VHDL description of a passthrough block
--
---------------------------------------------------------------------


---------------------------------------------------------------------
--
--  Entity        : xlpassthrough
--
--  Architecture  : passthrough_arch
--
--  Description   : Top level VHDL description of passthrough block. 
--
---------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

entity xlpassthrough is
    generic (
        din_width    : integer := 16;            -- Width of input
        dout_width   : integer := 16             -- Width of output
        );
    port (
        din : in std_logic_vector (din_width-1 downto 0);
        dout : out std_logic_vector (dout_width-1 downto 0));
end xlpassthrough;

architecture passthrough_arch of xlpassthrough is
begin
  dout <= din;
end passthrough_arch;


library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_concat_4b856b04a0 is
  port (
    in0 : in std_logic_vector((1 - 1) downto 0);
    in1 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((2 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_concat_4b856b04a0;
architecture behavior of sysgen_concat_4b856b04a0
is
  signal in0_1_23: unsigned((1 - 1) downto 0);
  signal in1_1_27: unsigned((1 - 1) downto 0);
  signal y_2_1_concat: unsigned((2 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

--$Header: /devl/xcs/repo/env/Jobs/sysgen/src/xbs/blocks/xlconvert/hdl/xlconvert.vhd,v 1.1 2004/11/22 00:17:30 rosty Exp $
---------------------------------------------------------------------
--
--  Filename      : xlconvert.vhd
--
--  Description   : VHDL description of a fixed point converter block that
--                  converts the input to a new output type.

--
---------------------------------------------------------------------


---------------------------------------------------------------------
--
--  Entity        : xlconvert
--
--  Architecture  : behavior
--
--  Description   : Top level VHDL description of fixed point conver block.
--
---------------------------------------------------------------------


library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;


entity convert_func_call_transmitter_xlconvert is
    generic (
        din_width    : integer := 16;            -- Width of input
        din_bin_pt   : integer := 4;             -- Binary point of input
        din_arith    : integer := xlUnsigned;    -- Type of arith of input
        dout_width   : integer := 8;             -- Width of output
        dout_bin_pt  : integer := 2;             -- Binary point of output
        dout_arith   : integer := xlUnsigned;    -- Type of arith of output
        quantization : integer := xlTruncate;    -- xlRound or xlTruncate
        overflow     : integer := xlWrap);       -- xlSaturate or xlWrap
    port (
        din : in std_logic_vector (din_width-1 downto 0);
        result : out std_logic_vector (dout_width-1 downto 0));
end convert_func_call_transmitter_xlconvert ;

architecture behavior of convert_func_call_transmitter_xlconvert is
begin
    -- Convert to output type and do saturation arith.
    result <= convert_type(din, din_width, din_bin_pt, din_arith,
                           dout_width, dout_bin_pt, dout_arith,
                           quantization, overflow);
end behavior;


library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;


entity transmitter_xlconvert  is
    generic (
        din_width    : integer := 16;            -- Width of input
        din_bin_pt   : integer := 4;             -- Binary point of input
        din_arith    : integer := xlUnsigned;    -- Type of arith of input
        dout_width   : integer := 8;             -- Width of output
        dout_bin_pt  : integer := 2;             -- Binary point of output
        dout_arith   : integer := xlUnsigned;    -- Type of arith of output
        en_width     : integer := 1;
        en_bin_pt    : integer := 0;
        en_arith     : integer := xlUnsigned;
        bool_conversion : integer :=0;           -- if one, convert ufix_1_0 to
                                                 -- bool
        latency      : integer := 0;             -- Ouput delay clk cycles
        quantization : integer := xlTruncate;    -- xlRound or xlTruncate
        overflow     : integer := xlWrap);       -- xlSaturate or xlWrap
    port (
        din : in std_logic_vector (din_width-1 downto 0);
        en  : in std_logic_vector (en_width-1 downto 0);
        ce  : in std_logic;
        clr : in std_logic;
        clk : in std_logic;
        dout : out std_logic_vector (dout_width-1 downto 0));

end transmitter_xlconvert ;

architecture behavior of transmitter_xlconvert  is

    component synth_reg
        generic (width       : integer;
                 latency     : integer);
        port (i       : in std_logic_vector(width-1 downto 0);
              ce      : in std_logic;
              clr     : in std_logic;
              clk     : in std_logic;
              o       : out std_logic_vector(width-1 downto 0));
    end component;

    component convert_func_call_transmitter_xlconvert 
        generic (
            din_width    : integer := 16;            -- Width of input
            din_bin_pt   : integer := 4;             -- Binary point of input
            din_arith    : integer := xlUnsigned;    -- Type of arith of input
            dout_width   : integer := 8;             -- Width of output
            dout_bin_pt  : integer := 2;             -- Binary point of output
            dout_arith   : integer := xlUnsigned;    -- Type of arith of output
            quantization : integer := xlTruncate;    -- xlRound or xlTruncate
            overflow     : integer := xlWrap);       -- xlSaturate or xlWrap
        port (
            din : in std_logic_vector (din_width-1 downto 0);
            result : out std_logic_vector (dout_width-1 downto 0));
    end component;


    -- synthesis translate_off
--    signal real_din, real_dout : real;    -- For debugging info ports
    -- synthesis translate_on
    signal result : std_logic_vector(dout_width-1 downto 0);
    signal internal_ce : std_logic;

begin

    -- Debugging info for internal full precision variables
    -- synthesis translate_off
--     real_din <= to_real(din, din_bin_pt, din_arith);
--     real_dout <= to_real(dout, dout_bin_pt, dout_arith);
    -- synthesis translate_on

    internal_ce <= ce and en(0);

    bool_conversion_generate : if (bool_conversion = 1)
    generate
      result <= din;
    end generate; --bool_conversion_generate

    std_conversion_generate : if (bool_conversion = 0)
    generate
      -- Workaround for XST bug
      convert : convert_func_call_transmitter_xlconvert 
        generic map (
          din_width   => din_width,
          din_bin_pt  => din_bin_pt,
          din_arith   => din_arith,
          dout_width  => dout_width,
          dout_bin_pt => dout_bin_pt,
          dout_arith  => dout_arith,
          quantization => quantization,
          overflow     => overflow)
        port map (
          din => din,
          result => result);
    end generate; --std_conversion_generate

    latency_test : if (latency > 0) generate
        reg : synth_reg
            generic map (
              width => dout_width,
              latency => latency
            )
            port map (
              i => result,
              ce => internal_ce,
              clr => clr,
              clk => clk,
              o => dout
            );
    end generate;

    latency0 : if (latency = 0)
    generate
        dout <= result;
    end generate latency0;

end  behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_mux_7d29d07b59 is
  port (
    sel : in std_logic_vector((2 - 1) downto 0);
    d0 : in std_logic_vector((1 - 1) downto 0);
    d1 : in std_logic_vector((1 - 1) downto 0);
    d2 : in std_logic_vector((1 - 1) downto 0);
    d3 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_mux_7d29d07b59;
architecture behavior of sysgen_mux_7d29d07b59
is
  signal sel_1_20: std_logic_vector((2 - 1) downto 0);
  signal d0_1_24: std_logic;
  signal d1_1_27: std_logic;
  signal d2_1_30: std_logic;
  signal d3_1_33: std_logic;
  signal unregy_join_6_1: std_logic;
begin
  sel_1_20 <= sel;
  d0_1_24 <= d0(0);
  d1_1_27 <= d1(0);
  d2_1_30 <= d2(0);
  d3_1_33 <= d3(0);
  proc_switch_6_1: process (d0_1_24, d1_1_27, d2_1_30, d3_1_33, sel_1_20)
  is
  begin
    case sel_1_20 is 
      when "00" =>
        unregy_join_6_1 <= d0_1_24;
      when "01" =>
        unregy_join_6_1 <= d1_1_27;
      when "10" =>
        unregy_join_6_1 <= d2_1_30;
      when others =>
        unregy_join_6_1 <= d3_1_33;
    end case;
  end process proc_switch_6_1;
  y <= std_logic_to_vector(unregy_join_6_1);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_shift_46a06dc853 is
  port (
    ip : in std_logic_vector((50 - 1) downto 0);
    op : out std_logic_vector((58 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_shift_46a06dc853;
architecture behavior of sysgen_shift_46a06dc853
is
  signal ip_1_23: signed((50 - 1) downto 0);
  type array_type_op_mem_46_20 is array (0 to (1 - 1)) of signed((58 - 1) downto 0);
  signal op_mem_46_20: array_type_op_mem_46_20 := (
    0 => "0000000000000000000000000000000000000000000000000000000000");
  signal op_mem_46_20_front_din: signed((58 - 1) downto 0);
  signal op_mem_46_20_back: signed((58 - 1) downto 0);
  signal op_mem_46_20_push_front_pop_back_en: std_logic;
  signal internal_ip_33_3_convert: signed((58 - 1) downto 0);
begin
  ip_1_23 <= std_logic_vector_to_signed(ip);
  op_mem_46_20_back <= op_mem_46_20(0);
  proc_op_mem_46_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_46_20_push_front_pop_back_en = '1')) then
        op_mem_46_20(0) <= op_mem_46_20_front_din;
      end if;
    end if;
  end process proc_op_mem_46_20;
  internal_ip_33_3_convert <= std_logic_vector_to_signed(convert_type(signed_to_std_logic_vector(ip_1_23), 50, 48, xlSigned, 58, 56, xlSigned, xlRound, xlSaturate));
  op_mem_46_20_push_front_pop_back_en <= '0';
  op <= signed_to_std_logic_vector(internal_ip_33_3_convert);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_lfsr_581ccf288b is
  port (
    en : in std_logic_vector((1 - 1) downto 0);
    dout : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_lfsr_581ccf288b;
architecture behavior of sysgen_lfsr_581ccf288b
is
  signal en_1_63: boolean;
  signal lfsr0_2_19_next: unsigned((1 - 1) downto 0);
  signal lfsr0_2_19: unsigned((1 - 1) downto 0);
  signal lfsr0_2_19_en: std_logic;
  signal lfsr0_2_19_reg_i: std_logic_vector((1 - 1) downto 0);
  signal lfsr0_2_19_reg_o: std_logic_vector((1 - 1) downto 0);
  signal lfsr0_2_19_reg_ce: std_logic;
  signal lfsr1_3_19_next: unsigned((1 - 1) downto 0);
  signal lfsr1_3_19: unsigned((1 - 1) downto 0) := "0";
  signal lfsr1_3_19_en: std_logic;
  signal lfsr2_4_19_next: unsigned((1 - 1) downto 0);
  signal lfsr2_4_19: unsigned((1 - 1) downto 0) := "0";
  signal lfsr2_4_19_en: std_logic;
  signal lfsr3_5_19_next: unsigned((1 - 1) downto 0);
  signal lfsr3_5_19: unsigned((1 - 1) downto 0) := "0";
  signal lfsr3_5_19_en: std_logic;
  signal lfsr4_6_19_next: unsigned((1 - 1) downto 0);
  signal lfsr4_6_19: unsigned((1 - 1) downto 0);
  signal lfsr4_6_19_en: std_logic;
  signal lfsr4_6_19_reg_i: std_logic_vector((1 - 1) downto 0);
  signal lfsr4_6_19_reg_o: std_logic_vector((1 - 1) downto 0);
  signal lfsr4_6_19_reg_ce: std_logic;
  signal lfsr5_7_19_next: unsigned((1 - 1) downto 0);
  signal lfsr5_7_19: unsigned((1 - 1) downto 0) := "0";
  signal lfsr5_7_19_en: std_logic;
  signal lfsr6_8_19_next: unsigned((1 - 1) downto 0);
  signal lfsr6_8_19: unsigned((1 - 1) downto 0) := "0";
  signal lfsr6_8_19_en: std_logic;
  signal lfsr7_9_19_next: unsigned((1 - 1) downto 0);
  signal lfsr7_9_19: unsigned((1 - 1) downto 0) := "0";
  signal lfsr7_9_19_en: std_logic;
  signal lfsr8_10_19_next: unsigned((1 - 1) downto 0);
  signal lfsr8_10_19: unsigned((1 - 1) downto 0) := "0";
  signal lfsr8_10_19_en: std_logic;
  signal lfsr9_11_19_next: unsigned((1 - 1) downto 0);
  signal lfsr9_11_19: unsigned((1 - 1) downto 0) := "0";
  signal lfsr9_11_19_en: std_logic;
  signal bit_27_35: unsigned((1 - 1) downto 0);
  signal bit_27_22: unsigned((1 - 1) downto 0);
  signal temp_27_1_bitnot: unsigned((1 - 1) downto 0);
  signal lfsr6_join_25_1: unsigned((1 - 1) downto 0);
  signal lfsr6_join_25_1_en: std_logic;
  signal lfsr7_join_25_1: unsigned((1 - 1) downto 0);
  signal lfsr7_join_25_1_en: std_logic;
  signal lfsr8_join_25_1: unsigned((1 - 1) downto 0);
  signal lfsr8_join_25_1_en: std_logic;
  signal lfsr2_join_25_1: unsigned((1 - 1) downto 0);
  signal lfsr2_join_25_1_en: std_logic;
  signal lfsr5_join_25_1: unsigned((1 - 1) downto 0);
  signal lfsr5_join_25_1_en: std_logic;
  signal lfsr3_join_25_1: unsigned((1 - 1) downto 0);
  signal lfsr3_join_25_1_en: std_logic;
  signal lfsr0_join_25_1: unsigned((1 - 1) downto 0);
  signal lfsr0_join_25_1_en: std_logic;
  signal lfsr9_join_25_1: unsigned((1 - 1) downto 0);
  signal lfsr9_join_25_1_en: std_logic;
  signal lfsr4_join_25_1: unsigned((1 - 1) downto 0);
  signal lfsr4_join_25_1_en: std_logic;
  signal lfsr1_join_25_1: unsigned((1 - 1) downto 0);
  signal lfsr1_join_25_1_en: std_logic;
begin
  en_1_63 <= ((en) = "1");
  lfsr0_2_19_reg_i <= unsigned_to_std_logic_vector(lfsr0_2_19_next);
  lfsr0_2_19 <= std_logic_vector_to_unsigned(lfsr0_2_19_reg_o);
  lfsr0_2_19_reg_ce <= (ce and lfsr0_2_19_en);
  lfsr0_2_19_reg_inst: entity work.synth_reg_w_init
    generic map (
      init_index => 2, 
      init_value => b"1", 
      latency => 1, 
      width => 1)
    port map (
      ce => lfsr0_2_19_reg_ce, 
      clk => clk, 
      clr => clr, 
      i => lfsr0_2_19_reg_i, 
      o => lfsr0_2_19_reg_o);
  proc_lfsr1_3_19: process (clk)
  is
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (lfsr1_3_19_en = '1')) then
        lfsr1_3_19 <= lfsr1_3_19_next;
      end if;
    end if;
  end process proc_lfsr1_3_19;
  proc_lfsr2_4_19: process (clk)
  is
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (lfsr2_4_19_en = '1')) then
        lfsr2_4_19 <= lfsr2_4_19_next;
      end if;
    end if;
  end process proc_lfsr2_4_19;
  proc_lfsr3_5_19: process (clk)
  is
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (lfsr3_5_19_en = '1')) then
        lfsr3_5_19 <= lfsr3_5_19_next;
      end if;
    end if;
  end process proc_lfsr3_5_19;
  lfsr4_6_19_reg_i <= unsigned_to_std_logic_vector(lfsr4_6_19_next);
  lfsr4_6_19 <= std_logic_vector_to_unsigned(lfsr4_6_19_reg_o);
  lfsr4_6_19_reg_ce <= (ce and lfsr4_6_19_en);
  lfsr4_6_19_reg_inst: entity work.synth_reg_w_init
    generic map (
      init_index => 2, 
      init_value => b"1", 
      latency => 1, 
      width => 1)
    port map (
      ce => lfsr4_6_19_reg_ce, 
      clk => clk, 
      clr => clr, 
      i => lfsr4_6_19_reg_i, 
      o => lfsr4_6_19_reg_o);
  proc_lfsr5_7_19: process (clk)
  is
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (lfsr5_7_19_en = '1')) then
        lfsr5_7_19 <= lfsr5_7_19_next;
      end if;
    end if;
  end process proc_lfsr5_7_19;
  proc_lfsr6_8_19: process (clk)
  is
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (lfsr6_8_19_en = '1')) then
        lfsr6_8_19 <= lfsr6_8_19_next;
      end if;
    end if;
  end process proc_lfsr6_8_19;
  proc_lfsr7_9_19: process (clk)
  is
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (lfsr7_9_19_en = '1')) then
        lfsr7_9_19 <= lfsr7_9_19_next;
      end if;
    end if;
  end process proc_lfsr7_9_19;
  proc_lfsr8_10_19: process (clk)
  is
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (lfsr8_10_19_en = '1')) then
        lfsr8_10_19 <= lfsr8_10_19_next;
      end if;
    end if;
  end process proc_lfsr8_10_19;
  proc_lfsr9_11_19: process (clk)
  is
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (lfsr9_11_19_en = '1')) then
        lfsr9_11_19 <= lfsr9_11_19_next;
      end if;
    end if;
  end process proc_lfsr9_11_19;
  bit_27_35 <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(lfsr9_11_19) xor unsigned_to_std_logic_vector(lfsr4_6_19));
  bit_27_22 <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(lfsr1_3_19) xor unsigned_to_std_logic_vector(bit_27_35));
  temp_27_1_bitnot <= std_logic_vector_to_unsigned(not unsigned_to_std_logic_vector(bit_27_22));
  proc_if_25_1: process (en_1_63, lfsr0_2_19, lfsr1_3_19, lfsr2_4_19, lfsr3_5_19, lfsr4_6_19, lfsr5_7_19, lfsr6_8_19, lfsr7_9_19, lfsr8_10_19, temp_27_1_bitnot)
  is
  begin
    if en_1_63 then
      lfsr6_join_25_1_en <= '1';
    else 
      lfsr6_join_25_1_en <= '0';
    end if;
    lfsr6_join_25_1 <= lfsr5_7_19;
    if en_1_63 then
      lfsr7_join_25_1_en <= '1';
    else 
      lfsr7_join_25_1_en <= '0';
    end if;
    lfsr7_join_25_1 <= lfsr6_8_19;
    if en_1_63 then
      lfsr8_join_25_1_en <= '1';
    else 
      lfsr8_join_25_1_en <= '0';
    end if;
    lfsr8_join_25_1 <= lfsr7_9_19;
    if en_1_63 then
      lfsr2_join_25_1_en <= '1';
    else 
      lfsr2_join_25_1_en <= '0';
    end if;
    lfsr2_join_25_1 <= lfsr1_3_19;
    if en_1_63 then
      lfsr5_join_25_1_en <= '1';
    else 
      lfsr5_join_25_1_en <= '0';
    end if;
    lfsr5_join_25_1 <= lfsr4_6_19;
    if en_1_63 then
      lfsr3_join_25_1_en <= '1';
    else 
      lfsr3_join_25_1_en <= '0';
    end if;
    lfsr3_join_25_1 <= lfsr2_4_19;
    if en_1_63 then
      lfsr0_join_25_1_en <= '1';
    else 
      lfsr0_join_25_1_en <= '0';
    end if;
    lfsr0_join_25_1 <= temp_27_1_bitnot;
    if en_1_63 then
      lfsr9_join_25_1_en <= '1';
    else 
      lfsr9_join_25_1_en <= '0';
    end if;
    lfsr9_join_25_1 <= lfsr8_10_19;
    if en_1_63 then
      lfsr4_join_25_1_en <= '1';
    else 
      lfsr4_join_25_1_en <= '0';
    end if;
    lfsr4_join_25_1 <= lfsr3_5_19;
    if en_1_63 then
      lfsr1_join_25_1_en <= '1';
    else 
      lfsr1_join_25_1_en <= '0';
    end if;
    lfsr1_join_25_1 <= lfsr0_2_19;
  end process proc_if_25_1;
  lfsr0_2_19_next <= temp_27_1_bitnot;
  lfsr0_2_19_en <= lfsr0_join_25_1_en;
  lfsr1_3_19_next <= lfsr0_2_19;
  lfsr1_3_19_en <= lfsr1_join_25_1_en;
  lfsr2_4_19_next <= lfsr1_3_19;
  lfsr2_4_19_en <= lfsr2_join_25_1_en;
  lfsr3_5_19_next <= lfsr2_4_19;
  lfsr3_5_19_en <= lfsr3_join_25_1_en;
  lfsr4_6_19_next <= lfsr3_5_19;
  lfsr4_6_19_en <= lfsr4_join_25_1_en;
  lfsr5_7_19_next <= lfsr4_6_19;
  lfsr5_7_19_en <= lfsr5_join_25_1_en;
  lfsr6_8_19_next <= lfsr5_7_19;
  lfsr6_8_19_en <= lfsr6_join_25_1_en;
  lfsr7_9_19_next <= lfsr6_8_19;
  lfsr7_9_19_en <= lfsr7_join_25_1_en;
  lfsr8_10_19_next <= lfsr7_9_19;
  lfsr8_10_19_en <= lfsr8_join_25_1_en;
  lfsr9_11_19_next <= lfsr8_10_19;
  lfsr9_11_19_en <= lfsr9_join_25_1_en;
  dout <= unsigned_to_std_logic_vector(lfsr9_11_19);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_lfsr_2355174a2f is
  port (
    en : in std_logic_vector((1 - 1) downto 0);
    dout : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_lfsr_2355174a2f;
architecture behavior of sysgen_lfsr_2355174a2f
is
  signal en_1_63: boolean;
  signal lfsr0_2_19_next: unsigned((1 - 1) downto 0);
  signal lfsr0_2_19: unsigned((1 - 1) downto 0);
  signal lfsr0_2_19_en: std_logic;
  signal lfsr0_2_19_reg_i: std_logic_vector((1 - 1) downto 0);
  signal lfsr0_2_19_reg_o: std_logic_vector((1 - 1) downto 0);
  signal lfsr0_2_19_reg_ce: std_logic;
  signal lfsr1_3_19_next: unsigned((1 - 1) downto 0);
  signal lfsr1_3_19: unsigned((1 - 1) downto 0) := "0";
  signal lfsr1_3_19_en: std_logic;
  signal lfsr2_4_19_next: unsigned((1 - 1) downto 0);
  signal lfsr2_4_19: unsigned((1 - 1) downto 0) := "0";
  signal lfsr2_4_19_en: std_logic;
  signal lfsr3_5_19_next: unsigned((1 - 1) downto 0);
  signal lfsr3_5_19: unsigned((1 - 1) downto 0) := "0";
  signal lfsr3_5_19_en: std_logic;
  signal lfsr4_6_19_next: unsigned((1 - 1) downto 0);
  signal lfsr4_6_19: unsigned((1 - 1) downto 0) := "0";
  signal lfsr4_6_19_en: std_logic;
  signal lfsr5_7_19_next: unsigned((1 - 1) downto 0);
  signal lfsr5_7_19: unsigned((1 - 1) downto 0) := "0";
  signal lfsr5_7_19_en: std_logic;
  signal lfsr6_8_19_next: unsigned((1 - 1) downto 0);
  signal lfsr6_8_19: unsigned((1 - 1) downto 0) := "0";
  signal lfsr6_8_19_en: std_logic;
  signal lfsr7_9_19_next: unsigned((1 - 1) downto 0);
  signal lfsr7_9_19: unsigned((1 - 1) downto 0) := "0";
  signal lfsr7_9_19_en: std_logic;
  signal lfsr8_10_19_next: unsigned((1 - 1) downto 0);
  signal lfsr8_10_19: unsigned((1 - 1) downto 0) := "0";
  signal lfsr8_10_19_en: std_logic;
  signal lfsr9_11_19_next: unsigned((1 - 1) downto 0);
  signal lfsr9_11_19: unsigned((1 - 1) downto 0) := "0";
  signal lfsr9_11_19_en: std_logic;
  signal lfsr10_12_20_next: unsigned((1 - 1) downto 0);
  signal lfsr10_12_20: unsigned((1 - 1) downto 0) := "0";
  signal lfsr10_12_20_en: std_logic;
  signal lfsr11_13_20_next: unsigned((1 - 1) downto 0);
  signal lfsr11_13_20: unsigned((1 - 1) downto 0) := "0";
  signal lfsr11_13_20_en: std_logic;
  signal lfsr12_14_20_next: unsigned((1 - 1) downto 0);
  signal lfsr12_14_20: unsigned((1 - 1) downto 0) := "0";
  signal lfsr12_14_20_en: std_logic;
  signal lfsr13_15_20_next: unsigned((1 - 1) downto 0);
  signal lfsr13_15_20: unsigned((1 - 1) downto 0) := "0";
  signal lfsr13_15_20_en: std_logic;
  signal lfsr14_16_20_next: unsigned((1 - 1) downto 0);
  signal lfsr14_16_20: unsigned((1 - 1) downto 0) := "0";
  signal lfsr14_16_20_en: std_logic;
  signal lfsr15_17_20_next: unsigned((1 - 1) downto 0);
  signal lfsr15_17_20: unsigned((1 - 1) downto 0) := "0";
  signal lfsr15_17_20_en: std_logic;
  signal bit_39_61: unsigned((1 - 1) downto 0);
  signal bit_39_48: unsigned((1 - 1) downto 0);
  signal bit_39_35: unsigned((1 - 1) downto 0);
  signal bit_39_22: unsigned((1 - 1) downto 0);
  signal temp_39_1_bitnot: unsigned((1 - 1) downto 0);
  signal lfsr6_join_37_1: unsigned((1 - 1) downto 0);
  signal lfsr6_join_37_1_en: std_logic;
  signal lfsr1_join_37_1: unsigned((1 - 1) downto 0);
  signal lfsr1_join_37_1_en: std_logic;
  signal lfsr11_join_37_1: unsigned((1 - 1) downto 0);
  signal lfsr11_join_37_1_en: std_logic;
  signal lfsr0_join_37_1: unsigned((1 - 1) downto 0);
  signal lfsr0_join_37_1_en: std_logic;
  signal lfsr8_join_37_1: unsigned((1 - 1) downto 0);
  signal lfsr8_join_37_1_en: std_logic;
  signal lfsr13_join_37_1: unsigned((1 - 1) downto 0);
  signal lfsr13_join_37_1_en: std_logic;
  signal lfsr10_join_37_1: unsigned((1 - 1) downto 0);
  signal lfsr10_join_37_1_en: std_logic;
  signal lfsr7_join_37_1: unsigned((1 - 1) downto 0);
  signal lfsr7_join_37_1_en: std_logic;
  signal lfsr14_join_37_1: unsigned((1 - 1) downto 0);
  signal lfsr14_join_37_1_en: std_logic;
  signal lfsr4_join_37_1: unsigned((1 - 1) downto 0);
  signal lfsr4_join_37_1_en: std_logic;
  signal lfsr12_join_37_1: unsigned((1 - 1) downto 0);
  signal lfsr12_join_37_1_en: std_logic;
  signal lfsr9_join_37_1: unsigned((1 - 1) downto 0);
  signal lfsr9_join_37_1_en: std_logic;
  signal lfsr3_join_37_1: unsigned((1 - 1) downto 0);
  signal lfsr3_join_37_1_en: std_logic;
  signal lfsr5_join_37_1: unsigned((1 - 1) downto 0);
  signal lfsr5_join_37_1_en: std_logic;
  signal lfsr15_join_37_1: unsigned((1 - 1) downto 0);
  signal lfsr15_join_37_1_en: std_logic;
  signal lfsr2_join_37_1: unsigned((1 - 1) downto 0);
  signal lfsr2_join_37_1_en: std_logic;
begin
  en_1_63 <= ((en) = "1");
  lfsr0_2_19_reg_i <= unsigned_to_std_logic_vector(lfsr0_2_19_next);
  lfsr0_2_19 <= std_logic_vector_to_unsigned(lfsr0_2_19_reg_o);
  lfsr0_2_19_reg_ce <= (ce and lfsr0_2_19_en);
  lfsr0_2_19_reg_inst: entity work.synth_reg_w_init
    generic map (
      init_index => 2, 
      init_value => b"1", 
      latency => 1, 
      width => 1)
    port map (
      ce => lfsr0_2_19_reg_ce, 
      clk => clk, 
      clr => clr, 
      i => lfsr0_2_19_reg_i, 
      o => lfsr0_2_19_reg_o);
  proc_lfsr1_3_19: process (clk)
  is
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (lfsr1_3_19_en = '1')) then
        lfsr1_3_19 <= lfsr1_3_19_next;
      end if;
    end if;
  end process proc_lfsr1_3_19;
  proc_lfsr2_4_19: process (clk)
  is
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (lfsr2_4_19_en = '1')) then
        lfsr2_4_19 <= lfsr2_4_19_next;
      end if;
    end if;
  end process proc_lfsr2_4_19;
  proc_lfsr3_5_19: process (clk)
  is
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (lfsr3_5_19_en = '1')) then
        lfsr3_5_19 <= lfsr3_5_19_next;
      end if;
    end if;
  end process proc_lfsr3_5_19;
  proc_lfsr4_6_19: process (clk)
  is
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (lfsr4_6_19_en = '1')) then
        lfsr4_6_19 <= lfsr4_6_19_next;
      end if;
    end if;
  end process proc_lfsr4_6_19;
  proc_lfsr5_7_19: process (clk)
  is
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (lfsr5_7_19_en = '1')) then
        lfsr5_7_19 <= lfsr5_7_19_next;
      end if;
    end if;
  end process proc_lfsr5_7_19;
  proc_lfsr6_8_19: process (clk)
  is
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (lfsr6_8_19_en = '1')) then
        lfsr6_8_19 <= lfsr6_8_19_next;
      end if;
    end if;
  end process proc_lfsr6_8_19;
  proc_lfsr7_9_19: process (clk)
  is
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (lfsr7_9_19_en = '1')) then
        lfsr7_9_19 <= lfsr7_9_19_next;
      end if;
    end if;
  end process proc_lfsr7_9_19;
  proc_lfsr8_10_19: process (clk)
  is
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (lfsr8_10_19_en = '1')) then
        lfsr8_10_19 <= lfsr8_10_19_next;
      end if;
    end if;
  end process proc_lfsr8_10_19;
  proc_lfsr9_11_19: process (clk)
  is
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (lfsr9_11_19_en = '1')) then
        lfsr9_11_19 <= lfsr9_11_19_next;
      end if;
    end if;
  end process proc_lfsr9_11_19;
  proc_lfsr10_12_20: process (clk)
  is
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (lfsr10_12_20_en = '1')) then
        lfsr10_12_20 <= lfsr10_12_20_next;
      end if;
    end if;
  end process proc_lfsr10_12_20;
  proc_lfsr11_13_20: process (clk)
  is
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (lfsr11_13_20_en = '1')) then
        lfsr11_13_20 <= lfsr11_13_20_next;
      end if;
    end if;
  end process proc_lfsr11_13_20;
  proc_lfsr12_14_20: process (clk)
  is
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (lfsr12_14_20_en = '1')) then
        lfsr12_14_20 <= lfsr12_14_20_next;
      end if;
    end if;
  end process proc_lfsr12_14_20;
  proc_lfsr13_15_20: process (clk)
  is
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (lfsr13_15_20_en = '1')) then
        lfsr13_15_20 <= lfsr13_15_20_next;
      end if;
    end if;
  end process proc_lfsr13_15_20;
  proc_lfsr14_16_20: process (clk)
  is
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (lfsr14_16_20_en = '1')) then
        lfsr14_16_20 <= lfsr14_16_20_next;
      end if;
    end if;
  end process proc_lfsr14_16_20;
  proc_lfsr15_17_20: process (clk)
  is
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (lfsr15_17_20_en = '1')) then
        lfsr15_17_20 <= lfsr15_17_20_next;
      end if;
    end if;
  end process proc_lfsr15_17_20;
  bit_39_61 <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(lfsr15_17_20) xor unsigned_to_std_logic_vector(lfsr13_15_20));
  bit_39_48 <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(lfsr4_6_19) xor unsigned_to_std_logic_vector(bit_39_61));
  bit_39_35 <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(lfsr2_4_19) xor unsigned_to_std_logic_vector(bit_39_48));
  bit_39_22 <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(lfsr1_3_19) xor unsigned_to_std_logic_vector(bit_39_35));
  temp_39_1_bitnot <= std_logic_vector_to_unsigned(not unsigned_to_std_logic_vector(bit_39_22));
  proc_if_37_1: process (en_1_63, lfsr0_2_19, lfsr10_12_20, lfsr11_13_20, lfsr12_14_20, lfsr13_15_20, lfsr14_16_20, lfsr1_3_19, lfsr2_4_19, lfsr3_5_19, lfsr4_6_19, lfsr5_7_19, lfsr6_8_19, lfsr7_9_19, lfsr8_10_19, lfsr9_11_19, temp_39_1_bitnot)
  is
  begin
    if en_1_63 then
      lfsr6_join_37_1_en <= '1';
    else 
      lfsr6_join_37_1_en <= '0';
    end if;
    lfsr6_join_37_1 <= lfsr5_7_19;
    if en_1_63 then
      lfsr1_join_37_1_en <= '1';
    else 
      lfsr1_join_37_1_en <= '0';
    end if;
    lfsr1_join_37_1 <= lfsr0_2_19;
    if en_1_63 then
      lfsr11_join_37_1_en <= '1';
    else 
      lfsr11_join_37_1_en <= '0';
    end if;
    lfsr11_join_37_1 <= lfsr10_12_20;
    if en_1_63 then
      lfsr0_join_37_1_en <= '1';
    else 
      lfsr0_join_37_1_en <= '0';
    end if;
    lfsr0_join_37_1 <= temp_39_1_bitnot;
    if en_1_63 then
      lfsr8_join_37_1_en <= '1';
    else 
      lfsr8_join_37_1_en <= '0';
    end if;
    lfsr8_join_37_1 <= lfsr7_9_19;
    if en_1_63 then
      lfsr13_join_37_1_en <= '1';
    else 
      lfsr13_join_37_1_en <= '0';
    end if;
    lfsr13_join_37_1 <= lfsr12_14_20;
    if en_1_63 then
      lfsr10_join_37_1_en <= '1';
    else 
      lfsr10_join_37_1_en <= '0';
    end if;
    lfsr10_join_37_1 <= lfsr9_11_19;
    if en_1_63 then
      lfsr7_join_37_1_en <= '1';
    else 
      lfsr7_join_37_1_en <= '0';
    end if;
    lfsr7_join_37_1 <= lfsr6_8_19;
    if en_1_63 then
      lfsr14_join_37_1_en <= '1';
    else 
      lfsr14_join_37_1_en <= '0';
    end if;
    lfsr14_join_37_1 <= lfsr13_15_20;
    if en_1_63 then
      lfsr4_join_37_1_en <= '1';
    else 
      lfsr4_join_37_1_en <= '0';
    end if;
    lfsr4_join_37_1 <= lfsr3_5_19;
    if en_1_63 then
      lfsr12_join_37_1_en <= '1';
    else 
      lfsr12_join_37_1_en <= '0';
    end if;
    lfsr12_join_37_1 <= lfsr11_13_20;
    if en_1_63 then
      lfsr9_join_37_1_en <= '1';
    else 
      lfsr9_join_37_1_en <= '0';
    end if;
    lfsr9_join_37_1 <= lfsr8_10_19;
    if en_1_63 then
      lfsr3_join_37_1_en <= '1';
    else 
      lfsr3_join_37_1_en <= '0';
    end if;
    lfsr3_join_37_1 <= lfsr2_4_19;
    if en_1_63 then
      lfsr5_join_37_1_en <= '1';
    else 
      lfsr5_join_37_1_en <= '0';
    end if;
    lfsr5_join_37_1 <= lfsr4_6_19;
    if en_1_63 then
      lfsr15_join_37_1_en <= '1';
    else 
      lfsr15_join_37_1_en <= '0';
    end if;
    lfsr15_join_37_1 <= lfsr14_16_20;
    if en_1_63 then
      lfsr2_join_37_1_en <= '1';
    else 
      lfsr2_join_37_1_en <= '0';
    end if;
    lfsr2_join_37_1 <= lfsr1_3_19;
  end process proc_if_37_1;
  lfsr0_2_19_next <= temp_39_1_bitnot;
  lfsr0_2_19_en <= lfsr0_join_37_1_en;
  lfsr1_3_19_next <= lfsr0_2_19;
  lfsr1_3_19_en <= lfsr1_join_37_1_en;
  lfsr2_4_19_next <= lfsr1_3_19;
  lfsr2_4_19_en <= lfsr2_join_37_1_en;
  lfsr3_5_19_next <= lfsr2_4_19;
  lfsr3_5_19_en <= lfsr3_join_37_1_en;
  lfsr4_6_19_next <= lfsr3_5_19;
  lfsr4_6_19_en <= lfsr4_join_37_1_en;
  lfsr5_7_19_next <= lfsr4_6_19;
  lfsr5_7_19_en <= lfsr5_join_37_1_en;
  lfsr6_8_19_next <= lfsr5_7_19;
  lfsr6_8_19_en <= lfsr6_join_37_1_en;
  lfsr7_9_19_next <= lfsr6_8_19;
  lfsr7_9_19_en <= lfsr7_join_37_1_en;
  lfsr8_10_19_next <= lfsr7_9_19;
  lfsr8_10_19_en <= lfsr8_join_37_1_en;
  lfsr9_11_19_next <= lfsr8_10_19;
  lfsr9_11_19_en <= lfsr9_join_37_1_en;
  lfsr10_12_20_next <= lfsr9_11_19;
  lfsr10_12_20_en <= lfsr10_join_37_1_en;
  lfsr11_13_20_next <= lfsr10_12_20;
  lfsr11_13_20_en <= lfsr11_join_37_1_en;
  lfsr12_14_20_next <= lfsr11_13_20;
  lfsr12_14_20_en <= lfsr12_join_37_1_en;
  lfsr13_15_20_next <= lfsr12_14_20;
  lfsr13_15_20_en <= lfsr13_join_37_1_en;
  lfsr14_16_20_next <= lfsr13_15_20;
  lfsr14_16_20_en <= lfsr14_join_37_1_en;
  lfsr15_17_20_next <= lfsr14_16_20;
  lfsr15_17_20_en <= lfsr15_join_37_1_en;
  dout <= unsigned_to_std_logic_vector(lfsr15_17_20);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_mux_81a2b1b804 is
  port (
    sel : in std_logic_vector((1 - 1) downto 0);
    d0 : in std_logic_vector((1 - 1) downto 0);
    d1 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_mux_81a2b1b804;
architecture behavior of sysgen_mux_81a2b1b804
is
  signal sel_1_20: std_logic;
  signal d0_1_24: std_logic_vector((1 - 1) downto 0);
  signal d1_1_27: std_logic_vector((1 - 1) downto 0);
  signal sel_internal_2_1_convert: std_logic_vector((1 - 1) downto 0);
  signal unregy_join_6_1: std_logic_vector((1 - 1) downto 0);
begin
  sel_1_20 <= sel(0);
  d0_1_24 <= d0;
  d1_1_27 <= d1;
  sel_internal_2_1_convert <= cast(std_logic_to_vector(sel_1_20), 0, 1, 0, xlUnsigned);
  proc_switch_6_1: process (d0_1_24, d1_1_27, sel_internal_2_1_convert)
  is
  begin
    case sel_internal_2_1_convert is 
      when "0" =>
        unregy_join_6_1 <= d0_1_24;
      when others =>
        unregy_join_6_1 <= d1_1_27;
    end case;
  end process proc_switch_6_1;
  y <= unregy_join_6_1;
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_mux_b4753900d3 is
  port (
    sel : in std_logic_vector((2 - 1) downto 0);
    d0 : in std_logic_vector((16 - 1) downto 0);
    d1 : in std_logic_vector((16 - 1) downto 0);
    d2 : in std_logic_vector((16 - 1) downto 0);
    y : out std_logic_vector((16 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_mux_b4753900d3;
architecture behavior of sysgen_mux_b4753900d3
is
  signal sel_1_20: std_logic_vector((2 - 1) downto 0);
  signal d0_1_24: std_logic_vector((16 - 1) downto 0);
  signal d1_1_27: std_logic_vector((16 - 1) downto 0);
  signal d2_1_30: std_logic_vector((16 - 1) downto 0);
  type array_type_pipe_18_22 is array (0 to (1 - 1)) of std_logic_vector((16 - 1) downto 0);
  signal pipe_18_22: array_type_pipe_18_22 := (
    0 => "0000000000000000");
  signal pipe_18_22_front_din: std_logic_vector((16 - 1) downto 0);
  signal pipe_18_22_back: std_logic_vector((16 - 1) downto 0);
  signal pipe_18_22_push_front_pop_back_en: std_logic;
  signal unregy_join_6_1: std_logic_vector((16 - 1) downto 0);
begin
  sel_1_20 <= sel;
  d0_1_24 <= d0;
  d1_1_27 <= d1;
  d2_1_30 <= d2;
  pipe_18_22_back <= pipe_18_22(0);
  proc_pipe_18_22: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (pipe_18_22_push_front_pop_back_en = '1')) then
        pipe_18_22(0) <= pipe_18_22_front_din;
      end if;
    end if;
  end process proc_pipe_18_22;
  proc_switch_6_1: process (d0_1_24, d1_1_27, d2_1_30, sel_1_20)
  is
  begin
    case sel_1_20 is 
      when "00" =>
        unregy_join_6_1 <= d0_1_24;
      when "01" =>
        unregy_join_6_1 <= d1_1_27;
      when others =>
        unregy_join_6_1 <= d2_1_30;
    end case;
  end process proc_switch_6_1;
  pipe_18_22_front_din <= unregy_join_6_1;
  pipe_18_22_push_front_pop_back_en <= '1';
  y <= pipe_18_22_back;
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_mux_7a215d4692 is
  port (
    sel : in std_logic_vector((2 - 1) downto 0);
    d0 : in std_logic_vector((1 - 1) downto 0);
    d1 : in std_logic_vector((1 - 1) downto 0);
    d2 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_mux_7a215d4692;
architecture behavior of sysgen_mux_7a215d4692
is
  signal sel_1_20: std_logic_vector((2 - 1) downto 0);
  signal d0_1_24: std_logic;
  signal d1_1_27: std_logic;
  signal d2_1_30: std_logic;
  type array_type_pipe_18_22 is array (0 to (1 - 1)) of std_logic;
  signal pipe_18_22: array_type_pipe_18_22 := (
    0 => '0');
  signal pipe_18_22_front_din: std_logic;
  signal pipe_18_22_back: std_logic;
  signal pipe_18_22_push_front_pop_back_en: std_logic;
  signal unregy_join_6_1: std_logic;
begin
  sel_1_20 <= sel;
  d0_1_24 <= d0(0);
  d1_1_27 <= d1(0);
  d2_1_30 <= d2(0);
  pipe_18_22_back <= pipe_18_22(0);
  proc_pipe_18_22: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (pipe_18_22_push_front_pop_back_en = '1')) then
        pipe_18_22(0) <= pipe_18_22_front_din;
      end if;
    end if;
  end process proc_pipe_18_22;
  proc_switch_6_1: process (d0_1_24, d1_1_27, d2_1_30, sel_1_20)
  is
  begin
    case sel_1_20 is 
      when "00" =>
        unregy_join_6_1 <= d0_1_24;
      when "01" =>
        unregy_join_6_1 <= d1_1_27;
      when others =>
        unregy_join_6_1 <= d2_1_30;
    end case;
  end process proc_switch_6_1;
  pipe_18_22_front_din <= unregy_join_6_1;
  pipe_18_22_push_front_pop_back_en <= '1';
  y <= std_logic_to_vector(pipe_18_22_back);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_20b3b4887d is
  port (
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_20b3b4887d;
architecture behavior of sysgen_constant_20b3b4887d
is
begin
  op <= "1";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity transmitter_axi_lite_interface is 
    port(
        observation_point : out std_logic_vector(31 downto 0);
        modulation : out std_logic_vector(0 downto 0);
        enable_tx : out std_logic_vector(0 downto 0);
        enable_data : out std_logic_vector(0 downto 0);
        clk : out std_logic;
        transmitter_aclk : in std_logic;
        transmitter_aresetn : in std_logic;
        transmitter_s_axi_awaddr : in std_logic_vector(4-1 downto 0);
        transmitter_s_axi_awvalid : in std_logic;
        transmitter_s_axi_awready : out std_logic;
        transmitter_s_axi_wdata : in std_logic_vector(32-1 downto 0);
        transmitter_s_axi_wstrb : in std_logic_vector(32/8-1 downto 0);
        transmitter_s_axi_wvalid : in std_logic;
        transmitter_s_axi_wready : out std_logic;
        transmitter_s_axi_bresp : out std_logic_vector(1 downto 0);
        transmitter_s_axi_bvalid : out std_logic;
        transmitter_s_axi_bready : in std_logic;
        transmitter_s_axi_araddr : in std_logic_vector(4-1 downto 0);
        transmitter_s_axi_arvalid : in std_logic;
        transmitter_s_axi_arready : out std_logic;
        transmitter_s_axi_rdata : out std_logic_vector(32-1 downto 0);
        transmitter_s_axi_rresp : out std_logic_vector(1 downto 0);
        transmitter_s_axi_rvalid : out std_logic;
        transmitter_s_axi_rready : in std_logic
    );
end transmitter_axi_lite_interface;
architecture structural of transmitter_axi_lite_interface is 
component transmitter_axi_lite_interface_verilog is
    port(
        observation_point : out std_logic_vector(31 downto 0);
        modulation : out std_logic_vector(0 downto 0);
        enable_tx : out std_logic_vector(0 downto 0);
        enable_data : out std_logic_vector(0 downto 0);
        clk : out std_logic;
        transmitter_aclk : in std_logic;
        transmitter_aresetn : in std_logic;
        transmitter_s_axi_awaddr : in std_logic_vector(4-1 downto 0);
        transmitter_s_axi_awvalid : in std_logic;
        transmitter_s_axi_awready : out std_logic;
        transmitter_s_axi_wdata : in std_logic_vector(32-1 downto 0);
        transmitter_s_axi_wstrb : in std_logic_vector(32/8-1 downto 0);
        transmitter_s_axi_wvalid : in std_logic;
        transmitter_s_axi_wready : out std_logic;
        transmitter_s_axi_bresp : out std_logic_vector(1 downto 0);
        transmitter_s_axi_bvalid : out std_logic;
        transmitter_s_axi_bready : in std_logic;
        transmitter_s_axi_araddr : in std_logic_vector(4-1 downto 0);
        transmitter_s_axi_arvalid : in std_logic;
        transmitter_s_axi_arready : out std_logic;
        transmitter_s_axi_rdata : out std_logic_vector(32-1 downto 0);
        transmitter_s_axi_rresp : out std_logic_vector(1 downto 0);
        transmitter_s_axi_rvalid : out std_logic;
        transmitter_s_axi_rready : in std_logic
    );
end component;
begin
inst : transmitter_axi_lite_interface_verilog
    port map(
    observation_point => observation_point,
    modulation => modulation,
    enable_tx => enable_tx,
    enable_data => enable_data,
    clk => clk,
    transmitter_aclk => transmitter_aclk,
    transmitter_aresetn => transmitter_aresetn,
    transmitter_s_axi_awaddr => transmitter_s_axi_awaddr,
    transmitter_s_axi_awvalid => transmitter_s_axi_awvalid,
    transmitter_s_axi_awready => transmitter_s_axi_awready,
    transmitter_s_axi_wdata => transmitter_s_axi_wdata,
    transmitter_s_axi_wstrb => transmitter_s_axi_wstrb,
    transmitter_s_axi_wvalid => transmitter_s_axi_wvalid,
    transmitter_s_axi_wready => transmitter_s_axi_wready,
    transmitter_s_axi_bresp => transmitter_s_axi_bresp,
    transmitter_s_axi_bvalid => transmitter_s_axi_bvalid,
    transmitter_s_axi_bready => transmitter_s_axi_bready,
    transmitter_s_axi_araddr => transmitter_s_axi_araddr,
    transmitter_s_axi_arvalid => transmitter_s_axi_arvalid,
    transmitter_s_axi_arready => transmitter_s_axi_arready,
    transmitter_s_axi_rdata => transmitter_s_axi_rdata,
    transmitter_s_axi_rresp => transmitter_s_axi_rresp,
    transmitter_s_axi_rvalid => transmitter_s_axi_rvalid,
    transmitter_s_axi_rready => transmitter_s_axi_rready
);
end structural;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

-------------------------------------------------------------------
 -- System Generator VHDL source file.
 --
 -- Copyright(C) 2018 by Xilinx, Inc.  All rights reserved.  This
 -- text/file contains proprietary, confidential information of Xilinx,
 -- Inc., is distributed under license from Xilinx, Inc., and may be used,
 -- copied and/or disclosed only pursuant to the terms of a valid license
 -- agreement with Xilinx, Inc.  Xilinx hereby grants you a license to use
 -- this text/file solely for design, simulation, implementation and
 -- creation of design files limited to Xilinx devices or technologies.
 -- Use with non-Xilinx devices or technologies is expressly prohibited
 -- and immediately terminates your license unless covered by a separate
 -- agreement.
 --
 -- Xilinx is providing this design, code, or information "as is" solely
 -- for use in developing programs and solutions for Xilinx devices.  By
 -- providing this design, code, or information as one possible
 -- implementation of this feature, application or standard, Xilinx is
 -- making no representation that this implementation is free from any
 -- claims of infringement.  You are responsible for obtaining any rights
 -- you may require for your implementation.  Xilinx expressly disclaims
 -- any warranty whatsoever with respect to the adequacy of the
 -- implementation, including but not limited to warranties of
 -- merchantability or fitness for a particular purpose.
 --
 -- Xilinx products are not intended for use in life support appliances,
 -- devices, or systems.  Use in such applications is expressly prohibited.
 --
 -- Any modifications that are made to the source code are done at the user's
 -- sole risk and will be unsupported.
 --
 -- This copyright and support notice must be retained as part of this
 -- text at all times.  (c) Copyright 1995-2018 Xilinx, Inc.  All rights
 -- reserved.
 -------------------------------------------------------------------
 library IEEE;
 use IEEE.std_logic_1164.all;
 use IEEE.std_logic_arith.all;

entity transmitter_xlcmult is 
   generic (
     core_name0: string := "";
     a_width: integer := 4;
     a_bin_pt: integer := 2;
     a_arith: integer := xlSigned;
     b_width: integer := 4;
     b_bin_pt: integer := 2;
     b_arith: integer := xlSigned;
     p_width: integer := 8;
     p_bin_pt: integer := 2;
     p_arith: integer := xlSigned;
     rst_width: integer := 1;
     rst_bin_pt: integer := 0;
     rst_arith: integer := xlUnsigned;
     en_width: integer := 1;
     en_bin_pt: integer := 0;
     en_arith: integer := xlUnsigned;
     multsign: integer := xlSigned;
     quantization: integer := xlTruncate;
     overflow: integer := xlWrap;
     extra_registers: integer := 0;
     c_a_width: integer := 7;
     c_b_width: integer := 7;
     c_a_type: integer := 0;
     c_b_type: integer := 0;
     c_type: integer := 0;
     const_bin_pt: integer := 1;
     zero_const : integer := 0;
     c_output_width: integer := 16
   );
   port (
     a: in std_logic_vector(a_width - 1 downto 0);
     ce: in std_logic;
     clr: in std_logic;
     clk: in std_logic;
     core_ce: in std_logic:= '0';
     core_clr: in std_logic:= '0';
     core_clk: in std_logic:= '0';
     rst: in std_logic_vector(rst_width - 1 downto 0);
     en: in std_logic_vector(en_width - 1 downto 0);
     p: out std_logic_vector(p_width - 1 downto 0)
   );
 end transmitter_xlcmult;
 
 architecture behavior of transmitter_xlcmult is
 component synth_reg
 generic (
 width: integer := 16;
 latency: integer := 5
 );
 port (
 i: in std_logic_vector(width - 1 downto 0);
 ce: in std_logic;
 clr: in std_logic;
 clk: in std_logic;
 o: out std_logic_vector(width - 1 downto 0)
 );
 end component;
 signal tmp_a: std_logic_vector(c_a_width - 1 downto 0);
 signal tmp_p: std_logic_vector(c_output_width - 1 downto 0);
 signal conv_p: std_logic_vector(p_width - 1 downto 0);
 -- synthesis translate_off
 signal real_a, real_p: real;
 -- synthesis translate_on
 signal nd: std_logic;
 signal internal_ce: std_logic;
 signal internal_clr: std_logic;
 signal internal_core_ce: std_logic;


 component transmitter_mult_gen_v12_0_i0
    port ( 
      clk: in std_logic;
      ce: in std_logic;
      sclr: in std_logic;
      p: out std_logic_vector(c_output_width - 1 downto 0);
      a: in std_logic_vector(c_a_width - 1 downto 0) 
 		  ); 
 end component;

begin
 -- synthesis translate_off
 -- synthesis translate_on
 input_process: process(a)
 variable tmp_p_bin_pt, tmp_p_arith: integer;
 begin
 tmp_a <= zero_ext(a, c_a_width);
 end process;
 output_process: process(tmp_p)
 begin
 conv_p <= convert_type(tmp_p, c_output_width, a_bin_pt+b_bin_pt, multsign,
 p_width, p_bin_pt, p_arith, quantization, overflow);
 end process;
 internal_ce <= ce and en(0);
 internal_core_ce <= core_ce and en(0);
 internal_clr <= (clr or rst(0)) and ce;
 nd <= internal_ce;


 comp0: if ((core_name0 = "transmitter_mult_gen_v12_0_i0")) generate 
  core_instance0:transmitter_mult_gen_v12_0_i0
   port map ( 
      sclr => internal_clr,
      clk => clk,
      ce => internal_ce,
      p => tmp_p,
      a => tmp_a
  ); 
   end generate;

latency_gt_0: if (extra_registers > 0) and (zero_const = 0)
 generate
 reg: synth_reg
 generic map (
 width => p_width,
 latency => extra_registers
 )
 port map (
 i => conv_p,
 ce => internal_ce,
 clr => internal_clr,
 clk => clk,
 o => p
 );
 end generate;
 latency0: if ( (extra_registers = 0) and (zero_const = 0) )
 generate
 p <= conv_p;
 end generate latency0;
 zero_constant: if (zero_const = 1)
 generate
 p <= integer_to_std_logic_vector(0,p_width,p_arith);
 end generate zero_constant;
 end architecture behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

---------------------------------------------------------------------
 --
 --  Entity        : xlfifogen
 --
 --  Architecture  : behavior
 --
 --  Description   : Top level VHDL description of a fifo block
 --
 ---------------------------------------------------------------------
 
 library IEEE;
 use IEEE.std_logic_1164.all;
 use IEEE.std_logic_arith.all;
 use ieee.std_logic_unsigned.all;

entity transmitter_xlfifogen_u is 
   generic (
     core_name0: string := "";
     data_width: integer := -1;
     data_count_width: integer := -1;
     percent_full_width: integer := -1;
     has_ae : integer := 0;
     has_af : integer := 0;
     extra_registers: integer := 0;
     ignore_din_for_gcd: boolean := false;
     has_rst : boolean := false
   );
   port (
     din: in std_logic_vector(data_width - 1 downto 0);
     we: in std_logic;
     we_ce: in std_logic;
     re: in std_logic;
     re_ce: in std_logic;
     rst: in std_logic;
     en: in std_logic;
     ce: in std_logic;
     clk: in std_logic;
     empty: out std_logic;
     full: out std_logic;
     percent_full: out std_logic_vector(percent_full_width - 1 downto 0);
     dcount: out std_logic_vector(data_count_width - 1 downto 0);
     ae: out std_logic;
     af: out std_logic;
     dout: out std_logic_vector(data_width - 1 downto 0)
   );
 end transmitter_xlfifogen_u;
 
 architecture behavior of transmitter_xlfifogen_u is
 component synth_reg
 generic (
 width: integer := 16;
 latency: integer := 5
 );
 port (
 i: in std_logic_vector(width - 1 downto 0);
 ce: in std_logic;
 clr: in std_logic;
 clk: in std_logic;
 o: out std_logic_vector(width - 1 downto 0)
 );
 end component;
 component synth_reg_w_init 
 generic (width : integer;
 init_index : integer; 
 init_value : bit_vector; 
 latency : integer); 
 port (i : in std_logic_vector(width-1 downto 0); 
 ce : in std_logic; 
 clr : in std_logic; 
 clk : in std_logic; 
 o : out std_logic_vector(width-1 downto 0)); 
 end component; 
 


 component transmitter_fifo_generator_i0
    port ( 
      clk: in std_logic;
      din: in std_logic_vector(data_width - 1 downto 0);
      wr_en: in std_logic;
      rd_en: in std_logic;
      dout: out std_logic_vector(data_width - 1 downto 0);
      full: out std_logic;
      empty: out std_logic;
      data_count: out std_logic_vector(data_count_width - 1 downto 0) 
 		  ); 
 end component;

  signal rd_en: std_logic;
   signal wr_en: std_logic;
   signal srst: std_logic;
   signal core_full: std_logic;
   signal core_dcount: std_logic_vector(data_count_width - 1 downto 0);
   signal srst_vec: std_logic_vector(0 downto 0);
   signal dout_net: std_logic_vector(data_width - 1 downto 0);
   signal count: integer; 
   signal empty_net: std_logic; 
   signal ae_net: std_logic; 
   signal af_net: std_logic; 
   signal ae_vec: std_logic_vector(0 downto 0); 
   signal af_vec: std_logic_vector(0 downto 0); 
   signal ae_out: std_logic_vector(0 downto 0); 
   signal af_out: std_logic_vector(0 downto 0); 
 
 begin
 

 comp0: if ((core_name0 = "transmitter_fifo_generator_i0")) generate 
  core_instance0:transmitter_fifo_generator_i0
   port map ( 
        clk => clk,
        din => din,
        wr_en => wr_en,
        rd_en => rd_en,
        full => core_full,
        dout => dout_net,
        empty => empty_net
,
        data_count => core_dcount
  ); 
   end generate;

-- Process to remap data count from 0000->1111 when fifo is full.
   modify_count: process(core_full, core_dcount) is
   begin
     if core_full = '1' then
       percent_full <= (others => '1');
     else
       percent_full <= core_dcount(data_count_width-1 downto data_count_width-percent_full_width);
     end if;
   end process modify_count;
   
   
   --Zero ae/af if these signals are not specified on the core
   terminate_core_ae: if has_ae /= 1 generate
   begin
     ae <= '0';
   end generate terminate_core_ae;
   terminate_core_af: if has_af /= 1 generate
   begin
     af <= '0';
   end generate terminate_core_af;
latency_gt_0: if (extra_registers > 0) generate
   reg: synth_reg
     generic map (
       width => 1,
       latency => extra_registers
     )
     port map (
       i => std_logic_to_vector(rst),
       ce => ce,
       clr => '0',
       clk => clk,
       o => srst_vec
     );
     srst <= srst_vec(0);
 end generate;
 
  ae_vec(0) <= ae_net;
  af_vec(0) <= af_net;
 multi_sample: if (ignore_din_for_gcd) generate 
    reg1: synth_reg_w_init 
    generic map (width      => 1, 
    init_index => 2, 
    init_value => "1", 
    latency    => 1) 
    port map (i   => ae_vec, 
    ce  => ce, 
    clr => srst_vec(0), 
    clk => clk, 
    o   => ae_out); 
    reg2: synth_reg_w_init 
    generic map (width      => 1, 
    init_index => 2, 
    init_value => "0", 
    latency    => 1) 
    port map (i   => af_vec, 
    ce  => ce, 
    clr => srst_vec(0), 
    clk => clk, 
    o   => af_out); 
  end generate; 
  not_multi: if (ignore_din_for_gcd = false) generate 
 begin 
 af_out <= af_vec; 
  ae_out <= ae_vec; 
  end generate; 
 latency_eq_0: if (extra_registers = 0) generate
   srst <= rst and ce;
 end generate;
 
    process (dout_net, empty_net, core_full, core_dcount, ae_out(0), af_out(0), re, we, en, re_ce, we_ce) is 
    begin 
        dout <= dout_net; 
        empty <= empty_net; 
        full <= core_full; 
        dcount <= core_dcount;
        ae <= ae_out(0);
        af <= af_out(0);
        rd_en <= re and en and re_ce;
        wr_en <= we and en and we_ce;
    end process; 
 end  behavior;
 
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

entity xlcic_compiler_1550be3768d892b798d571eedcf4a1eb is 
  port(
    ce:in std_logic;
    ce_320:in std_logic;
    ce_logic_320:in std_logic;
    clk:in std_logic;
    clk_320:in std_logic;
    clk_logic_320:in std_logic;
    m_axis_data_tdata_real:out std_logic_vector(49 downto 0);
    m_axis_data_tvalid:out std_logic;
    s_axis_data_tdata_real:in std_logic_vector(15 downto 0);
    s_axis_data_tready:out std_logic
  );
end xlcic_compiler_1550be3768d892b798d571eedcf4a1eb; 

architecture behavior of xlcic_compiler_1550be3768d892b798d571eedcf4a1eb  is
  component transmitter_cic_compiler_v4_0_i0
    port(
      aclk:in std_logic;
      aclken:in std_logic;
      m_axis_data_tdata:out std_logic_vector(55 downto 0);
      m_axis_data_tvalid:out std_logic;
      s_axis_data_tdata:in std_logic_vector(15 downto 0);
      s_axis_data_tready:out std_logic;
      s_axis_data_tvalid:in std_logic
    );
end component;
signal m_axis_data_tdata_net: std_logic_vector(55 downto 0) := (others=>'0');
signal s_axis_data_tdata_net: std_logic_vector(15 downto 0) := (others=>'0');
begin
  m_axis_data_tdata_real <= m_axis_data_tdata_net(49 downto 0);
  s_axis_data_tdata_net(15 downto 0) <= s_axis_data_tdata_real;
  transmitter_cic_compiler_v4_0_i0_instance : transmitter_cic_compiler_v4_0_i0
    port map(
      aclk=>clk,
      aclken=>ce,
      m_axis_data_tdata=>m_axis_data_tdata_net,
      m_axis_data_tvalid=>m_axis_data_tvalid,
      s_axis_data_tdata=>s_axis_data_tdata_net,
      s_axis_data_tready=>s_axis_data_tready,
      s_axis_data_tvalid=>ce_logic_320
    );
end behavior;


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

entity xlfir_compiler_205c73803c3a1d01f8f0c298c8dd66b7 is 
  port(
    ce:in std_logic;
    ce_1280:in std_logic;
    ce_320:in std_logic;
    ce_logic_1280:in std_logic;
    clk:in std_logic;
    clk_1280:in std_logic;
    clk_320:in std_logic;
    clk_logic_1280:in std_logic;
    m_axis_data_tdata_path0:out std_logic_vector(30 downto 0);
    m_axis_data_tdata_path1:out std_logic_vector(30 downto 0);
    m_axis_data_tvalid:out std_logic;
    s_axis_data_tdata_path0:in std_logic_vector(15 downto 0);
    s_axis_data_tdata_path1:in std_logic_vector(15 downto 0);
    s_axis_data_tready:out std_logic;
    src_ce:in std_logic;
    src_clk:in std_logic
  );
end xlfir_compiler_205c73803c3a1d01f8f0c298c8dd66b7; 

architecture behavior of xlfir_compiler_205c73803c3a1d01f8f0c298c8dd66b7  is
  component transmitter_fir_compiler_v7_2_i0
    port(
      aclk:in std_logic;
      aclken:in std_logic;
      m_axis_data_tdata:out std_logic_vector(63 downto 0);
      m_axis_data_tvalid:out std_logic;
      s_axis_data_tdata:in std_logic_vector(31 downto 0);
      s_axis_data_tready:out std_logic;
      s_axis_data_tvalid:in std_logic
    );
end component;
signal m_axis_data_tdata_net: std_logic_vector(63 downto 0) := (others=>'0');
signal m_axis_data_tdata_path1_ps_net: std_logic_vector(30 downto 0) := (others=>'0');
signal m_axis_data_tdata_path0_ps_net: std_logic_vector(30 downto 0) := (others=>'0');
signal m_axis_data_tvalid_ps_net: std_logic := '0';
signal m_axis_data_tvalid_ps_net_captured: std_logic := '0';
signal m_axis_data_tvalid_ps_net_or_captured_net: std_logic := '0';
signal s_axis_data_tdata_net: std_logic_vector(31 downto 0) := (others=>'0');
begin
  m_axis_data_tdata_path1_ps_net <= m_axis_data_tdata_net(62 downto 32);
  m_axis_data_tdata_path0_ps_net <= m_axis_data_tdata_net(30 downto 0);
  s_axis_data_tdata_net(31 downto 16) <= s_axis_data_tdata_path1;
  s_axis_data_tdata_net(15 downto 0) <= s_axis_data_tdata_path0;
  m_axis_data_tdata_path1_ps_net_synchronizer : entity work.synth_reg_w_init
    generic map(
        width => 31,
        init_index => 0,
        init_value => "0",
        latency => 1
    )
    port map (
        i => m_axis_data_tdata_path1_ps_net,
        ce => ce_320,
        clr => '0',
        clk => clk_320, 
        o => m_axis_data_tdata_path1
    );
  m_axis_data_tdata_path0_ps_net_synchronizer : entity work.synth_reg_w_init
    generic map(
        width => 31,
        init_index => 0,
        init_value => "0",
        latency => 1
    )
    port map (
        i => m_axis_data_tdata_path0_ps_net,
        ce => ce_320,
        clr => '0',
        clk => clk_320, 
        o => m_axis_data_tdata_path0
    );
  m_axis_data_tvalid_ps_net_or_captured_net <= m_axis_data_tvalid_ps_net or m_axis_data_tvalid_ps_net_captured;
m_axis_data_tvalid_ps_net_synchronizer_1 : entity work.synth_reg_w_init
    generic map(
        width => 1,
        init_index => 0,
        init_value => "0",
        latency => 1
    )
    port map (
        i(0) => m_axis_data_tvalid_ps_net_or_captured_net,
        ce => ce_320,
        clr => '0',
        clk => clk_320, 
        o(0) => m_axis_data_tvalid
    );
m_axis_data_tvalid_ps_net_synchronizer_2 : entity work.synth_reg_w_init
    generic map(
        width => 1,
        init_index => 0,
        init_value => "0",
        latency => 1
    )
    port map (
        i(0) => '1',
        ce => m_axis_data_tvalid_ps_net,
        clr => '0',
        clk => clk_320, 
        o(0) => m_axis_data_tvalid_ps_net_captured
    );
  transmitter_fir_compiler_v7_2_i0_instance : transmitter_fir_compiler_v7_2_i0
    port map(
      aclk=>clk,
      aclken=>ce,
      m_axis_data_tdata=>m_axis_data_tdata_net,
      m_axis_data_tvalid=>m_axis_data_tvalid_ps_net,
      s_axis_data_tdata=>s_axis_data_tdata_net,
      s_axis_data_tready=>s_axis_data_tready,
      s_axis_data_tvalid=>ce_logic_1280
    );
end behavior;



