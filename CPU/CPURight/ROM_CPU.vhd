library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Rom_CPU is
    port(
        addr : in std_logic_vector(7 downto 0);
        data : out std_logic_vector(7 downto 0)
    );
end Rom_CPU;

architecture arch_rom of Rom_CPU is
    constant ADDR_WIDTH : integer := 4;
    constant DATA_WIDTH : integer := 8;
    type rom_type is array(0 to 2**ADDR_WIDTH - 1)
         of std_logic_vector(DATA_WIDTH - 1 downto 0);
     -- ROM definition
     constant DATA_ROM : rom_type := (
		  "00001111", 
		  "00001111", 
		  "00001011", 
		  "00001101", 
		  "00001111", 
		  "00001011", 
		  "00001111", 
		  "00001111",
		  "00000000", 
		  "00000000",
		  "00000000",
		  "00000000",
		  "00000000",
		  "00000000",
		  "00000000",
		  "00000000" 
    );

begin
    data <= DATA_ROM(to_integer(unsigned(addr)));
end arch_rom;
