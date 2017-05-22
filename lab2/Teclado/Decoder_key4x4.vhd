library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Decoder_key4x4 is
    Port ( 
            Row : in  STD_LOGIC_VECTOR (3 downto 0);
            clk : in  STD_LOGIC;
            new_in : out  STD_LOGIC;
            DecodeOut : out  STD_LOGIC_VECTOR (3 downto 0);
            Col : out  STD_LOGIC_VECTOR (3 downto 0)
         );
end Decoder_key4x4;

architecture Behavioral of Decoder_key4x4 is
	signal tick: std_logic := '0';
	signal tick1: std_logic := '0';
	signal init_val: std_logic := '0';
	signal aux_new_in: std_logic := '0';
	signal q: std_logic_vector (15 downto 0);
	type STATE_KEY is (C1, C2, C3, C4);
	signal key: STATE_KEY := C1;
begin

counter : entity work.mod_m_counter(arch)
	generic map(
		N => 16, M => 50000
    )
	port map(
        clk => clk,
        reset => '0',
        q => q,
        max_tick => tick
	);

	
process(clk, tick)
begin
	if(clk' event and clk = '1') then
		if(tick = '1') then
			aux_new_in <= '0';
			case key is
				when C1 =>
				Col <= "0111";
				when C2 =>
				Col <= "1011";
				when C3 =>
				Col <= "1101";
				when C4 =>
				Col <= "1110";
			end case;
		elsif(key = C1 and q = "0000000000001000") then
				--R1
				if(Row = "0111") then
					aux_new_in <= '1';
					DecodeOut <= "0001"; --1
				--R2
				elsif(Row = "1011") then
					aux_new_in <= '1';
					DecodeOut <= "0100"; --4
				--R3
				elsif(Row = "1101") then
					aux_new_in <= '1';
					DecodeOut <= "0111"; --7
				--R4
				elsif(Row = "1110") then
					aux_new_in <= '1';
					DecodeOut <= "0000"; --0
				end if;
				key <= C2;
		elsif(key = C2 and q = "0000000000001000") then
				--R1
				if(Row = "0111") then
					aux_new_in <= '1';
					DecodeOut <= "0010"; --2
				--R2
				elsif(Row = "1011") then
					aux_new_in <= '1';
					DecodeOut <= "0101"; --5
				--R3
				elsif(Row = "1101") then
					aux_new_in <= '1';
					DecodeOut <= "1000"; --8
				--R4
				elsif(Row = "1110") then
					aux_new_in <= '1';
					DecodeOut <= "1111"; --F
				end if;
				key <= C3;
		elsif(key = C3 and q = "0000000000001000") then
				--R1
				if(Row = "0111") then
					aux_new_in <= '1';
					DecodeOut <= "0011"; --3
				--R2
				elsif(Row = "1011") then
					aux_new_in <= '1';
					DecodeOut <= "0110"; --6
				--R3
				elsif(Row = "1101") then
					aux_new_in <= '1';
					DecodeOut <= "1001"; --9
				--R4
				elsif(Row = "1110") then
					aux_new_in <= '1';
					DecodeOut <= "1110"; --E
				end if;
				key <= C4;
		elsif(key = C4 and q = "0000000000001000") then
				--R1
				if(Row = "0111") then
					aux_new_in <= '1';
					DecodeOut <= "1010"; --A
				--R2
				elsif(Row = "1011") then
					aux_new_in <= '1';
					DecodeOut <= "1011"; --B
				--R3
				elsif(Row = "1101") then
					aux_new_in <= '1';
					DecodeOut <= "1100"; --C
				--R4
				elsif(Row = "1110") then
					aux_new_in <= '1';
					DecodeOut <= "1101"; --D
				end if;
				key <= C1;
		end if;
	end if;			
end process;

new_in <= aux_new_in;

end Behavioral;

