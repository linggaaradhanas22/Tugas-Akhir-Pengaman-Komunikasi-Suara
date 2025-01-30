library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.fixed_pkg.all;

entity power_tb is
end power_tb;

architecture sim of power_tb is

    constant clk_hz : integer := 100e6;
    constant clk_period : time := 1 sec / clk_hz;

    constant Q_INT_BITS : integer := 13;
    constant Q_FRAC_BITS : integer := 3;
    constant COEFF_Q1_INT_BITS : integer := 14;
    constant COEFF_Q1_FRAC_BITS : integer := 2;

    signal clk : std_logic := '1';

    -- 697 Hz
    signal Q1_reg : sfixed(Q_INT_BITS-1 downto -Q_FRAC_BITS) := x"B6CE";
    signal Q2_reg : sfixed(Q_INT_BITS-1 downto -Q_FRAC_BITS) := x"B7E4";
    signal coeff_Q1 : sfixed(COEFF_Q1_INT_BITS-1 downto -COEFF_Q1_FRAC_BITS) := x"B892";

    signal Q1_squared : ufixed(2*Q_INT_BITS-1 downto -(2*Q_FRAC_BITS));
    signal Q2_squared : ufixed(2*Q_INT_BITS-1 downto -(2*Q_FRAC_BITS));
    signal coeff_Q1_Q2_ver1 : sfixed(COEFF_Q1_INT_BITS + Q_INT_BITS-1  downto -(COEFF_Q1_FRAC_BITS + Q_FRAC_BITS));
    signal coeff_Q1_Q2_ver2 : ufixed(23 downto 0);

    signal Q1_squared_scaled : ufixed(22 downto 0);
    signal Q2_squared_scaled : ufixed(22 downto 0);
    signal Q1_squared_plus_Q2_squared : ufixed(23 downto 0);
    signal power_fix : ufixed(17 downto 0) := (others => '0');
    signal temp_697: ufixed(16 downto 0) := (others => '0');

    -- 770 Hz
    signal Q1_reg_770 : sfixed(Q_INT_BITS-1 downto -Q_FRAC_BITS) := x"FCE6";
    signal Q2_reg_770 : sfixed(Q_INT_BITS-1 downto -Q_FRAC_BITS) := x"FCD6";
    signal coeff_Q1_770 : sfixed(COEFF_Q1_INT_BITS-1 downto -COEFF_Q1_FRAC_BITS) := x"FCE0";

    signal Q1_squared_770 : ufixed(2*Q_INT_BITS-1 downto -(2*Q_FRAC_BITS));
    signal Q2_squared_770 : ufixed(2*Q_INT_BITS-1 downto -(2*Q_FRAC_BITS));
    signal coeff_Q1_Q2_ver1_770 : sfixed(COEFF_Q1_INT_BITS + Q_INT_BITS-1  downto -(COEFF_Q1_FRAC_BITS + Q_FRAC_BITS));
    signal coeff_Q1_Q2_ver2_770 : ufixed(23 downto 0);

    signal Q1_squared_scaled_770 : ufixed(22 downto 0);
    signal Q2_squared_scaled_770 : ufixed(22 downto 0);
    signal Q1_squared_plus_Q2_squared_770 : ufixed(23 downto 0);
    signal power_fix_770 : ufixed(17 downto 0) := (others => '0');
    signal temp_770: sfixed(16 downto 0) := (others => '0');

begin

    clk <= not clk after clk_period / 2;

    -- 697
    Q1_squared_scaled <= resize(Q1_squared, 22, 0);
    Q2_squared_scaled <= resize(Q2_squared, 22, 0);
    Q1_squared_plus_Q2_squared <= resize(Q1_squared_scaled + Q2_squared_scaled, Q1_squared_plus_Q2_squared);
    power_fix <= resize(Q1_squared_plus_Q2_squared - coeff_Q1_Q2_ver2, 17, 0);

    -- 770
    Q1_squared_scaled_770 <= resize(Q1_squared_770, 22, 0);
    Q2_squared_scaled_770 <= resize(Q2_squared_770, 22, 0);
    Q1_squared_plus_Q2_squared_770 <= resize(Q1_squared_scaled_770 + Q2_squared_scaled_770, Q1_squared_plus_Q2_squared_770);
    power_fix_770 <= resize(Q1_squared_plus_Q2_squared_770 - coeff_Q1_Q2_ver2_770), 17, 0);

    SEQUENCER_PROC : process
    begin
        Q1_squared <= ufixed(Q1_reg * Q1_reg);
        Q2_squared <= ufixed(Q2_reg * Q2_reg);
        coeff_Q1_Q2_ver1 <= coeff_Q1 * Q2_reg;
        coeff_Q1_Q2_ver2 <= resize(ufixed(coeff_Q1 * Q2_reg), coeff_Q1_Q2_ver2);

        -- 770 
        Q1_squared_770 <= ufixed(Q1_reg_770 * Q1_reg_770);
        Q2_squared_770 <= ufixed(Q2_reg_770 * Q2_reg_770);
        coeff_Q1_Q2_ver2_770 <= resize(ufixed(coeff_Q1_770 * Q2_reg_770), coeff_Q1_Q2_ver2_770);

        wait;
    end process;    

end architecture;