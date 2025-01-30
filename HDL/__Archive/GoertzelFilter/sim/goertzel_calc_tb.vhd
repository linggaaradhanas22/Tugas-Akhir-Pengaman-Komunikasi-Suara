library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.fixed_pkg.all;
use STD.textio.all;

entity goertzel_calc_tb is
end goertzel_calc_tb;

architecture sim of goertzel_calc_tb is

    -- Constants
    constant COEFF_INT_BITS : integer := 2;
    constant COEFF_FRAC_BITS : integer := 14;
    constant Q_INT_BITS : integer := 11;
    constant Q_FRAC_BITS : integer := 5;
    constant X_INT_BITS : integer := 2;
    constant X_FRAC_BITS : integer := 14;

    -- Signals
    signal coeff : sfixed(COEFF_INT_BITS-1 downto -COEFF_FRAC_BITS);
    signal x_reg : sfixed(X_INT_BITS-1 downto -X_FRAC_BITS);
    signal Q0, Q1_reg, Q2_reg : sfixed(Q_INT_BITS-1 downto -Q_FRAC_BITS);

begin
    -- Device Under Test (DUT) instantiation
    DUT: entity work.goertzel_calc(rtl)
        generic map (
            COEFF_INT_BITS => COEFF_INT_BITS,
            COEFF_FRAC_BITS => COEFF_FRAC_BITS,
            Q_INT_BITS => Q_INT_BITS,
            Q_FRAC_BITS => Q_FRAC_BITS,
            X_INT_BITS => X_INT_BITS,
            X_FRAC_BITS => X_FRAC_BITS
        )
        port map (
            coeff => coeff,
            x_reg => x_reg,
            Q1_reg => Q1_reg,
            Q2_reg => Q2_reg,
            Q0 => Q0
        );

    -- Stimulus process
    stim_proc: process
        variable Q1_var, x_var, Q2_var : real := 0.0;
        variable coeff_var : real := 1.924910472907295;
    begin
        -- Test Case 2
        x_var  := 0.727443130630800;

        coeff <= to_sfixed(coeff_var, coeff);
        x_reg <= to_sfixed(x_var, x_reg);
        Q1_reg <= to_sfixed(Q1_var, Q1_reg);
        Q2_reg <= to_sfixed(Q2_var, Q2_reg);
        wait for 10 ns;

        -- Test Case 3
        x_var  := 1.33363968791620;
        Q1_var := 0.727443130630800;
       
        x_reg <= to_sfixed(x_var, x_reg);
        Q1_reg <= to_sfixed(Q1_var, Q1_reg);
        Q2_reg <= to_sfixed(Q2_var, Q2_reg);
        wait for 10 ns;

        -- Test Case 4
        x_var  := 1.72121029499008;
        Q1_var := 2.73390258851190;
        Q2_var := 0.72744313063080;
        
        x_reg <= to_sfixed(x_var, x_reg);
        Q1_reg <= to_sfixed(Q1_var, Q1_reg);
        Q2_reg <= to_sfixed(Q2_var, Q2_reg);
        wait for 10 ns;

        -- Test Case 5
        x_var  := 1.83545025890262;
        Q1_var := 6.25628488889420;
        Q2_var := 2.73390258851190;
        
        x_reg <= to_sfixed(x_var, x_reg);
        Q1_reg <= to_sfixed(Q1_var, Q1_reg);
        Q2_reg <= to_sfixed(Q2_var, Q2_reg);

        -- Test Case 6
        x_var  := 1.67412051301319;
        Q1_var := 11.1443359745148;
        Q2_var := 6.25628488889420;
        
        x_reg <= to_sfixed(x_var, x_reg);
        Q1_reg <= to_sfixed(Q1_var, Q1_reg);
        Q2_reg <= to_sfixed(Q2_var, Q2_reg);

        -- Test Case 153
        x_var  := -0.600406765051615;
        Q1_var := 169.063415176880;
        Q2_var := 218.187623642547;
        
        x_reg <= to_sfixed(x_var, x_reg);
        Q1_reg <= to_sfixed(Q1_var, Q1_reg);
        Q2_reg <= to_sfixed(Q2_var, Q2_reg);

        wait;
    end process;

end architecture sim;