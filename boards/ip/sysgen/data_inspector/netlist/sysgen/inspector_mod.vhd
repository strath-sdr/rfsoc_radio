-- Generated from Simulink block 
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
entity inspector_stub is
  port (
    m_axis_tready : in std_logic_vector( 1-1 downto 0 );
    s_axis_tdata : in std_logic_vector( 32-1 downto 0 );
    s_axis_tvalid : in std_logic_vector( 1-1 downto 0 );
    clk : in std_logic;
    inspector_aresetn : in std_logic;
    inspector_s_axi_awaddr : in std_logic_vector( 4-1 downto 0 );
    inspector_s_axi_awvalid : in std_logic;
    inspector_s_axi_wdata : in std_logic_vector( 32-1 downto 0 );
    inspector_s_axi_wstrb : in std_logic_vector( 4-1 downto 0 );
    inspector_s_axi_wvalid : in std_logic;
    inspector_s_axi_bready : in std_logic;
    inspector_s_axi_araddr : in std_logic_vector( 4-1 downto 0 );
    inspector_s_axi_arvalid : in std_logic;
    inspector_s_axi_rready : in std_logic;
    m_axis_tdata : out std_logic_vector( 32-1 downto 0 );
    m_axis_tlast : out std_logic_vector( 1-1 downto 0 );
    m_axis_tvalid : out std_logic_vector( 1-1 downto 0 );
    inspector_s_axi_awready : out std_logic;
    inspector_s_axi_wready : out std_logic;
    inspector_s_axi_bresp : out std_logic_vector( 2-1 downto 0 );
    inspector_s_axi_bvalid : out std_logic;
    inspector_s_axi_arready : out std_logic;
    inspector_s_axi_rdata : out std_logic_vector( 32-1 downto 0 );
    inspector_s_axi_rresp : out std_logic_vector( 2-1 downto 0 );
    inspector_s_axi_rvalid : out std_logic
  );
end inspector_stub;
architecture structural of inspector_stub is 
begin
  sysgen_dut : entity xil_defaultlib.inspector_0 
  port map (
    m_axis_tready => m_axis_tready,
    s_axis_tdata => s_axis_tdata,
    s_axis_tvalid => s_axis_tvalid,
    clk => clk,
    inspector_aresetn => inspector_aresetn,
    inspector_s_axi_awaddr => inspector_s_axi_awaddr,
    inspector_s_axi_awvalid => inspector_s_axi_awvalid,
    inspector_s_axi_wdata => inspector_s_axi_wdata,
    inspector_s_axi_wstrb => inspector_s_axi_wstrb,
    inspector_s_axi_wvalid => inspector_s_axi_wvalid,
    inspector_s_axi_bready => inspector_s_axi_bready,
    inspector_s_axi_araddr => inspector_s_axi_araddr,
    inspector_s_axi_arvalid => inspector_s_axi_arvalid,
    inspector_s_axi_rready => inspector_s_axi_rready,
    m_axis_tdata => m_axis_tdata,
    m_axis_tlast => m_axis_tlast,
    m_axis_tvalid => m_axis_tvalid,
    inspector_s_axi_awready => inspector_s_axi_awready,
    inspector_s_axi_wready => inspector_s_axi_wready,
    inspector_s_axi_bresp => inspector_s_axi_bresp,
    inspector_s_axi_bvalid => inspector_s_axi_bvalid,
    inspector_s_axi_arready => inspector_s_axi_arready,
    inspector_s_axi_rdata => inspector_s_axi_rdata,
    inspector_s_axi_rresp => inspector_s_axi_rresp,
    inspector_s_axi_rvalid => inspector_s_axi_rvalid
  );
end structural;
