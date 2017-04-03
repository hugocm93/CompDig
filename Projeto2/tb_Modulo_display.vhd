--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:36:07 03/19/2017
-- Design Name:   
-- Module Name:   D:/Dropbox/Com_Digital/Labos/Aula2_1/tb_Modulo_display.vhd
-- Project Name:  Aula2_1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Modulo_display
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
 
ENTITY tb_Modulo_display IS
END tb_Modulo_display;
 
ARCHITECTURE behavior OF tb_Modulo_display IS 

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal hex1 : std_logic_vector(3 downto 0) := (others => '0');
   signal hex2 : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal hex_out : std_logic_vector(6 downto 0):= (others => '0');
   signal c : std_logic:='0';

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   Modulo_display_unit: entity work.Modulo_display(behavioral)
			PORT MAP (
          clk => clk,
          reset => reset,
          hex1 => hex1,
          hex2 => hex2,
          hex_out => hex_out,
          c => c
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin	
		reset <='1', '0' after clk_period;	
		hex1 <="0001";
		hex2 <="1010";
		wait for 250 ms;
		reset <='1';
      -- insert stimulus here 
      wait;
   end process;

END;
