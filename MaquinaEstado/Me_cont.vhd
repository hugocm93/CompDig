library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ME_cont is
	Port( clk, reset : in STD_logic;
			Control : in STD_LOGIC_VECTOR(1 downto 0);
			SaidaLeds : out STD_LOGIC_VECTOR(3 downto 0);
			Display7 : out STD_LOGIC_VECTOR(6 downto 0);
			c : out STD_LOGIC);
end ME_cont;

architecture Behavioral of Me_cont is
	COMPONENT Modulo_display
	Port( clk, reset : in STD_logic;
			hex1, hex2 : out STD_LOGIC_VECTOR(3 downto 0);
			hex_out : out STD_LOGIC_VECTOR(6 downto 0);
			c : out STD_LOGIC);
			
	END COMPONENT;
				
type STATE_TYPE is (E0, E1, E2, E3);
signal estado: STATE_TYPE := E0;
signal hex_aux: STD_LOGIC_VECTOR( 3 downto 0):="0000";
signal q: STD_LOGIC_VECTOR( 3 downto 0);
signal up: STD_LOGIC :='0';
signal tick: STD_LOGIC :='0';				
signal clk_aux: STD_LOGIC :='0';		
begin
timer: entity work.mod_m_counter(arch)
			GENERIC MAP(
			N =>26, M => 50000000)
			PORT MAP(
				clk => clk,
				reset => reset,
				max_tick => tick
				);
			Display: Modulo_display PORT MAP(
				clk => clk,
				hex1 => "1110",
				hex2 => hex_aux,
				c => c,
				hex_out => Display7,
				Reset => reset
				);
				
