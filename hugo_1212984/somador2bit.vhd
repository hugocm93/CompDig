library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity somador2bit is
    Port ( a0 : in  STD_LOGIC;
			  a1 : in  STD_LOGIC;
           b0 : in  STD_LOGIC;
			  b1 : in  STD_LOGIC;
           cin : in  STD_LOGIC;
           s0 : out  STD_LOGIC;
			  s1 : out  STD_LOGIC;
           cout : out  STD_LOGIC);
end somador2bit;

architecture Behavioral of somador2bit is
	signal tempCarry : STD_LOGIC;
begin

Inst1_somador1bit : entity work.somador1bit PORT MAP(
		i0 => a0,
		i1 => b0,
		cin => '0',
		s => s0,
		cout => tempCarry
	);
	
Inst2_somador1bit : entity work.somador1bit PORT MAP(
	i0 => a1,
	i1 => b1,
	cin => tempCarry,
	s => s1,
	cout => cout
);

end Behavioral;

