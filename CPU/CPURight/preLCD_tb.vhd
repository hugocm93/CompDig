LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY preLCD_tb IS
END preLCD_tb;
 
ARCHITECTURE behavior OF preLCD_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT preLCD
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         str_select : IN  std_logic_vector(2 downto 0);
         rs : OUT  std_logic;
         rw : OUT  std_logic;
         ena : OUT  std_logic;
         data_lcd : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal str_select : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal rs : std_logic;
   signal rw : std_logic;
   signal ena : std_logic;
   signal data_lcd : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 1 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: preLCD PORT MAP (
          clk => clk,
          reset => reset,
          str_select => str_select,
          rs => rs,
          rw => rw,
          ena => ena,
          data_lcd => data_lcd
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
	
		str_select <= "000";

      wait;
   end process;

END;
