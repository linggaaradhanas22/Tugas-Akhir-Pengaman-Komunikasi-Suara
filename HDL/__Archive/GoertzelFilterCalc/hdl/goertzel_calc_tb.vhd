library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.fixed_pkg.all;

entity goertzel_calc_tb is
end goertzel_calc_tb;

architecture tb of goertzel_calc_tb is

    -- Constants
    constant COEFF_INT_BITS : integer := 1;
    constant COEFF_FRAC_BITS : integer := 15;
    constant Q_INT_BITS : integer := 11;
    constant Q_FRAC_BITS : integer := 5;
    constant X_INT_BITS : integer := 2;
    constant X_FRAC_BITS : integer := 14;

    -- Signals
    signal coeff : ufixed(COEFF_INT_BITS-1 downto -COEFF_FRAC_BITS);
    signal x : sfixed(X_INT_BITS-1 downto -X_FRAC_BITS);
    signal Q1, Q2 : sfixed(Q_INT_BITS-1 downto -Q_FRAC_BITS);
    signal Q0 : sfixed(Q_INT_BITS-1 downto -Q_FRAC_BITS);

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
            x => x,
            Q1 => Q1,
            Q2 => Q2,
            Q0 => Q0
        );

    -- Stimulus process
    stim_proc: process
        variable Q1_var, x_var, Q2_var : real := 0.0;
        variable coeff_var : real := 1.924910472907295;
    begin
        -- Test Case 1
        x_var  := 0.727443130630800;

        coeff <= to_ufixed(coeff_var, coeff);
        x <= to_sfixed(x_var, x);
        Q1 <= to_sfixed(Q1_var, Q1);
        Q2 <= to_sfixed(Q2_var, Q2);
        wait for 10 ns;

        -- Test Case 2
        x_var  := 1.33363968791620;
        Q1_var := 0.727443130630800;
       
        x <= to_sfixed(x_var, x);
        Q1 <= to_sfixed(Q1_var, Q1);
        Q2 <= to_sfixed(Q2_var, Q2);
        wait for 10 ns;

        -- Test Case 3
        x_var  := 1.72121029499008;
        Q1_var := 2.73390258851190;
        Q2_var := 0.72744313063080;
        
        x <= to_sfixed(x_var, x);
        Q1 <= to_sfixed(Q1_var, Q1);
        Q2 <= to_sfixed(Q2_var, Q2);
        wait for 10 ns;

        -- Test Case 4
        x_var  := 1.83545025890262;
        Q1_var := 6.25628488889420;
        Q2_var := 2.73390258851190;
        
        x <= to_sfixed(x_var, x);
        Q1 <= to_sfixed(Q1_var, Q1);
        Q2 <= to_sfixed(Q2_var, Q2);

        wait;
    end process;

end architecture tb;
