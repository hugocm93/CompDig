library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.commands_lcd4bits.all;

entity LCD_AUX is
port( clk : in std_logic;
		reset : in std_logic;
		str_select : in std_logic_vector(2 downto 0);
		rs : out std_logic;
		rw : out std_logic;
		ena : out std_logic;
		data_lcd : out std_logic_vector(3 downto 0)		
		);
		
end LCD_AUX;

architecture behavioral of LCD_AUX is
   COMPONENT db_fsm
   PORT( button	:	IN	STD_LOGIC; 
          result	:	OUT	STD_LOGIC; 
          clk	:	IN	STD_LOGIC);
   END COMPONENT;
	
component procesador_lcd4bits
	port(
		clk : in std_logic;
		vector_mem : in std_logic_vector(11 downto 0);
		c1a : in std_logic_vector(39 downto 0);
		c2a : in std_logic_vector(39 downto 0);
		c3a : in std_logic_vector(39 downto 0);
		c4a : in std_logic_vector(39 downto 0);
		c5a : in std_logic_vector(39 downto 0);
		c6a : in std_logic_vector(39 downto 0);
		c7a : in std_logic_vector(39 downto 0);
		c8a : in std_logic_vector(39 downto 0);          
		rs : out std_logic;
		rw : out std_logic;
		ena : out std_logic;
		inc_dir : out integer range 0 to 1024;
		bd_lcd : out std_logic_vector(7 downto 0);
		data : out std_logic_vector(3 downto 0)
		);
	end component;
	
	signal vector_mem_s : std_logic_vector(11 downto 0);
	signal dir : integer range 0 to 1024 := 0;
	signal aux : std_logic_vector(7 downto 0);
	signal resetDebounce : std_logic;
	signal counterRow : integer := 1;
	signal counterCol : integer := 0;
	signal newChar : std_logic;
	
	--Usando
	signal positionCounter : integer := 0;
	signal stop : std_logic := '0';
	
	signal s1 : std_logic_vector(47 downto 0) := "010000110010000001101111011101010010000001000001"; -- "C ou A"
	signal s2 : std_logic_vector(39 downto 0) := "0111001101100101011011100110100001100001"; -- "senha"
	signal s3 : std_logic_vector(15 downto 0) := "0100111101001011"; -- "OK"
	signal s4 : std_logic_vector(23 downto 0) := "010100000101011101000100"; -- "PWD"
	signal s5 : std_logic_vector(31 downto 0) := "01000101011100100111001001101111"; -- "Erro"
	
	type ram is array (0 to 60) of std_logic_vector(11 downto 0);
	signal inst : ram;

begin
   reset_db: db_fsm PORT MAP(
		button => reset, 
		result => resetDebounce, 
		clk => clk 
   );
	
inst_procesador_lcd4bits: procesador_lcd4bits port map(
		clk => clk,
		rs => rs,
		rw => rw,
		ena => ena,
		vector_mem => vector_mem_s,
		inc_dir => dir,
		c1a => (others => '0'),
		c2a => (others => '0'),
		c3a => (others => '0'),
		c4a => (others => '0'),
		c5a => (others => '0'),
		c6a => (others => '0'),
		c7a => (others => '0'),
		c8a => (others => '0'),
		bd_lcd => open,
		data => data_lcd 
	);
	
vector_mem_s <= inst(dir);
-- comandos

inst(0) <= lcd_ini("00");
inst(1) <= pos(1,1);
inst(2) <= clear_lcd('1');

inst(3) <= loop_ini(1);
inst(4) <= pos(counterRow,counterCol);
inst(5) <= clear_lcd('1') when resetDebounce = '1' else char_ascii(aux);
inst(6) <= loop_end(1);

inst(7) <= codigo_end(1);

process(resetDebounce,dir)
begin

if (resetDebounce = '1') then
	counterCol <= 0;
	counterRow <= 1;	
	positionCounter <= 0;
	stop <= '0';
elsif (clk' event and clk = '1' and stop = '0') then --antes estava o send_d
	counterCol <= counterCol + 1;
	if (counterCol = 16) then
		counterRow <= 2;
		counterCol <= 1;
	end if;	
	
	newChar <= '1';
end if;

if (dir = 6 and newChar = '1') then
	if (str_select="000" and positionCounter < 6) then
		aux <= s1(47 - 8*positionCounter downto 40 - 8*positionCounter);
		if(positionCounter = 5) then
			stop <= '1';
		end if;
		
	elsif (str_select="001" and positionCounter < 5) then
		aux <= s2(39 - 8*positionCounter downto 32 - 8*positionCounter);
		if(positionCounter = 4) then
			stop <= '1';
		end if;
		
	elsif (str_select="010" and positionCounter < 2) then
		aux <= s3(15 - 8*positionCounter downto 8 - 8*positionCounter);
		if(positionCounter = 1) then
			stop <= '1';
		end if;
		
	elsif (str_select="011" and positionCounter < 3) then
		aux <= s4(23 - 8*positionCounter downto 16 - 8*positionCounter);
		if(positionCounter = 2) then
			stop <= '1';
		end if;
		
	elsif (str_select="100" and positionCounter < 4) then
		aux <= s5(31 - 8*positionCounter downto 24 - 8*positionCounter);
		if(positionCounter = 3) then
			stop <= '1';
		end if;
		
	end if;
	
	positionCounter <= positionCounter + 1;
	newChar <= '0';
end if;

end process;

end behavioral;

