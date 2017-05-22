----------------------------------------
----------PROCESADOR LCD----------------
----------�NO MODIFICAR!----------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity PROCESADOR_LCD4BITS is

PORT(CLK : IN STD_LOGIC;
	  RS : OUT STD_LOGIC;
	  RW : OUT STD_LOGIC;
	  ENA : OUT STD_LOGIC;
	  
	  VECTOR_MEM : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
	  
	  INC_DIR : OUT INTEGER RANGE 0 TO 1024;

	  C1A,C2A,C3A,C4A,C5A,C6A,C7A,C8A : IN STD_LOGIC_VECTOR(39 DOWNTO 0);
	  
	  BD_LCD : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);			         

	  DATA : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)--DE 4 BITS
		);

end PROCESADOR_LCD4BITS;

architecture Behavioral of PROCESADOR_LCD4BITS is

TYPE MAQUINA IS (CHECAR,INI_LCD1,INI_LCD2,CURSOR_LCD,CURSOR_HOME,CLEAR_DISPLAY,CHAR,CHAR_ASCII,POS,BUCLE_INI,BUCLE_FIN,
					  LIMPIAR_PANTALLA,NADA,POS_RAM,CREAR_CHAR,LEER_RAM,CLEAR_DISPLAY_CHAR,CURSOR_HOME_CHAR,ENABLE,FIN);
SIGNAL ESTADO : MAQUINA := INI_LCD1;

SIGNAL ESTADO_FUTURO : MAQUINA;
SIGNAL ESTADO_PRESENTE :MAQUINA;

CONSTANT DELAY_FIN : INTEGER := 499_999;--499_999;
SIGNAL CONTA_DELAY : INTEGER RANGE 0 TO DELAY_FIN := 0;

SIGNAL MANDAR_BAJO : STD_LOGIC := '0'; --SI ESTE BIT ES 0 SE MANDAN LOS 4 MSBs Y SI ES 1 SE MANDAN LOS 4 LSBs

SIGNAL CONF_CURSOR : STD_LOGIC_VECTOR(1 DOWNTO 0);

SIGNAL DATA_CHAR,VEC_POS : STD_LOGIC_VECTOR(11 DOWNTO 0);

SIGNAL INC_DIR_S,DIR_BI : INTEGER RANGE 0 TO 1024 := 0;

SIGNAL CONTA_CHAR : INTEGER RANGE 1 TO 8 := 1;

SIGNAL VEC_C_CHAR : STD_LOGIC_VECTOR(39 DOWNTO 0);

SIGNAL VEC_RAM,VEC_L_RAM : STD_LOGIC_VECTOR(7 DOWNTO 0);

begin

