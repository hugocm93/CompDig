
-- VHDL Instantiation Created from source file Rom_asyn.vhd -- 11:53:07 06/05/2017
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT Rom_asyn
	PORT(
		addr : IN std_logic_vector(7 downto 0);          
		data : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

	Inst_Rom_asyn: Rom_asyn PORT MAP(
		addr => ,
		data => 
	);


