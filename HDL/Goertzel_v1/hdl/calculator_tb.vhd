library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
use ieee.fixed_pkg.all;

use std.textio.all;
use std.env.finish;

entity calculator_tb is
end calculator_tb;

architecture sim of calculator_tb is

    constant clk_hz : integer := 50e6;
    constant clk_period : time := 1 sec / clk_hz;
    constant DATA_WIDTH : integer := 16;

    -- Q format constant
    constant COEFF_INT_BITS : integer := 2;
    constant COEFF_FRAC_BITS : integer := 14;

    constant Q_INT_BITS : integer := 13;
    constant Q_FRAC_BITS : integer := 3;

    constant X_INT_BITS  : integer   := 2;
    constant X_FRAC_BITS : integer   := 14;

    constant COEFF_Q1_INT_BITS : integer := 14;
    constant COEFF_Q1_FRAC_BITS : integer := 2;

    constant X_MIN_Q2_INT_BITS : integer := 13;
    constant X_MIN_Q2_FRAC_BITS: integer := 3;

    signal clk : std_logic := '1';
    signal rst : std_logic := '1';

    constant coeff : sfixed(COEFF_INT_BITS-1 downto -COEFF_FRAC_BITS) := to_sfixed(1.98113868088715, COEFF_INT_BITS-1, -COEFF_FRAC_BITS);
    constant coeff_signed : signed(DATA_WIDTH - 1 downto 0) := to_signed(32459, DATA_WIDTH); 

    -- Combinational block output (x - Q2)
    signal sub_out : sfixed(Q_INT_BITS  downto -X_FRAC_BITS);
    signal sub_out_signed : signed(Q_INT_BITS + X_FRAC_BITS - 1 downto 0);
    
    signal mult_out : sfixed(COEFF_INT_BITS + Q_INT_BITS - 1 downto -(Q_FRAC_BITS + COEFF_FRAC_BITS));
    signal mult_out_signed: signed(2*DATA_WIDTH-1 downto 0);

    signal add_out : sfixed(COEFF_Q1_INT_BITS  downto -X_MIN_Q2_FRAC_BITS);
    signal add_out_signed : signed(COEFF_Q1_INT_BITS + X_MIN_Q2_FRAC_BITS - 1 downto 0);

    -- Intermediary signal 
    signal coeff_Q1 : sfixed(COEFF_Q1_INT_BITS-1 downto -COEFF_Q1_FRAC_BITS);
    signal coeff_Q1_signed : signed(DATA_WIDTH-1 downto 0);
    signal x_min_q2 : sfixed(X_MIN_Q2_INT_BITS-1 downto -X_MIN_Q2_FRAC_BITS);
    signal x_min_q2_signed : signed(DATA_WIDTH-1 downto 0);

    -- Input signal
    signal Q0, Q1, Q2 : sfixed(Q_INT_BITS-1 downto -Q_FRAC_BITS);
    signal Q0_signed, Q1_signed, Q2_signed : signed(DATA_WIDTH - 1 downto 0);
    signal DTMF_sig : sfixed(X_INT_BITS - 1 downto -X_FRAC_BITS);
    signal DTMF_sig_signed : signed(DATA_WIDTH - 1 downto 0);


