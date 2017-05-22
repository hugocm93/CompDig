library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity Debounce is
	 generic(
	 N: integer :=24;--# bits
	 M: integer :=15000000 -- mod-M
	 );
    Port ( clk : in  STD_LOGIC;
           sinal_in : in  STD_LOGIC;
           sinal_db : out  STD_LOGIC);
end Debounce;
architecture Behavioral of Debounce is
signal tick:std_logic;
signal init_val:std_logic:='0';
begin
	counter: entity work.mod_m_counter(arch)
	GENERIC MAP(
	 N =>N,M =>M)	      	 
	PORT MAP(
	   clk => clk,
		reset => not init_val,
		max_tick => tick
	);	
process(sinal_in,tick)
begin
	if tick='1' then
		init_val <='0';
	elsif (sinal_in'event and sinal_in='1') then
			init_val <='1';
	end if;
end process;
sinal_db <=init_val;
end Behavioral;
