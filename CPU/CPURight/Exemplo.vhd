library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.commands_lcd4bits.all;

entity exemplo is
port( clk : in std_logic;
		send_d : in std_logic;
		reset : in std_logic;
		rs : out std_logic;
		rw : out std_logic;
		ena : out std_logic;
		data_lcd : out std_logic_vector(3 downto 0);			
	   input : in std_logic_vector(7 downto 0)
		);
		
end exemplo;

architecture behavioral of exemplo is
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
	
	signal aux : std_logic_vector(7 downto 0) := (others => '0');
	signal counterRow : integer := 1;
	signal counterCol : integer := 0;
	signal newChar : std_logic;

	
	type ram is array (0 to 60) of std_logic_vector(11 downto 0);
	signal inst : ram;

begin

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
inst(5) <= clear_lcd('1') when reset = '1' else char_ascii(aux);
inst(6) <= loop_end(1);

inst(7) <= codigo_end(1);

process(send_d, reset,dir)
begin

if (reset = '1') then
	counterCol <= 0;
	counterRow <= 1;	
elsif (send_d' event and send_d = '1') then
	counterCol <= counterCol + 1;
	if (counterCol = 16) then
		counterRow <= 2;
		counterCol <= 1;
	end if;	
	
	newChar <= '1';
end if;

if (dir = 6 and newChar = '1') then
	aux <= input;
	newChar <= '0';
end if;

end process;

end behavioral;

