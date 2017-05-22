library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity eq1 is
    Port ( i0 : in  STD_LOGIC;
           i1 : in  STD_LOGIC;
           eq : out  STD_LOGIC);
end eq1;

architecture sop_arch of eq1 is
	signal p0, p1: STD_LOGIC;
begin

eq <= p0 or p1;
p1 <= (not i0) and (not i1);
p0 <= i0 and i1;


end sop_arch;

