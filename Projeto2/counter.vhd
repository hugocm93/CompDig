library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity counter is
	 generic(N: integer:=8);
    Port ( clk, reset : in  STD_LOGIC;
           max_tick : out  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR (N-1 downto 0));
end counter;

architecture arch of counter is
	signal r_reg: unsigned(N-1 downto 0);
	signal r_next: unsigned(N-1 downto 0);

begin

	process(clk, reset)
	begin
		if(reset='1') then
			r_reg <= (others => '0');
		elsif( clk' event and clk='1') then
			r_reg <= r_next;
		end if;
	end process;

	r_next <= r_reg +1;
	q <= std_logic_vector(r_reg);
	max_tick <= '1' when r_reg=(2**N-1) else '0';
end arch;

