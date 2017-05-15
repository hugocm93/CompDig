LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY somador1bit_tb IS
END somador1bit_tb;
 
ARCHITECTURE behavior OF somador1bit_tb IS 

    COMPONENT somador1bit
    PORT(
         i0 : IN  std_logic;
         i1 : IN  std_logic;
         cin : IN  std_logic;
         s : OUT  std_logic;
         cout : OUT  std_logic
        );
    END COMPONENT;
    
   --Inputs
	signal clk : std_logic := '0';
   signal i0 : std_logic := '0';
   signal i1 : std_logic := '0';
   signal cin : std_logic := '0';

 	--Outputs
   signal s : std_logic;
   signal cout : std_logic;
 
   constant clk_period : time := 10 ns;
 
BEGIN
   uut: somador1bit PORT MAP (
          i0 => i0,
          i1 => i1,
          cin => cin,
          s => s,
          cout => cout
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;

   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
      wait for clk_period*10;

		i0 <= '0';
		i1 <= '0';
		cin <= '0';
		wait for 50 ns;
		
		i0 <= '0';
		i1 <= '0';
		cin <= '1';
		wait for 50 ns;
		
		i0 <= '0';
		i1 <= '1';
		cin <= '0';
		wait for 50 ns;
		
		i0 <= '0';
		i1 <= '1';
		cin <= '1';
		wait for 50 ns;
		
		i0 <= '1';
		i1 <= '0';
		cin <= '0';
		wait for 50 ns;
		
		i0 <= '1';
		i1 <= '0';
		cin <= '1';
		wait for 50 ns;
		
		i0 <= '1';
		i1 <= '1';
		cin <= '0';
		wait for 50 ns;
		
		i0 <= '1';
		i1 <= '1';
		cin <= '1';
		wait for 50 ns;

      wait;
   end process;

END;
