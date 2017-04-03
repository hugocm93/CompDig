--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:28:38 03/19/2017
-- Design Name:   
-- Module Name:   D:/Dropbox/Com_Digital/Labos/Aula2/tb_counter_up_down.vhd
-- Project Name:  Aula2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: counter_up_down
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_counter_up_down IS
END tb_counter_up_down;
 
ARCHITECTURE behavior OF tb_counter_up_down IS 

   constant N : integer := 4; 

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal up : std_logic := '0';

 	--Outputs
   signal max_tick : std_logic;
   signal q : std_logic_vector(N-1 downto 0);

   -- Clock period definitions
   constant clk_period : time := 20 ns;

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   counter_up_down_unit: entity work.counter_up_down(arch)
		GENERIC MAP(N => N)
		PORT MAP (
          clk => clk,
          reset => reset,
          up => up,
          max_tick => max_tick,
          q => q
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
	
	reset <= '1', '0' after clk_period/4;
	up <= '1','0' after clk_period*2*(2**N);

END;
