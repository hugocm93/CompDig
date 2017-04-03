library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Modulo_display is
	port(   clk, reset : in std_logic;
		hex1: in std_logic_vector (3 downto 0);
		hex_out: out std_logic_vector (6 downto 0);
		c: out std_logic);
end Modulo_display;

architecture behavioral of Modulo_display is
	signal clk_aux: std_logic := '0';
	signal tick: std_logic := '0';
	signal hex2: std_logic_vector (3 downto 0);
begin

hex2 <= not  hex1;

fd : entity work.d_ff_reset(arch)
	port map(
		clk => tick,
		reset => reset,
		d => not clk_aux,
		q => clk_aux
		);

counter : entity work.mod_m_counter(arch)
	generic map(
		N => 19, M => 500000)
	port map(
	clk => clk,
	reset => reset,
	max_tick => tick
	);

dis : entity work.display_7_seg(arch)
	port map(
	clk => clk_aux,
	c => c,
	hex1 => hex1,
	hex2 => hex2,
	hex7seg => hex_out
	);
	
	
end behavioral;
