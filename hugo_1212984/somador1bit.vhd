library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity somador1bit is
    Port ( i0 : in  STD_LOGIC;
           i1 : in  STD_LOGIC;
           cin : in  STD_LOGIC;
           s : out  STD_LOGIC;
           cout : out  STD_LOGIC);
end somador1bit;

architecture Behavioral of somador1bit is

begin

process(i0, i1, cin)
begin

	if (i0='0' and i1='0' and cin='0') then
		cout <= '0';
		s <= '0';
	elsif (i0='0' and i1='0' and cin='1') then
		cout <= '0';
		s <= '1';
	elsif (i0='0' and i1='1' and cin='0') then
		cout <= '0';
		s <= '1';
	elsif (i0='0' and i1='1' and cin='1') then
		cout <= '1';
		s <= '0';
	elsif (i0='1' and i1='0' and cin='0') then
		cout <= '0';
		s <= '1';
	elsif (i0='1' and i1='0' and cin='1') then
		cout <= '1';
		s <= '0';
	elsif (i0='1' and i1='1' and cin='0') then
		cout <= '1';
		s <= '0';
	elsif (i0='1' and i1='1' and cin='1') then
		cout <= '1';
		s <= '1';
	end if;
	
end process;

end Behavioral;

