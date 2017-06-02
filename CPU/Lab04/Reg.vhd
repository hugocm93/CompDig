
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Reg is
    Port ( Q : in  STD_LOGIC_VECTOR (7 downto 0);
           D : out  STD_LOGIC_VECTOR (7 downto 0);
           MReset : in  STD_LOGIC;
           CP : in  STD_LOGIC);
end Reg;

architecture Behavioral of Reg is

begin


end Behavioral;

