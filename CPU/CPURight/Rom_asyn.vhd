library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Rom_asyn is
    port(
        addr : in std_logic_vector(7 downto 0);
        data : out std_logic_vector(7 downto 0)
    );
end Rom_asyn;

architecture arch_rom of Rom_asyn is
    constant ADDR_WIDTH : integer := 4;
    constant DATA_WIDTH : integer := 8;
    type rom_type is array(0 to 2**ADDR_WIDTH - 1)
         of std_logic_vector(DATA_WIDTH - 1 downto 0);
     -- ROM definition
     constant DATA_ROM : rom_type := (
        "00000011", -- addr 0000
        "00000100", -- addr 0001
        "00001000", -- addr 0010
        "00000000", -- addr 0011
        "00000000", -- addr 0100
        "00000000", -- addr 0101
        "00000000", -- addr 0110
        "00000000", -- addr 0111
        "00000000", -- addr 1000
        "00000000", -- addr 1001
        "00000000", -- addr 1010
        "00000000", -- addr 1011
        "00000000", -- addr 1100
        "00000000", -- addr 1101
        "00000000", -- addr 1110
        "00000000"  -- addr 1111
    );

begin
    data <= DATA_ROM(to_integer(unsigned(addr)));
end arch_rom;
