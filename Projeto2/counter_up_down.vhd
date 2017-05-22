library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity counter_up_down is
	 generic(N: integer:=8);
    Port ( clk, reset, up : in  STD_LOGIC;
           max_tick : out  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR (N-1 downto 0));
end counter_up_down;

architecture arch of counter_up_down is
	signal r_reg: unsigned(N-1 downto 0);

begin

	process(clk, reset)
	begin
		if(reset='1') then
			r_reg <= (others => '0');
		elsif( clk' event and clk='1') then
			if(up = '1') then
				r_reg <= r_reg + 1;
			else
				r_reg <= r_reg - 1;
			end if;
		end if;
	end process;

	q <= std_logic_vector(r_reg);
	max_tick <= '1' when r_reg=(2**N-1) else '0';
end arch;

