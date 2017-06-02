library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Tri_State is
    Port ( I : in  STD_LOGIC_VECTOR (7 downto 0);
           O : out  STD_LOGIC_VECTOR (7 downto 0);
           OE : in  STD_LOGIC);
end Tri_State;

architecture Behavioral of Tri_State is

begin


end Behavioral;

