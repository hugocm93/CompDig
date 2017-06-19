--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:01:50 06/19/2017
-- Design Name:   
-- Module Name:   C:/Users/aula/Downloads/CompDig/CPU/CPURight/tb_lab5.vhd
-- Project Name:  CPURight
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Control
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
 
ENTITY tb_lab5 IS
END tb_lab5;
 
ARCHITECTURE behavior OF tb_lab5 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Control
    PORT(
         reset : IN  std_logic;
         clk : IN  std_logic;
         clkPlaca : IN  std_logic;
         c : OUT  std_logic;
         ac_out : OUT  std_logic_vector(6 downto 0);
         pc_out : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal reset : std_logic := '0';
   signal clk : std_logic := '0';
   signal clkPlaca : std_logic := '0';

 	--Outputs
   signal c : std_logic;
   signal ac_out : std_logic_vector(6 downto 0);
   signal pc_out : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
   constant clkPlaca_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Control PORT MAP (
          reset => reset,
          clk => clk,
          clkPlaca => clkPlaca,
          c => c,
          ac_out => ac_out,
          pc_out => pc_out
        );
 
   clkPlaca_process :process
   begin
		clkPlaca <= '0';
		wait for clkPlaca_period/2;
		clkPlaca <= '1';
		wait for clkPlaca_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 400 ns.
		reset<='1';
		wait for 10 ns;	
		reset<='0';
		clk <= '0';
      wait for 400 ns;	
		clk <= '1';
		reset<='0';
      wait for 400 ns;	
		clk <= '0';
		reset<='0';
      wait for 400 ns;	
		clk <= '1';
		reset<='0';
      wait for 400 ns;	
		clk <= '0';
		reset<='0';
      wait for 400 ns;	
		clk <= '1';
		reset<='0';
      wait for 400 ns;	
		clk <= '0';
		reset<='0';
      wait for 400 ns;	
		clk <= '1';
		reset<='0';
      wait for 400 ns;	
		clk <= '0';
		reset<='0';
      wait for 400 ns;	
		clk <= '1';
		reset<='0';
      wait for 400 ns;	
		clk <= '0';
		reset<='0';
      wait for 400 ns;	
		clk <= '1';
		reset<='0';
      wait for 400 ns;	
		clk <= '0';
		reset<='0';	
      wait for 400 ns;	
		clk <= '1';
		reset<='0';
      wait for 400 ns;	
		clk <= '0';
		reset<='0';
      wait for 400 ns;	
		clk <= '1';
		reset<='0';
      wait for 400 ns;	
		clk <= '0';
		reset<='0';
      wait for 400 ns;	
		clk <= '1';
		reset<='0';
      wait for 400 ns;	
		clk <= '0';
		reset<='0';
      wait for 400 ns;	
		clk <= '1';
		reset<='0';
      wait for 400 ns;	
		clk <= '0';
		reset<='0';	
      wait for 400 ns;	
		clk <= '1';
		reset<='0';
      wait for 400 ns;	
		clk <= '0';
		reset<='0';
      wait for 400 ns;	
		clk <= '1';
		reset<='0';
      wait for 400 ns;	
		clk <= '0';
		reset<='0';
      wait for 400 ns;	
		clk <= '1';
		reset<='0';
      wait for 400 ns;	
		clk <= '0';
		reset<='0';
      wait for 400 ns;	
		clk <= '1';
		reset<='0';
      wait for 400 ns;	
		clk <= '0';
		reset<='0';
      wait for 400 ns;	
		clk <= '1';
		reset<='0';
      wait for 400 ns;	
		clk <= '0';
		reset<='0';
      wait for 400 ns;	
		clk <= '1';
		reset<='0';
      wait for 400 ns;	
		clk <= '0';
		reset<='0';		
      wait;
   end process;

END;
