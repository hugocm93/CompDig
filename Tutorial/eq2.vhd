library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity eq2 is
    Port ( a : in  STD_LOGIC_VECTOR (1 downto 0);
           b : in  STD_LOGIC_VECTOR (1 downto 0);
           aeqb : out  STD_LOGIC);
end eq2;

architecture sop_arch of eq2 is
	signal e0, e1: STD_LOGIC;
begin

	eq_bit0_unit : entity work.eq1(sop_arch)
	port map(i0=>a(0),i1=>b(0),eq=>e0);
	
	eq_bit1_unit : entity work.eq1(sop_arch)
	port map(i0=>a(1),i1=>b(1),eq=>e1);

	aeqb <= e0 and e1;
end sop_arch;

