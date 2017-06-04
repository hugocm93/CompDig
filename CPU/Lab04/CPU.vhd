
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity CPU is
    Port ( reset, clk : in  STD_LOGIC;
           LoadPC : in  STD_LOGIC;
           EnMEM : in  STD_LOGIC;
           clkAC : in  STD_LOGIC;
           EnPC : in  STD_LOGIC;
           clkIR : in  STD_LOGIC;
           IncPC : in  STD_LOGIC;
           EnMBR : in  STD_LOGIC;
           clkMBR : in  STD_LOGIC;
           EnALU : in  STD_LOGIC;
           RESETAC : in  STD_LOGIC);
end CPU;

architecture Behavioral of CPU is
    type state is 
        (FETCH_T0_0
        ,FETCH_T0_1
        ,FETCH_T1_0
        ,FETCH_T1_1
        ,ADD_T0_0
        ,ADD_T0_1
        ,ADD_T1_0
        ,ADD_T1_1
        ,ADD_T2_0
        ,ADD_T2_1
        ,LOAD_T0_0
        ,LOAD_T0_1
        ,LOAD_T1_0
        ,LOAD_T1_1
        ,LOAD_T2_0
        ,LOAD_T2_1
        ,LOAD_T3_0
        ,LOAD_T3_1
        ,BRA_T0_0
        ,BRA_T0_1
        ,BRA_T1_0
        ,BRA_T1_1
    );
signal CPU_STATE is state;
signal addr_bus, data_bus : 
        std_logic_vector(7 downto 0) := (others => '0');
signal auxMBR, auxPC, auxAC, auxALU, auxData: 
        std_logic_vector(7 downto 0) := (others => '0');

