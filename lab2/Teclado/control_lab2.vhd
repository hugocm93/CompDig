
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity control_lab2 is
    Port ( 
          reset : in  STD_LOGIC;
			 key : in STD_LOGIC_VECTOR (3 downto 0);
			 new_key : in STD_LOGIC;
			 key_new : out STD_LOGIC_VECTOR (3 downto 0);
			 key_old : out STD_LOGIC_VECTOR (3 downto 0)
			 );
end control_lab2;

architecture Behavioral of control_lab2 is
	signal temp : STD_LOGIC_VECTOR (3 downto 0) := (others => '0') ;
begin

	process(new_key,reset)
	begin
	if reset ='1' then
		key_old <= (others => '0');
		key_new <= (others => '0');		
	elsif(new_key' event and new_key = '1') then
		key_old <= temp;
		temp <= key;
		key_new <= key;
	end if; 
	
	end process;

end Behavioral;

