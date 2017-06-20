library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity Control is
	Port (reset, clk, clkPlaca : in  STD_LOGIC;
			c : out  STD_LOGIC;
		   ac_out : out std_logic_vector(6 downto 0);
			pc_out : out std_logic_vector(7 downto 0));
end Control;

architecture Behavioral of Control is

COMPONENT db_fsm
   PORT( button	:	IN	STD_LOGIC; 
          result	:	OUT	STD_LOGIC; 
          clk	:	IN	STD_LOGIC);
   END COMPONENT;

signal data : std_logic_vector(7 downto 0) := (others => '0');  
signal addr : std_logic_vector(7 downto 0) := (others => '0');
signal input : std_logic_vector(7 downto 0) := (others => '0');
signal instruction : std_logic_vector(7 downto 0) := (others => '0');	
signal flag, clkDebounce : std_logic := '0';	
signal PCOut : std_logic_vector(7 downto 0) := (others => '0');
signal ACOut : std_logic_vector(7 downto 0) := (others => '0'); 
signal portIn : std_logic_vector(7 downto 0) := (others => '0'); 
signal portOut : std_logic_vector(7 downto 0) := (others => '0'); 
signal instructionAux : std_logic_vector(7 downto 0) := (others => '0');

begin

pc_out <= PCOut;

   UUT: db_fsm PORT MAP(
		button => clk, 
		result => clkDebounce, 
		clk => clkPlaca
   );

CPU : entity work.CPU(Behavioral) PORT MAP(
		reset => reset,
		clk => clkPlaca,
		input => input,
		PCOut => PCOut,
		ACOut => ACOut,
		portIn => portIn,
		portOut => portOut,
		instruction => instruction
	);

PROGRAM : entity work.Rom_asyn(arch_rom) PORT MAP( 
		addr => addr,
		data => data
	);

DISPLAY : entity work.Modulo_display(behavioral) PORT MAP(
		clk => clkPlaca,
		reset => reset,
		hex2 => ACOut(3 downto 0),
		hex1 =>  ACOut(7 downto 4),
		hex_out => ac_out,
		c => c
	);
	
process(reset, clkDebounce)
	 begin
			if(reset = '1') then
				addr <= (others => '0');
			elsif(clkDebounce' event and clkDebounce='1') then -- rising_edge(clkDebounce)
				if(flag='0') then
					instructionAux <= data;
					addr <= std_logic_vector(unsigned(addr) + 1);
					flag <= '1';
				elsif(flag='1') then
					input <= data;
					instruction <= instructionAux;
					addr <= std_logic_vector(unsigned(addr) + 1);
					flag <= '0';
				end if;	
				
				if(addr="1111") then
					addr <= (others => '0');
				end if;
				
			end if;		
end process;
end Behavioral;