begin

    RAM_TRI :  entity work.tri_state_buffer(Behavioral) PORT MAP(
        IN8 => auxData,
        OE => EnMEM,
        OUT8 => data_bus 
    );

    ALU_TRI :  entity work.tri_state_buffer(Behavioral) PORT MAP(
        IN8 => auxALU,
        OE => EnALU,
        OUT8 => addr_bus 
    );

    MBR_TRI :  entity work.tri_state_buffer(Behavioral) PORT MAP(
        IN8 => auxMBR,
        OE => EnMBR,
        OUT8 => data_bus 
    );

    PC_TRI :  entity work.tri_state_buffer(Behavioral) PORT MAP(
        IN8 => auxPC,
        OE => EnPC,
        OUT8 => data_bus 
    );

    IR : entity work.register8(Behavioral) PORT MAP(
        D   => data_bus,
        MReset => reset,
        CP => clkIR,
        Q   => '0' -- nao usado por enquanto
    );

    MBR : entity work.register8(Behavioral) PORT MAP(
        D   => data_bus,
        MReset => reset,
        CP => clkMBR,
        Q   => auxMBR 
    );

    AC : entity work.register8(Behavioral) PORT MAP(
        D   => addr_bus,
        MReset => reset and RESETAC,
        CP => clkAC,
        Q   => auxAC 
    );

    PC : entity work.up_counter_load(rtl) PORT MAP(
        cout   => auxPC,
        data   => data_bus,
        load   => LoadPC,
        enable => '1', -- habilitado
        clk    => IncPC,
        reset  => reset 
    );

    ALU : entity work.alu8bit(behavioral) PORT MAP(
        a => auxAC,
        b => data_bus,
        f => auxALU, 
        zero => '0', --nao usado por enquanto
        op => "010" --soma por enquanto
    );

    RAM : entity work.SingleRAM_syn(ram_arch)
        GENERIC MAP(
            ADDR_WIDTH => 7,
            DATA_WIDTH => 7
        );
        PORT MAP(
            clk => clk,
            we => '0', --leitura 
            addr => addr_bus,
            din => auxData,
            dout => auxData
    );

    process(reset, clk) begin
    end process;

    process(CPU_STATE) begin
        case CPU_STATE is
            when FETCH_T0_0 =>
               LoadPC  <= '0';
               EnMEM   <= '1';
               clkAC   <= '0';
               EnPC    <= '1';
               clkIR   <= '1';
               IncPC   <= '0';
               EnMBR   <= '0';
               clkMBR  <= '0';
               EnALU   <= '0';
               RESETAC <= '0';

            when FETCH_T0_1 =>
               LoadPC  <= '0';
               EnMEM   <= '1';
               clkAC   <= '0';
               EnPC    <= '1';
               clkIR   <= '0';
               IncPC   <= '0';
               EnMBR   <= '0';
               clkMBR  <= '0';
               EnALU   <= '0';
               RESETAC <= '0';

            when FETCH_T1_0 =>
               LoadPC  <= '0';
               EnMEM   <= '0';
               clkAC   <= '0';
               EnPC    <= '0';
               clkIR   <= '0';
               IncPC   <= '1';
               EnMBR   <= '0';
               clkMBR  <= '0';
               EnALU   <= '0';
               RESETAC <= '0';

            when FETCH_T1_1 =>
               LoadPC  <= '0';
               EnMEM   <= '0';
               clkAC   <= '0';
               EnPC    <= '0';
               clkIR   <= '0';
               IncPC   <= '0';
               EnMBR   <= '0';
               clkMBR  <= '0';
               EnALU   <= '0';
               RESETAC <= '0';

            when ADD_T0_0 =>
               LoadPC  <= '0';
               EnMEM   <= '1';
               clkAC   <= '0';
               EnPC    <= '1';
               clkIR   <= '0';
               IncPC   <= '0';
               EnMBR   <= '0';
               clkMBR  <= '1';
               EnALU   <= '0';
               RESETAC <= '0';

            when ADD_T0_1 =>
               LoadPC  <= '0';
               EnMEM   <= '1';
               clkAC   <= '0';
               EnPC    <= '1';
               clkIR   <= '0';
               IncPC   <= '0';
               EnMBR   <= '0';
               clkMBR  <= '0';
               EnALU   <= '0';
               RESETAC <= '0';

            when ADD_T1_0 =>
               LoadPC  <= '0';
               EnMEM   <= '1';
               clkAC   <= '1';
               EnPC    <= '0';
               clkIR   <= '0';
               IncPC   <= '0';
               EnMBR   <= '0';
               clkMBR  <= '0';
               EnALU   <= '1';
               RESETAC <= '0';

            when ADD_T1_1 =>
               LoadPC  <= '0';
               EnMEM   <= '1';
               clkAC   <= '0';
               EnPC    <= '0';
               clkIR   <= '0';
               IncPC   <= '0';
               EnMBR   <= '0';
               clkMBR  <= '0';
               EnALU   <= '1';
               RESETAC <= '0';

            when ADD_T2_0 =>
               LoadPC  <= '0';
               EnMEM   <= '0';
               clkAC   <= '0';
               EnPC    <= '0';
               clkIR   <= '0';
               IncPC   <= '1';
               EnMBR   <= '0';
               clkMBR  <= '0';
               EnALU   <= '0';
               RESETAC <= '0';

            when ADD_T2_1 =>
               LoadPC  <= '0';
               EnMEM   <= '0';
               clkAC   <= '0';
               EnPC    <= '0';
               clkIR   <= '0';
               IncPC   <= '0';
               EnMBR   <= '0';
               clkMBR  <= '0';
               EnALU   <= '0';
               RESETAC <= '0';

            when LOAD_T0_0 =>
               LoadPC  <= '0';
               EnMEM   <= '0';
               clkAC   <= '0';
               EnPC    <= '0';
               clkIR   <= '0';
               IncPC   <= '0';
               EnMBR   <= '0';
               clkMBR  <= '0';
               EnALU   <= '0';
               RESETAC <= '1';

            when LOAD_T0_1 =>
               LoadPC  <= '0';
               EnMEM   <= '0';
               clkAC   <= '0';
               EnPC    <= '0';
               clkIR   <= '0';
               IncPC   <= '0';
               EnMBR   <= '0';
               clkMBR  <= '0';
               EnALU   <= '0';
               RESETAC <= '0';

            when LOAD_T1_0 =>
               LoadPC  <= '0';
               EnMEM   <= '1';
               clkAC   <= '0';
               EnPC    <= '1';
               clkIR   <= '0';
               IncPC   <= '0';
               EnMBR   <= '0';
               clkMBR  <= '1';
               EnALU   <= '0';
               RESETAC <= '0';

            when LOAD_T1_1 =>
               LoadPC  <= '0';
               EnMEM   <= '1';
               clkAC   <= '0';
               EnPC    <= '1';
               clkIR   <= '0';
               IncPC   <= '0';
               EnMBR   <= '0';
               clkMBR  <= '0';
               EnALU   <= '0';
               RESETAC <= '0';

            when LOAD_T2_0 =>
               LoadPC  <= '0';
               EnMEM   <= '1';
               clkAC   <= '1';
               EnPC    <= '0';
               clkIR   <= '0';
               IncPC   <= '0';
               EnMBR   <= '0';
               clkMBR  <= '0';
               EnALU   <= '1';
               RESETAC <= '0';

            when LOAD_T2_1 =>
               LoadPC  <= '0';
               EnMEM   <= '1';
               clkAC   <= '0';
               EnPC    <= '0';
               clkIR   <= '0';
               IncPC   <= '0';
               EnMBR   <= '0';
               clkMBR  <= '0';
               EnALU   <= '1';
               RESETAC <= '0';

            when LOAD_T3_0 =>
               LoadPC  <= '0';
               EnMEM   <= '0';
               clkAC   <= '0';
               EnPC    <= '0';
               clkIR   <= '0';
               IncPC   <= '1';
               EnMBR   <= '0';
               clkMBR  <= '0';
               EnALU   <= '0';
               RESETAC <= '0';

            when LOAD_T3_1 =>
               LoadPC  <= '0';
               EnMEM   <= '0';
               clkAC   <= '0';
               EnPC    <= '0';
               clkIR   <= '0';
               IncPC   <= '0';
               EnMBR   <= '0';
               clkMBR  <= '0';
               EnALU   <= '0';
               RESETAC <= '0';

            when BRA_T0_0 =>
               LoadPC  <= '0';
               EnMEM   <= '1';
               clkAC   <= '0';
               EnPC    <= '1';
               clkIR   <= '0';
               IncPC   <= '0';
               EnMBR   <= '0';
               clkMBR  <= '1';
               EnALU   <= '0';
               RESETAC <= '0';

            when BRA_T0_1 =>
               LoadPC  <= '0';
               EnMEM   <= '1';
               clkAC   <= '0';
               EnPC    <= '1';
               clkIR   <= '0';
               IncPC   <= '0';
               EnMBR   <= '0';
               clkMBR  <= '0';
               EnALU   <= '0';
               RESETAC <= '0';

            when BRA_T1_0 =>
               LoadPC  <= '1';
               EnMEM   <= '0';
               clkAC   <= '0';
               EnPC    <= '0';
               clkIR   <= '0';
               IncPC   <= '0';
               EnMBR   <= '1';
               clkMBR  <= '0';
               EnALU   <= '0';
               RESETAC <= '0';

            when BRA_T1_1 =>
               LoadPC  <= '0';
               EnMEM   <= '0';
               clkAC   <= '0';
               EnPC    <= '0';
               clkIR   <= '0';
               IncPC   <= '0';
               EnMBR   <= '1';
               clkMBR  <= '0';
               EnALU   <= '0';
               RESETAC <= '0';
        end case;
    end process;
end Behavioral;

