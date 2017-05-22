LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY Transmissor_tb IS
END Transmissor_tb;
 
ARCHITECTURE behavior OF Transmissor_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Transmissor
    PORT(
         b0 : IN  std_logic;
         b1 : IN  std_logic;
         b2 : IN  std_logic;
         b3 : IN  std_logic;
         oldClk : IN  std_logic;
         reset : IN  std_logic;
         send : IN  std_logic;
         serial_out : OUT  std_logic
        );
    END COMPONENT;
    
   --Inputs
   signal b0 : std_logic := '0';
   signal b1 : std_logic := '0';
   signal b2 : std_logic := '0';
   signal b3 : std_logic := '0';
   signal oldClk : std_logic := '0';
   signal reset : std_logic := '0';
   signal send : std_logic := '0';

 	--Outputs
   signal serial_out : std_logic;

   -- Clock period definitions
   constant oldClk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Transmissor PORT MAP (
          b0 => b0,
          b1 => b1,
          b2 => b2,
          b3 => b3,
          oldClk => oldClk,
          reset => reset,
          send => send,
          serial_out => serial_out
        );

   -- Clock process definitions
   oldClk_process :process
   begin
		oldClk <= '0';
		wait for oldClk_period/2;
		oldClk <= '1';
		wait for oldClk_period/2;
   end process;
 
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for oldClk_period*10;
		reset <= '0';
      send <= '0';
		b0 <= '0';
		b1 <= '1';
		b2 <= '0';
		b3 <= '1';
		wait for 100 ns;
		
		send <= '1';

      wait;
   end process;

END;
