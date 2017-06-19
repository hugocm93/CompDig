library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity CPU is
    Port ( reset, clk : in  STD_LOGIC;
			  input : in std_logic_vector(7 downto 0);
			  PCOut, ACOut : out std_logic_vector(7 downto 0);
			  instruction : in std_logic_vector(7 downto 0));
end CPU;

architecture Behavioral of CPU is

signal PC_reg, AC_reg, IR_reg, rom_data, rom_addr : 
        std_logic_vector(7 downto 0) := (others => '0');
		  
signal instAux : std_logic_vector(7 downto 0) := (others => '0');
signal instOld : std_logic_vector(7 downto 0) := (others => '0');
		  
signal writeEn, isUpdate : std_logic := '0';

begin

PCOut <= PC_reg;
ACOut <= AC_reg;

RAM : entity work.ROM_CPU(arch_rom) PORT MAP( 
		addr => rom_addr,
		data => rom_data
	);

isUpdate <= '1' when instruction = instOld else '0';

    process(reset, clk) 
	 begin
			if(reset = '1') then
				AC_reg <= "00000000";
				PC_reg <= "00000000";
				IR_reg <= "00000000";
			elsif(clk' event and clk='1') then -- rising_edge(clk)
				if(isUpdate = '0') then
					instOld <= instruction;
					instAux <= instruction;
			end if;
				
			  case instAux is
					when "00000000" => -- fetch
						IR_reg <= input; 
						PC_reg <= std_logic_vector(unsigned(PC_reg) + 1);
						instAux <= "11111111";
					
					when "00000001" => -- add
						rom_addr <= input;
						AC_reg <= std_logic_vector(unsigned(rom_data) + unsigned(AC_reg));
						PC_reg <= std_logic_vector(unsigned(PC_reg) + 1);
						instAux <= "11111111";
						
						
					when "00000010" => -- load
						rom_addr <= input;
						AC_reg <= std_logic_vector(unsigned(rom_data));
						PC_reg <= std_logic_vector(unsigned(PC_reg) + 1);
						instAux <= "11111111";
						
						
					when "00000011" => -- bra
						PC_reg <= input;
						instAux <= "11111111";
					
					when "11111111" =>
					
					when others =>  
			  end case;
		  
			end if;
    end process;
end Behavioral;
