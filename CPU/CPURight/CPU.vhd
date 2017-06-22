library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity CPU is
    Port ( reset, clk : in  STD_LOGIC;
			  input : in std_logic_vector(7 downto 0);
			  PCOut, ACOut, portOut : out std_logic_vector(7 downto 0);
			  instruction, portIn : in std_logic_vector(7 downto 0));
end CPU;

architecture Behavioral of CPU is

signal PC_reg, AC_reg, IR_reg, A0_reg, datain_bus, dataout_bus, addr_bus : 
        std_logic_vector(7 downto 0) := (others => '0');
		  
signal instAux : std_logic_vector(7 downto 0) := (others => '0');
signal instOld : std_logic_vector(7 downto 0) := (others => '0');
		  
signal writeEn, isUpdate : std_logic := '0';

begin

PCOut <= PC_reg;
ACOut <= AC_reg;

	RAM : entity work.SingleRAM_syn(ram_arch) PORT MAP(
		clk => clk,
		we => writeEn,
		addr => addr_bus,
		din => datain_bus,
		dout => dataout_bus
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
					   writeEn <= '0';
						IR_reg <= input; 
						PC_reg <= std_logic_vector(unsigned(PC_reg) + 1);
						instAux <= "11111111";
					
					when "00000001" => -- add
						writeEn <= '0';
						addr_bus <= input;
						AC_reg <= std_logic_vector(unsigned(dataout_bus) + unsigned(AC_reg));
						PC_reg <= std_logic_vector(unsigned(PC_reg) + 1);
						instAux <= "11111111";
						
						
					when "00000010" => -- load
						writeEn <= '0';
						addr_bus <= input;
						AC_reg <= dataout_bus;
						PC_reg <= std_logic_vector(unsigned(PC_reg) + 1);
						instAux <= "11111111";
						
						
					when "00000011" => -- bra
						writeEn <= '0';
						PC_reg <= input;
						instAux <= "11111111";
					
					when "00000100" => -- store
						addr_bus <= input;
						writeEn <= '1';
						datain_bus <= AC_reg;
						PC_reg <= std_logic_vector(unsigned(PC_reg) + 1);
						instAux <= "11111111";
						
					when "00000101" => -- brz
					-- perguntar ao smith
					-- perguntar tb se estamos usando a memoria da forma certa
					-- como iniciar
					-- quais modulos juntar
					
					when "00000110" => -- move+
						writeEn <= '0';
						addr_bus <= A0_reg;
						AC_reg <= dataout_bus;
						A0_reg <= std_logic_vector(unsigned(A0_reg) + 1);
						PC_reg <= std_logic_vector(unsigned(PC_reg) + 1);
						instAux <= "11111111";
						
					when "00000111" => -- store+
						writeEn <= '1';
						addr_bus <= A0_reg;
						datain_bus <= AC_reg;
						A0_reg <= std_logic_vector(unsigned(A0_reg) + 1);
						PC_reg <= std_logic_vector(unsigned(PC_reg) + 1);
						instAux <= "11111111";
						
					when "00001000" => -- out
						writeEn <= '0';
						portOut <= AC_reg;
						PC_reg <= std_logic_vector(unsigned(PC_reg) + 1);
						instAux <= "11111111";
						
					when "00001001" => -- in
						writeEn <= '0';
						AC_reg <= portIn;
						PC_reg <= std_logic_vector(unsigned(PC_reg) + 1);
						instAux <= "11111111";
						
					when "00001010" => -- leaA0
						writeEn <= '0';
						A0_reg <= input;
						PC_reg <= std_logic_vector(unsigned(PC_reg) + 1);
						instAux <= "11111111";						
					
					when "11111111" =>
						writeEn <= '0';
					
					when others =>  
			  end case;
		  
			end if;
    end process;
end Behavioral;
