
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity main_lab_2 is
    Port ( 
           reset : in  STD_LOGIC;
			  clk : in STD_LOGIC;
			  c : out STD_LOGIC;
			  col : out  STD_LOGIC_VECTOR (3 downto 0);
			  row : in  STD_LOGIC_VECTOR (3 downto 0);
			  display7 : out  STD_LOGIC_VECTOR (6 downto 0)
			 );
end main_lab_2;

architecture Behavioral of main_lab_2 is
	COMPONENT db_fsm
   PORT( button	:	IN	STD_LOGIC; 
          result	:	OUT	STD_LOGIC; 
          clk	:	IN	STD_LOGIC);
   END COMPONENT;
	
	signal key : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
	signal new_key : STD_LOGIC := '0';
	signal key_new : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
	signal key_old : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
	signal newkeyD: STD_LOGIC := '0';
	signal newkeyDAux: STD_LOGIC := '0'; 
	signal resetD: STD_LOGIC := '0';
begin


Inst_Decoder_key4x4: entity work.Decoder_key4x4(Behavioral) PORT MAP(
		Row => row,
		clk => clk,
		new_in => newkeyDAux,
		DecodeOut => key,
		Col => col
	);
	
	
		Inst_Modulo_display:  entity work.Modulo_display(Behavioral) PORT MAP(
		clk => clk,
		reset => resetD,
		hex1 => key_new,
		hex2 => key_old,
		hex_out => display7,
		c => c
	);


	Inst_Debounce:  entity work.Debounce(Behavioral) generic map(
		N => 24, M => 15000000
    )
	 PORT MAP(
		clk => clk,
		sinal_in => newkeyDAux,
		sinal_db => newkeyD
	);


   UUT: db_fsm  PORT MAP(
		button => reset, 
		result => resetD, 
		clk => clk
   );
	
	Inst_control_lab2: entity work.control_lab2(Behavioral) PORT MAP(
		reset => resetD,
		key => key,
		new_key => newkeyD,
		key_new => key_new,
		key_old => key_old
	);

end Behavioral;



