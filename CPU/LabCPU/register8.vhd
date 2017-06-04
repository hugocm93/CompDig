library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

ENTITY register8 IS PORT(
    D   : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    MReset : IN STD_LOGIC; -- async. clear.
    CP : IN STD_LOGIC; -- clock.
    Q   : OUT STD_LOGIC_VECTOR(7 DOWNTO 0) -- output
);
END register8;

ARCHITECTURE Behavioral OF register8 IS

begin
    process(MReset, CP)
    begin
        if MReset = '1' then
            Q <= x"00";
        elsif rising_edge(CP) then
            Q <= D;
        end if;
    end process;
end Behavioral;
