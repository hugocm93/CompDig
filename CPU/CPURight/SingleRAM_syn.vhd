library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity SingleRAM_syn is
    generic(
        ADDR_WIDTH: integer := 8;
        DATA_WIDTH: integer := 8
    );
    port(
        clk, we : in std_logic;
        addr : in std_logic_vector(ADDR_WIDTH - 1 downto 0);
        din : in std_logic_vector(DATA_WIDTH - 1 downto 0);
        dout : out std_logic_vector(DATA_WIDTH - 1 downto 0)
    );
end SingleRAM_syn;

architecture ram_arch of SingleRAM_syn is
    type ram_type is array (2**ADDR_WIDTH - 1 downto 0)
         of std_logic_vector (DATA_WIDTH - 1 downto 0);
    signal ram : ram_type;
    signal addr_reg : std_logic_vector(ADDR_WIDTH - 1 downto 0);
begin
    process(clk)
    begin
        if(clk'event and clk = '1') then 
            if(we = '1') then
                ram(to_integer(unsigned(addr))) <= din;
            end if;
            addr_reg <= addr;
        end if;
    end process;
    dout <= ram(to_integer(unsigned(addr_reg)));
end ram_arch;


