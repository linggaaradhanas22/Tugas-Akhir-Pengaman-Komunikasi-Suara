library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.fixed_pkg.all;

entity fixed_point_tb is
end fixed_point_tb;

architecture behavior of fixed_point_tb is

    constant COEFF_INT_BITS : natural := 1;
    constant COEFF_FRAC_BITS : natural := 15;

    constant Q_INT_BITS : natural := 11;
    constant Q_FRAC_BITS : natural := 5;

    constant X_INT_BITS  : natural := 2;
    constant X_FRAC_BITS : natural := 14;

    constant MULT_Q1_COEFF_INT_BITS  : integer := Q_INT_BITS + COEFF_INT_BITS;
    constant MULT_Q1_COEFF_FRAC_BITS : integer := Q_FRAC_BITS + COEFF_FRAC_BITS;

    constant SUB_X_Q2_INT_BITS       : integer := maximum(X_INT_BITS, Q_INT_BITS) + 1;
    constant SUB_X_Q2_FRAC_BITS      : integer := maximum(X_FRAC_BITS, Q_FRAC_BITS);

    constant Q0_RES_INT_BITS         : integer := maximum(MULT_Q1_COEFF_INT_BITS, SUB_X_Q2_INT_BITS) + 1;
    constant Q0_RES_FRAC_BITS        : integer := maximum(MULT_Q1_COEFF_FRAC_BITS, SUB_X_Q2_FRAC_BITS);
    
    signal coeff : sfixed(COEFF_INT_BITS downto -COEFF_FRAC_BITS); -- The last bit is the sign bit
    signal Q0, Q1, Q2 : sfixed(Q_INT_BITS-1 downto -Q_FRAC_BITS);
    signal x    : sfixed(X_INT_BITS-1 downto -X_FRAC_BITS);
    signal coeff_q1 : sfixed(MULT_Q1_COEFF_INT_BITS  downto -MULT_Q1_COEFF_FRAC_BITS);
    signal x_min_q2 : sfixed(SUB_X_Q2_INT_BITS - 1 downto -SUB_X_Q2_FRAC_BITS);
    signal Q0_res   : sfixed(Q0_RES_INT_BITS  downto -Q0_RES_FRAC_BITS);
    
    
begin

    coeff_q1 <= coeff * Q1;
    x_min_q2 <= x - Q2;
    -- Q0_res <= x_min_q2 + coeff_q1;
    Q0 <= resize(x_min_q2 + coeff_q1, Q0);

    -- Stimulus process
    stim_proc: process
        variable coeff_var, Q1_var, x_var, Q2_var : real := 0.0;
    begin
        coeff_var := 1.924910472907295;
        Q1_var := 0.727443130630800;
        x_var  := 1.333639687916201;
        
        -- Convert real numbers to fixed-point
        coeff <= to_sfixed(coeff_var, coeff);
        Q1 <= to_sfixed(Q1_var, Q1);
        x <= to_sfixed(x_var, x);
        Q2 <= to_sfixed(Q2_var, Q2);

        wait for 10 ns;
        
    end process;
    
end behavior;