INC_DIR <= INC_DIR_S;
-------------------------------------------------------------------------------------
PROCESS(CLK)
BEGIN
 IF RISING_EDGE(CLK) THEN
 
				--CURSOR--
				IF VECTOR_MEM = x"101" THEN
					CONF_CURSOR <= "00";
				ELSIF VECTOR_MEM = x"102" THEN
					CONF_CURSOR <= "01";
				ELSIF VECTOR_MEM = x"103" THEN
					CONF_CURSOR <= "10";
				ELSE
					CONF_CURSOR <= "11";
				END IF;
				----------
				
				--CARACTERES ESPECIALES---
				IF 	VECTOR_MEM = x"17E" THEN VEC_RAM <= x"40"; VEC_C_CHAR <= C1A; 
				ELSIF VECTOR_MEM = x"17F" THEN VEC_RAM <= x"48"; VEC_C_CHAR <= C2A; 
				ELSIF VECTOR_MEM = x"180" THEN VEC_RAM <= x"50"; VEC_C_CHAR <= C3A; 
				ELSIF VECTOR_MEM = x"181" THEN VEC_RAM <= x"58"; VEC_C_CHAR <= C4A; 
				ELSIF VECTOR_MEM = x"182" THEN VEC_RAM <= x"60"; VEC_C_CHAR <= C5A; 
				ELSIF VECTOR_MEM = x"183" THEN VEC_RAM <= x"68"; VEC_C_CHAR <= C6A; 
				ELSIF VECTOR_MEM = x"184" THEN VEC_RAM <= x"70"; VEC_C_CHAR <= C7A; 
				ELSIF VECTOR_MEM = x"185" THEN VEC_RAM <= x"78"; VEC_C_CHAR <= C8A;
				ELSIF VECTOR_MEM = x"186" THEN VEC_L_RAM <= x"00";
				ELSIF VECTOR_MEM = x"187" THEN VEC_L_RAM <= x"01";
				ELSIF VECTOR_MEM = x"188" THEN VEC_L_RAM <= x"02";
				ELSIF VECTOR_MEM = x"189" THEN VEC_L_RAM <= x"03";
				ELSIF VECTOR_MEM = x"18A" THEN VEC_L_RAM <= x"04";
				ELSIF VECTOR_MEM = x"18B" THEN VEC_L_RAM <= x"05";
				ELSIF VECTOR_MEM = x"18C" THEN VEC_L_RAM <= x"06";
				ELSIF VECTOR_MEM = x"18D" THEN VEC_L_RAM <= x"07";
				END IF;
				--------------------------

		CASE ESTADO IS
		
			WHEN CHECAR =>
					
					MANDAR_BAJO <= '0';
					BD_LCD <= x"00";
					
					IF VECTOR_MEM >= x"109" AND VECTOR_MEM <= x"13C" THEN
							
							IF VECTOR_MEM >= x"109" AND VECTOR_MEM <= x"122" THEN
								DATA_CHAR <= VECTOR_MEM - x"0A8";
							ELSE
								DATA_CHAR <= VECTOR_MEM - x"0E2";
							END IF;
						ESTADO <= CHAR;
						
					ELSIF VECTOR_MEM >= x"020" AND VECTOR_MEM <= x"0FF" THEN
						
						DATA_CHAR <= VECTOR_MEM;
						ESTADO <= CHAR_ASCII;
						
					ELSIF VECTOR_MEM >=	x"150" AND VECTOR_MEM <=  x"177" THEN
							
							IF VECTOR_MEM >= x"150" AND VECTOR_MEM <= x"163" THEN
								VEC_POS <= VECTOR_MEM - x"0D0";
							ELSIF VECTOR_MEM >= x"164" AND VECTOR_MEM <= x"177" THEN
								VEC_POS <= VECTOR_MEM - x"0A4";
							END IF;
						ESTADO <= POS;
					
					ELSIF VECTOR_MEM = x"17C" THEN
						ESTADO <= BUCLE_INI;
					
					ELSIF VECTOR_MEM = x"17D" THEN
						ESTADO <= BUCLE_FIN;
					
					ELSIF VECTOR_MEM = x"1FE" THEN
						ESTADO <= LIMPIAR_PANTALLA;
						
					ELSIF VECTOR_MEM = x"1FD" THEN
						ESTADO <= NADA;

					ELSIF VECTOR_MEM >= x"17E" AND VECTOR_MEM <= x"185" THEN
						ESTADO <= POS_RAM;
					
					ELSIF VECTOR_MEM >= x"186" AND VECTOR_MEM <= x"18D" THEN
						ESTADO <= LEER_RAM;
					
					ELSIF VECTOR_MEM =X"1FF" THEN
						ESTADO <= FIN;
						
					END IF;
					
			WHEN INI_LCD1 =>
						
						RS <= '0';
						RW <= '0';
						
						DATA <= "0010";--4 BITS
						
					IF CONTA_DELAY = DELAY_FIN THEN				
						CONTA_DELAY <= 0;
						ESTADO <= INI_LCD2;
					ELSE
						CONTA_DELAY <= CONTA_DELAY +1;
						ESTADO <= INI_LCD1;
					END IF;
				
					IF CONTA_DELAY <= DELAY_FIN/3 THEN
						ENA <= '0';
					ELSIF CONTA_DELAY > DELAY_FIN/3 AND CONTA_DELAY < (2*DELAY_FIN)/3 THEN
						ENA <= '1';
					ELSE
						ENA <= '0';
					END IF;
						
						
			WHEN INI_LCD2 =>
			
					IF MANDAR_BAJO = '0' THEN 
						DATA <= "0010";--4 BITS MSB
						ESTADO_FUTURO <= INI_LCD2;
						ESTADO <= ENABLE;
					ELSE 
						DATA <= "1000";--2 RENGLONES, MATRICES 5x8 (LSB)
						ESTADO_FUTURO <= CURSOR_LCD;
						ESTADO <= ENABLE;
					END IF;
			
			WHEN CURSOR_LCD =>
			
					IF MANDAR_BAJO = '0' THEN 
						DATA <= "0000";--4 BITS MSB
						ESTADO_FUTURO <= CURSOR_LCD;
						ESTADO <= ENABLE;
					ELSE 
						DATA <= "11"&CONF_CURSOR;--4 BITS LSB
						ESTADO_FUTURO <= CLEAR_DISPLAY;
						ESTADO <= ENABLE;
					END IF;			
					
			WHEN CLEAR_DISPLAY =>
			
					IF MANDAR_BAJO = '0' THEN 
						DATA <= "0000";--4 BITS MSB
						ESTADO_FUTURO <= CLEAR_DISPLAY;
						ESTADO <= ENABLE;
					ELSE 
						DATA <= "0001";--4 BITS LSB
						ESTADO_FUTURO <= CURSOR_HOME;
						ESTADO <= ENABLE;
					END IF;
			
			WHEN CURSOR_HOME =>
			
					IF MANDAR_BAJO = '0' THEN 
						DATA <= "0000";--4 BITS MSB
						ESTADO_FUTURO <= CURSOR_HOME;
						ESTADO <= ENABLE;
					ELSE 
						DATA <= "0010";--4 BITS LSB
						ESTADO_FUTURO <= CHECAR;
						ESTADO <= ENABLE;
						ESTADO_PRESENTE <= CURSOR_HOME;
						INC_DIR_S <= INC_DIR_S +1;
					END IF;
				
			WHEN CHAR =>
			
					RS <= '1';
					BD_LCD <= x"00";
					
					IF MANDAR_BAJO = '0' THEN 
						DATA <= DATA_CHAR(7 DOWNTO 4);--4 BITS MSB
						ESTADO_FUTURO <= CHAR;
						ESTADO <= ENABLE;
					ELSE 
						DATA <= DATA_CHAR(3 DOWNTO 0);--4 BITS LSB
						ESTADO_FUTURO <= CHECAR;
						ESTADO <= ENABLE;
						ESTADO_PRESENTE <= CHAR;
						INC_DIR_S <= INC_DIR_S +1;
					END IF;
			
			WHEN CHAR_ASCII =>
			
					RS <= '1';
					BD_LCD <= x"00";
					
					IF MANDAR_BAJO = '0' THEN 
						DATA <= DATA_CHAR(7 DOWNTO 4);--4 BITS MSB
						ESTADO_FUTURO <= CHAR_ASCII;
						ESTADO <= ENABLE;
					ELSE 
						DATA <= DATA_CHAR(3 DOWNTO 0);--4 BITS LSB
						ESTADO_FUTURO <= CHECAR;
						ESTADO <= ENABLE;
						ESTADO_PRESENTE <= CHAR_ASCII;
						INC_DIR_S <= INC_DIR_S +1;
					END IF;
			
				
			WHEN POS =>
					
					RS <= '0';
					BD_LCD <= x"00";
					
					IF MANDAR_BAJO = '0' THEN 
						DATA <= VEC_POS(7 DOWNTO 4);--4 BITS MSB
						ESTADO_FUTURO <= POS;
						ESTADO <= ENABLE;
					ELSE 
						DATA <= VEC_POS(3 DOWNTO 0);--4 BITS LSB
						ESTADO_FUTURO <= CHECAR;
						ESTADO <= ENABLE;
						ESTADO_PRESENTE <= POS;
						INC_DIR_S <= INC_DIR_S +1;
					END IF;		
			
			WHEN LIMPIAR_PANTALLA =>
					
					RS <= '0';
					RW <= '0';
					BD_LCD <= x"00";
					
					IF MANDAR_BAJO = '0' THEN 
						DATA <= "0000";--4 BITS MSB
						ESTADO_FUTURO <= LIMPIAR_PANTALLA;
						ESTADO <= ENABLE;
					ELSE 
						DATA <= "0001";--4 BITS LSB
						ESTADO_FUTURO <= CHECAR;
						ESTADO <= ENABLE;
						ESTADO_PRESENTE <= LIMPIAR_PANTALLA;
						INC_DIR_S <= INC_DIR_S +1;
					END IF;
			
			WHEN NADA =>
					
					RS <= '0';
					RW <= '0';
					DATA <= "0000";
					BD_LCD <= x"00";
					
					IF CONTA_DELAY = DELAY_FIN THEN				
						CONTA_DELAY <= 0;
						ESTADO <= CHECAR;
						BD_LCD <= x"08";
					ELSE
						CONTA_DELAY <= CONTA_DELAY +1;
						ESTADO <= NADA;
					END IF;
			
			WHEN POS_RAM =>
					
					RS <= '0';
					RW <= '0';
					BD_LCD <= x"00";
					
					IF MANDAR_BAJO = '0' THEN 
						DATA <= VEC_RAM(7 DOWNTO 4);--4 BITS MSB
						ESTADO_FUTURO <= POS_RAM;
						ESTADO <= ENABLE;
					ELSE 
						DATA <= VEC_RAM(3 DOWNTO 0);--4 BITS LSB
						ESTADO_FUTURO <= CREAR_CHAR;
						ESTADO <= ENABLE;
					END IF;
			
			WHEN CREAR_CHAR =>
					
					RS <= '1';
					RW <= '0';
					BD_LCD <= x"00";
					
					IF CONTA_CHAR = 1 THEN
						IF MANDAR_BAJO = '0' THEN
							DATA <= "000"&VEC_C_CHAR(39);
							ESTADO_FUTURO <= CREAR_CHAR;
							ESTADO <= ENABLE;
						ELSE
							DATA <= VEC_C_CHAR(38 DOWNTO 35);
							ESTADO_FUTURO <= CREAR_CHAR;
							CONTA_CHAR <= CONTA_CHAR+1;
							ESTADO <= ENABLE;
						END IF;
					ELSIF CONTA_CHAR = 2 THEN
						IF MANDAR_BAJO = '0' THEN
							DATA <= "000"&VEC_C_CHAR(34);
							ESTADO_FUTURO <= CREAR_CHAR;
							ESTADO <= ENABLE;
						ELSE
							DATA <= VEC_C_CHAR(33 DOWNTO 30);
							ESTADO_FUTURO <= CREAR_CHAR;
							CONTA_CHAR <= CONTA_CHAR+1;
							ESTADO <= ENABLE;
						END IF;
					ELSIF CONTA_CHAR = 3 THEN
						IF MANDAR_BAJO = '0' THEN
							DATA <= "000"&VEC_C_CHAR(29);
							ESTADO_FUTURO <= CREAR_CHAR;
							ESTADO <= ENABLE;
						ELSE
							DATA <= VEC_C_CHAR(28 DOWNTO 25);
							ESTADO_FUTURO <= CREAR_CHAR;
							CONTA_CHAR <= CONTA_CHAR+1;
							ESTADO <= ENABLE;
						END IF;
					ELSIF CONTA_CHAR = 4 THEN
						IF MANDAR_BAJO = '0' THEN
							DATA <= "000"&VEC_C_CHAR(24);
							ESTADO_FUTURO <= CREAR_CHAR;
							ESTADO <= ENABLE;
						ELSE
							DATA <= VEC_C_CHAR(23 DOWNTO 20);
							ESTADO_FUTURO <= CREAR_CHAR;
							CONTA_CHAR <= CONTA_CHAR+1;
							ESTADO <= ENABLE;
						END IF;
					ELSIF CONTA_CHAR = 5 THEN
						IF MANDAR_BAJO = '0' THEN
							DATA <= "000"&VEC_C_CHAR(19);
							ESTADO_FUTURO <= CREAR_CHAR;
							ESTADO <= ENABLE;
						ELSE
							DATA <= VEC_C_CHAR(18 DOWNTO 15);
							ESTADO_FUTURO <= CREAR_CHAR;
							CONTA_CHAR <= CONTA_CHAR+1;
							ESTADO <= ENABLE;
						END IF;
					ELSIF CONTA_CHAR = 6 THEN
						IF MANDAR_BAJO = '0' THEN
							DATA <= "000"&VEC_C_CHAR(14);
							ESTADO_FUTURO <= CREAR_CHAR;
							ESTADO <= ENABLE;
						ELSE
							DATA <= VEC_C_CHAR(13 DOWNTO 10);
							ESTADO_FUTURO <= CREAR_CHAR;
							CONTA_CHAR <= CONTA_CHAR+1;
							ESTADO <= ENABLE;
						END IF;
					ELSIF CONTA_CHAR = 7 THEN
						IF MANDAR_BAJO = '0' THEN
							DATA <= "000"&VEC_C_CHAR(9);
							ESTADO_FUTURO <= CREAR_CHAR;
							ESTADO <= ENABLE;
						ELSE
							DATA <= VEC_C_CHAR(8 DOWNTO 5);
							ESTADO_FUTURO <= CREAR_CHAR;
							CONTA_CHAR <= CONTA_CHAR+1;
							ESTADO <= ENABLE;
						END IF;
					ELSE
						IF MANDAR_BAJO = '0' THEN
							DATA <= "000"&VEC_C_CHAR(4);
							ESTADO_FUTURO <= CREAR_CHAR;
							ESTADO <= ENABLE;
						ELSE
							DATA <= VEC_C_CHAR(3 DOWNTO 0);
							ESTADO_FUTURO <= CLEAR_DISPLAY_CHAR;
							CONTA_CHAR <= 1;
							ESTADO <= ENABLE;
						END IF;
					END IF;
					
			WHEN CLEAR_DISPLAY_CHAR =>
					
					BD_LCD <= x"00";
					
					IF MANDAR_BAJO = '0' THEN 
						DATA <= "0000";--4 BITS MSB
						ESTADO_FUTURO <= CLEAR_DISPLAY_CHAR;
						ESTADO <= ENABLE;
					ELSE 
						DATA <= "0001";--4 BITS LSB
						ESTADO_FUTURO <= CURSOR_HOME_CHAR;
						ESTADO <= ENABLE;
					END IF;
			
			WHEN CURSOR_HOME_CHAR =>
			
					BD_LCD <= x"00";
					
					IF MANDAR_BAJO = '0' THEN 
						DATA <= "0000";--4 BITS MSB
						ESTADO_FUTURO <= CURSOR_HOME_CHAR;
						ESTADO <= ENABLE;
					ELSE 
						DATA <= "0010";--4 BITS LSB
						ESTADO_FUTURO <= CHECAR;
						ESTADO <= ENABLE;
						ESTADO_PRESENTE <= CURSOR_HOME_CHAR;
						INC_DIR_S <= INC_DIR_S +1;
					END IF;
			
			WHEN LEER_RAM =>
					
					RS <= '1';
					RW <= '0';
					BD_LCD <= x"00";
					
					IF MANDAR_BAJO = '0' THEN 
						DATA <= VEC_L_RAM(7 DOWNTO 4);--4 BITS MSB
						ESTADO_FUTURO <= LEER_RAM;
						ESTADO <= ENABLE;
					ELSE 
						DATA <=VEC_L_RAM(3 DOWNTO 0);--4 BITS LSB
						ESTADO_FUTURO <= CHECAR;
						ESTADO <= ENABLE;
						ESTADO_PRESENTE <= LEER_RAM;
						INC_DIR_S <= INC_DIR_S +1;
					END IF;
			
			WHEN BUCLE_INI	=>
						
						BD_LCD <= x"00";
							
						DIR_BI <= INC_DIR_S;
						INC_DIR_S <= INC_DIR_S +1;
						ESTADO_PRESENTE <= BUCLE_INI;
						ESTADO <= CHECAR;
						
				WHEN BUCLE_FIN =>
						
						BD_LCD <= x"00";
						
						INC_DIR_S <= DIR_BI;
						ESTADO <= BUCLE_INI;
						ESTADO_PRESENTE <= BUCLE_FIN;
			
			WHEN ENABLE =>		
					
					IF CONTA_DELAY = DELAY_FIN THEN				
						CONTA_DELAY <= 0;
						ESTADO <= ESTADO_FUTURO;
						MANDAR_BAJO <= NOT MANDAR_BAJO;
						
								--BANDERA--
									IF 	ESTADO_PRESENTE = CURSOR_LCD THEN BD_LCD <= x"01";
									ELSIF ESTADO_PRESENTE = CHAR 		  THEN BD_LCD <= x"02";
									ELSIF ESTADO_PRESENTE = POS 		  THEN BD_LCD <= x"03";
								   ELSIF ESTADO_PRESENTE = CHAR_ASCII THEN BD_LCD <= x"05";
								   ELSIF ESTADO_PRESENTE = BUCLE_INI  THEN BD_LCD <= x"06";
									ELSIF ESTADO_PRESENTE = BUCLE_FIN  THEN BD_LCD <= x"07";
									ELSIF ESTADO_PRESENTE = LIMPIAR_PANTALLA THEN BD_LCD <= x"08";
								   ELSIF ESTADO_PRESENTE = CURSOR_HOME_CHAR THEN BD_LCD <= x"09";
								 	ELSIF ESTADO_PRESENTE = LEER_RAM THEN BD_LCD <= x"0A";
									ELSE BD_LCD <= x"00";
									END IF;
								-----------
						
					ELSE
						CONTA_DELAY <= CONTA_DELAY +1;
						ESTADO <= ENABLE;
					END IF;
				
					IF CONTA_DELAY <= DELAY_FIN/3 THEN
						ENA <= '0';
					ELSIF CONTA_DELAY > DELAY_FIN/3 AND CONTA_DELAY < (2*DELAY_FIN)/3 THEN
						ENA <= '1';
					ELSE
						ENA <= '0';
					END IF;
			
			WHEN FIN => ESTADO <= CHECAR;
					
			WHEN OTHERS => null;
		
		END CASE;
	END IF;
END PROCESS;
				

end Behavioral;				
