
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity CPU is
    Port ( RESET : in  STD_LOGIC;
           LoadPC : in  STD_LOGIC;
           EnMEM : in  STD_LOGIC;
           clkAC : in  STD_LOGIC;
           EnPC : in  STD_LOGIC;
           clkIR : in  STD_LOGIC;
           IncPC : in  STD_LOGIC;
           EnMBR : in  STD_LOGIC;
           clkMBR : in  STD_LOGIC;
           EnALU : in  STD_LOGIC;
           RESETAC : in  STD_LOGIC);
end CPU;

architecture Behavioral of CPU is


begin


end Behavioral;

