library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Transmissor is
    Port ( b0 : in  STD_LOGIC;
           b1 : in  STD_LOGIC;
           b2 : in  STD_LOGIC;
           b3 : in  STD_LOGIC;
			  oldClk : in STD_LOGIC;
           reset : in  STD_LOGIC;
           send : in  STD_LOGIC;
           serial_out : out  STD_LOGIC);
end Transmissor;

architecture ArchTX of Transmissor is
signal pkg : std_logic_vector(9 downto 0) := (others=> '0');
signal pos : integer := 0;
signal clk : std_logic;
signal sendD : std_logic;
type TRANSMISSOR is (DISPONIVEL, TRANSMITINDO, ESPERA); --tipos de Estados
signal ESTADO : TRANSMISSOR := DISPONIVEL;

COMPONENT db_fsm
   PORT( button	:	IN	STD_LOGIC; 
          result	:	OUT	STD_LOGIC; 
          clk	:	IN	STD_LOGIC);
   END COMPONENT;
	
begin

Inst_BaudRate: entity work.BaudRate(arch_br)
	PORT MAP(
		clk => oldClk,
		reset => reset,
		baud => clk
	);
	
	UUT: db_fsm  PORT MAP(
		button => send, 
		result => sendD, 
		clk => oldClk
   );
	
process(clk, reset)
begin
	if(reset = '1') then
		ESTADO <= DISPONIVEL;
	elsif(clk'event and clk ='1') then
		case ESTADO is
		when DISPONIVEL => --CONCATENA COM DADO a ser enviado e start bit e stop bit
			if(sendD = '1') then
				ESTADO <= TRANSMITINDO;
				pkg(0) <= '0'; -- start bit
				pkg(1) <= b0;
				pkg(2) <= b1;
				pkg(3) <= b2;
				pkg(4) <= b3;
				pkg(5) <= '1';
				pkg(6) <= '1';
				pkg(7) <= '0';
				pkg(8) <= '0';
				pkg(9) <= '1'; -- stop bit
			
				pos <= 0;
			end if;
		when TRANSMITINDO =>
			if(pos <= 9) then
				serial_out <= pkg(pos);
				pos <= pos + 1;
			else
				ESTADO <= ESPERA;
			end if;
		when ESPERA => -- Quando em espera, aguarda ate o sinal de requisicao voltar a 0 para voltar a ficar disponivel
			if(sendD = '0') then
				ESTADO <= DISPONIVEL;
			end if;
		end case;
	end if;
end process;
end ArchTX;