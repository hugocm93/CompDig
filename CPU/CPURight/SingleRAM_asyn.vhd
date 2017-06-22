library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity SingleRAM_asyn is
    generic(
        ADDR_WIDTH: integer := 12;
        DATA_WIDTH: integer := 9
    );
    port(
        clk, we : in std_logic;
        addr : in std_logic_vector(ADDR_WIDTH - 1 downto 0);
        din : in std_logic_vector(DATA_WIDTH - 1 downto 0);
        dout : out std_logic_vector(DATA_WIDTH - 1 downto 0)
    );
end SingleRAM_asyn;

architecture ram_arch of SingleRAM_asyn is
    type ram_type is array (2**ADDR_WIDTH - 1 downto 0)
         of std_logic_vector (DATA_WIDTH - 1 downto 0);
    signal ram : ram_type;
begin
    process(clk)
    begin
        if(clk'event and clk = '1') then
            if(we = '1') then
                ram(to_integer(unsigned(addr))) <= din;
            end if;
        end if;
    end process;
    dout <= ram(to_integer(unsigned(addr)));
end ram_arch;


