library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ieee_proposed;
use ieee_proposed.fixed_pkg.all;


entity goertzel_calc_registered is
    generic (
        COEFF_INT_BITS : integer := 2;
        COEFF_FRAC_BITS : integer := 14;
    
        Q_INT_BITS : integer    := 11;
        Q_FRAC_BITS : integer   := 5;
    
        X_INT_BITS  : integer   := 2;
        X_FRAC_BITS : integer   := 14
    );
    port (
        clk    : in std_logic;
        rst    : in std_logic;
        coeff  : in sfixed(COEFF_INT_BITS-1 downto -COEFF_FRAC_BITS);
        x      : in sfixed(X_INT_BITS-1 downto -X_FRAC_BITS);
        Q0_reg, Q1_reg, Q2_reg : out sfixed(Q_INT_BITS-1 downto -Q_FRAC_BITS)
    );
	 
	function max(a, b: integer) return integer is
	begin
		if a > b then
			return a;
		else
			return b;
		end if;
	end function;
	
end entity goertzel_calc_registered;

architecture rtl of goertzel_calc_registered is
    constant MULT_Q1_COEFF_INT_BITS  : integer := Q_INT_BITS + COEFF_INT_BITS;
    constant MULT_Q1_COEFF_FRAC_BITS : integer := Q_FRAC_BITS + COEFF_FRAC_BITS;
    constant SUB_X_Q2_INT_BITS  : integer := max(X_INT_BITS, Q_INT_BITS) + 1;
    constant SUB_X_Q2_FRAC_BITS : integer := max(X_FRAC_BITS, Q_FRAC_BITS);    
    
    signal coeff_q1 : sfixed(MULT_Q1_COEFF_INT_BITS downto -MULT_Q1_COEFF_FRAC_BITS);
    signal x_min_q2 : sfixed(SUB_X_Q2_INT_BITS-1 downto -SUB_X_Q2_FRAC_BITS);
    
    -- Combinational calculation result
    signal Q0_next : sfixed(Q_INT_BITS-1 downto -Q_FRAC_BITS);
    
    -- Internal register signals
    signal Q0_int, Q1_int, Q2_int : sfixed(Q_INT_BITS-1 downto -Q_FRAC_BITS);

begin
    -- Combinational logic
    coeff_q1 <= to_sfixed(coeff) * Q1_int;  -- Use Q1_int instead of direct input
    x_min_q2 <= x - Q2_int;                 -- Use Q2_int instead of direct input
    Q0_next <= resize(x_min_q2 + coeff_q1, Q_INT_BITS-1, -Q_FRAC_BITS);

    -- Sequential logic
    process(clk, rst)
    begin
        if rst = '1' then
            -- Reset all registers to zero
            Q0_int <= to_sfixed(0, Q_INT_BITS-1, -Q_FRAC_BITS);
            Q1_int <= to_sfixed(0, Q_INT_BITS-1, -Q_FRAC_BITS);
            Q2_int <= to_sfixed(0, Q_INT_BITS-1, -Q_FRAC_BITS);
        elsif rising_edge(clk) then
            -- Update registers
            Q0_int <= Q0_next;   -- New calculation result
            Q1_int <= Q0_int;    -- Previous Q0
            Q2_int <= Q1_int;    -- Previous Q1
        end if;
    end process;

    -- Output assignments
    Q0_reg <= Q0_int;
    Q1_reg <= Q1_int;
    Q2_reg <= Q2_int;

end architecture rtl;

