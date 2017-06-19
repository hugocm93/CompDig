LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY Control_tb IS
END Control_tb;
 
ARCHITECTURE behavior OF Control_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Control
    PORT(
         reset : IN  std_logic;
         clk : IN  std_logic;
			clkPlaca : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal reset : std_logic := '0';
   signal clk : std_logic := '0';
	signal clkPlaca : std_logic := '0';

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Control PORT MAP (
          reset => reset,
          clk => clk,
			 clkPlaca => clkPlaca
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
      wait;
   end process;

END;
