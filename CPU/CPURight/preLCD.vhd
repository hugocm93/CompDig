library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity preLCD is
port( clk : in std_logic;
		reset : in std_logic;
		str_select : in std_logic_vector(2 downto 0);
		rs : out std_logic;
		rw : out std_logic;
		ena : out std_logic;
		data_lcd : out std_logic_vector(3 downto 0)		
		);
		
end preLCD;

architecture behavioral of preLCD is
   COMPONENT db_fsm
   PORT( button	:	IN	STD_LOGIC; 
          result	:	OUT	STD_LOGIC; 
          clk	:	IN	STD_LOGIC);
   END COMPONENT;
	
	signal resetDebounce, clkFake : std_logic;
	signal positionCounter, clockCounter : integer := 0;
	signal stop : std_logic := '0';
	signal aux : std_logic_vector(7 downto 0) := x"00";
	
	signal s1 : std_logic_vector(47 downto 0) := "010000110010000001101111011101010010000001000001"; -- "C ou A"
	signal s2 : std_logic_vector(39 downto 0) := "0111001101100101011011100110100001100001"; -- "senha"
	signal s3 : std_logic_vector(15 downto 0) := "0100111101001011"; -- "OK"
	signal s4 : std_logic_vector(23 downto 0) := "010100000101011101000100"; -- "PWD"
	signal s5 : std_logic_vector(31 downto 0) := "01000101011100100111001001101111"; -- "Erro"
	
begin

reset_db: db_fsm PORT MAP(
		button => reset, 
		result => resetDebounce, 
		clk => clk 
   );
	
MOD_LCD : entity work.exemplo(behavioral) PORT MAP(
		clk => clk,
		send_d => clkFake,
		reset => reset,
		rs => rs,
		rw => rw,
		ena => ena,
		data_lcd => data_lcd,
		input => aux
	);


process(clk)
begin

if(clk' event and clk = '1') then
	clockCounter <= clockCounter + 1;
end if;

if(stop = '0' and clockCounter = 5000) then
	clkFake <= not clkFake;
	clockCounter <= 0;
end if;

end process;

process(clkFake, resetDebounce)
begin

if (resetDebounce = '1') then
	positionCounter <= 0;
	stop <= '0';
elsif(clkFake' event and clkFake = '0') then
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
end if;

end process;

end behavioral;

