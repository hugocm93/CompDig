library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.COMMANDS_LCD4BITS.ALL;

entity Exemplo is
PORT( CLK : IN STD_LOGIC;
		SEND_D : IN STD_LOGIC;
		q : out  STD_LOGIC;
		RS : OUT STD_LOGIC;
		RW : OUT STD_LOGIC;
		ENA : OUT STD_LOGIC;
		DATA_LCD : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
					
	  --INPUT : STD_LOGIC_VECTOR(7 DOWNTO 0);
		);
		
end Exemplo;

architecture Behavioral of Exemplo is
COMPONENT PROCESADOR_LCD4BITS
	PORT(
		CLK : IN std_logic;
		VECTOR_MEM : IN std_logic_vector(11 downto 0);
		C1A : IN std_logic_vector(39 downto 0);
		C2A : IN std_logic_vector(39 downto 0);
		C3A : IN std_logic_vector(39 downto 0);
		C4A : IN std_logic_vector(39 downto 0);
		C5A : IN std_logic_vector(39 downto 0);
		C6A : IN std_logic_vector(39 downto 0);
		C7A : IN std_logic_vector(39 downto 0);
		C8A : IN std_logic_vector(39 downto 0);          
		RS : OUT std_logic;
		RW : OUT std_logic;
		ENA : OUT std_logic;
		INC_DIR : OUT INTEGER RANGE 0 TO 1024;
		BD_LCD : OUT std_logic_vector(7 downto 0);
		DATA : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
	
	SIGNAL VECTOR_MEM_S : STD_LOGIC_VECTOR(11 DOWNTO 0);
	SIGNAL DIR : INTEGER RANGE 0 TO 1024 := 0;

	
	TYPE RAM IS ARRAY (0 to 60) OF STD_LOGIC_VECTOR(11 DOWNTO 0);
	SIGNAL INST : RAM;

begin

Inst_PROCESADOR_LCD4BITS: PROCESADOR_LCD4BITS PORT MAP(
		CLK => CLK,
		RS => RS,
		RW => RW,
		ENA => ENA,
		VECTOR_MEM => VECTOR_MEM_S,
		INC_DIR => DIR,
		C1A => (others => '0'),
		C2A => (others => '0'),
		C3A => (others => '0'),
		C4A => (others => '0'),
		C5A => (others => '0'),
		C6A => (others => '0'),
		C7A => (others => '0'),
		C8A => (others => '0'),
		BD_LCD => open,
		DATA => DATA_LCD 
	);
	
VECTOR_MEM_S <= INST(DIR);
-- Comandos

INST(0) <= LCD_INI("10");
INST(1) <= POS(1,1);
INST(2) <= LOOP_INI(1);
--INST(3) <= q = CLEAR_LCD('1') when SEND_D = '1' else CHAR_ASCII(q);
INST(4) <= POS(1,2);
INST(5) <= LOOP_END(1);

INST(6) <= CODIGO_END(1);


	process(SEND_D)
	begin
			if(SEND_D = '1') then
				CLEAR_LCD('1');
			elsif 
				CLEAR_LCD('0');
			end if;
		end process;

end Behavioral;

