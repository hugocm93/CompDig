
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity d_ff_reset is
    Port ( clk, reset, d : in  STD_LOGIC;
           q : out  STD_LOGIC);
end d_ff_reset;

architecture arch of d_ff_reset is

begin
	process(clk, reset)
	begin
			if(reset = '1') then
				q <= '0';
			elsif(clk' event and clk='1') then -- rising_edge(clk)
				q <= d;
			end if;
		end process;
end arch;

