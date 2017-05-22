--------------------------------------------------------------------------------
-- Copyright (c) 1995-2012 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.5
--  \   \         Application : sch2hdl
--  /   /         Filename : Sche.vhf
-- /___/   /\     Timestamp : 04/03/2017 12:22:15
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family spartan3e -flat -suppress -vhdl C:/Users/aula/Downloads/CompDig/Projeto2/Sche.vhf -w C:/Users/aula/Downloads/CompDig/Projeto2/Sche.sch
--Design Name: Sche
--Device: spartan3e
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity Sche is
   port ( clk     : in    std_logic; 
          hex2    : in    std_logic_vector (3 downto 0); 
          Reset   : in    std_logic; 
          c       : out   std_logic; 
          hex_out : out   std_logic_vector (6 downto 0));
end Sche;

architecture BEHAVIORAL of Sche is
   attribute BOX_TYPE   : string ;
   signal XLXN_1  : std_logic;
   signal XLXN_8  : std_logic;
   signal XLXN_31 : std_logic;
   component d_ff_reset
      port ( clk   : in    std_logic; 
             reset : in    std_logic; 
             d     : in    std_logic; 
             q     : out   std_logic);
   end component;
   
   component display_7_seg
      port ( clk     : in    std_logic; 
             hex1    : in    std_logic_vector (3 downto 0); 
             hex2    : in    std_logic_vector (3 downto 0); 
             c       : out   std_logic; 
             hex7seg : out   std_logic_vector (6 downto 0));
   end component;
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   component mod_m_counter
      port ( clk      : in    std_logic; 
             reset    : in    std_logic; 
             max_tick : out   std_logic; 
             q        : out   std_logic_vector (18 downto 0));
   end component;
   
begin
   XLXI_5 : d_ff_reset
      port map (clk=>XLXN_31,
                d=>XLXN_8,
                reset=>Reset,
                q=>XLXN_1);
   
   XLXI_6 : display_7_seg
      port map (clk=>XLXN_1,
                hex1(3 downto 0)=>hex2(3 downto 0),
                hex2(3 downto 0)=>hex2(3 downto 0),
                c=>c,
                hex7seg(6 downto 0)=>hex_out(6 downto 0));
   
   XLXI_9 : INV
      port map (I=>XLXN_1,
                O=>XLXN_8);
   
   XLXI_10 : mod_m_counter
      port map (clk=>clk,
                reset=>Reset,
                max_tick=>XLXN_31,
                q=>open);
   
end BEHAVIORAL;


