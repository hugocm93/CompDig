
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity vhdl_c is
    Port ( a : in  STD_LOGIC_VECTOR (1 downto 0);
           en : in  STD_LOGIC;
           y : out  STD_LOGIC_VECTOR (3 downto 0));
end vhdl_c;

architecture cond_arch of vhdl_c is

begin

y <= "0000" when (en='0') else
	  "0001" when (a="00") else
	  "0010" when (a="01") else
	  "0100" when (a="10") else
	  "1000" ; -- a = "11"
  
end cond_arch;

architecture sel_arch of vhdl_c is
signal s: std_logic_vector(2 downto 0);
begin
s <= en & a; -- concatenates "en" and "a"

with s select
	y <= "0000" when "000" | "001" | "010" | "011",
		  "0001" when "100",
		  "0010" when "101",
		  "0100" when "110",
		  "1000" when others;  --a = '111'
		  
end sel_arch;

architecture if_arch of vhdl_c is
begin
	process(en, a)
	begin
	if(en='0') then
		y <= "0000";
	elsif(a="00") then
	y <= "0001";
	elsif(a="01") then
	y <= "0010";
	elsif(a="10") then
	y <= "0100";
	else
	y <= "1000";
	end if;
	end process;
end if_arch;

architecture case_arch of vhdl_c is
signal s: std_logic_vector(2 downto 0);
begin
	s <= en & a; -- concatenates "en" and "a"

	process(s)
	begin
		case s is
			when "000" | "001" | "010" | "011" =>
				y <= "0000";
			when "100" =>
				y <= "0001";
			when "101" =>
				y <= "0010";
			when "110" =>
				y <= "0100";
			when others =>
				y <= "1000";
		end case;
	end process;
end case_arch;

