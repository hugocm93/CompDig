library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity display_7_seg is
    port ( clk : in  std_logic;
           c : out  std_logic;
           hex1 : in  std_logic_vector (3 downto 0);
           hex2 : in  std_logic_vector (3 downto 0);
           hex7seg : out  std_logic_vector (6 downto 0));
end display_7_seg;

architecture arch of display_7_seg is 

	constant ds0 : std_logic_vector (6 downto 0) :="0111111";
	constant ds1 : std_logic_vector (6 downto 0) :="0000110";
	constant ds2 : std_logic_vector (6 downto 0) :="1011011";
	constant ds3 : std_logic_vector (6 downto 0) :="1001111";
	constant ds4 : std_logic_vector (6 downto 0) :="1100110";
	constant ds5 : std_logic_vector (6 downto 0) :="1101101";
	constant ds6 : std_logic_vector (6 downto 0) :="1111101";
	constant ds7 : std_logic_vector (6 downto 0) :="0000111";
	constant ds8 : std_logic_vector (6 downto 0) :="1111111";
	constant ds9 : std_logic_vector (6 downto 0) :="1100111";
	constant dsa : std_logic_vector (6 downto 0) :="1110111";
	constant dsb : std_logic_vector (6 downto 0) :="1111100";
	constant dsc : std_logic_vector (6 downto 0) :="0111001";
	constant dsd : std_logic_vector (6 downto 0) :="1011110";
	constant dse : std_logic_vector (6 downto 0) :="1111001";
	constant dsf : std_logic_vector (6 downto 0) :="1110001";
	constant dsn : std_logic_vector (6 downto 0) :="0000000";
	signal seg_h : std_logic_vector (6 downto 0) :=(others=> '0');
	signal seg_l : std_logic_vector (6 downto 0) :=(others=> '0');
	signal hex1int : integer range 15 downto 0;
	signal hex2int : integer range 15 downto 0;
	
begin


table_f:	block
		begin
		hex7seg <= seg_h when clk = '1' else
					seg_l when clk = '0';
							
			c <= clk;
			
		end block table_f;
table_h: block
	 begin
		hex1int <= to_integer(unsigned(hex1));
		seg_h <= ds0 when hex1int = 0 else
	ds1 when hex1int = 1 else	
	ds2 when hex1int = 2 else	
	ds3 when hex1int = 3 else	
	ds4 when hex1int = 4 else	
	ds5 when hex1int = 5 else	
	ds6 when hex1int = 6 else	
	ds7 when hex1int = 7 else	
	ds8 when hex1int = 8 else	
	ds9 when hex1int = 9 else	
	dsa when hex1int = 10 else	
	dsb when hex1int = 11 else	
	dsc when hex1int = 12 else	
	dsd when hex1int = 13 else	
	dse when hex1int = 14 else	
	dsf when hex1int = 15 and hex1 = "1111" else
	dsn;
	end block table_h;

table_l: block
	 begin
		hex2int <= to_integer(unsigned(hex2));
		seg_l <= ds0 when hex2int = 0 else
	ds1 when hex2int = 1 else	
	ds2 when hex2int = 2 else	
	ds3 when hex2int = 3 else	
	ds4 when hex2int = 4 else	
	ds5 when hex2int = 5 else	
	ds6 when hex2int = 6 else	
	ds7 when hex2int = 7 else	
	ds8 when hex2int = 8 else	
	ds9 when hex2int = 9 else	
	dsa when hex2int = 10 else	
	dsb when hex2int = 11 else	
	dsc when hex2int = 12 else	
	dsd when hex2int = 13 else	
	dse when hex2int = 14 else	
	dsf when hex2int = 15 and hex2 = "1111" else
	dsn;
	end block table_l;


end arch;

