
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity MEM is
    Port ( Address : in  STD_LOGIC_VECTOR (7 downto 0);
           IO : inout  STD_LOGIC_VECTOR (7 downto 0);
           CS : in  STD_LOGIC;
           WE : in  STD_LOGIC);
end MEM;

architecture Behavioral of MEM is

begin


end Behavioral;

