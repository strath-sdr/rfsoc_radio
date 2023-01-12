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
entity sysgen_concat_b0a3468cf3 is
  port (
    in0 : in std_logic_vector((8 - 1) downto 0);
    in1 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((9 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_concat_b0a3468cf3;
architecture behavior of sysgen_concat_b0a3468cf3
is
  signal in0_1_23: unsigned((8 - 1) downto 0);
  signal in1_1_27: boolean;
  signal y_2_1_concat: unsigned((9 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= ((in1) = "1");
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & boolean_to_vector(in1_1_27));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_291ac9f735 is
  port (
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_291ac9f735;
architecture behavior of sysgen_constant_291ac9f735
is
begin
  op <= "1";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_e1cbbe41f1 is
  port (
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_e1cbbe41f1;
architecture behavior of sysgen_constant_e1cbbe41f1
is
begin
  op <= "0";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_31e26c3c13 is
  port (
    op : out std_logic_vector((8 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_31e26c3c13;
architecture behavior of sysgen_constant_31e26c3c13
is
begin
  op <= "00000000";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_inverter_db20653b1e is
  port (
    ip : in std_logic_vector((1 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_inverter_db20653b1e;
architecture behavior of sysgen_inverter_db20653b1e
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
entity sysgen_logical_613abbe5d0 is
  port (
    d0 : in std_logic_vector((1 - 1) downto 0);
    d1 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_logical_613abbe5d0;
architecture behavior of sysgen_logical_613abbe5d0
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
entity sysgen_logical_4ec3e6b0b2 is
  port (
    d0 : in std_logic_vector((1 - 1) downto 0);
    d1 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_logical_4ec3e6b0b2;
architecture behavior of sysgen_logical_4ec3e6b0b2
is
  signal d0_1_24: std_logic;
  signal d1_1_27: std_logic;
  signal fully_2_1_bit: std_logic;
begin
  d0_1_24 <= d0(0);
  d1_1_27 <= d1(0);
  fully_2_1_bit <= d0_1_24 or d1_1_27;
  y <= std_logic_to_vector(fully_2_1_bit);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_mux_bc369b4d1c is
  port (
    sel : in std_logic_vector((1 - 1) downto 0);
    d0 : in std_logic_vector((1 - 1) downto 0);
    d1 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_mux_bc369b4d1c;
architecture behavior of sysgen_mux_bc369b4d1c
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
entity sysgen_mux_75af721bdf is
  port (
    sel : in std_logic_vector((1 - 1) downto 0);
    d0 : in std_logic_vector((8 - 1) downto 0);
    d1 : in std_logic_vector((8 - 1) downto 0);
    y : out std_logic_vector((8 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_mux_75af721bdf;
architecture behavior of sysgen_mux_75af721bdf
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


entity receiver_xlregister is

   generic (d_width          : integer := 5;          -- Width of d input
            init_value       : bit_vector := b"00");  -- Binary init value string

   port (d   : in std_logic_vector (d_width-1 downto 0);
         rst : in std_logic_vector(0 downto 0) := "0";
         en  : in std_logic_vector(0 downto 0) := "1";
         ce  : in std_logic;
         clk : in std_logic;
         q   : out std_logic_vector (d_width-1 downto 0));

end receiver_xlregister;

architecture behavior of receiver_xlregister is

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
entity sysgen_relational_ef14ae091d is
  port (
    a : in std_logic_vector((1 - 1) downto 0);
    b : in std_logic_vector((13 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_relational_ef14ae091d;
architecture behavior of sysgen_relational_ef14ae091d
is
  signal a_1_31: unsigned((1 - 1) downto 0);
  signal b_1_34: unsigned((13 - 1) downto 0);
  signal cast_12_12: unsigned((13 - 1) downto 0);
  signal result_12_3_rel: boolean;
begin
  a_1_31 <= std_logic_vector_to_unsigned(a);
  b_1_34 <= std_logic_vector_to_unsigned(b);
  cast_12_12 <= u2u_cast(a_1_31, 0, 13, 0);
  result_12_3_rel <= cast_12_12 = b_1_34;
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


entity receiver_xlslice is
    generic (
        new_msb      : integer := 9;           -- position of new msb
        new_lsb      : integer := 1;           -- position of new lsb
        x_width      : integer := 16;          -- Width of x input
        y_width      : integer := 8);          -- Width of y output
    port (
        x : in std_logic_vector (x_width-1 downto 0);
        y : out std_logic_vector (y_width-1 downto 0));
end receiver_xlslice;

architecture behavior of receiver_xlslice is
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

entity receiver_xlusamp is

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
end receiver_xlusamp;

architecture struct of receiver_xlusamp is
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
entity sysgen_shift_e52016e73f is
  port (
    ip : in std_logic_vector((23 - 1) downto 0);
    op : out std_logic_vector((23 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_shift_e52016e73f;
architecture behavior of sysgen_shift_e52016e73f
is
  signal ip_1_23: signed((23 - 1) downto 0);
  type array_type_op_mem_46_20 is array (0 to (1 - 1)) of signed((23 - 1) downto 0);
  signal op_mem_46_20: array_type_op_mem_46_20 := (
    0 => "00000000000000000000000");
  signal op_mem_46_20_front_din: signed((23 - 1) downto 0);
  signal op_mem_46_20_back: signed((23 - 1) downto 0);
  signal op_mem_46_20_push_front_pop_back_en: std_logic;
  signal cast_internal_ip_33_3_convert: signed((23 - 1) downto 0);
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
  cast_internal_ip_33_3_convert <= s2s_cast(ip_1_23, 20, 23, 21);
  op_mem_46_20_push_front_pop_back_en <= '0';
  op <= signed_to_std_logic_vector(cast_internal_ip_33_3_convert);
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


entity convert_func_call_receiver_xlconvert is
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
end convert_func_call_receiver_xlconvert ;

architecture behavior of convert_func_call_receiver_xlconvert is
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


entity receiver_xlconvert  is
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

end receiver_xlconvert ;

architecture behavior of receiver_xlconvert  is

    component synth_reg
        generic (width       : integer;
                 latency     : integer);
        port (i       : in std_logic_vector(width-1 downto 0);
              ce      : in std_logic;
              clr     : in std_logic;
              clk     : in std_logic;
              o       : out std_logic_vector(width-1 downto 0));
    end component;

    component convert_func_call_receiver_xlconvert 
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
      convert : convert_func_call_receiver_xlconvert 
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
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;


entity receiver_xldelay is
   generic(width        : integer := -1;
           latency      : integer := -1;
           reg_retiming : integer :=  0;
           reset        : integer :=  0);
   port(d       : in std_logic_vector (width-1 downto 0);
        ce      : in std_logic;
        clk     : in std_logic;
        en      : in std_logic;
        rst     : in std_logic;
        q       : out std_logic_vector (width-1 downto 0));

end receiver_xldelay;

architecture behavior of receiver_xldelay is
   component synth_reg
      generic (width       : integer;
               latency     : integer);
      port (i       : in std_logic_vector(width-1 downto 0);
            ce      : in std_logic;
            clr     : in std_logic;
            clk     : in std_logic;
            o       : out std_logic_vector(width-1 downto 0));
   end component; -- end component synth_reg

   component synth_reg_reg
      generic (width       : integer;
               latency     : integer);
      port (i       : in std_logic_vector(width-1 downto 0);
            ce      : in std_logic;
            clr     : in std_logic;
            clk     : in std_logic;
            o       : out std_logic_vector(width-1 downto 0));
   end component;

   signal internal_ce  : std_logic;

begin
   internal_ce  <= ce and en;

   srl_delay: if ((reg_retiming = 0) and (reset = 0)) or (latency < 1) generate
     synth_reg_srl_inst : synth_reg
       generic map (
         width   => width,
         latency => latency)
       port map (
         i   => d,
         ce  => internal_ce,
         clr => '0',
         clk => clk,
         o   => q);
   end generate srl_delay;

   reg_delay: if ((reg_retiming = 1) or (reset = 1)) and (latency >= 1) generate
     synth_reg_reg_inst : synth_reg_reg
       generic map (
         width   => width,
         latency => latency)
       port map (
         i   => d,
         ce  => internal_ce,
         clr => rst,
         clk => clk,
         o   => q);
   end generate reg_delay;
end architecture behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_concat_804ce16df3 is
  port (
    in0 : in std_logic_vector((1 - 1) downto 0);
    in1 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((2 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_concat_804ce16df3;
architecture behavior of sysgen_concat_804ce16df3
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

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_mux_d91aaccb20 is
  port (
    sel : in std_logic_vector((1 - 1) downto 0);
    d0 : in std_logic_vector((22 - 1) downto 0);
    d1 : in std_logic_vector((22 - 1) downto 0);
    y : out std_logic_vector((22 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_mux_d91aaccb20;
architecture behavior of sysgen_mux_d91aaccb20
is
  signal sel_1_20: std_logic;
  signal d0_1_24: std_logic_vector((22 - 1) downto 0);
  signal d1_1_27: std_logic_vector((22 - 1) downto 0);
  signal sel_internal_2_1_convert: std_logic_vector((1 - 1) downto 0);
  signal unregy_join_6_1: std_logic_vector((22 - 1) downto 0);
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

library xpm;
use xpm.vcomponents.all;
library IEEE;
use IEEE.std_logic_1164.all;

entity receiver_xlsprom is
   generic(c_address_width   : integer := -1;
           c_width             : integer := -1;
           mem_size          : integer := 0;
           mem_init_file     : string  := "none";
           read_reset_val    : string  := "0";
           mem_type          : string  := "auto";
           latency           : integer := 0);
   port(addr: in std_logic_vector(c_address_width-1 downto 0);
        en: in std_logic_vector(0 downto 0);
        rst: in std_logic_vector(0 downto 0);
        ce: in std_logic;
        clk: in std_logic;
        data: out std_logic_vector(c_width-1 downto 0)
);

end receiver_xlsprom;

architecture behavior of receiver_xlsprom is
signal a_en: std_logic_vector(0 downto 0);
signal a_rst: std_logic_vector(0 downto 0);
signal core_data_out, dly_data_out: std_logic_vector(c_width-1 downto 0);
 component synth_reg
     generic (
       width: integer;
       latency: integer
     );
     port (
       i: in std_logic_vector(width - 1 downto 0);
       ce: in std_logic;
       clr: in std_logic;
       clk: in std_logic;
       o: out std_logic_vector(width - 1 downto 0)
     );
 end component;
begin
a_en(0) <= en(0) and ce;
a_rst(0) <= rst(0) and ce;
 data <= dly_data_out;
xpm_memory_sprom_inst : xpm_memory_sprom

generic map (
   -- Common module generics
     MEMORY_SIZE        => mem_size,        --positive integer
     MEMORY_PRIMITIVE   => mem_type,
     MEMORY_INIT_FILE   => mem_init_file,
     MEMORY_INIT_PARAM  => "",
     USE_MEM_INIT       => 1,
     WAKEUP_TIME        => "disable_sleep",
     MESSAGE_CONTROL    => 0,

     -- Port A module generics
     READ_DATA_WIDTH_A  => c_width,
     ADDR_WIDTH_A       => c_address_width,
     READ_RESET_VALUE_A => read_reset_val,
     READ_LATENCY_A     => latency
 )
 port map (
     -- Common module ports
     sleep          =>  '0',
     -- Port A module ports
     clka           =>  clk,
     rsta           =>  a_rst(0),
     ena            =>  a_en(0),
     regcea         =>  '1',
	  addra          =>  addr,
	  injectsbiterra =>  '0',  --do not change
	  injectdbiterra =>  '0',  --do not change
	  douta          =>  core_data_out,
	  sbiterra       =>  open, --do not change
	  dbiterra       =>  open  --do not change
);
 latency_test:if (latency > 1)  generate
   reg1: synth_reg
     generic map (
     width => c_width,
     latency => latency - 1
     )
     port map (
     i => core_data_out,
     ce => ce,
     clr => '0',
     clk => clk,
     o => dly_data_out
     );
    end generate;
    latency_1 : if (latency<=1) generate
     dly_data_out <= core_data_out;
   end generate;
end behavior;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_a1ebb838d6 is
  port (
    op : out std_logic_vector((16 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_a1ebb838d6;
architecture behavior of sysgen_constant_a1ebb838d6
is
begin
  op <= "0000000000000000";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_addsub_1ce29be2fe is
  port (
    a : in std_logic_vector((16 - 1) downto 0);
    b : in std_logic_vector((22 - 1) downto 0);
    mode : in std_logic_vector((1 - 1) downto 0);
    s : out std_logic_vector((22 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_addsub_1ce29be2fe;
architecture behavior of sysgen_addsub_1ce29be2fe
is
  signal a_17_32: signed((16 - 1) downto 0);
  signal b_17_35: signed((22 - 1) downto 0);
  signal mode_17_48: boolean;
  type array_type_op_mem_91_20 is array (0 to (1 - 1)) of signed((22 - 1) downto 0);
  signal op_mem_91_20: array_type_op_mem_91_20 := (
    0 => "0000000000000000000000");
  signal op_mem_91_20_front_din: signed((22 - 1) downto 0);
  signal op_mem_91_20_back: signed((22 - 1) downto 0);
  signal op_mem_91_20_push_front_pop_back_en: std_logic;
  type array_type_cout_mem_92_22 is array (0 to (1 - 1)) of unsigned((1 - 1) downto 0);
  signal cout_mem_92_22: array_type_cout_mem_92_22 := (
    0 => "0");
  signal cout_mem_92_22_front_din: unsigned((1 - 1) downto 0);
  signal cout_mem_92_22_back: unsigned((1 - 1) downto 0);
  signal cout_mem_92_22_push_front_pop_back_en: std_logic;
  signal prev_mode_93_22_next: unsigned((3 - 1) downto 0);
  signal prev_mode_93_22: unsigned((3 - 1) downto 0);
  signal prev_mode_93_22_reg_i: std_logic_vector((3 - 1) downto 0);
  signal prev_mode_93_22_reg_o: std_logic_vector((3 - 1) downto 0);
  signal not_68_25: boolean;
  signal bool_68_25: boolean;
  signal bool_68_7: boolean;
  signal cast_internal_s_69_5_addsub_a: signed((23 - 1) downto 0);
  signal cast_internal_s_69_5_addsub_b: signed((23 - 1) downto 0);
  signal internal_s_69_5_addsub: signed((23 - 1) downto 0);
  signal cast_internal_s_83_3_convert: signed((22 - 1) downto 0);
  signal prev_mode_93_22_next_x_000000: unsigned((3 - 1) downto 0);
begin
  a_17_32 <= std_logic_vector_to_signed(a);
  b_17_35 <= std_logic_vector_to_signed(b);
  mode_17_48 <= ((mode) = "1");
  op_mem_91_20_back <= op_mem_91_20(0);
  proc_op_mem_91_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_91_20_push_front_pop_back_en = '1')) then
        op_mem_91_20(0) <= op_mem_91_20_front_din;
      end if;
    end if;
  end process proc_op_mem_91_20;
  cout_mem_92_22_back <= cout_mem_92_22(0);
  proc_cout_mem_92_22: process (clk)
  is
    variable i_x_000000: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (cout_mem_92_22_push_front_pop_back_en = '1')) then
        cout_mem_92_22(0) <= cout_mem_92_22_front_din;
      end if;
    end if;
  end process proc_cout_mem_92_22;
  prev_mode_93_22_reg_i <= unsigned_to_std_logic_vector(prev_mode_93_22_next);
  prev_mode_93_22 <= std_logic_vector_to_unsigned(prev_mode_93_22_reg_o);
  prev_mode_93_22_reg_inst: entity work.synth_reg_w_init
    generic map (
      init_index => 2, 
      init_value => b"010", 
      latency => 1, 
      width => 3)
    port map (
      ce => ce, 
      clk => clk, 
      clr => clr, 
      i => prev_mode_93_22_reg_i, 
      o => prev_mode_93_22_reg_o);
  not_68_25 <=  not mode_17_48;
  bool_68_25 <= not_68_25 and true;
  bool_68_7 <= false or bool_68_25;
  cast_internal_s_69_5_addsub_a <= s2s_cast(a_17_32, 14, 23, 20);
  cast_internal_s_69_5_addsub_b <= s2s_cast(b_17_35, 20, 23, 20);
  proc_internal_s_69_5_addsub: process (bool_68_7, cast_internal_s_69_5_addsub_a, cast_internal_s_69_5_addsub_b)
  is
  begin
    if bool_68_7 then
      internal_s_69_5_addsub <= (cast_internal_s_69_5_addsub_a + cast_internal_s_69_5_addsub_b);
    else 
      internal_s_69_5_addsub <= (cast_internal_s_69_5_addsub_a - cast_internal_s_69_5_addsub_b);
    end if;
  end process proc_internal_s_69_5_addsub;
  cast_internal_s_83_3_convert <= s2s_cast(internal_s_69_5_addsub, 20, 22, 20);
  op_mem_91_20_push_front_pop_back_en <= '0';
  cout_mem_92_22_push_front_pop_back_en <= '0';
  prev_mode_93_22_next_x_000000 <= u2u_cast(std_logic_vector_to_unsigned(boolean_to_vector(mode_17_48)), 0, 3, 0);
  prev_mode_93_22_next <= prev_mode_93_22_next_x_000000;
  s <= signed_to_std_logic_vector(cast_internal_s_83_3_convert);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_addsub_8d7c17c983 is
  port (
    a : in std_logic_vector((16 - 1) downto 0);
    b : in std_logic_vector((15 - 1) downto 0);
    mode : in std_logic_vector((1 - 1) downto 0);
    s : out std_logic_vector((15 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_addsub_8d7c17c983;
architecture behavior of sysgen_addsub_8d7c17c983
is
  signal a_17_32: signed((16 - 1) downto 0);
  signal b_17_35: signed((15 - 1) downto 0);
  signal mode_17_48: boolean;
  type array_type_op_mem_91_20 is array (0 to (1 - 1)) of signed((15 - 1) downto 0);
  signal op_mem_91_20: array_type_op_mem_91_20 := (
    0 => "000000000000000");
  signal op_mem_91_20_front_din: signed((15 - 1) downto 0);
  signal op_mem_91_20_back: signed((15 - 1) downto 0);
  signal op_mem_91_20_push_front_pop_back_en: std_logic;
  type array_type_cout_mem_92_22 is array (0 to (1 - 1)) of unsigned((1 - 1) downto 0);
  signal cout_mem_92_22: array_type_cout_mem_92_22 := (
    0 => "0");
  signal cout_mem_92_22_front_din: unsigned((1 - 1) downto 0);
  signal cout_mem_92_22_back: unsigned((1 - 1) downto 0);
  signal cout_mem_92_22_push_front_pop_back_en: std_logic;
  signal prev_mode_93_22_next: unsigned((3 - 1) downto 0);
  signal prev_mode_93_22: unsigned((3 - 1) downto 0);
  signal prev_mode_93_22_reg_i: std_logic_vector((3 - 1) downto 0);
  signal prev_mode_93_22_reg_o: std_logic_vector((3 - 1) downto 0);
  signal not_68_25: boolean;
  signal bool_68_25: boolean;
  signal bool_68_7: boolean;
  signal cast_internal_s_69_5_addsub_a: signed((18 - 1) downto 0);
  signal cast_internal_s_69_5_addsub_b: signed((18 - 1) downto 0);
  signal internal_s_69_5_addsub: signed((18 - 1) downto 0);
  signal cast_internal_s_83_3_convert: signed((15 - 1) downto 0);
  signal prev_mode_93_22_next_x_000000: unsigned((3 - 1) downto 0);
begin
  a_17_32 <= std_logic_vector_to_signed(a);
  b_17_35 <= std_logic_vector_to_signed(b);
  mode_17_48 <= ((mode) = "1");
  op_mem_91_20_back <= op_mem_91_20(0);
  proc_op_mem_91_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_91_20_push_front_pop_back_en = '1')) then
        op_mem_91_20(0) <= op_mem_91_20_front_din;
      end if;
    end if;
  end process proc_op_mem_91_20;
  cout_mem_92_22_back <= cout_mem_92_22(0);
  proc_cout_mem_92_22: process (clk)
  is
    variable i_x_000000: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (cout_mem_92_22_push_front_pop_back_en = '1')) then
        cout_mem_92_22(0) <= cout_mem_92_22_front_din;
      end if;
    end if;
  end process proc_cout_mem_92_22;
  prev_mode_93_22_reg_i <= unsigned_to_std_logic_vector(prev_mode_93_22_next);
  prev_mode_93_22 <= std_logic_vector_to_unsigned(prev_mode_93_22_reg_o);
  prev_mode_93_22_reg_inst: entity work.synth_reg_w_init
    generic map (
      init_index => 2, 
      init_value => b"010", 
      latency => 1, 
      width => 3)
    port map (
      ce => ce, 
      clk => clk, 
      clr => clr, 
      i => prev_mode_93_22_reg_i, 
      o => prev_mode_93_22_reg_o);
  not_68_25 <=  not mode_17_48;
  bool_68_25 <= not_68_25 and true;
  bool_68_7 <= false or bool_68_25;
  cast_internal_s_69_5_addsub_a <= s2s_cast(a_17_32, 14, 18, 14);
  cast_internal_s_69_5_addsub_b <= s2s_cast(b_17_35, 12, 18, 14);
  proc_internal_s_69_5_addsub: process (bool_68_7, cast_internal_s_69_5_addsub_a, cast_internal_s_69_5_addsub_b)
  is
  begin
    if bool_68_7 then
      internal_s_69_5_addsub <= (cast_internal_s_69_5_addsub_a + cast_internal_s_69_5_addsub_b);
    else 
      internal_s_69_5_addsub <= (cast_internal_s_69_5_addsub_a - cast_internal_s_69_5_addsub_b);
    end if;
  end process proc_internal_s_69_5_addsub;
  cast_internal_s_83_3_convert <= s2s_cast(internal_s_69_5_addsub, 14, 15, 12);
  op_mem_91_20_push_front_pop_back_en <= '0';
  cout_mem_92_22_push_front_pop_back_en <= '0';
  prev_mode_93_22_next_x_000000 <= u2u_cast(std_logic_vector_to_unsigned(boolean_to_vector(mode_17_48)), 0, 3, 0);
  prev_mode_93_22_next <= prev_mode_93_22_next_x_000000;
  s <= signed_to_std_logic_vector(cast_internal_s_83_3_convert);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_e9e7d10164 is
  port (
    op : out std_logic_vector((22 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_e9e7d10164;
architecture behavior of sysgen_constant_e9e7d10164
is
begin
  op <= "0011001001000011111110";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_logical_e706ee99ae is
  port (
    d0 : in std_logic_vector((1 - 1) downto 0);
    d1 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_logical_e706ee99ae;
architecture behavior of sysgen_logical_e706ee99ae
is
  signal d0_1_24: std_logic;
  signal d1_1_27: std_logic;
  signal fully_2_1_bit: std_logic;
begin
  d0_1_24 <= d0(0);
  d1_1_27 <= d1(0);
  fully_2_1_bit <= d0_1_24 xor d1_1_27;
  y <= std_logic_to_vector(fully_2_1_bit);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_shift_57ee593aad is
  port (
    ip : in std_logic_vector((16 - 1) downto 0);
    op : out std_logic_vector((15 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_shift_57ee593aad;
architecture behavior of sysgen_shift_57ee593aad
is
  signal ip_1_23: signed((16 - 1) downto 0);
  type array_type_op_mem_46_20 is array (0 to (1 - 1)) of signed((15 - 1) downto 0);
  signal op_mem_46_20: array_type_op_mem_46_20 := (
    0 => "000000000000000");
  signal op_mem_46_20_front_din: signed((15 - 1) downto 0);
  signal op_mem_46_20_back: signed((15 - 1) downto 0);
  signal op_mem_46_20_push_front_pop_back_en: std_logic;
  signal cast_internal_ip_33_3_convert: signed((15 - 1) downto 0);
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
  cast_internal_ip_33_3_convert <= s2s_cast(ip_1_23, 14, 15, 12);
  op_mem_46_20_push_front_pop_back_en <= '0';
  op <= signed_to_std_logic_vector(cast_internal_ip_33_3_convert);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_addsub_b8c87ec6ec is
  port (
    a : in std_logic_vector((22 - 1) downto 0);
    b : in std_logic_vector((22 - 1) downto 0);
    mode : in std_logic_vector((1 - 1) downto 0);
    s : out std_logic_vector((22 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_addsub_b8c87ec6ec;
architecture behavior of sysgen_addsub_b8c87ec6ec
is
  signal a_17_32: signed((22 - 1) downto 0);
  signal b_17_35: signed((22 - 1) downto 0);
  signal mode_17_48: boolean;
  type array_type_op_mem_91_20 is array (0 to (1 - 1)) of signed((22 - 1) downto 0);
  signal op_mem_91_20: array_type_op_mem_91_20 := (
    0 => "0000000000000000000000");
  signal op_mem_91_20_front_din: signed((22 - 1) downto 0);
  signal op_mem_91_20_back: signed((22 - 1) downto 0);
  signal op_mem_91_20_push_front_pop_back_en: std_logic;
  type array_type_cout_mem_92_22 is array (0 to (1 - 1)) of unsigned((1 - 1) downto 0);
  signal cout_mem_92_22: array_type_cout_mem_92_22 := (
    0 => "0");
  signal cout_mem_92_22_front_din: unsigned((1 - 1) downto 0);
  signal cout_mem_92_22_back: unsigned((1 - 1) downto 0);
  signal cout_mem_92_22_push_front_pop_back_en: std_logic;
  signal prev_mode_93_22_next: unsigned((3 - 1) downto 0);
  signal prev_mode_93_22: unsigned((3 - 1) downto 0);
  signal prev_mode_93_22_reg_i: std_logic_vector((3 - 1) downto 0);
  signal prev_mode_93_22_reg_o: std_logic_vector((3 - 1) downto 0);
  signal not_68_25: boolean;
  signal bool_68_25: boolean;
  signal bool_68_7: boolean;
  signal cast_internal_s_69_5_addsub_a: signed((23 - 1) downto 0);
  signal cast_internal_s_69_5_addsub_b: signed((23 - 1) downto 0);
  signal internal_s_69_5_addsub: signed((23 - 1) downto 0);
  signal cast_internal_s_83_3_convert: signed((22 - 1) downto 0);
  signal prev_mode_93_22_next_x_000000: unsigned((3 - 1) downto 0);
begin
  a_17_32 <= std_logic_vector_to_signed(a);
  b_17_35 <= std_logic_vector_to_signed(b);
  mode_17_48 <= ((mode) = "1");
  op_mem_91_20_back <= op_mem_91_20(0);
  proc_op_mem_91_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_91_20_push_front_pop_back_en = '1')) then
        op_mem_91_20(0) <= op_mem_91_20_front_din;
      end if;
    end if;
  end process proc_op_mem_91_20;
  cout_mem_92_22_back <= cout_mem_92_22(0);
  proc_cout_mem_92_22: process (clk)
  is
    variable i_x_000000: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (cout_mem_92_22_push_front_pop_back_en = '1')) then
        cout_mem_92_22(0) <= cout_mem_92_22_front_din;
      end if;
    end if;
  end process proc_cout_mem_92_22;
  prev_mode_93_22_reg_i <= unsigned_to_std_logic_vector(prev_mode_93_22_next);
  prev_mode_93_22 <= std_logic_vector_to_unsigned(prev_mode_93_22_reg_o);
  prev_mode_93_22_reg_inst: entity work.synth_reg_w_init
    generic map (
      init_index => 2, 
      init_value => b"010", 
      latency => 1, 
      width => 3)
    port map (
      ce => ce, 
      clk => clk, 
      clr => clr, 
      i => prev_mode_93_22_reg_i, 
      o => prev_mode_93_22_reg_o);
  not_68_25 <=  not mode_17_48;
  bool_68_25 <= not_68_25 and true;
  bool_68_7 <= false or bool_68_25;
  cast_internal_s_69_5_addsub_a <= s2s_cast(a_17_32, 20, 23, 20);
  cast_internal_s_69_5_addsub_b <= s2s_cast(b_17_35, 20, 23, 20);
  proc_internal_s_69_5_addsub: process (bool_68_7, cast_internal_s_69_5_addsub_a, cast_internal_s_69_5_addsub_b)
  is
  begin
    if bool_68_7 then
      internal_s_69_5_addsub <= (cast_internal_s_69_5_addsub_a + cast_internal_s_69_5_addsub_b);
    else 
      internal_s_69_5_addsub <= (cast_internal_s_69_5_addsub_a - cast_internal_s_69_5_addsub_b);
    end if;
  end process proc_internal_s_69_5_addsub;
  cast_internal_s_83_3_convert <= s2s_cast(internal_s_69_5_addsub, 20, 22, 20);
  op_mem_91_20_push_front_pop_back_en <= '0';
  cout_mem_92_22_push_front_pop_back_en <= '0';
  prev_mode_93_22_next_x_000000 <= u2u_cast(std_logic_vector_to_unsigned(boolean_to_vector(mode_17_48)), 0, 3, 0);
  prev_mode_93_22_next <= prev_mode_93_22_next_x_000000;
  s <= signed_to_std_logic_vector(cast_internal_s_83_3_convert);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_addsub_d08d68c26b is
  port (
    a : in std_logic_vector((15 - 1) downto 0);
    b : in std_logic_vector((15 - 1) downto 0);
    mode : in std_logic_vector((1 - 1) downto 0);
    s : out std_logic_vector((15 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_addsub_d08d68c26b;
architecture behavior of sysgen_addsub_d08d68c26b
is
  signal a_17_32: signed((15 - 1) downto 0);
  signal b_17_35: signed((15 - 1) downto 0);
  signal mode_17_48: boolean;
  type array_type_op_mem_91_20 is array (0 to (1 - 1)) of signed((15 - 1) downto 0);
  signal op_mem_91_20: array_type_op_mem_91_20 := (
    0 => "000000000000000");
  signal op_mem_91_20_front_din: signed((15 - 1) downto 0);
  signal op_mem_91_20_back: signed((15 - 1) downto 0);
  signal op_mem_91_20_push_front_pop_back_en: std_logic;
  type array_type_cout_mem_92_22 is array (0 to (1 - 1)) of unsigned((1 - 1) downto 0);
  signal cout_mem_92_22: array_type_cout_mem_92_22 := (
    0 => "0");
  signal cout_mem_92_22_front_din: unsigned((1 - 1) downto 0);
  signal cout_mem_92_22_back: unsigned((1 - 1) downto 0);
  signal cout_mem_92_22_push_front_pop_back_en: std_logic;
  signal prev_mode_93_22_next: unsigned((3 - 1) downto 0);
  signal prev_mode_93_22: unsigned((3 - 1) downto 0);
  signal prev_mode_93_22_reg_i: std_logic_vector((3 - 1) downto 0);
  signal prev_mode_93_22_reg_o: std_logic_vector((3 - 1) downto 0);
  signal not_68_25: boolean;
  signal bool_68_25: boolean;
  signal bool_68_7: boolean;
  signal cast_internal_s_69_5_addsub_a: signed((16 - 1) downto 0);
  signal cast_internal_s_69_5_addsub_b: signed((16 - 1) downto 0);
  signal internal_s_69_5_addsub: signed((16 - 1) downto 0);
  signal cast_internal_s_83_3_convert: signed((15 - 1) downto 0);
  signal prev_mode_93_22_next_x_000000: unsigned((3 - 1) downto 0);
begin
  a_17_32 <= std_logic_vector_to_signed(a);
  b_17_35 <= std_logic_vector_to_signed(b);
  mode_17_48 <= ((mode) = "1");
  op_mem_91_20_back <= op_mem_91_20(0);
  proc_op_mem_91_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_91_20_push_front_pop_back_en = '1')) then
        op_mem_91_20(0) <= op_mem_91_20_front_din;
      end if;
    end if;
  end process proc_op_mem_91_20;
  cout_mem_92_22_back <= cout_mem_92_22(0);
  proc_cout_mem_92_22: process (clk)
  is
    variable i_x_000000: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (cout_mem_92_22_push_front_pop_back_en = '1')) then
        cout_mem_92_22(0) <= cout_mem_92_22_front_din;
      end if;
    end if;
  end process proc_cout_mem_92_22;
  prev_mode_93_22_reg_i <= unsigned_to_std_logic_vector(prev_mode_93_22_next);
  prev_mode_93_22 <= std_logic_vector_to_unsigned(prev_mode_93_22_reg_o);
  prev_mode_93_22_reg_inst: entity work.synth_reg_w_init
    generic map (
      init_index => 2, 
      init_value => b"010", 
      latency => 1, 
      width => 3)
    port map (
      ce => ce, 
      clk => clk, 
      clr => clr, 
      i => prev_mode_93_22_reg_i, 
      o => prev_mode_93_22_reg_o);
  not_68_25 <=  not mode_17_48;
  bool_68_25 <= not_68_25 and true;
  bool_68_7 <= false or bool_68_25;
  cast_internal_s_69_5_addsub_a <= s2s_cast(a_17_32, 12, 16, 12);
  cast_internal_s_69_5_addsub_b <= s2s_cast(b_17_35, 12, 16, 12);
  proc_internal_s_69_5_addsub: process (bool_68_7, cast_internal_s_69_5_addsub_a, cast_internal_s_69_5_addsub_b)
  is
  begin
    if bool_68_7 then
      internal_s_69_5_addsub <= (cast_internal_s_69_5_addsub_a + cast_internal_s_69_5_addsub_b);
    else 
      internal_s_69_5_addsub <= (cast_internal_s_69_5_addsub_a - cast_internal_s_69_5_addsub_b);
    end if;
  end process proc_internal_s_69_5_addsub;
  cast_internal_s_83_3_convert <= s2s_cast(internal_s_69_5_addsub, 12, 15, 12);
  op_mem_91_20_push_front_pop_back_en <= '0';
  cout_mem_92_22_push_front_pop_back_en <= '0';
  prev_mode_93_22_next_x_000000 <= u2u_cast(std_logic_vector_to_unsigned(boolean_to_vector(mode_17_48)), 0, 3, 0);
  prev_mode_93_22_next <= prev_mode_93_22_next_x_000000;
  s <= signed_to_std_logic_vector(cast_internal_s_83_3_convert);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_d4d8254f24 is
  port (
    op : out std_logic_vector((22 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_d4d8254f24;
architecture behavior of sysgen_constant_d4d8254f24
is
begin
  op <= "0001110110101100011010";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_shift_16a6fc976d is
  port (
    ip : in std_logic_vector((15 - 1) downto 0);
    op : out std_logic_vector((15 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_shift_16a6fc976d;
architecture behavior of sysgen_shift_16a6fc976d
is
  signal ip_1_23: signed((15 - 1) downto 0);
  type array_type_op_mem_46_20 is array (0 to (1 - 1)) of signed((15 - 1) downto 0);
  signal op_mem_46_20: array_type_op_mem_46_20 := (
    0 => "000000000000000");
  signal op_mem_46_20_front_din: signed((15 - 1) downto 0);
  signal op_mem_46_20_back: signed((15 - 1) downto 0);
  signal op_mem_46_20_push_front_pop_back_en: std_logic;
  signal cast_internal_ip_33_3_convert: signed((15 - 1) downto 0);
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
  cast_internal_ip_33_3_convert <= s2s_cast(ip_1_23, 13, 15, 12);
  op_mem_46_20_push_front_pop_back_en <= '0';
  op <= signed_to_std_logic_vector(cast_internal_ip_33_3_convert);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_1ac3e68a1c is
  port (
    op : out std_logic_vector((22 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_1ac3e68a1c;
architecture behavior of sysgen_constant_1ac3e68a1c
is
begin
  op <= "0000000000010000000000";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_shift_9d9a206710 is
  port (
    ip : in std_logic_vector((15 - 1) downto 0);
    op : out std_logic_vector((15 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_shift_9d9a206710;
architecture behavior of sysgen_shift_9d9a206710
is
  signal ip_1_23: signed((15 - 1) downto 0);
  type array_type_op_mem_46_20 is array (0 to (1 - 1)) of signed((15 - 1) downto 0);
  signal op_mem_46_20: array_type_op_mem_46_20 := (
    0 => "000000000000000");
  signal op_mem_46_20_front_din: signed((15 - 1) downto 0);
  signal op_mem_46_20_back: signed((15 - 1) downto 0);
  signal op_mem_46_20_push_front_pop_back_en: std_logic;
  signal cast_internal_ip_27_3_rsh: signed((22 - 1) downto 0);
  signal cast_internal_ip_33_3_convert: signed((15 - 1) downto 0);
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
  cast_internal_ip_27_3_rsh <= s2s_cast(ip_1_23, 12, 22, 12);
  cast_internal_ip_33_3_convert <= s2s_cast(cast_internal_ip_27_3_rsh, 22, 15, 12);
  op_mem_46_20_push_front_pop_back_en <= '0';
  op <= signed_to_std_logic_vector(cast_internal_ip_33_3_convert);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_97a2d1d222 is
  port (
    op : out std_logic_vector((22 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_97a2d1d222;
architecture behavior of sysgen_constant_97a2d1d222
is
begin
  op <= "0000111110101101101111";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_shift_7a05d19302 is
  port (
    ip : in std_logic_vector((15 - 1) downto 0);
    op : out std_logic_vector((15 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_shift_7a05d19302;
architecture behavior of sysgen_shift_7a05d19302
is
  signal ip_1_23: signed((15 - 1) downto 0);
  type array_type_op_mem_46_20 is array (0 to (1 - 1)) of signed((15 - 1) downto 0);
  signal op_mem_46_20: array_type_op_mem_46_20 := (
    0 => "000000000000000");
  signal op_mem_46_20_front_din: signed((15 - 1) downto 0);
  signal op_mem_46_20_back: signed((15 - 1) downto 0);
  signal op_mem_46_20_push_front_pop_back_en: std_logic;
  signal cast_internal_ip_33_3_convert: signed((15 - 1) downto 0);
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
  cast_internal_ip_33_3_convert <= s2s_cast(ip_1_23, 14, 15, 12);
  op_mem_46_20_push_front_pop_back_en <= '0';
  op <= signed_to_std_logic_vector(cast_internal_ip_33_3_convert);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_e40c082fdf is
  port (
    op : out std_logic_vector((22 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_e40c082fdf;
architecture behavior of sysgen_constant_e40c082fdf
is
begin
  op <= "0000011111110101011100";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_shift_6e3c700f38 is
  port (
    ip : in std_logic_vector((15 - 1) downto 0);
    op : out std_logic_vector((15 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_shift_6e3c700f38;
architecture behavior of sysgen_shift_6e3c700f38
is
  signal ip_1_23: signed((15 - 1) downto 0);
  type array_type_op_mem_46_20 is array (0 to (1 - 1)) of signed((15 - 1) downto 0);
  signal op_mem_46_20: array_type_op_mem_46_20 := (
    0 => "000000000000000");
  signal op_mem_46_20_front_din: signed((15 - 1) downto 0);
  signal op_mem_46_20_back: signed((15 - 1) downto 0);
  signal op_mem_46_20_push_front_pop_back_en: std_logic;
  signal cast_internal_ip_33_3_convert: signed((15 - 1) downto 0);
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
  cast_internal_ip_33_3_convert <= s2s_cast(ip_1_23, 15, 15, 12);
  op_mem_46_20_push_front_pop_back_en <= '0';
  op <= signed_to_std_logic_vector(cast_internal_ip_33_3_convert);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_9ee2402d4f is
  port (
    op : out std_logic_vector((22 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_9ee2402d4f;
architecture behavior of sysgen_constant_9ee2402d4f
is
begin
  op <= "0000001111111110101011";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_shift_86f2a39b1b is
  port (
    ip : in std_logic_vector((15 - 1) downto 0);
    op : out std_logic_vector((15 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_shift_86f2a39b1b;
architecture behavior of sysgen_shift_86f2a39b1b
is
  signal ip_1_23: signed((15 - 1) downto 0);
  type array_type_op_mem_46_20 is array (0 to (1 - 1)) of signed((15 - 1) downto 0);
  signal op_mem_46_20: array_type_op_mem_46_20 := (
    0 => "000000000000000");
  signal op_mem_46_20_front_din: signed((15 - 1) downto 0);
  signal op_mem_46_20_back: signed((15 - 1) downto 0);
  signal op_mem_46_20_push_front_pop_back_en: std_logic;
  signal cast_internal_ip_27_3_rsh: signed((16 - 1) downto 0);
  signal cast_internal_ip_33_3_convert: signed((15 - 1) downto 0);
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
  cast_internal_ip_27_3_rsh <= s2s_cast(ip_1_23, 12, 16, 12);
  cast_internal_ip_33_3_convert <= s2s_cast(cast_internal_ip_27_3_rsh, 16, 15, 12);
  op_mem_46_20_push_front_pop_back_en <= '0';
  op <= signed_to_std_logic_vector(cast_internal_ip_33_3_convert);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_3b19b1af4d is
  port (
    op : out std_logic_vector((22 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_3b19b1af4d;
architecture behavior of sysgen_constant_3b19b1af4d
is
begin
  op <= "0000000111111111110101";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_shift_0a5abab164 is
  port (
    ip : in std_logic_vector((15 - 1) downto 0);
    op : out std_logic_vector((15 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_shift_0a5abab164;
architecture behavior of sysgen_shift_0a5abab164
is
  signal ip_1_23: signed((15 - 1) downto 0);
  type array_type_op_mem_46_20 is array (0 to (1 - 1)) of signed((15 - 1) downto 0);
  signal op_mem_46_20: array_type_op_mem_46_20 := (
    0 => "000000000000000");
  signal op_mem_46_20_front_din: signed((15 - 1) downto 0);
  signal op_mem_46_20_back: signed((15 - 1) downto 0);
  signal op_mem_46_20_push_front_pop_back_en: std_logic;
  signal cast_internal_ip_27_3_rsh: signed((17 - 1) downto 0);
  signal cast_internal_ip_33_3_convert: signed((15 - 1) downto 0);
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
  cast_internal_ip_27_3_rsh <= s2s_cast(ip_1_23, 12, 17, 12);
  cast_internal_ip_33_3_convert <= s2s_cast(cast_internal_ip_27_3_rsh, 17, 15, 12);
  op_mem_46_20_push_front_pop_back_en <= '0';
  op <= signed_to_std_logic_vector(cast_internal_ip_33_3_convert);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_40acab5fa7 is
  port (
    op : out std_logic_vector((22 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_40acab5fa7;
architecture behavior of sysgen_constant_40acab5fa7
is
begin
  op <= "0000000011111111111111";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_shift_dbf5b0c1d6 is
  port (
    ip : in std_logic_vector((15 - 1) downto 0);
    op : out std_logic_vector((15 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_shift_dbf5b0c1d6;
architecture behavior of sysgen_shift_dbf5b0c1d6
is
  signal ip_1_23: signed((15 - 1) downto 0);
  type array_type_op_mem_46_20 is array (0 to (1 - 1)) of signed((15 - 1) downto 0);
  signal op_mem_46_20: array_type_op_mem_46_20 := (
    0 => "000000000000000");
  signal op_mem_46_20_front_din: signed((15 - 1) downto 0);
  signal op_mem_46_20_back: signed((15 - 1) downto 0);
  signal op_mem_46_20_push_front_pop_back_en: std_logic;
  signal cast_internal_ip_27_3_rsh: signed((18 - 1) downto 0);
  signal cast_internal_ip_33_3_convert: signed((15 - 1) downto 0);
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
  cast_internal_ip_27_3_rsh <= s2s_cast(ip_1_23, 12, 18, 12);
  cast_internal_ip_33_3_convert <= s2s_cast(cast_internal_ip_27_3_rsh, 18, 15, 12);
  op_mem_46_20_push_front_pop_back_en <= '0';
  op <= signed_to_std_logic_vector(cast_internal_ip_33_3_convert);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_0d23d62541 is
  port (
    op : out std_logic_vector((22 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_0d23d62541;
architecture behavior of sysgen_constant_0d23d62541
is
begin
  op <= "0000000010000000000000";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_shift_4ba794e2ce is
  port (
    ip : in std_logic_vector((15 - 1) downto 0);
    op : out std_logic_vector((15 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_shift_4ba794e2ce;
architecture behavior of sysgen_shift_4ba794e2ce
is
  signal ip_1_23: signed((15 - 1) downto 0);
  type array_type_op_mem_46_20 is array (0 to (1 - 1)) of signed((15 - 1) downto 0);
  signal op_mem_46_20: array_type_op_mem_46_20 := (
    0 => "000000000000000");
  signal op_mem_46_20_front_din: signed((15 - 1) downto 0);
  signal op_mem_46_20_back: signed((15 - 1) downto 0);
  signal op_mem_46_20_push_front_pop_back_en: std_logic;
  signal cast_internal_ip_27_3_rsh: signed((19 - 1) downto 0);
  signal cast_internal_ip_33_3_convert: signed((15 - 1) downto 0);
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
  cast_internal_ip_27_3_rsh <= s2s_cast(ip_1_23, 12, 19, 12);
  cast_internal_ip_33_3_convert <= s2s_cast(cast_internal_ip_27_3_rsh, 19, 15, 12);
  op_mem_46_20_push_front_pop_back_en <= '0';
  op <= signed_to_std_logic_vector(cast_internal_ip_33_3_convert);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_68c9d38ccb is
  port (
    op : out std_logic_vector((22 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_68c9d38ccb;
architecture behavior of sysgen_constant_68c9d38ccb
is
begin
  op <= "0000000001000000000000";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_shift_af5b82b0d2 is
  port (
    ip : in std_logic_vector((15 - 1) downto 0);
    op : out std_logic_vector((15 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_shift_af5b82b0d2;
architecture behavior of sysgen_shift_af5b82b0d2
is
  signal ip_1_23: signed((15 - 1) downto 0);
  type array_type_op_mem_46_20 is array (0 to (1 - 1)) of signed((15 - 1) downto 0);
  signal op_mem_46_20: array_type_op_mem_46_20 := (
    0 => "000000000000000");
  signal op_mem_46_20_front_din: signed((15 - 1) downto 0);
  signal op_mem_46_20_back: signed((15 - 1) downto 0);
  signal op_mem_46_20_push_front_pop_back_en: std_logic;
  signal cast_internal_ip_27_3_rsh: signed((20 - 1) downto 0);
  signal cast_internal_ip_33_3_convert: signed((15 - 1) downto 0);
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
  cast_internal_ip_27_3_rsh <= s2s_cast(ip_1_23, 12, 20, 12);
  cast_internal_ip_33_3_convert <= s2s_cast(cast_internal_ip_27_3_rsh, 20, 15, 12);
  op_mem_46_20_push_front_pop_back_en <= '0';
  op <= signed_to_std_logic_vector(cast_internal_ip_33_3_convert);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_b3d37d93b5 is
  port (
    op : out std_logic_vector((22 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_b3d37d93b5;
architecture behavior of sysgen_constant_b3d37d93b5
is
begin
  op <= "0000000000100000000000";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_shift_9c56238928 is
  port (
    ip : in std_logic_vector((15 - 1) downto 0);
    op : out std_logic_vector((15 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_shift_9c56238928;
architecture behavior of sysgen_shift_9c56238928
is
  signal ip_1_23: signed((15 - 1) downto 0);
  type array_type_op_mem_46_20 is array (0 to (1 - 1)) of signed((15 - 1) downto 0);
  signal op_mem_46_20: array_type_op_mem_46_20 := (
    0 => "000000000000000");
  signal op_mem_46_20_front_din: signed((15 - 1) downto 0);
  signal op_mem_46_20_back: signed((15 - 1) downto 0);
  signal op_mem_46_20_push_front_pop_back_en: std_logic;
  signal cast_internal_ip_27_3_rsh: signed((21 - 1) downto 0);
  signal cast_internal_ip_33_3_convert: signed((15 - 1) downto 0);
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
  cast_internal_ip_27_3_rsh <= s2s_cast(ip_1_23, 12, 21, 12);
  cast_internal_ip_33_3_convert <= s2s_cast(cast_internal_ip_27_3_rsh, 21, 15, 12);
  op_mem_46_20_push_front_pop_back_en <= '0';
  op <= signed_to_std_logic_vector(cast_internal_ip_33_3_convert);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_mux_ae645d58f7 is
  port (
    sel : in std_logic_vector((1 - 1) downto 0);
    d0 : in std_logic_vector((16 - 1) downto 0);
    d1 : in std_logic_vector((16 - 1) downto 0);
    y : out std_logic_vector((16 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_mux_ae645d58f7;
architecture behavior of sysgen_mux_ae645d58f7
is
  signal sel_1_20: std_logic;
  signal d0_1_24: std_logic_vector((16 - 1) downto 0);
  signal d1_1_27: std_logic_vector((16 - 1) downto 0);
  signal sel_internal_2_1_convert: std_logic_vector((1 - 1) downto 0);
  signal unregy_join_6_1: std_logic_vector((16 - 1) downto 0);
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
entity sysgen_constant_edd89ce943 is
  port (
    op : out std_logic_vector((13 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_edd89ce943;
architecture behavior of sysgen_constant_edd89ce943
is
begin
  op <= "1111111111111";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_relational_3416daf0b3 is
  port (
    a : in std_logic_vector((13 - 1) downto 0);
    b : in std_logic_vector((13 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_relational_3416daf0b3;
architecture behavior of sysgen_relational_3416daf0b3
is
  signal a_1_31: unsigned((13 - 1) downto 0);
  signal b_1_34: unsigned((13 - 1) downto 0);
  signal result_12_3_rel: boolean;
begin
  a_1_31 <= std_logic_vector_to_unsigned(a);
  b_1_34 <= std_logic_vector_to_unsigned(b);
  result_12_3_rel <= a_1_31 = b_1_34;
  op <= boolean_to_vector(result_12_3_rel);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_relational_c1f67a56e1 is
  port (
    a : in std_logic_vector((32 - 1) downto 0);
    b : in std_logic_vector((32 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_relational_c1f67a56e1;
architecture behavior of sysgen_relational_c1f67a56e1
is
  signal a_1_31: unsigned((32 - 1) downto 0);
  signal b_1_34: unsigned((32 - 1) downto 0);
  signal result_18_3_rel: boolean;
begin
  a_1_31 <= std_logic_vector_to_unsigned(a);
  b_1_34 <= std_logic_vector_to_unsigned(b);
  result_18_3_rel <= a_1_31 > b_1_34;
  op <= boolean_to_vector(result_18_3_rel);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_02c1b20566 is
  port (
    op : out std_logic_vector((10 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_02c1b20566;
architecture behavior of sysgen_constant_02c1b20566
is
begin
  op <= "0000000000";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_2f28ab19df is
  port (
    op : out std_logic_vector((14 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_2f28ab19df;
architecture behavior of sysgen_constant_2f28ab19df
is
begin
  op <= "00000000000000";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_ed7df6023e is
  port (
    op : out std_logic_vector((32 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_ed7df6023e;
architecture behavior of sysgen_constant_ed7df6023e
is
begin
  op <= "00000000000000000000000000000000";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_mux_5ef768c070 is
  port (
    sel : in std_logic_vector((1 - 1) downto 0);
    d0 : in std_logic_vector((32 - 1) downto 0);
    d1 : in std_logic_vector((32 - 1) downto 0);
    y : out std_logic_vector((32 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_mux_5ef768c070;
architecture behavior of sysgen_mux_5ef768c070
is
  signal sel_1_20: std_logic;
  signal d0_1_24: std_logic_vector((32 - 1) downto 0);
  signal d1_1_27: std_logic_vector((32 - 1) downto 0);
  signal sel_internal_2_1_convert: std_logic_vector((1 - 1) downto 0);
  signal unregy_join_6_1: std_logic_vector((32 - 1) downto 0);
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
entity sysgen_relational_f6f3c4e942 is
  port (
    a : in std_logic_vector((10 - 1) downto 0);
    b : in std_logic_vector((13 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_relational_f6f3c4e942;
architecture behavior of sysgen_relational_f6f3c4e942
is
  signal a_1_31: unsigned((10 - 1) downto 0);
  signal b_1_34: unsigned((13 - 1) downto 0);
  signal cast_12_12: unsigned((13 - 1) downto 0);
  signal result_12_3_rel: boolean;
begin
  a_1_31 <= std_logic_vector_to_unsigned(a);
  b_1_34 <= std_logic_vector_to_unsigned(b);
  cast_12_12 <= u2u_cast(a_1_31, 0, 13, 0);
  result_12_3_rel <= cast_12_12 = b_1_34;
  op <= boolean_to_vector(result_12_3_rel);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_shift_fa69ff46d8 is
  port (
    ip : in std_logic_vector((64 - 1) downto 0);
    op : out std_logic_vector((32 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_shift_fa69ff46d8;
architecture behavior of sysgen_shift_fa69ff46d8
is
  signal ip_1_23: unsigned((64 - 1) downto 0);
  type array_type_op_mem_46_20 is array (0 to (1 - 1)) of unsigned((32 - 1) downto 0);
  signal op_mem_46_20: array_type_op_mem_46_20 := (
    0 => "00000000000000000000000000000000");
  signal op_mem_46_20_front_din: unsigned((32 - 1) downto 0);
  signal op_mem_46_20_back: unsigned((32 - 1) downto 0);
  signal op_mem_46_20_push_front_pop_back_en: std_logic;
  signal cast_internal_ip_33_3_convert: unsigned((32 - 1) downto 0);
begin
  ip_1_23 <= std_logic_vector_to_unsigned(ip);
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
  cast_internal_ip_33_3_convert <= u2u_cast(ip_1_23, 64, 32, 31);
  op_mem_46_20_push_front_pop_back_en <= '0';
  op <= unsigned_to_std_logic_vector(cast_internal_ip_33_3_convert);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_reinterpret_469a743fd1 is
  port (
    input_port : in std_logic_vector((16 - 1) downto 0);
    output_port : out std_logic_vector((16 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_reinterpret_469a743fd1;
architecture behavior of sysgen_reinterpret_469a743fd1
is
  signal input_port_1_40: unsigned((16 - 1) downto 0);
  signal output_port_5_5_force: signed((16 - 1) downto 0);
begin
  input_port_1_40 <= std_logic_vector_to_unsigned(input_port);
  output_port_5_5_force <= unsigned_to_signed(input_port_1_40);
  output_port <= signed_to_std_logic_vector(output_port_5_5_force);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_relational_29fc886a67 is
  port (
    a : in std_logic_vector((8 - 1) downto 0);
    b : in std_logic_vector((32 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_relational_29fc886a67;
architecture behavior of sysgen_relational_29fc886a67
is
  signal a_1_31: signed((8 - 1) downto 0);
  signal b_1_34: unsigned((32 - 1) downto 0);
  signal cast_22_12: signed((33 - 1) downto 0);
  signal cast_22_17: signed((33 - 1) downto 0);
  signal result_22_3_rel: boolean;
begin
  a_1_31 <= std_logic_vector_to_signed(a);
  b_1_34 <= std_logic_vector_to_unsigned(b);
  cast_22_12 <= s2s_cast(a_1_31, 0, 33, 0);
  cast_22_17 <= u2s_cast(b_1_34, 0, 33, 0);
  result_22_3_rel <= cast_22_12 >= cast_22_17;
  op <= boolean_to_vector(result_22_3_rel);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_0bd11d8843 is
  port (
    op : out std_logic_vector((2 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_0bd11d8843;
architecture behavior of sysgen_constant_0bd11d8843
is
begin
  op <= "01";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_afb570504f is
  port (
    op : out std_logic_vector((2 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_afb570504f;
architecture behavior of sysgen_constant_afb570504f
is
begin
  op <= "11";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_mux_e22feec339 is
  port (
    sel : in std_logic_vector((1 - 1) downto 0);
    d0 : in std_logic_vector((2 - 1) downto 0);
    d1 : in std_logic_vector((2 - 1) downto 0);
    y : out std_logic_vector((2 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_mux_e22feec339;
architecture behavior of sysgen_mux_e22feec339
is
  signal sel_1_20: std_logic_vector((1 - 1) downto 0);
  signal d0_1_24: std_logic_vector((2 - 1) downto 0);
  signal d1_1_27: std_logic_vector((2 - 1) downto 0);
  signal unregy_join_6_1: std_logic_vector((2 - 1) downto 0);
begin
  sel_1_20 <= sel;
  d0_1_24 <= d0;
  d1_1_27 <= d1;
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
  y <= unregy_join_6_1;
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_logical_e2cf0c6029 is
  port (
    d0 : in std_logic_vector((1 - 1) downto 0);
    d1 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_logical_e2cf0c6029;
architecture behavior of sysgen_logical_e2cf0c6029
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

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_concat_7e0de4e1ff is
  port (
    in0 : in std_logic_vector((1 - 1) downto 0);
    in1 : in std_logic_vector((1 - 1) downto 0);
    in2 : in std_logic_vector((1 - 1) downto 0);
    in3 : in std_logic_vector((1 - 1) downto 0);
    in4 : in std_logic_vector((1 - 1) downto 0);
    in5 : in std_logic_vector((1 - 1) downto 0);
    in6 : in std_logic_vector((1 - 1) downto 0);
    in7 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((8 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_concat_7e0de4e1ff;
architecture behavior of sysgen_concat_7e0de4e1ff
is
  signal in0_1_23: unsigned((1 - 1) downto 0);
  signal in1_1_27: unsigned((1 - 1) downto 0);
  signal in2_1_31: unsigned((1 - 1) downto 0);
  signal in3_1_35: unsigned((1 - 1) downto 0);
  signal in4_1_39: unsigned((1 - 1) downto 0);
  signal in5_1_43: unsigned((1 - 1) downto 0);
  signal in6_1_47: unsigned((1 - 1) downto 0);
  signal in7_1_51: unsigned((1 - 1) downto 0);
  signal y_2_1_concat: unsigned((8 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  in2_1_31 <= std_logic_vector_to_unsigned(in2);
  in3_1_35 <= std_logic_vector_to_unsigned(in3);
  in4_1_39 <= std_logic_vector_to_unsigned(in4);
  in5_1_43 <= std_logic_vector_to_unsigned(in5);
  in6_1_47 <= std_logic_vector_to_unsigned(in6);
  in7_1_51 <= std_logic_vector_to_unsigned(in7);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27) & unsigned_to_std_logic_vector(in2_1_31) & unsigned_to_std_logic_vector(in3_1_35) & unsigned_to_std_logic_vector(in4_1_39) & unsigned_to_std_logic_vector(in5_1_43) & unsigned_to_std_logic_vector(in6_1_47) & unsigned_to_std_logic_vector(in7_1_51));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_8a7891ef8e is
  port (
    op : out std_logic_vector((4 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_8a7891ef8e;
architecture behavior of sysgen_constant_8a7891ef8e
is
begin
  op <= "1000";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_relational_d8e59a041c is
  port (
    a : in std_logic_vector((4 - 1) downto 0);
    b : in std_logic_vector((4 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_relational_d8e59a041c;
architecture behavior of sysgen_relational_d8e59a041c
is
  signal a_1_31: unsigned((4 - 1) downto 0);
  signal b_1_34: unsigned((4 - 1) downto 0);
  signal result_12_3_rel: boolean;
begin
  a_1_31 <= std_logic_vector_to_unsigned(a);
  b_1_34 <= std_logic_vector_to_unsigned(b);
  result_12_3_rel <= a_1_31 = b_1_34;
  op <= boolean_to_vector(result_12_3_rel);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_logical_c15cd3714c is
  port (
    d0 : in std_logic_vector((1 - 1) downto 0);
    d1 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_logical_c15cd3714c;
architecture behavior of sysgen_logical_c15cd3714c
is
  signal d0_1_24: std_logic;
  signal d1_1_27: std_logic;
  type array_type_latency_pipe_5_26 is array (0 to (1 - 1)) of std_logic;
  signal latency_pipe_5_26: array_type_latency_pipe_5_26 := (
    0 => '0');
  signal latency_pipe_5_26_front_din: std_logic;
  signal latency_pipe_5_26_back: std_logic;
  signal latency_pipe_5_26_push_front_pop_back_en: std_logic;
  signal fully_2_1_bit: std_logic;
begin
  d0_1_24 <= d0(0);
  d1_1_27 <= d1(0);
  latency_pipe_5_26_back <= latency_pipe_5_26(0);
  proc_latency_pipe_5_26: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (latency_pipe_5_26_push_front_pop_back_en = '1')) then
        latency_pipe_5_26(0) <= latency_pipe_5_26_front_din;
      end if;
    end if;
  end process proc_latency_pipe_5_26;
  fully_2_1_bit <= d0_1_24 and d1_1_27;
  latency_pipe_5_26_front_din <= fully_2_1_bit;
  latency_pipe_5_26_push_front_pop_back_en <= '1';
  y <= std_logic_to_vector(latency_pipe_5_26_back);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_relational_2e0904a1c7 is
  port (
    a : in std_logic_vector((32 - 1) downto 0);
    b : in std_logic_vector((1 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_relational_2e0904a1c7;
architecture behavior of sysgen_relational_2e0904a1c7
is
  signal a_1_31: unsigned((32 - 1) downto 0);
  signal b_1_34: unsigned((1 - 1) downto 0);
  signal cast_12_17: unsigned((32 - 1) downto 0);
  signal result_12_3_rel: boolean;
begin
  a_1_31 <= std_logic_vector_to_unsigned(a);
  b_1_34 <= std_logic_vector_to_unsigned(b);
  cast_12_17 <= u2u_cast(b_1_34, 0, 32, 0);
  result_12_3_rel <= a_1_31 = cast_12_17;
  op <= boolean_to_vector(result_12_3_rel);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_relational_aab3ce74ec is
  port (
    a : in std_logic_vector((32 - 1) downto 0);
    b : in std_logic_vector((8 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_relational_aab3ce74ec;
architecture behavior of sysgen_relational_aab3ce74ec
is
  signal a_1_31: unsigned((32 - 1) downto 0);
  signal b_1_34: unsigned((8 - 1) downto 0);
  signal cast_22_17: unsigned((32 - 1) downto 0);
  signal result_22_3_rel: boolean;
begin
  a_1_31 <= std_logic_vector_to_unsigned(a);
  b_1_34 <= std_logic_vector_to_unsigned(b);
  cast_22_17 <= u2u_cast(b_1_34, 0, 32, 0);
  result_22_3_rel <= a_1_31 >= cast_22_17;
  op <= boolean_to_vector(result_22_3_rel);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_relational_fad5ec3b4f is
  port (
    a : in std_logic_vector((32 - 1) downto 0);
    b : in std_logic_vector((1 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_relational_fad5ec3b4f;
architecture behavior of sysgen_relational_fad5ec3b4f
is
  signal a_1_31: unsigned((32 - 1) downto 0);
  signal b_1_34: unsigned((1 - 1) downto 0);
  signal cast_18_16: unsigned((32 - 1) downto 0);
  signal result_18_3_rel: boolean;
begin
  a_1_31 <= std_logic_vector_to_unsigned(a);
  b_1_34 <= std_logic_vector_to_unsigned(b);
  cast_18_16 <= u2u_cast(b_1_34, 0, 32, 0);
  result_18_3_rel <= a_1_31 > cast_18_16;
  op <= boolean_to_vector(result_18_3_rel);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_relational_ea187b9a7b is
  port (
    a : in std_logic_vector((8 - 1) downto 0);
    b : in std_logic_vector((1 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_relational_ea187b9a7b;
architecture behavior of sysgen_relational_ea187b9a7b
is
  signal a_1_31: unsigned((8 - 1) downto 0);
  signal b_1_34: unsigned((1 - 1) downto 0);
  signal cast_14_17: unsigned((8 - 1) downto 0);
  signal result_14_3_rel: boolean;
begin
  a_1_31 <= std_logic_vector_to_unsigned(a);
  b_1_34 <= std_logic_vector_to_unsigned(b);
  cast_14_17 <= u2u_cast(b_1_34, 0, 8, 0);
  result_14_3_rel <= a_1_31 /= cast_14_17;
  op <= boolean_to_vector(result_14_3_rel);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_mux_ea8d291d2e is
  port (
    sel : in std_logic_vector((1 - 1) downto 0);
    d0 : in std_logic_vector((1 - 1) downto 0);
    d1 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_mux_ea8d291d2e;
architecture behavior of sysgen_mux_ea8d291d2e
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
entity sysgen_inverter_d6a105e894 is
  port (
    ip : in std_logic_vector((1 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_inverter_d6a105e894;
architecture behavior of sysgen_inverter_d6a105e894
is
  signal ip_1_26: unsigned((1 - 1) downto 0);
  type array_type_op_mem_22_20 is array (0 to (1 - 1)) of unsigned((1 - 1) downto 0);
  signal op_mem_22_20: array_type_op_mem_22_20 := (
    0 => "0");
  signal op_mem_22_20_front_din: unsigned((1 - 1) downto 0);
  signal op_mem_22_20_back: unsigned((1 - 1) downto 0);
  signal op_mem_22_20_push_front_pop_back_en: std_logic;
  signal internal_ip_12_1_bitnot: unsigned((1 - 1) downto 0);
begin
  ip_1_26 <= std_logic_vector_to_unsigned(ip);
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
  internal_ip_12_1_bitnot <= std_logic_vector_to_unsigned(not unsigned_to_std_logic_vector(ip_1_26));
  op_mem_22_20_push_front_pop_back_en <= '0';
  op <= unsigned_to_std_logic_vector(internal_ip_12_1_bitnot);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_mux_4229a76860 is
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
end sysgen_mux_4229a76860;
architecture behavior of sysgen_mux_4229a76860
is
  signal sel_1_20: std_logic_vector((2 - 1) downto 0);
  signal d0_1_24: std_logic_vector((1 - 1) downto 0);
  signal d1_1_27: std_logic_vector((1 - 1) downto 0);
  signal d2_1_30: std_logic_vector((1 - 1) downto 0);
  signal d3_1_33: std_logic_vector((1 - 1) downto 0);
  type array_type_pipe_20_22 is array (0 to (1 - 1)) of std_logic_vector((1 - 1) downto 0);
  signal pipe_20_22: array_type_pipe_20_22 := (
    0 => "0");
  signal pipe_20_22_front_din: std_logic_vector((1 - 1) downto 0);
  signal pipe_20_22_back: std_logic_vector((1 - 1) downto 0);
  signal pipe_20_22_push_front_pop_back_en: std_logic;
  signal unregy_join_6_1: std_logic_vector((1 - 1) downto 0);
begin
  sel_1_20 <= sel;
  d0_1_24 <= d0;
  d1_1_27 <= d1;
  d2_1_30 <= d2;
  d3_1_33 <= d3;
  pipe_20_22_back <= pipe_20_22(0);
  proc_pipe_20_22: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (pipe_20_22_push_front_pop_back_en = '1')) then
        pipe_20_22(0) <= pipe_20_22_front_din;
      end if;
    end if;
  end process proc_pipe_20_22;
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
  pipe_20_22_front_din <= unregy_join_6_1;
  pipe_20_22_push_front_pop_back_en <= '1';
  y <= pipe_20_22_back;
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_concat_2215a67854 is
  port (
    in0 : in std_logic_vector((2 - 1) downto 0);
    in1 : in std_logic_vector((2 - 1) downto 0);
    in2 : in std_logic_vector((2 - 1) downto 0);
    in3 : in std_logic_vector((2 - 1) downto 0);
    y : out std_logic_vector((8 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_concat_2215a67854;
architecture behavior of sysgen_concat_2215a67854
is
  signal in0_1_23: unsigned((2 - 1) downto 0);
  signal in1_1_27: unsigned((2 - 1) downto 0);
  signal in2_1_31: unsigned((2 - 1) downto 0);
  signal in3_1_35: unsigned((2 - 1) downto 0);
  signal y_2_1_concat: unsigned((8 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  in2_1_31 <= std_logic_vector_to_unsigned(in2);
  in3_1_35 <= std_logic_vector_to_unsigned(in3);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27) & unsigned_to_std_logic_vector(in2_1_31) & unsigned_to_std_logic_vector(in3_1_35));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_5c37b4279b is
  port (
    op : out std_logic_vector((3 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_5c37b4279b;
architecture behavior of sysgen_constant_5c37b4279b
is
begin
  op <= "100";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_relational_eb29c0185b is
  port (
    a : in std_logic_vector((3 - 1) downto 0);
    b : in std_logic_vector((3 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_relational_eb29c0185b;
architecture behavior of sysgen_relational_eb29c0185b
is
  signal a_1_31: unsigned((3 - 1) downto 0);
  signal b_1_34: unsigned((3 - 1) downto 0);
  signal result_12_3_rel: boolean;
begin
  a_1_31 <= std_logic_vector_to_unsigned(a);
  b_1_34 <= std_logic_vector_to_unsigned(b);
  result_12_3_rel <= a_1_31 = b_1_34;
  op <= boolean_to_vector(result_12_3_rel);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_concat_4821ac8bad is
  port (
    in0 : in std_logic_vector((16 - 1) downto 0);
    in1 : in std_logic_vector((16 - 1) downto 0);
    y : out std_logic_vector((32 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_concat_4821ac8bad;
architecture behavior of sysgen_concat_4821ac8bad
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
entity sysgen_mux_acb687e974 is
  port (
    sel : in std_logic_vector((3 - 1) downto 0);
    d0 : in std_logic_vector((16 - 1) downto 0);
    d1 : in std_logic_vector((16 - 1) downto 0);
    d2 : in std_logic_vector((16 - 1) downto 0);
    d3 : in std_logic_vector((16 - 1) downto 0);
    d4 : in std_logic_vector((16 - 1) downto 0);
    y : out std_logic_vector((16 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_mux_acb687e974;
architecture behavior of sysgen_mux_acb687e974
is
  signal sel_1_20: std_logic_vector((3 - 1) downto 0);
  signal d0_1_24: std_logic_vector((16 - 1) downto 0);
  signal d1_1_27: std_logic_vector((16 - 1) downto 0);
  signal d2_1_30: std_logic_vector((16 - 1) downto 0);
  signal d3_1_33: std_logic_vector((16 - 1) downto 0);
  signal d4_1_36: std_logic_vector((16 - 1) downto 0);
  type array_type_pipe_22_22 is array (0 to (1 - 1)) of std_logic_vector((16 - 1) downto 0);
  signal pipe_22_22: array_type_pipe_22_22 := (
    0 => "0000000000000000");
  signal pipe_22_22_front_din: std_logic_vector((16 - 1) downto 0);
  signal pipe_22_22_back: std_logic_vector((16 - 1) downto 0);
  signal pipe_22_22_push_front_pop_back_en: std_logic;
  signal unregy_join_6_1: std_logic_vector((16 - 1) downto 0);
begin
  sel_1_20 <= sel;
  d0_1_24 <= d0;
  d1_1_27 <= d1;
  d2_1_30 <= d2;
  d3_1_33 <= d3;
  d4_1_36 <= d4;
  pipe_22_22_back <= pipe_22_22(0);
  proc_pipe_22_22: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (pipe_22_22_push_front_pop_back_en = '1')) then
        pipe_22_22(0) <= pipe_22_22_front_din;
      end if;
    end if;
  end process proc_pipe_22_22;
  proc_switch_6_1: process (d0_1_24, d1_1_27, d2_1_30, d3_1_33, d4_1_36, sel_1_20)
  is
  begin
    case sel_1_20 is 
      when "000" =>
        unregy_join_6_1 <= d0_1_24;
      when "001" =>
        unregy_join_6_1 <= d1_1_27;
      when "010" =>
        unregy_join_6_1 <= d2_1_30;
      when "011" =>
        unregy_join_6_1 <= d3_1_33;
      when others =>
        unregy_join_6_1 <= d4_1_36;
    end case;
  end process proc_switch_6_1;
  pipe_22_22_front_din <= unregy_join_6_1;
  pipe_22_22_push_front_pop_back_en <= '1';
  y <= pipe_22_22_back;
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_mux_d0fe2bb2f7 is
  port (
    sel : in std_logic_vector((3 - 1) downto 0);
    d0 : in std_logic_vector((1 - 1) downto 0);
    d1 : in std_logic_vector((1 - 1) downto 0);
    d2 : in std_logic_vector((1 - 1) downto 0);
    d3 : in std_logic_vector((1 - 1) downto 0);
    d4 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_mux_d0fe2bb2f7;
architecture behavior of sysgen_mux_d0fe2bb2f7
is
  signal sel_1_20: std_logic_vector((3 - 1) downto 0);
  signal d0_1_24: std_logic;
  signal d1_1_27: std_logic;
  signal d2_1_30: std_logic;
  signal d3_1_33: std_logic;
  signal d4_1_36: std_logic;
  type array_type_pipe_22_22 is array (0 to (1 - 1)) of std_logic;
  signal pipe_22_22: array_type_pipe_22_22 := (
    0 => '0');
  signal pipe_22_22_front_din: std_logic;
  signal pipe_22_22_back: std_logic;
  signal pipe_22_22_push_front_pop_back_en: std_logic;
  signal unregy_join_6_1: std_logic;
begin
  sel_1_20 <= sel;
  d0_1_24 <= d0(0);
  d1_1_27 <= d1(0);
  d2_1_30 <= d2(0);
  d3_1_33 <= d3(0);
  d4_1_36 <= d4(0);
  pipe_22_22_back <= pipe_22_22(0);
  proc_pipe_22_22: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (pipe_22_22_push_front_pop_back_en = '1')) then
        pipe_22_22(0) <= pipe_22_22_front_din;
      end if;
    end if;
  end process proc_pipe_22_22;
  proc_switch_6_1: process (d0_1_24, d1_1_27, d2_1_30, d3_1_33, d4_1_36, sel_1_20)
  is
  begin
    case sel_1_20 is 
      when "000" =>
        unregy_join_6_1 <= d0_1_24;
      when "001" =>
        unregy_join_6_1 <= d1_1_27;
      when "010" =>
        unregy_join_6_1 <= d2_1_30;
      when "011" =>
        unregy_join_6_1 <= d3_1_33;
      when others =>
        unregy_join_6_1 <= d4_1_36;
    end case;
  end process proc_switch_6_1;
  pipe_22_22_front_din <= unregy_join_6_1;
  pipe_22_22_push_front_pop_back_en <= '1';
  y <= std_logic_to_vector(pipe_22_22_back);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_reinterpret_3904df080b is
  port (
    input_port : in std_logic_vector((16 - 1) downto 0);
    output_port : out std_logic_vector((16 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_reinterpret_3904df080b;
architecture behavior of sysgen_reinterpret_3904df080b
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

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_e6a76abd1d is
  port (
    op : out std_logic_vector((6 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_e6a76abd1d;
architecture behavior of sysgen_constant_e6a76abd1d
is
begin
  op <= "100000";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_mux_4d2e5ff3e1 is
  port (
    sel : in std_logic_vector((1 - 1) downto 0);
    d0 : in std_logic_vector((64 - 1) downto 0);
    d1 : in std_logic_vector((64 - 1) downto 0);
    y : out std_logic_vector((65 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_mux_4d2e5ff3e1;
architecture behavior of sysgen_mux_4d2e5ff3e1
is
  signal sel_1_20: std_logic;
  signal d0_1_24: std_logic_vector((64 - 1) downto 0);
  signal d1_1_27: std_logic_vector((64 - 1) downto 0);
  signal sel_internal_2_1_convert: std_logic_vector((1 - 1) downto 0);
  signal unregy_join_6_1: std_logic_vector((65 - 1) downto 0);
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
        unregy_join_6_1 <= cast(d0_1_24, 58, 65, 58, xlUnsigned);
      when others =>
        unregy_join_6_1 <= cast(d1_1_27, 58, 65, 58, xlSigned);
    end case;
  end process proc_switch_6_1;
  y <= unregy_join_6_1;
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_relational_0eaff1ae01 is
  port (
    a : in std_logic_vector((64 - 1) downto 0);
    b : in std_logic_vector((64 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_relational_0eaff1ae01;
architecture behavior of sysgen_relational_0eaff1ae01
is
  signal a_1_31: unsigned((64 - 1) downto 0);
  signal b_1_34: unsigned((64 - 1) downto 0);
  signal result_18_3_rel: boolean;
begin
  a_1_31 <= std_logic_vector_to_unsigned(a);
  b_1_34 <= std_logic_vector_to_unsigned(b);
  result_18_3_rel <= a_1_31 > b_1_34;
  op <= boolean_to_vector(result_18_3_rel);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_relational_77da886c64 is
  port (
    a : in std_logic_vector((64 - 1) downto 0);
    b : in std_logic_vector((6 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_relational_77da886c64;
architecture behavior of sysgen_relational_77da886c64
is
  signal a_1_31: unsigned((64 - 1) downto 0);
  signal b_1_34: unsigned((6 - 1) downto 0);
  signal cast_18_16: unsigned((64 - 1) downto 0);
  signal result_18_3_rel: boolean;
begin
  a_1_31 <= std_logic_vector_to_unsigned(a);
  b_1_34 <= std_logic_vector_to_unsigned(b);
  cast_18_16 <= u2u_cast(b_1_34, 0, 64, 58);
  result_18_3_rel <= a_1_31 > cast_18_16;
  op <= boolean_to_vector(result_18_3_rel);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_reinterpret_d828f855c8 is
  port (
    input_port : in std_logic_vector((16 - 1) downto 0);
    output_port : out std_logic_vector((16 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_reinterpret_d828f855c8;
architecture behavior of sysgen_reinterpret_d828f855c8
is
  signal input_port_1_40: signed((16 - 1) downto 0);
begin
  input_port_1_40 <= std_logic_vector_to_signed(input_port);
  output_port <= signed_to_std_logic_vector(input_port_1_40);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity receiver_axi_lite_interface is 
    port(
        threshold : out std_logic_vector(31 downto 0);
        reset_time_sync : out std_logic_vector(0 downto 0);
        reset_phase_sync : out std_logic_vector(0 downto 0);
        reset_frame_sync : out std_logic_vector(0 downto 0);
        observation_point : out std_logic_vector(31 downto 0);
        modulation : out std_logic_vector(0 downto 0);
        global_reset_sync : out std_logic_vector(0 downto 0);
        enable_transfer : out std_logic_vector(0 downto 0);
        coarse_passthrough : out std_logic_vector(0 downto 0);
        bpsk_packet_count : in std_logic_vector(31 downto 0);
        data_count : in std_logic_vector(11 downto 0);
        frame_size : in std_logic_vector(7 downto 0);
        freq_offset : in std_logic_vector(31 downto 0);
        packet_size : in std_logic_vector(7 downto 0);
        qpsk_packet_count : in std_logic_vector(31 downto 0);
        clk : out std_logic;
        receiver_aclk : in std_logic;
        receiver_aresetn : in std_logic;
        receiver_s_axi_awaddr : in std_logic_vector(6-1 downto 0);
        receiver_s_axi_awvalid : in std_logic;
        receiver_s_axi_awready : out std_logic;
        receiver_s_axi_wdata : in std_logic_vector(32-1 downto 0);
        receiver_s_axi_wstrb : in std_logic_vector(32/8-1 downto 0);
        receiver_s_axi_wvalid : in std_logic;
        receiver_s_axi_wready : out std_logic;
        receiver_s_axi_bresp : out std_logic_vector(1 downto 0);
        receiver_s_axi_bvalid : out std_logic;
        receiver_s_axi_bready : in std_logic;
        receiver_s_axi_araddr : in std_logic_vector(6-1 downto 0);
        receiver_s_axi_arvalid : in std_logic;
        receiver_s_axi_arready : out std_logic;
        receiver_s_axi_rdata : out std_logic_vector(32-1 downto 0);
        receiver_s_axi_rresp : out std_logic_vector(1 downto 0);
        receiver_s_axi_rvalid : out std_logic;
        receiver_s_axi_rready : in std_logic
    );
end receiver_axi_lite_interface;
architecture structural of receiver_axi_lite_interface is 
component receiver_axi_lite_interface_verilog is
    port(
        threshold : out std_logic_vector(31 downto 0);
        reset_time_sync : out std_logic_vector(0 downto 0);
        reset_phase_sync : out std_logic_vector(0 downto 0);
        reset_frame_sync : out std_logic_vector(0 downto 0);
        observation_point : out std_logic_vector(31 downto 0);
        modulation : out std_logic_vector(0 downto 0);
        global_reset_sync : out std_logic_vector(0 downto 0);
        enable_transfer : out std_logic_vector(0 downto 0);
        coarse_passthrough : out std_logic_vector(0 downto 0);
        bpsk_packet_count : in std_logic_vector(31 downto 0);
        data_count : in std_logic_vector(11 downto 0);
        frame_size : in std_logic_vector(7 downto 0);
        freq_offset : in std_logic_vector(31 downto 0);
        packet_size : in std_logic_vector(7 downto 0);
        qpsk_packet_count : in std_logic_vector(31 downto 0);
        clk : out std_logic;
        receiver_aclk : in std_logic;
        receiver_aresetn : in std_logic;
        receiver_s_axi_awaddr : in std_logic_vector(6-1 downto 0);
        receiver_s_axi_awvalid : in std_logic;
        receiver_s_axi_awready : out std_logic;
        receiver_s_axi_wdata : in std_logic_vector(32-1 downto 0);
        receiver_s_axi_wstrb : in std_logic_vector(32/8-1 downto 0);
        receiver_s_axi_wvalid : in std_logic;
        receiver_s_axi_wready : out std_logic;
        receiver_s_axi_bresp : out std_logic_vector(1 downto 0);
        receiver_s_axi_bvalid : out std_logic;
        receiver_s_axi_bready : in std_logic;
        receiver_s_axi_araddr : in std_logic_vector(6-1 downto 0);
        receiver_s_axi_arvalid : in std_logic;
        receiver_s_axi_arready : out std_logic;
        receiver_s_axi_rdata : out std_logic_vector(32-1 downto 0);
        receiver_s_axi_rresp : out std_logic_vector(1 downto 0);
        receiver_s_axi_rvalid : out std_logic;
        receiver_s_axi_rready : in std_logic
    );
end component;
begin
inst : receiver_axi_lite_interface_verilog
    port map(
    threshold => threshold,
    reset_time_sync => reset_time_sync,
    reset_phase_sync => reset_phase_sync,
    reset_frame_sync => reset_frame_sync,
    observation_point => observation_point,
    modulation => modulation,
    global_reset_sync => global_reset_sync,
    enable_transfer => enable_transfer,
    coarse_passthrough => coarse_passthrough,
    bpsk_packet_count => bpsk_packet_count,
    data_count => data_count,
    frame_size => frame_size,
    freq_offset => freq_offset,
    packet_size => packet_size,
    qpsk_packet_count => qpsk_packet_count,
    clk => clk,
    receiver_aclk => receiver_aclk,
    receiver_aresetn => receiver_aresetn,
    receiver_s_axi_awaddr => receiver_s_axi_awaddr,
    receiver_s_axi_awvalid => receiver_s_axi_awvalid,
    receiver_s_axi_awready => receiver_s_axi_awready,
    receiver_s_axi_wdata => receiver_s_axi_wdata,
    receiver_s_axi_wstrb => receiver_s_axi_wstrb,
    receiver_s_axi_wvalid => receiver_s_axi_wvalid,
    receiver_s_axi_wready => receiver_s_axi_wready,
    receiver_s_axi_bresp => receiver_s_axi_bresp,
    receiver_s_axi_bvalid => receiver_s_axi_bvalid,
    receiver_s_axi_bready => receiver_s_axi_bready,
    receiver_s_axi_araddr => receiver_s_axi_araddr,
    receiver_s_axi_arvalid => receiver_s_axi_arvalid,
    receiver_s_axi_arready => receiver_s_axi_arready,
    receiver_s_axi_rdata => receiver_s_axi_rdata,
    receiver_s_axi_rresp => receiver_s_axi_rresp,
    receiver_s_axi_rvalid => receiver_s_axi_rvalid,
    receiver_s_axi_rready => receiver_s_axi_rready
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

entity receiver_xladdsub is 
   generic (
     core_name0: string := "";
     a_width: integer := 16;
     a_bin_pt: integer := 4;
     a_arith: integer := xlUnsigned;
     c_in_width: integer := 16;
     c_in_bin_pt: integer := 4;
     c_in_arith: integer := xlUnsigned;
     c_out_width: integer := 16;
     c_out_bin_pt: integer := 4;
     c_out_arith: integer := xlUnsigned;
     b_width: integer := 8;
     b_bin_pt: integer := 2;
     b_arith: integer := xlUnsigned;
     s_width: integer := 17;
     s_bin_pt: integer := 4;
     s_arith: integer := xlUnsigned;
     rst_width: integer := 1;
     rst_bin_pt: integer := 0;
     rst_arith: integer := xlUnsigned;
     en_width: integer := 1;
     en_bin_pt: integer := 0;
     en_arith: integer := xlUnsigned;
     full_s_width: integer := 17;
     full_s_arith: integer := xlUnsigned;
     mode: integer := xlAddMode;
     extra_registers: integer := 0;
     latency: integer := 0;
     quantization: integer := xlTruncate;
     overflow: integer := xlWrap;
     c_latency: integer := 0;
     c_output_width: integer := 17;
     c_has_c_in : integer := 0;
     c_has_c_out : integer := 0
   );
   port (
     a: in std_logic_vector(a_width - 1 downto 0);
     b: in std_logic_vector(b_width - 1 downto 0);
     c_in : in std_logic_vector (0 downto 0) := "0";
     ce: in std_logic;
     clr: in std_logic := '0';
     clk: in std_logic;
     rst: in std_logic_vector(rst_width - 1 downto 0) := "0";
     en: in std_logic_vector(en_width - 1 downto 0) := "1";
     c_out : out std_logic_vector (0 downto 0);
     s: out std_logic_vector(s_width - 1 downto 0)
   );
 end receiver_xladdsub;
 
 architecture behavior of receiver_xladdsub is 
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
 
 function format_input(inp: std_logic_vector; old_width, delta, new_arith,
 new_width: integer)
 return std_logic_vector
 is
 variable vec: std_logic_vector(old_width-1 downto 0);
 variable padded_inp: std_logic_vector((old_width + delta)-1 downto 0);
 variable result: std_logic_vector(new_width-1 downto 0);
 begin
 vec := inp;
 if (delta > 0) then
 padded_inp := pad_LSB(vec, old_width+delta);
 result := extend_MSB(padded_inp, new_width, new_arith);
 else
 result := extend_MSB(vec, new_width, new_arith);
 end if;
 return result;
 end;
 
 constant full_s_bin_pt: integer := fractional_bits(a_bin_pt, b_bin_pt);
 constant full_a_width: integer := full_s_width;
 constant full_b_width: integer := full_s_width;
 
 signal full_a: std_logic_vector(full_a_width - 1 downto 0);
 signal full_b: std_logic_vector(full_b_width - 1 downto 0);
 signal core_s: std_logic_vector(full_s_width - 1 downto 0);
 signal conv_s: std_logic_vector(s_width - 1 downto 0);
 signal temp_cout : std_logic;
 signal internal_clr: std_logic;
 signal internal_ce: std_logic;
 signal extra_reg_ce: std_logic;
 signal override: std_logic;
 signal logic1: std_logic_vector(0 downto 0);


 component receiver_c_addsub_v12_0_i0
    port ( 
    a: in std_logic_vector(23 - 1 downto 0);
    clk: in std_logic:= '0';
    ce: in std_logic:= '0';
    s: out std_logic_vector(c_output_width - 1 downto 0);
    b: in std_logic_vector(23 - 1 downto 0) 
 		  ); 
 end component;

 component receiver_c_addsub_v12_0_i1
    port ( 
    a: in std_logic_vector(41 - 1 downto 0);
    s: out std_logic_vector(c_output_width - 1 downto 0);
    b: in std_logic_vector(41 - 1 downto 0) 
 		  ); 
 end component;

 component receiver_c_addsub_v12_0_i2
    port ( 
    a: in std_logic_vector(49 - 1 downto 0);
    s: out std_logic_vector(c_output_width - 1 downto 0);
    b: in std_logic_vector(49 - 1 downto 0) 
 		  ); 
 end component;

 component receiver_c_addsub_v12_0_i3
    port ( 
    a: in std_logic_vector(64 - 1 downto 0);
    clk: in std_logic:= '0';
    ce: in std_logic:= '0';
    s: out std_logic_vector(c_output_width - 1 downto 0);
    b: in std_logic_vector(64 - 1 downto 0) 
 		  ); 
 end component;

 component receiver_c_addsub_v12_0_i4
    port ( 
    a: in std_logic_vector(44 - 1 downto 0);
    s: out std_logic_vector(c_output_width - 1 downto 0);
    b: in std_logic_vector(44 - 1 downto 0) 
 		  ); 
 end component;

 component receiver_c_addsub_v12_0_i5
    port ( 
    a: in std_logic_vector(65 - 1 downto 0);
    s: out std_logic_vector(c_output_width - 1 downto 0);
    b: in std_logic_vector(65 - 1 downto 0) 
 		  ); 
 end component;

 component receiver_c_addsub_v12_0_i6
    port ( 
    a: in std_logic_vector(66 - 1 downto 0);
    s: out std_logic_vector(c_output_width - 1 downto 0);
    b: in std_logic_vector(66 - 1 downto 0) 
 		  ); 
 end component;

 component receiver_c_addsub_v12_0_i7
    port ( 
    a: in std_logic_vector(65 - 1 downto 0);
    s: out std_logic_vector(c_output_width - 1 downto 0);
    b: in std_logic_vector(65 - 1 downto 0) 
 		  ); 
 end component;

 component receiver_c_addsub_v12_0_i8
    port ( 
    a: in std_logic_vector(32 - 1 downto 0);
    s: out std_logic_vector(c_output_width - 1 downto 0);
    b: in std_logic_vector(32 - 1 downto 0) 
 		  ); 
 end component;

 component receiver_c_addsub_v12_0_i9
    port ( 
    a: in std_logic_vector(32 - 1 downto 0);
    s: out std_logic_vector(c_output_width - 1 downto 0);
    b: in std_logic_vector(32 - 1 downto 0) 
 		  ); 
 end component;

begin
 internal_clr <= (clr or (rst(0))) and ce;
 internal_ce <= ce and en(0);
 logic1(0) <= '1';
 addsub_process: process (a, b, core_s)
 begin
 full_a <= format_input (a, a_width, b_bin_pt - a_bin_pt, a_arith,
 full_a_width);
 full_b <= format_input (b, b_width, a_bin_pt - b_bin_pt, b_arith,
 full_b_width);
 conv_s <= convert_type (core_s, full_s_width, full_s_bin_pt, full_s_arith,
 s_width, s_bin_pt, s_arith, quantization, overflow);
 end process addsub_process;


 comp0: if ((core_name0 = "receiver_c_addsub_v12_0_i0")) generate 
  core_instance0:receiver_c_addsub_v12_0_i0
   port map ( 
         a => full_a,
         clk => clk,
         ce => internal_ce,
         s => core_s,
         b => full_b
  ); 
   end generate;

 comp1: if ((core_name0 = "receiver_c_addsub_v12_0_i1")) generate 
  core_instance1:receiver_c_addsub_v12_0_i1
   port map ( 
         a => full_a,
         s => core_s,
         b => full_b
  ); 
   end generate;

 comp2: if ((core_name0 = "receiver_c_addsub_v12_0_i2")) generate 
  core_instance2:receiver_c_addsub_v12_0_i2
   port map ( 
         a => full_a,
         s => core_s,
         b => full_b
  ); 
   end generate;

 comp3: if ((core_name0 = "receiver_c_addsub_v12_0_i3")) generate 
  core_instance3:receiver_c_addsub_v12_0_i3
   port map ( 
         a => full_a,
         clk => clk,
         ce => internal_ce,
         s => core_s,
         b => full_b
  ); 
   end generate;

 comp4: if ((core_name0 = "receiver_c_addsub_v12_0_i4")) generate 
  core_instance4:receiver_c_addsub_v12_0_i4
   port map ( 
         a => full_a,
         s => core_s,
         b => full_b
  ); 
   end generate;

 comp5: if ((core_name0 = "receiver_c_addsub_v12_0_i5")) generate 
  core_instance5:receiver_c_addsub_v12_0_i5
   port map ( 
         a => full_a,
         s => core_s,
         b => full_b
  ); 
   end generate;

 comp6: if ((core_name0 = "receiver_c_addsub_v12_0_i6")) generate 
  core_instance6:receiver_c_addsub_v12_0_i6
   port map ( 
         a => full_a,
         s => core_s,
         b => full_b
  ); 
   end generate;

 comp7: if ((core_name0 = "receiver_c_addsub_v12_0_i7")) generate 
  core_instance7:receiver_c_addsub_v12_0_i7
   port map ( 
         a => full_a,
         s => core_s,
         b => full_b
  ); 
   end generate;

 comp8: if ((core_name0 = "receiver_c_addsub_v12_0_i8")) generate 
  core_instance8:receiver_c_addsub_v12_0_i8
   port map ( 
         a => full_a,
         s => core_s,
         b => full_b
  ); 
   end generate;

 comp9: if ((core_name0 = "receiver_c_addsub_v12_0_i9")) generate 
  core_instance9:receiver_c_addsub_v12_0_i9
   port map ( 
         a => full_a,
         s => core_s,
         b => full_b
  ); 
   end generate;

latency_test: if (extra_registers > 0) generate
 override_test: if (c_latency > 1) generate
 override_pipe: synth_reg
 generic map (
 width => 1,
 latency => c_latency
 )
 port map (
 i => logic1,
 ce => internal_ce,
 clr => internal_clr,
 clk => clk,
 o(0) => override);
 extra_reg_ce <= ce and en(0) and override;
 end generate override_test;
 no_override: if ((c_latency = 0) or (c_latency = 1)) generate
 extra_reg_ce <= ce and en(0);
 end generate no_override;
 extra_reg: synth_reg
 generic map (
 width => s_width,
 latency => extra_registers
 )
 port map (
 i => conv_s,
 ce => extra_reg_ce,
 clr => internal_clr,
 clk => clk,
 o => s
 );
 cout_test: if (c_has_c_out = 1) generate
 c_out_extra_reg: synth_reg
 generic map (
 width => 1,
 latency => extra_registers
 )
 port map (
 i(0) => temp_cout,
 ce => extra_reg_ce,
 clr => internal_clr,
 clk => clk,
 o => c_out
 );
 end generate cout_test;
 end generate;
 
 latency_s: if ((latency = 0) or (extra_registers = 0)) generate
 s <= conv_s;
 end generate latency_s;
 latency0: if (((latency = 0) or (extra_registers = 0)) and
 (c_has_c_out = 1)) generate
 c_out(0) <= temp_cout;
 end generate latency0;
 tie_dangling_cout: if (c_has_c_out = 0) generate
 c_out <= "0";
 end generate tie_dangling_cout;
 end architecture behavior;

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

entity receiver_xlcmult is 
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
 end receiver_xlcmult;
 
 architecture behavior of receiver_xlcmult is
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


 component receiver_mult_gen_v12_0_i0
    port ( 
      clk: in std_logic;
      ce: in std_logic;
      sclr: in std_logic;
      p: out std_logic_vector(c_output_width - 1 downto 0);
      a: in std_logic_vector(c_a_width - 1 downto 0) 
 		  ); 
 end component;

 component receiver_mult_gen_v12_0_i1
    port ( 
      p: out std_logic_vector(c_output_width - 1 downto 0);
      a: in std_logic_vector(c_a_width - 1 downto 0) 
 		  ); 
 end component;

 component receiver_mult_gen_v12_0_i2
    port ( 
      p: out std_logic_vector(c_output_width - 1 downto 0);
      a: in std_logic_vector(c_a_width - 1 downto 0) 
 		  ); 
 end component;

 component receiver_mult_gen_v12_0_i3
    port ( 
      p: out std_logic_vector(c_output_width - 1 downto 0);
      a: in std_logic_vector(c_a_width - 1 downto 0) 
 		  ); 
 end component;

 component receiver_mult_gen_v12_0_i5
    port ( 
      clk: in std_logic;
      ce: in std_logic;
      sclr: in std_logic;
      p: out std_logic_vector(c_output_width - 1 downto 0);
      a: in std_logic_vector(c_a_width - 1 downto 0) 
 		  ); 
 end component;

 component receiver_mult_gen_v12_0_i6
    port ( 
      p: out std_logic_vector(c_output_width - 1 downto 0);
      a: in std_logic_vector(c_a_width - 1 downto 0) 
 		  ); 
 end component;

 component receiver_mult_gen_v12_0_i7
    port ( 
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


 comp0: if ((core_name0 = "receiver_mult_gen_v12_0_i0")) generate 
  core_instance0:receiver_mult_gen_v12_0_i0
   port map ( 
      sclr => internal_clr,
      clk => clk,
      ce => internal_ce,
      p => tmp_p,
      a => tmp_a
  ); 
   end generate;

 comp1: if ((core_name0 = "receiver_mult_gen_v12_0_i1")) generate 
  core_instance1:receiver_mult_gen_v12_0_i1
   port map ( 
      p => tmp_p,
      a => tmp_a
  ); 
   end generate;

 comp2: if ((core_name0 = "receiver_mult_gen_v12_0_i2")) generate 
  core_instance2:receiver_mult_gen_v12_0_i2
   port map ( 
      p => tmp_p,
      a => tmp_a
  ); 
   end generate;

 comp3: if ((core_name0 = "receiver_mult_gen_v12_0_i3")) generate 
  core_instance3:receiver_mult_gen_v12_0_i3
   port map ( 
      p => tmp_p,
      a => tmp_a
  ); 
   end generate;

 comp4: if ((core_name0 = "receiver_mult_gen_v12_0_i5")) generate 
  core_instance4:receiver_mult_gen_v12_0_i5
   port map ( 
      sclr => internal_clr,
      clk => clk,
      ce => internal_ce,
      p => tmp_p,
      a => tmp_a
  ); 
   end generate;

 comp5: if ((core_name0 = "receiver_mult_gen_v12_0_i6")) generate 
  core_instance5:receiver_mult_gen_v12_0_i6
   port map ( 
      p => tmp_p,
      a => tmp_a
  ); 
   end generate;

 comp6: if ((core_name0 = "receiver_mult_gen_v12_0_i7")) generate 
  core_instance6:receiver_mult_gen_v12_0_i7
   port map ( 
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
 --  Filename      : xlcounter_rst.vhd
 --
 --  Created       : 1/31/01
 --  Modified      :
 --
 --  Description   : VHDL wrapper for a counter. This wrapper
 --                  uses the Binary Counter CoreGenerator core.
 --
 ---------------------------------------------------------------------
 
 
 ---------------------------------------------------------------------
 --
 --  Entity        : xlcounter
 --
 --  Architecture  : behavior
 --
 --  Description   : Top level VHDL description of a counter.
 --
 ---------------------------------------------------------------------
 
 library IEEE;
 use IEEE.std_logic_1164.all;

entity receiver_xlcounter_free is 
   generic (
     core_name0: string := "";
     op_width: integer := 5;
     op_arith: integer := xlSigned
   );
   port (
     ce: in std_logic;
     clr: in std_logic;
     clk: in std_logic;
     op: out std_logic_vector(op_width - 1 downto 0);
     up: in std_logic_vector(0 downto 0) := (others => '0');
     load: in std_logic_vector(0 downto 0) := (others => '0');
     din: in std_logic_vector(op_width - 1 downto 0) := (others => '0');
     en: in std_logic_vector(0 downto 0);
     rst: in std_logic_vector(0 downto 0)
   );
 end receiver_xlcounter_free;
 
 architecture behavior of receiver_xlcounter_free is


 component receiver_c_counter_binary_v12_0_i1
    port ( 
      clk: in std_logic;
      ce: in std_logic;
      SINIT: in std_logic;
      q: out std_logic_vector(op_width - 1 downto 0) 
 		  ); 
 end component;

-- synthesis translate_off
   constant zeroVec: std_logic_vector(op_width - 1 downto 0) := (others => '0');
   constant oneVec: std_logic_vector(op_width - 1 downto 0) := (others => '1');
   constant zeroStr: string(1 to op_width) :=
     std_logic_vector_to_bin_string(zeroVec);
   constant oneStr: string(1 to op_width) :=
     std_logic_vector_to_bin_string(oneVec);
 -- synthesis translate_on
 
   signal core_sinit: std_logic;
   signal core_ce: std_logic;
   signal op_net: std_logic_vector(op_width - 1 downto 0);
 begin
   core_ce <= ce and en(0);
   core_sinit <= (clr or rst(0)) and ce;
   op <= op_net;


 comp0: if ((core_name0 = "receiver_c_counter_binary_v12_0_i1")) generate 
  core_instance0:receiver_c_counter_binary_v12_0_i1
   port map ( 
        clk => clk,
        ce => core_ce,
        SINIT => core_sinit,
        q => op_net
  ); 
   end generate;

end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

---------------------------------------------------------------------
 --
 --  Filename      : xlcounter.vhd
 --
 --  Created       : 5/31/00
 --  Modified      : 6/7/00
 --
 --  Description   : VHDL wrapper for a counter. This wrapper
 --                  uses the Binary Counter CoreGenerator core.
 --
 ---------------------------------------------------------------------
 
 
 ---------------------------------------------------------------------
 --
 --  Entity        : xlcounter
 --
 --  Architecture  : behavior
 --
 --  Description   : Top level VHDL description of a counter.
 --
 ---------------------------------------------------------------------
 
 library IEEE;
 use IEEE.std_logic_1164.all;
 use IEEE.numeric_std.all;

entity receiver_xlcounter_limit is 
   generic (
     core_name0: string := "";
     op_width: integer := 5;
     op_arith: integer := xlSigned;
     cnt_63_48: integer:= 0;
     cnt_47_32: integer:= 0;
     cnt_31_16: integer:= 0;
     cnt_15_0: integer:= 0;
     count_limited: integer := 0		-- 0 if cnt_to = (2^n)-1 else 1
   );
   port (
     ce: in std_logic;
     clr: in std_logic;
     clk: in std_logic;
     op: out std_logic_vector(op_width - 1 downto 0);
     up: in std_logic_vector(0 downto 0) := (others => '0');
     en: in std_logic_vector(0 downto 0);
     rst: in std_logic_vector(0 downto 0)
   );
 end receiver_xlcounter_limit;
 
 architecture behavior of receiver_xlcounter_limit is
 signal high_cnt_to: std_logic_vector(31 downto 0);
 signal low_cnt_to: std_logic_vector(31 downto 0);
 signal cnt_to: std_logic_vector(63 downto 0);
 signal core_sinit, op_thresh0, core_ce: std_logic;
 signal rst_overrides_en: std_logic;
 signal op_net: std_logic_vector(op_width - 1 downto 0);
 
 -- synthesis translate_off
 signal real_op : real; -- For debugging info ports
 -- synthesis translate_on
 
 function equals(op, cnt_to : std_logic_vector; width, arith : integer)
 return std_logic
 is
 variable signed_op, signed_cnt_to : signed (width - 1 downto 0);
 variable unsigned_op, unsigned_cnt_to : unsigned (width - 1 downto 0);
 variable result : std_logic;
 begin
 -- synthesis translate_off
 if ((is_XorU(op)) or (is_XorU(cnt_to)) ) then
 result := '0';
 return result;
 end if;
 -- synthesis translate_on
 
 if (op = cnt_to) then
 result := '1';
 else
 result := '0';
 end if;
 return result;
 end;


 component receiver_c_counter_binary_v12_0_i0
    port ( 
      clk: in std_logic;
      ce: in std_logic;
      SINIT: in std_logic;
      q: out std_logic_vector(op_width - 1 downto 0) 
 		  ); 
 end component;

 component receiver_c_counter_binary_v12_0_i2
    port ( 
      clk: in std_logic;
      ce: in std_logic;
      SINIT: in std_logic;
      q: out std_logic_vector(op_width - 1 downto 0) 
 		  ); 
 end component;

 component receiver_c_counter_binary_v12_0_i3
    port ( 
      clk: in std_logic;
      ce: in std_logic;
      SINIT: in std_logic;
      q: out std_logic_vector(op_width - 1 downto 0) 
 		  ); 
 end component;

-- synthesis translate_off
   constant zeroVec : std_logic_vector(op_width - 1 downto 0) := (others => '0');
   constant oneVec : std_logic_vector(op_width - 1 downto 0) := (others => '1');
   constant zeroStr : string(1 to op_width) :=
     std_logic_vector_to_bin_string(zeroVec);
   constant oneStr : string(1 to op_width) :=
     std_logic_vector_to_bin_string(oneVec);
 -- synthesis translate_on
 
 begin
   -- Debugging info for internal full precision variables
   -- synthesis translate_off
 --     real_op <= to_real(op, op_bin_pt, op_arith);
   -- synthesis translate_on
 
   cnt_to(63 downto 48) <= integer_to_std_logic_vector(cnt_63_48, 16, op_arith);
   cnt_to(47 downto 32) <= integer_to_std_logic_vector(cnt_47_32, 16, op_arith);
   cnt_to(31 downto 16) <= integer_to_std_logic_vector(cnt_31_16, 16, op_arith);
   cnt_to(15 downto 0) <= integer_to_std_logic_vector(cnt_15_0, 16, op_arith);
 
   -- Output of counter always valid
   op <= op_net;
   core_ce <= ce and en(0);
   rst_overrides_en <= rst(0) or en(0);
 
   limit : if (count_limited = 1) generate
     eq_cnt_to : process (op_net, cnt_to)
     begin
       -- Had to pass cnt_to(op_width - 1 downto 0) instead of cnt_to so
       -- that XST would infer a macro
       op_thresh0 <= equals(op_net, cnt_to(op_width - 1 downto 0),
                      op_width, op_arith);
     end process;
 
     core_sinit <= (op_thresh0 or clr or rst(0)) and ce and rst_overrides_en;
   end generate;
 
   no_limit : if (count_limited = 0) generate
     core_sinit <= (clr or rst(0)) and ce and rst_overrides_en;
   end generate;


 comp0: if ((core_name0 = "receiver_c_counter_binary_v12_0_i0")) generate 
  core_instance0:receiver_c_counter_binary_v12_0_i0
   port map ( 
        clk => clk,
        ce => core_ce,
        SINIT => core_sinit,
        q => op_net
  ); 
   end generate;

 comp1: if ((core_name0 = "receiver_c_counter_binary_v12_0_i2")) generate 
  core_instance1:receiver_c_counter_binary_v12_0_i2
   port map ( 
        clk => clk,
        ce => core_ce,
        SINIT => core_sinit,
        q => op_net
  ); 
   end generate;

 comp2: if ((core_name0 = "receiver_c_counter_binary_v12_0_i3")) generate 
  core_instance2:receiver_c_counter_binary_v12_0_i3
   port map ( 
        clk => clk,
        ce => core_ce,
        SINIT => core_sinit,
        q => op_net
  ); 
   end generate;

end behavior;

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

entity receiver_xlfifogen_u is 
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
 end receiver_xlfifogen_u;
 
 architecture behavior of receiver_xlfifogen_u is
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
 


 component receiver_fifo_generator_i0
    port ( 
      clk: in std_logic;
      srst: in std_logic;
      din: in std_logic_vector(data_width - 1 downto 0);
      wr_en: in std_logic;
      rd_en: in std_logic;
      dout: out std_logic_vector(data_width - 1 downto 0);
      full: out std_logic;
      empty: out std_logic;
      data_count: out std_logic_vector(data_count_width - 1 downto 0) 
 		  ); 
 end component;

 component receiver_fifo_generator_i1
    port ( 
      clk: in std_logic;
      srst: in std_logic;
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
 

 comp0: if ((core_name0 = "receiver_fifo_generator_i0")) generate 
  core_instance0:receiver_fifo_generator_i0
   port map ( 
        clk => clk,
        srst => srst,
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

 comp1: if ((core_name0 = "receiver_fifo_generator_i1")) generate 
  core_instance1:receiver_fifo_generator_i1
   port map ( 
        clk => clk,
        srst => srst,
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

entity xlcic_compiler_ab7d75287b431a7c4f752b001883d8f6 is 
  port(
    ce:in std_logic;
    ce_5:in std_logic;
    ce_logic_1:in std_logic;
    clk:in std_logic;
    clk_5:in std_logic;
    clk_logic_1:in std_logic;
    m_axis_data_tdata_real:out std_logic_vector(22 downto 0);
    m_axis_data_tvalid:out std_logic;
    s_axis_data_tdata_real:in std_logic_vector(15 downto 0);
    s_axis_data_tready:out std_logic
  );
end xlcic_compiler_ab7d75287b431a7c4f752b001883d8f6; 

architecture behavior of xlcic_compiler_ab7d75287b431a7c4f752b001883d8f6  is
  component receiver_cic_compiler_v4_0_i0
    port(
      aclk:in std_logic;
      aclken:in std_logic;
      m_axis_data_tdata:out std_logic_vector(23 downto 0);
      m_axis_data_tvalid:out std_logic;
      s_axis_data_tdata:in std_logic_vector(15 downto 0);
      s_axis_data_tready:out std_logic;
      s_axis_data_tvalid:in std_logic
    );
end component;
signal m_axis_data_tdata_net: std_logic_vector(23 downto 0) := (others=>'0');
signal m_axis_data_tdata_real_ps_net: std_logic_vector(22 downto 0) := (others=>'0');
signal m_axis_data_tdata_real_ps_net_captured: std_logic_vector(22 downto 0) := (others=>'0');
signal m_axis_data_tdata_real_ps_net_or_captured_net: std_logic_vector(22 downto 0) := (others=>'0');
signal m_axis_data_tvalid_ps_net: std_logic := '0';
signal m_axis_data_tvalid_ps_net_captured: std_logic := '0';
signal m_axis_data_tvalid_ps_net_or_captured_net: std_logic := '0';
signal s_axis_data_tdata_net: std_logic_vector(15 downto 0) := (others=>'0');
begin
  m_axis_data_tdata_real_ps_net <= m_axis_data_tdata_net(22 downto 0);
  s_axis_data_tdata_net(15 downto 0) <= s_axis_data_tdata_real;
  m_axis_data_tdata_real_ps_net_or_captured_net <= m_axis_data_tdata_real_ps_net or m_axis_data_tdata_real_ps_net_captured;
m_axis_data_tdata_real_ps_net_synchronizer_1 : entity work.synth_reg_w_init
    generic map(
        width => 23,
        init_index => 0,
        init_value => "0",
        latency => 1
    )
    port map (
        i => m_axis_data_tdata_real_ps_net_or_captured_net,
        ce => ce_5,
        clr => '0',
        clk => clk_5, 
        o => m_axis_data_tdata_real
    );
m_axis_data_tdata_real_ps_net_synchronizer_2 : entity work.synth_reg_w_init
    generic map(
        width => 23,
        init_index => 0,
        init_value => "0",
        latency => 1
    )
    port map (
        i => m_axis_data_tdata_real_ps_net,
        ce => m_axis_data_tvalid_ps_net,
        clr => '0',
        clk => clk_5, 
        o => m_axis_data_tdata_real_ps_net_captured
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
        ce => ce_5,
        clr => '0',
        clk => clk_5, 
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
        clk => clk_5, 
        o(0) => m_axis_data_tvalid_ps_net_captured
    );
  receiver_cic_compiler_v4_0_i0_instance : receiver_cic_compiler_v4_0_i0
    port map(
      aclk=>clk,
      aclken=>ce,
      m_axis_data_tdata=>m_axis_data_tdata_net,
      m_axis_data_tvalid=>m_axis_data_tvalid_ps_net,
      s_axis_data_tdata=>s_axis_data_tdata_net,
      s_axis_data_tready=>s_axis_data_tready,
      s_axis_data_tvalid=>ce_logic_1
    );
end behavior;


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

entity xlreceiver_cmpy_v6_0_i0_3c580ae50e053964934daefdc6acd256 is 
  port(
    a_im:in std_logic_vector(15 downto 0);
    a_re:in std_logic_vector(15 downto 0);
    b_im:in std_logic_vector(17 downto 0);
    b_re:in std_logic_vector(17 downto 0);
    ce:in std_logic;
    ce_20:in std_logic;
    clk:in std_logic;
    clk_20:in std_logic;
    p_im:out std_logic_vector(34 downto 0);
    p_re:out std_logic_vector(34 downto 0)
  );
end xlreceiver_cmpy_v6_0_i0_3c580ae50e053964934daefdc6acd256; 

architecture behavior of xlreceiver_cmpy_v6_0_i0_3c580ae50e053964934daefdc6acd256  is
  component receiver_cmpy_v6_0_i0
    port(
      aclk:in std_logic;
      aclken:in std_logic;
      m_axis_dout_tdata:out std_logic_vector(79 downto 0);
      m_axis_dout_tvalid:out std_logic;
      s_axis_a_tdata:in std_logic_vector(31 downto 0);
      s_axis_a_tvalid:in std_logic;
      s_axis_b_tdata:in std_logic_vector(47 downto 0);
      s_axis_b_tvalid:in std_logic
    );
end component;
signal m_axis_dout_tdata_net: std_logic_vector(79 downto 0) := (others=>'0');
signal p_im_ps_net: std_logic_vector(34 downto 0) := (others=>'0');
signal p_re_ps_net: std_logic_vector(34 downto 0) := (others=>'0');
signal m_axis_dout_tvalid: std_logic := '0';
signal s_axis_a_tdata_net: std_logic_vector(31 downto 0) := (others=>'0');
signal s_axis_b_tdata_net: std_logic_vector(47 downto 0) := (others=>'0');
begin
  p_im_ps_net <= m_axis_dout_tdata_net(74 downto 40);
  p_re_ps_net <= m_axis_dout_tdata_net(34 downto 0);
  s_axis_a_tdata_net(31 downto 16) <= a_im;
  s_axis_a_tdata_net(15 downto 0) <= a_re;
  s_axis_b_tdata_net(41 downto 24) <= b_im;
  s_axis_b_tdata_net(17 downto 0) <= b_re;
  p_im_ps_net_synchronizer : entity work.synth_reg_w_init
    generic map(
        width => 35,
        init_index => 0,
        init_value => "0",
        latency => 1
    )
    port map (
        i => p_im_ps_net,
        ce => ce_20,
        clr => '0',
        clk => clk_20, 
        o => p_im
    );
  p_re_ps_net_synchronizer : entity work.synth_reg_w_init
    generic map(
        width => 35,
        init_index => 0,
        init_value => "0",
        latency => 1
    )
    port map (
        i => p_re_ps_net,
        ce => ce_20,
        clr => '0',
        clk => clk_20, 
        o => p_re
    );
  receiver_cmpy_v6_0_i0_instance : receiver_cmpy_v6_0_i0
    port map(
      aclk=>clk,
      aclken=>ce,
      m_axis_dout_tdata=>m_axis_dout_tdata_net,
      m_axis_dout_tvalid=>m_axis_dout_tvalid,
      s_axis_a_tdata=>s_axis_a_tdata_net,
      s_axis_a_tvalid=>ce,
      s_axis_b_tdata=>s_axis_b_tdata_net,
      s_axis_b_tvalid=>ce
    );
end behavior;


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

entity xlreceiver_cmpy_v6_0_i1_b59bcb8a637d0acbaf0c114f5a2740aa is 
  port(
    a_im:in std_logic_vector(15 downto 0);
    a_re:in std_logic_vector(15 downto 0);
    b_im:in std_logic_vector(15 downto 0);
    b_re:in std_logic_vector(15 downto 0);
    ce:in std_logic;
    ce_5:in std_logic;
    clk:in std_logic;
    clk_5:in std_logic;
    p_im:out std_logic_vector(32 downto 0);
    p_re:out std_logic_vector(32 downto 0)
  );
end xlreceiver_cmpy_v6_0_i1_b59bcb8a637d0acbaf0c114f5a2740aa; 

architecture behavior of xlreceiver_cmpy_v6_0_i1_b59bcb8a637d0acbaf0c114f5a2740aa  is
  component receiver_cmpy_v6_0_i1
    port(
      aclk:in std_logic;
      aclken:in std_logic;
      m_axis_dout_tdata:out std_logic_vector(79 downto 0);
      m_axis_dout_tvalid:out std_logic;
      s_axis_a_tdata:in std_logic_vector(31 downto 0);
      s_axis_a_tvalid:in std_logic;
      s_axis_b_tdata:in std_logic_vector(31 downto 0);
      s_axis_b_tvalid:in std_logic
    );
end component;
signal m_axis_dout_tdata_net: std_logic_vector(79 downto 0) := (others=>'0');
signal p_im_ps_net: std_logic_vector(32 downto 0) := (others=>'0');
signal p_re_ps_net: std_logic_vector(32 downto 0) := (others=>'0');
signal m_axis_dout_tvalid: std_logic := '0';
signal s_axis_a_tdata_net: std_logic_vector(31 downto 0) := (others=>'0');
signal s_axis_b_tdata_net: std_logic_vector(31 downto 0) := (others=>'0');
begin
  p_im_ps_net <= m_axis_dout_tdata_net(72 downto 40);
  p_re_ps_net <= m_axis_dout_tdata_net(32 downto 0);
  s_axis_a_tdata_net(31 downto 16) <= a_im;
  s_axis_a_tdata_net(15 downto 0) <= a_re;
  s_axis_b_tdata_net(31 downto 16) <= b_im;
  s_axis_b_tdata_net(15 downto 0) <= b_re;
  p_im_ps_net_synchronizer : entity work.synth_reg_w_init
    generic map(
        width => 33,
        init_index => 0,
        init_value => "0",
        latency => 1
    )
    port map (
        i => p_im_ps_net,
        ce => ce_5,
        clr => '0',
        clk => clk_5, 
        o => p_im
    );
  p_re_ps_net_synchronizer : entity work.synth_reg_w_init
    generic map(
        width => 33,
        init_index => 0,
        init_value => "0",
        latency => 1
    )
    port map (
        i => p_re_ps_net,
        ce => ce_5,
        clr => '0',
        clk => clk_5, 
        o => p_re
    );
  receiver_cmpy_v6_0_i1_instance : receiver_cmpy_v6_0_i1
    port map(
      aclk=>clk,
      aclken=>ce,
      m_axis_dout_tdata=>m_axis_dout_tdata_net,
      m_axis_dout_tvalid=>m_axis_dout_tvalid,
      s_axis_a_tdata=>s_axis_a_tdata_net,
      s_axis_a_tvalid=>ce,
      s_axis_b_tdata=>s_axis_b_tdata_net,
      s_axis_b_tvalid=>ce
    );
end behavior;


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

entity xlfast_fourier_transform_1ea7c1bb5dc0834af6d1826c317af473 is 
  port(
    ce:in std_logic;
    clk:in std_logic;
    event_data_in_channel_halt:out std_logic;
    event_data_out_channel_halt:out std_logic;
    event_frame_started:out std_logic;
    event_status_channel_halt:out std_logic;
    event_tlast_missing:out std_logic;
    event_tlast_unexpected:out std_logic;
    m_axis_data_tdata_xn_im_0:out std_logic_vector(31 downto 0);
    m_axis_data_tdata_xn_re_0:out std_logic_vector(31 downto 0);
    m_axis_data_tlast:out std_logic;
    m_axis_data_tready:in std_logic;
    m_axis_data_tvalid:out std_logic;
    s_axis_config_tdata_fwd_inv:in std_logic_vector(0 downto 0);
    s_axis_config_tdata_scale_sch:in std_logic_vector(13 downto 0);
    s_axis_config_tready:out std_logic;
    s_axis_config_tvalid:in std_logic;
    s_axis_data_tdata_xn_im_0:in std_logic_vector(31 downto 0);
    s_axis_data_tdata_xn_re_0:in std_logic_vector(31 downto 0);
    s_axis_data_tlast:in std_logic;
    s_axis_data_tready:out std_logic;
    s_axis_data_tvalid:in std_logic
  );
end xlfast_fourier_transform_1ea7c1bb5dc0834af6d1826c317af473; 

architecture behavior of xlfast_fourier_transform_1ea7c1bb5dc0834af6d1826c317af473  is
  component receiver_xfft_v9_1_i0
    port(
      aclk:in std_logic;
      aclken:in std_logic;
      event_data_in_channel_halt:out std_logic;
      event_data_out_channel_halt:out std_logic;
      event_frame_started:out std_logic;
      event_status_channel_halt:out std_logic;
      event_tlast_missing:out std_logic;
      event_tlast_unexpected:out std_logic;
      m_axis_data_tdata:out std_logic_vector(63 downto 0);
      m_axis_data_tlast:out std_logic;
      m_axis_data_tready:in std_logic;
      m_axis_data_tvalid:out std_logic;
      s_axis_config_tdata:in std_logic_vector(15 downto 0);
      s_axis_config_tready:out std_logic;
      s_axis_config_tvalid:in std_logic;
      s_axis_data_tdata:in std_logic_vector(63 downto 0);
      s_axis_data_tlast:in std_logic;
      s_axis_data_tready:out std_logic;
      s_axis_data_tvalid:in std_logic
    );
end component;
signal m_axis_data_tdata_net: std_logic_vector(63 downto 0) := (others=>'0');
signal s_axis_config_tdata_net: std_logic_vector(15 downto 0) := (others=>'0');
signal s_axis_data_tdata_net: std_logic_vector(63 downto 0) := (others=>'0');
begin
  m_axis_data_tdata_xn_im_0 <= m_axis_data_tdata_net(63 downto 32);
  m_axis_data_tdata_xn_re_0 <= m_axis_data_tdata_net(31 downto 0);
  s_axis_config_tdata_net(14 downto 1) <= s_axis_config_tdata_scale_sch;
  s_axis_config_tdata_net(0 downto 0) <= s_axis_config_tdata_fwd_inv;
  s_axis_data_tdata_net(63 downto 32) <= s_axis_data_tdata_xn_im_0;
  s_axis_data_tdata_net(31 downto 0) <= s_axis_data_tdata_xn_re_0;
  receiver_xfft_v9_1_i0_instance : receiver_xfft_v9_1_i0
    port map(
      aclk=>clk,
      aclken=>ce,
      event_data_in_channel_halt=>event_data_in_channel_halt,
      event_data_out_channel_halt=>event_data_out_channel_halt,
      event_frame_started=>event_frame_started,
      event_status_channel_halt=>event_status_channel_halt,
      event_tlast_missing=>event_tlast_missing,
      event_tlast_unexpected=>event_tlast_unexpected,
      m_axis_data_tdata=>m_axis_data_tdata_net,
      m_axis_data_tlast=>m_axis_data_tlast,
      m_axis_data_tready=>m_axis_data_tready,
      m_axis_data_tvalid=>m_axis_data_tvalid,
      s_axis_config_tdata=>s_axis_config_tdata_net,
      s_axis_config_tready=>s_axis_config_tready,
      s_axis_config_tvalid=>s_axis_config_tvalid,
      s_axis_data_tdata=>s_axis_data_tdata_net,
      s_axis_data_tlast=>s_axis_data_tlast,
      s_axis_data_tready=>s_axis_data_tready,
      s_axis_data_tvalid=>s_axis_data_tvalid
    );
end behavior;


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

entity xlreceiver_cmpy_v6_0_i2_50c91325e0e7dbcf8de2e084adad4455 is 
  port(
    a_im:in std_logic_vector(17 downto 0);
    a_re:in std_logic_vector(17 downto 0);
    b_im:in std_logic_vector(17 downto 0);
    b_re:in std_logic_vector(17 downto 0);
    ce:in std_logic;
    ce_5:in std_logic;
    clk:in std_logic;
    clk_5:in std_logic;
    p_im:out std_logic_vector(36 downto 0);
    p_re:out std_logic_vector(36 downto 0)
  );
end xlreceiver_cmpy_v6_0_i2_50c91325e0e7dbcf8de2e084adad4455; 

architecture behavior of xlreceiver_cmpy_v6_0_i2_50c91325e0e7dbcf8de2e084adad4455  is
  component receiver_cmpy_v6_0_i2
    port(
      aclk:in std_logic;
      aclken:in std_logic;
      m_axis_dout_tdata:out std_logic_vector(79 downto 0);
      m_axis_dout_tvalid:out std_logic;
      s_axis_a_tdata:in std_logic_vector(47 downto 0);
      s_axis_a_tvalid:in std_logic;
      s_axis_b_tdata:in std_logic_vector(47 downto 0);
      s_axis_b_tvalid:in std_logic
    );
end component;
signal m_axis_dout_tdata_net: std_logic_vector(79 downto 0) := (others=>'0');
signal p_im_ps_net: std_logic_vector(36 downto 0) := (others=>'0');
signal p_re_ps_net: std_logic_vector(36 downto 0) := (others=>'0');
signal m_axis_dout_tvalid: std_logic := '0';
signal s_axis_a_tdata_net: std_logic_vector(47 downto 0) := (others=>'0');
signal s_axis_b_tdata_net: std_logic_vector(47 downto 0) := (others=>'0');
begin
  p_im_ps_net <= m_axis_dout_tdata_net(76 downto 40);
  p_re_ps_net <= m_axis_dout_tdata_net(36 downto 0);
  s_axis_a_tdata_net(41 downto 24) <= a_im;
  s_axis_a_tdata_net(17 downto 0) <= a_re;
  s_axis_b_tdata_net(41 downto 24) <= b_im;
  s_axis_b_tdata_net(17 downto 0) <= b_re;
  p_im_ps_net_synchronizer : entity work.synth_reg_w_init
    generic map(
        width => 37,
        init_index => 0,
        init_value => "0",
        latency => 1
    )
    port map (
        i => p_im_ps_net,
        ce => ce_5,
        clr => '0',
        clk => clk_5, 
        o => p_im
    );
  p_re_ps_net_synchronizer : entity work.synth_reg_w_init
    generic map(
        width => 37,
        init_index => 0,
        init_value => "0",
        latency => 1
    )
    port map (
        i => p_re_ps_net,
        ce => ce_5,
        clr => '0',
        clk => clk_5, 
        o => p_re
    );
  receiver_cmpy_v6_0_i2_instance : receiver_cmpy_v6_0_i2
    port map(
      aclk=>clk,
      aclken=>ce,
      m_axis_dout_tdata=>m_axis_dout_tdata_net,
      m_axis_dout_tvalid=>m_axis_dout_tvalid,
      s_axis_a_tdata=>s_axis_a_tdata_net,
      s_axis_a_tvalid=>ce,
      s_axis_b_tdata=>s_axis_b_tdata_net,
      s_axis_b_tvalid=>ce
    );
end behavior;


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

entity xlfir_compiler_c0f9b731039db4a27bce614b597d3b5d is 
  port(
    ce:in std_logic;
    ce_20:in std_logic;
    ce_logic_20:in std_logic;
    clk:in std_logic;
    clk_20:in std_logic;
    clk_logic_20:in std_logic;
    en:in std_logic;
    m_axis_data_tdata_real:out std_logic_vector(7 downto 0);
    m_axis_data_tvalid:out std_logic;
    s_axis_data_tdata_real:in std_logic_vector(1 downto 0);
    s_axis_data_tready:out std_logic;
    src_ce:in std_logic;
    src_clk:in std_logic
  );
end xlfir_compiler_c0f9b731039db4a27bce614b597d3b5d; 

architecture behavior of xlfir_compiler_c0f9b731039db4a27bce614b597d3b5d  is
  component receiver_fir_compiler_v7_2_i0
    port(
      aclk:in std_logic;
      aclken:in std_logic;
      m_axis_data_tdata:out std_logic_vector(7 downto 0);
      m_axis_data_tvalid:out std_logic;
      s_axis_data_tdata:in std_logic_vector(7 downto 0);
      s_axis_data_tready:out std_logic;
      s_axis_data_tvalid:in std_logic
    );
end component;
signal aclken_net: std_logic := '0';
signal m_axis_data_tdata_net: std_logic_vector(7 downto 0) := (others=>'0');
signal m_axis_data_tdata_real_ps_net: std_logic_vector(7 downto 0) := (others=>'0');
signal m_axis_data_tvalid_ps_net: std_logic := '0';
signal m_axis_data_tvalid_ps_net_captured: std_logic := '0';
signal m_axis_data_tvalid_ps_net_or_captured_net: std_logic := '0';
signal s_axis_data_tdata_net: std_logic_vector(7 downto 0) := (others=>'0');
signal internal_en_20_net: std_logic := '0';
begin
  aclken_net <= en and ce;
  m_axis_data_tdata_real_ps_net <= m_axis_data_tdata_net(7 downto 0);
  s_axis_data_tdata_net(1 downto 0) <= s_axis_data_tdata_real;
  internal_en_20_net <= en and ce_20;
  m_axis_data_tdata_real_ps_net_synchronizer : entity work.synth_reg_w_init
    generic map(
        width => 8,
        init_index => 0,
        init_value => "0",
        latency => 1
    )
    port map (
        i => m_axis_data_tdata_real_ps_net,
        ce => internal_en_20_net,
        clr => '0',
        clk => clk_20, 
        o => m_axis_data_tdata_real
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
        ce => internal_en_20_net,
        clr => '0',
        clk => clk_20, 
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
        clk => clk_20, 
        o(0) => m_axis_data_tvalid_ps_net_captured
    );
  receiver_fir_compiler_v7_2_i0_instance : receiver_fir_compiler_v7_2_i0
    port map(
      aclk=>clk,
      aclken=>aclken_net,
      m_axis_data_tdata=>m_axis_data_tdata_net,
      m_axis_data_tvalid=>m_axis_data_tvalid_ps_net,
      s_axis_data_tdata=>s_axis_data_tdata_net,
      s_axis_data_tready=>s_axis_data_tready,
      s_axis_data_tvalid=>ce_logic_20
    );
end behavior;


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

entity xlfir_compiler_01ac81c7a29be7199debebe97d3ee909 is 
  port(
    ce:in std_logic;
    ce_20:in std_logic;
    ce_5:in std_logic;
    ce_logic_5:in std_logic;
    clk:in std_logic;
    clk_20:in std_logic;
    clk_5:in std_logic;
    clk_logic_5:in std_logic;
    m_axis_data_tdata_path0:out std_logic_vector(32 downto 0);
    m_axis_data_tdata_path1:out std_logic_vector(32 downto 0);
    m_axis_data_tvalid:out std_logic;
    s_axis_data_tdata_path0:in std_logic_vector(15 downto 0);
    s_axis_data_tdata_path1:in std_logic_vector(15 downto 0);
    s_axis_data_tready:out std_logic;
    src_ce:in std_logic;
    src_clk:in std_logic
  );
end xlfir_compiler_01ac81c7a29be7199debebe97d3ee909; 

architecture behavior of xlfir_compiler_01ac81c7a29be7199debebe97d3ee909  is
  component receiver_fir_compiler_v7_2_i1
    port(
      aclk:in std_logic;
      aclken:in std_logic;
      m_axis_data_tdata:out std_logic_vector(79 downto 0);
      m_axis_data_tvalid:out std_logic;
      s_axis_data_tdata:in std_logic_vector(31 downto 0);
      s_axis_data_tready:out std_logic;
      s_axis_data_tvalid:in std_logic
    );
end component;
signal m_axis_data_tdata_net: std_logic_vector(79 downto 0) := (others=>'0');
signal m_axis_data_tdata_path1_ps_net: std_logic_vector(32 downto 0) := (others=>'0');
signal m_axis_data_tdata_path0_ps_net: std_logic_vector(32 downto 0) := (others=>'0');
signal m_axis_data_tvalid_ps_net: std_logic := '0';
signal m_axis_data_tvalid_ps_net_captured: std_logic := '0';
signal m_axis_data_tvalid_ps_net_or_captured_net: std_logic := '0';
signal s_axis_data_tdata_net: std_logic_vector(31 downto 0) := (others=>'0');
begin
  m_axis_data_tdata_path1_ps_net <= m_axis_data_tdata_net(72 downto 40);
  m_axis_data_tdata_path0_ps_net <= m_axis_data_tdata_net(32 downto 0);
  s_axis_data_tdata_net(31 downto 16) <= s_axis_data_tdata_path1;
  s_axis_data_tdata_net(15 downto 0) <= s_axis_data_tdata_path0;
  m_axis_data_tdata_path1_ps_net_synchronizer : entity work.synth_reg_w_init
    generic map(
        width => 33,
        init_index => 0,
        init_value => "0",
        latency => 1
    )
    port map (
        i => m_axis_data_tdata_path1_ps_net,
        ce => ce_20,
        clr => '0',
        clk => clk_20, 
        o => m_axis_data_tdata_path1
    );
  m_axis_data_tdata_path0_ps_net_synchronizer : entity work.synth_reg_w_init
    generic map(
        width => 33,
        init_index => 0,
        init_value => "0",
        latency => 1
    )
    port map (
        i => m_axis_data_tdata_path0_ps_net,
        ce => ce_20,
        clr => '0',
        clk => clk_20, 
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
        ce => ce_20,
        clr => '0',
        clk => clk_20, 
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
        clk => clk_20, 
        o(0) => m_axis_data_tvalid_ps_net_captured
    );
  receiver_fir_compiler_v7_2_i1_instance : receiver_fir_compiler_v7_2_i1
    port map(
      aclk=>clk,
      aclken=>ce,
      m_axis_data_tdata=>m_axis_data_tdata_net,
      m_axis_data_tvalid=>m_axis_data_tvalid_ps_net,
      s_axis_data_tdata=>s_axis_data_tdata_net,
      s_axis_data_tready=>s_axis_data_tready,
      s_axis_data_tvalid=>ce_logic_5
    );
end behavior;


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

entity xlfir_compiler_382353bead95e3b6b04a686443161e02 is 
  port(
    ce:in std_logic;
    clk:in std_logic;
    m_axis_data_tdata_real:out std_logic_vector(30 downto 0);
    m_axis_data_tvalid:out std_logic;
    s_axis_data_tdata_vect0:in std_logic_vector(15 downto 0);
    s_axis_data_tdata_vect1:in std_logic_vector(15 downto 0);
    s_axis_data_tready:out std_logic;
    s_axis_data_tvalid:in std_logic;
    src_ce:in std_logic;
    src_clk:in std_logic
  );
end xlfir_compiler_382353bead95e3b6b04a686443161e02; 

architecture behavior of xlfir_compiler_382353bead95e3b6b04a686443161e02  is
  component receiver_fir_compiler_v7_2_i2
    port(
      aclk:in std_logic;
      aclken:in std_logic;
      m_axis_data_tdata:out std_logic_vector(31 downto 0);
      m_axis_data_tvalid:out std_logic;
      s_axis_data_tdata:in std_logic_vector(31 downto 0);
      s_axis_data_tready:out std_logic;
      s_axis_data_tvalid:in std_logic
    );
end component;
signal m_axis_data_tdata_net: std_logic_vector(31 downto 0) := (others=>'0');
signal s_axis_data_tdata_net: std_logic_vector(31 downto 0) := (others=>'0');
begin
  m_axis_data_tdata_real <= m_axis_data_tdata_net(30 downto 0);
  s_axis_data_tdata_net(31 downto 16) <= s_axis_data_tdata_vect1;
  s_axis_data_tdata_net(15 downto 0) <= s_axis_data_tdata_vect0;
  receiver_fir_compiler_v7_2_i2_instance : receiver_fir_compiler_v7_2_i2
    port map(
      aclk=>clk,
      aclken=>ce,
      m_axis_data_tdata=>m_axis_data_tdata_net,
      m_axis_data_tvalid=>m_axis_data_tvalid,
      s_axis_data_tdata=>s_axis_data_tdata_net,
      s_axis_data_tready=>s_axis_data_tready,
      s_axis_data_tvalid=>s_axis_data_tvalid
    );
end behavior;



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

entity receiver_xlmult is 
   generic (
     core_name0: string := "";
     a_width: integer := 4;
     a_bin_pt: integer := 2;
     a_arith: integer := xlSigned;
     b_width: integer := 4;
     b_bin_pt: integer := 1;
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
     quantization: integer := xlTruncate;
     overflow: integer := xlWrap;
     extra_registers: integer := 0;
     c_a_width: integer := 7;
     c_b_width: integer := 7;
     c_type: integer := 0;
     c_a_type: integer := 0;
     c_b_type: integer := 0;
     c_pipelined: integer := 1;
     c_baat: integer := 4;
     multsign: integer := xlSigned;
     c_output_width: integer := 16
   );
   port (
     a: in std_logic_vector(a_width - 1 downto 0);
     b: in std_logic_vector(b_width - 1 downto 0);
     ce: in std_logic;
     clr: in std_logic;
     clk: in std_logic;
     core_ce: in std_logic := '0';
     core_clr: in std_logic := '0';
     core_clk: in std_logic := '0';
     rst: in std_logic_vector(rst_width - 1 downto 0);
     en: in std_logic_vector(en_width - 1 downto 0);
     p: out std_logic_vector(p_width - 1 downto 0)
   );
 end  receiver_xlmult;
 
 architecture behavior of receiver_xlmult is
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


 component receiver_mult_gen_v12_0_i4
    port ( 
      b: in std_logic_vector(c_b_width - 1 downto 0);
      p: out std_logic_vector(c_output_width - 1 downto 0);
      clk: in std_logic;
      ce: in std_logic;
      sclr: in std_logic;
      a: in std_logic_vector(c_a_width - 1 downto 0) 
 		  ); 
 end component;

 component receiver_mult_gen_v12_0_i8
    port ( 
      b: in std_logic_vector(c_b_width - 1 downto 0);
      p: out std_logic_vector(c_output_width - 1 downto 0);
      a: in std_logic_vector(c_a_width - 1 downto 0) 
 		  ); 
 end component;

signal tmp_a: std_logic_vector(c_a_width - 1 downto 0);
 signal conv_a: std_logic_vector(c_a_width - 1 downto 0);
 signal tmp_b: std_logic_vector(c_b_width - 1 downto 0);
 signal conv_b: std_logic_vector(c_b_width - 1 downto 0);
 signal tmp_p: std_logic_vector(c_output_width - 1 downto 0);
 signal conv_p: std_logic_vector(p_width - 1 downto 0);
 -- synthesis translate_off
 signal real_a, real_b, real_p: real;
 -- synthesis translate_on
 signal rfd: std_logic;
 signal rdy: std_logic;
 signal nd: std_logic;
 signal internal_ce: std_logic;
 signal internal_clr: std_logic;
 signal internal_core_ce: std_logic;
 begin
 -- synthesis translate_off
 -- synthesis translate_on
 internal_ce <= ce and en(0);
 internal_core_ce <= core_ce and en(0);
 internal_clr <= (clr or rst(0)) and ce;
 nd <= internal_ce;
 input_process: process (a,b)
 begin
 tmp_a <= zero_ext(a, c_a_width);
 tmp_b <= zero_ext(b, c_b_width);
 end process;
 output_process: process (tmp_p)
 begin
 conv_p <= convert_type(tmp_p, c_output_width, a_bin_pt+b_bin_pt, multsign,
 p_width, p_bin_pt, p_arith, quantization, overflow);
 end process;


 comp0: if ((core_name0 = "receiver_mult_gen_v12_0_i4")) generate 
  core_instance0:receiver_mult_gen_v12_0_i4
   port map ( 
        a => tmp_a,
        clk => clk,
        ce => internal_ce,
        sclr => internal_clr,
        p => tmp_p,
        b => tmp_b
  ); 
   end generate;

 comp1: if ((core_name0 = "receiver_mult_gen_v12_0_i8")) generate 
  core_instance1:receiver_mult_gen_v12_0_i8
   port map ( 
        a => tmp_a,
        p => tmp_p,
        b => tmp_b
  ); 
   end generate;

latency_gt_0: if (extra_registers > 0) generate
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
 latency_eq_0: if (extra_registers = 0) generate
 p <= conv_p;
 end generate;
 end architecture behavior;

