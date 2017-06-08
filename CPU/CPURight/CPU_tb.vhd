LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY CPU_tb IS
END CPU_tb;
 
ARCHITECTURE behavior OF CPU_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CPU
    PORT(
         reset : IN  std_logic;
         clk : IN  std_logic;
         input : IN  std_logic_vector(7 downto 0);
         instruction : IN  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal reset : std_logic := '0';
   signal clk : std_logic := '0';
   signal input : std_logic_vector(7 downto 0) := (others => '0');
   signal instruction : std_logic_vector(7 downto 0) := (others => '0');

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CPU PORT MAP (
          reset => reset,
          clk => clk,
          input => input,
          instruction => instruction
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
	
		instruction <= x"FF";
		reset <= '1';
		wait for 100 ns;
		reset <= '0';
		wait for 100 ns;
		
		input <= x"03";
		instruction <= x"00";
		wait for 500 ns;
		
		input <= x"06";
		instruction <= x"01";
		wait for 500 ns;
		
		input <= x"06";
		instruction <= x"00";
		wait for 500 ns;
		
		input <= x"06";
		instruction <= x"01";
		wait for 500 ns;
		

		
      wait;
   end process;

END;
