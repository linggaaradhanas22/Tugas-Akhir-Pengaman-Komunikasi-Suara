library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.fixed_pkg.all;

--library ieee_proposed;
--use ieee_proposed.fixed_pkg.all;

entity goertzel_calc is
    generic (
        COEFF_INT_BITS : integer := 1;
        COEFF_FRAC_BITS : integer := 15;
    
        Q_INT_BITS : integer    := 11;
        Q_FRAC_BITS : integer   := 5;
    
        X_INT_BITS  : integer   := 2;
        X_FRAC_BITS : integer   := 14
    );
    port (
        coeff  :  in ufixed(COEFF_INT_BITS-1 downto -COEFF_FRAC_BITS);
        x      :  in sfixed(X_INT_BITS-1 downto -X_FRAC_BITS);
        Q1, Q2 :  in sfixed(Q_INT_BITS-1 downto -Q_FRAC_BITS);
        Q0     :  out sfixed(Q_INT_BITS-1 downto -Q_FRAC_BITS)
    );
	 
	function max(a, b: integer) return integer is
	begin
		 if a > b then
			  return a;
		 else
			  return b;
		 end if;
	end function;
	
end entity goertzel_calc;

architecture rtl of goertzel_calc is

    constant MULT_Q1_COEFF_INT_BITS  : integer := Q_INT_BITS + COEFF_INT_BITS;
    constant MULT_Q1_COEFF_FRAC_BITS : integer := Q_FRAC_BITS + COEFF_FRAC_BITS;

	 constant SUB_X_Q2_INT_BITS  : integer := max(X_INT_BITS, Q_INT_BITS) + 1;
	 constant SUB_X_Q2_FRAC_BITS : integer := max(X_FRAC_BITS, Q_FRAC_BITS);    
    
    signal coeff_q1 : sfixed(MULT_Q1_COEFF_INT_BITS  downto -MULT_Q1_COEFF_FRAC_BITS);
    signal x_min_q2 : sfixed(SUB_X_Q2_INT_BITS - 1 downto -SUB_X_Q2_FRAC_BITS);

begin

    coeff_q1 <= to_sfixed(coeff) * Q1;
    x_min_q2 <= x - Q2;
    Q0 <= resize(x_min_q2 + coeff_q1, Q_INT_BITS-1, -Q_FRAC_BITS);

end architecture rtl;