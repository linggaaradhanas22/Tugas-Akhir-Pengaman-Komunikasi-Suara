library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.fixed_pkg.all;

entity goertzel_calc_registered_tb is
end goertzel_calc_registered_tb;

architecture sim of goertzel_calc_registered_tb is

    constant clk_hz : integer := 100e6;
    constant clk_period : time := 1 sec / clk_hz;
    -- Constants
    constant COEFF_INT_BITS : integer := 1;
    constant COEFF_FRAC_BITS : integer := 15;
    constant Q_INT_BITS : integer := 11;
    constant Q_FRAC_BITS : integer := 5;
    constant X_INT_BITS : integer := 2;
    constant X_FRAC_BITS : integer := 14;
    
    constant NUM_SAMPLES : integer := 90;

    signal clk : std_logic := '1';
    signal rst : std_logic := '1';
    -- Signals
    signal coeff : ufixed(COEFF_INT_BITS-1 downto -COEFF_FRAC_BITS);
    signal x : sfixed(X_INT_BITS-1 downto -X_FRAC_BITS);
    signal Q0_reg, Q1_reg, Q2_reg : sfixed(Q_INT_BITS-1 downto -Q_FRAC_BITS);
    signal count : integer := 0;

    -- Input array type and values
    type real_array is array (0 to NUM_SAMPLES-1) of real;
    constant x_inputs : real_array := (
        0.0,
        0.727443130630800,
        1.33363968791620,
        1.72121029499008,
        1.83545025890262,
        1.67412051301319,
        1.28622817984601,
        0.760194166837148,
        0.204099039088909,
        -0.277608574362026,
        -0.605834680451854,
        -0.742291409632490,
        -0.695411539856902,
        -0.515607947066543,
        -0.281140684900682,
        -0.0779399531524238,
        0.0219384125826301,
        -0.0217296881787884,
        -0.207088938625749,
        -0.490033967846992,
        -0.794196765119617,
        -1.02886566030804,
        -1.11079568945337,
        -0.984955871758108,
        -0.639450264921372,
        -0.111107576823197,
        0.519717366156675,
        1.14419984224836,
        1.64683102576682,
        1.92928444542359,
        1.93120912280148,
        1.64342107834885,
        1.11058695463863,
        0.422757573440081,
        -0.302481020105493,
        -0.943444893028492,
        -1.39838503694609,
        -1.60501418550199,
        -1.55143008899690,
        -1.27623150673724,
        -0.857988643024392,
        -0.396545492171169,
        0.00961177309658823,
        0.284873489439642,
        0.392172069628738,
        0.339408018702690,
        0.175346965619202,
        -0.0239293270474339,
        -0.174815230894957,
        -0.207618048552936,
        -0.0846782840376729,
        0.189036244187209,
        0.565374466179295,
        0.962730482781765,
        1.28397306463663,
        1.43861920072583,
        1.36429556927940,
        1.04263284508980,
        0.505920793246852,
        -0.167140958012834,
        -0.865871930733091,
        -1.46924965399513,
        -1.87018346770827,
        -1.99723965672995,
        -1.82915838910833,
        -1.39904685631071,
        -0.787359009681531,
        -0.105192245713434,
        0.528485492770152,
        1.01077488041496,
        1.27483212420250,
        1.30168899461428,
        1.12151214214306,
        0.804241762377321,
        0.441880547990649,
        0.126517492297890,
        -0.0709312145900632,
        -0.116495391759557,
        -0.0199426241322799,
        0.168860010130119,
        0.373099419357747,
        0.508617516754187,
        0.505429617889480,
        0.326184134337292,
        -0.0227416119103889,
        -0.490174875204477,
        -0.989530626945410,
        -1.41671291755203,
        -1.67266775349942,
        -1.68563391367568
    );
   

begin

    DUT : entity work.goertzel_calc_registered(rtl)
    generic map (
        COEFF_INT_BITS => COEFF_INT_BITS,
        COEFF_FRAC_BITS => COEFF_FRAC_BITS,
        Q_INT_BITS => Q_INT_BITS,
        Q_FRAC_BITS => Q_FRAC_BITS,
        X_INT_BITS => X_INT_BITS,
        X_FRAC_BITS => X_FRAC_BITS
    )
    port map (
        clk => clk,
        rst => rst,
        coeff => coeff,
        x => x,
        Q0_reg => Q0_reg,
        Q1_reg => Q1_reg,
        Q2_reg => Q2_reg
    );

    clk <= not clk after clk_period / 2;

    process is 
    begin 
        rst <= '0' after 5 ns;
        
        wait;
    end process;


    SEQUENCER_PROC : process
        variable coeff_var : real := 1.924910472907295;
    begin
        coeff <= to_ufixed(coeff_var, coeff);
        for i in 0 to NUM_SAMPLES-1 loop
            count <= count + 1;
            x <= to_sfixed(x_inputs(i), x);
            wait for clk_period;
        end loop;
        
        wait;
    end process;

end architecture;

