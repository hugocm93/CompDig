library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tri_state_buffer is
    Port ( 
           IN8  : in  STD_LOGIC_VECTOR (7 downto 0);
           OE  : in  STD_LOGIC;
           OUT8 : out STD_LOGIC_VECTOR (7 downto 0));
end tri_state_buffer;

architecture Behavioral of tri_state_buffer is

begin

    OUT8 <= IN8 when (OE = '0') else "ZZZZZZZZ";

end Behavioral;