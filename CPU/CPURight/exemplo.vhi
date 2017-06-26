
-- VHDL Instantiation Created from source file exemplo.vhd -- 12:27:14 06/26/2017
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT exemplo
	PORT(
		clk : IN std_logic;
		send_d : IN std_logic;
		reset : IN std_logic;
		input : IN std_logic_vector(7 downto 0);          
		rs : OUT std_logic;
		rw : OUT std_logic;
		ena : OUT std_logic;
		data_lcd : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;

	Inst_exemplo: exemplo PORT MAP(
		clk => ,
		send_d => ,
		reset => ,
		rs => ,
		rw => ,
		ena => ,
		data_lcd => ,
		input => 
	);


