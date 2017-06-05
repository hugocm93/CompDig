library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity CPU is
    Port ( reset, clk : in  STD_LOGIC;
			  input : in std_logic_vector(7 downto 0);
			  instruction : in std_logic_vector(7 downto 0));
end CPU;

architecture Behavioral of CPU is

signal PC_reg, AC_reg, IR_reg, rom_data, rom_addr: 
        std_logic_vector(7 downto 0) := (others => '0');
		  
signal writeEn : std_logic := '0';

begin

--    RAM : entity work.SingleRAM_syn(ram_arch)
--        GENERIC MAP(
--            ADDR_WIDTH => 8,
--            DATA_WIDTH => 8)
--        PORT MAP(
--            clk => clk,
--            we => writeEn,  
--            addr => input,
--            din => AC_reg,
--            dout => AC_reg);

ROM : entity work.Rom_asyn(arch_rom) PORT MAP( -- RAM da CPU
		addr => rom_addr,
		data => rom_data
	);

    process(reset, clk) 
	 begin
			if(reset = '1') then
				AC_reg <= "00000000";
				PC_reg <= "00000000";
				IR_reg <= "00000000";
			elsif(clk' event and clk='1') then -- rising_edge(clk)
			end if;

        case instruction is
            when "00000000" => -- fetch
					IR_reg <= input; 
					PC_reg <= std_logic_vector(unsigned(PC_reg) + 1);
				
				when "00000001" => -- add
					rom_addr <= input;
					AC_reg <= std_logic_vector(unsigned(rom_data) + unsigned(AC_reg));
					PC_reg <= std_logic_vector(unsigned(PC_reg) + 1);
					
				when "00000010" => -- load
					rom_addr <= input;
					AC_reg <= std_logic_vector(unsigned(rom_data));
					PC_reg <= std_logic_vector(unsigned(PC_reg) + 1);
					
				when "00000011" => -- bra
					PC_reg <= input;
				
				when others =>  
        end case;
    end process;
end Behavioral;