begin
    clk <= not clk after clk_period / 2;

    mult_out <= coeff * Q1;
    mult_out_signed <= coeff_signed * Q1_signed;

    sub_out <= DTMF_sig - Q2;
    sub_out_signed <= resize(DTMF_sig_signed, Q_INT_BITS + X_FRAC_BITS) - shift_left(resize(Q2_signed, Q_INT_BITS + X_FRAC_BITS), X_FRAC_BITS - Q_FRAC_BITS);

    add_out <= coeff_Q1 + x_min_q2;
    add_out_signed <= shift_left(resize(coeff_Q1_signed, COEFF_Q1_INT_BITS + X_MIN_Q2_FRAC_BITS), X_MIN_Q2_FRAC_BITS - COEFF_Q1_FRAC_BITS) + resize(x_min_q2_signed, COEFF_Q1_INT_BITS + X_MIN_Q2_FRAC_BITS);

    -- Converting to its appropriate value
    coeff_Q1 <= resize(mult_out, COEFF_Q1_INT_BITS-1, -COEFF_Q1_FRAC_BITS);
    coeff_Q1_signed <= resize(shift_right(mult_out_signed + to_signed(2**14, 32), 15), DATA_WIDTH);

    x_min_q2 <= resize(sub_out, X_MIN_Q2_INT_BITS-1, -X_MIN_Q2_FRAC_BITS);
    x_min_q2_signed <= resize(shift_right(sub_out_signed + to_signed(2**10, 27), 11), DATA_WIDTH);

    Q0 <= resize(add_out, Q_INT_BITS-1, -Q_FRAC_BITS);
    Q0_signed <= add_out_signed(COEFF_Q1_INT_BITS + X_MIN_Q2_FRAC_BITS - 1 downto 1);

    SEQUENCER_PROC : process
    begin
        Q1 <= to_sfixed(119.811992966390, Q_INT_BITS-1,  -Q_FRAC_BITS);
        Q1_signed <= to_signed(integer(round(119.811992966390 * 2**3)), 16);

        Q2 <= to_sfixed(115.364211465933, Q_INT_BITS-1,  -Q_FRAC_BITS);
        Q2_signed <= to_signed(integer(round(115.364211465933 * 2**3)), 16);

        DTMF_sig <= to_sfixed(-0.0846782840376775, X_INT_BITS-1,  -X_FRAC_BITS);
        DTMF_sig_signed <= to_signed(integer(round(-0.0846782840376775 * 2**14)), 16);

        wait for clk_period;
        
        Q1 <= to_sfixed(115.364211465933, Q_INT_BITS-1,  -Q_FRAC_BITS);
        Q1_signed <= to_signed(integer(round(115.364211465933 * 2**3)), 16);

        Q2 <= to_sfixed(107.156833288885, Q_INT_BITS-1,  -Q_FRAC_BITS);
        Q2_signed <= to_signed(integer(round(107.156833288885 * 2**3)), 16);

        DTMF_sig <= to_sfixed(-0.166363292334539, X_INT_BITS-1,  -X_FRAC_BITS);
        DTMF_sig_signed <= to_signed(integer(round(-0.166363292334539 * 2**14)), 16);

        wait for clk_period;

        Q1 <= to_sfixed(120.443328353857, Q_INT_BITS-1,  -Q_FRAC_BITS);
        Q1_signed <= to_signed(integer(round(120.443328353857 * 2**3)), 16);

        Q2 <= to_sfixed(119.811992966390, Q_INT_BITS-1,  -Q_FRAC_BITS);
        Q2_signed <= to_signed(integer(round(119.811992966390 * 2**3)), 16);

        DTMF_sig <= to_sfixed(0.0353959799690589, X_INT_BITS-1,  -X_FRAC_BITS);
        DTMF_sig_signed <= to_signed(integer(round(0.0353959799690589 * 2**14)), 16);

        wait for clk_period;

        Q1 <= to_sfixed(114.367421840608, Q_INT_BITS-1,  -Q_FRAC_BITS);
        Q1_signed <= to_signed(integer(round(114.367421840608 * 2**3)), 16);

        Q2 <= to_sfixed(108.591160369218, Q_INT_BITS-1,  -Q_FRAC_BITS);
        Q2_signed <= to_signed(integer(round(108.591160369218 * 2**3)), 16);

        DTMF_sig <= to_sfixed(-0.0720917794243566, X_INT_BITS-1,  -X_FRAC_BITS);
        DTMF_sig_signed <= to_signed(integer(round(-0.0720917794243566 * 2**14)), 16);
        
        wait;

    end process;

end architecture;