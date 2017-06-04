library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Rom_asyn is
    port(
        addr : in std_logic_vector(3 downto 0);
        data : out std_logic_vector(6 downto 0)
    );
end Rom_asyn;

architecture arch_rom of Rom_asyn is
    constant ADDR_WIDTH : integer := 4;
    constant DATA_WIDTH : integer := 7;
    type rom_type is array(0 to 2**ADDR_WIDTH - 1)
         of std_logic_vector(DATA_WIDTH - 1 downto 0);
     -- ROM definition
     constant DATA_ROM : rom_type := (
        "0000000", -- addr 0000
        "0000000", -- addr 0001
        "0000000", -- addr 0010
        "0000000", -- addr 0011
        "0000000", -- addr 0100
        "0000000", -- addr 0101
        "0000000", -- addr 0110
        "0000000", -- addr 0111
        "0000000", -- addr 1000
        "0000000", -- addr 1001
        "0000000", -- addr 1010
        "0000000", -- addr 1011
        "0000000", -- addr 1100
        "0000000", -- addr 1101
        "0000000", -- addr 1110
        "0000000" -- addr 1111
    );

begin
    data <= DATA_ROM(to_integer(unsigned(addr)));
end arch_rom;
