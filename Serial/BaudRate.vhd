library ieee;
use ieee.std_logic_1164.all;

entity BaudRate is
    generic(BaudDivisor : integer := 2604);
    port(clk : in  std_logic;
         reset : in  std_logic;
         baud : out  std_logic);
end BaudRate;

architecture arch_br of BaudRate is
    signal clkOut : std_logic := '0';
begin

process(clk, reset)
variable contagem : integer range 0 to BaudDivisor := 0; --Var usada para fazer a divisao do clk para 9600 bits/s no momento da transmissao

begin
    if(reset = '1') then -- funcao para quando o botao de reset for pressionado
        contagem := 0;
    elsif(clk'event and clk = '1') then -- funcao principal 
        contagem := contagem + 1;
        if(contagem = BaudRate) then
            contagem := 0;
            clkOut <= not clkOut;
        end if;
    end if;
end process;

baud <= clkOut;

end arch_br;

