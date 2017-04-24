library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity maqEstados is
    Port ( clk, reset : in STD_LOGIC;
			  W : in  STD_LOGIC;
           Z : out  STD_LOGIC);
end maqEstados;

architecture Behavioral of maqEstados is
	type STATE_TYPE is (A, B, C);
	signal estado: STATE_TYPE := A;
begin
	process(clk, reset)
	begin
		if reset = '1' then
			estado <= A;
		elsif clk'event and clk = '1' then
		-- Máquina de estados
			case estado is
			when A =>
				Z <= '0';
				if W = '1' then
					estado <= B;
				end if;
			when B =>
				Z <= '0';
				if W = '0' then
					estado <= A;
				else
					estado <= C;
				end if;
			when C =>
				Z <= '1';
				if W = '0' then
					estado <= A;
				end if;
			end case;
		end if;
	end process;
end Behavioral;
