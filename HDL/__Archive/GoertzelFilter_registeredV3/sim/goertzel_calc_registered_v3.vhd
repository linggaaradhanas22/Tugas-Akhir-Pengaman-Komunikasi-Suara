library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.fixed_pkg.all;

entity goertzel_calc_registered_v3 is

	generic
	(
        DATA_WIDTH : natural := 16;
		  COEFF_INT_BITS : natural := 2;
        COEFF_FRAC_BITS : natural := 14;
    
        Q_INT_BITS : natural    := 11;
        Q_FRAC_BITS : natural   := 5;
    
        X_INT_BITS  : natural   := 2;
        X_FRAC_BITS : natural   := 14
	);

	port
	(
		clk, start, rst		: in std_logic;
		-- Fixed-point format specifier: (sign).(integer).(fraction)
		x_in						: in sfixed((X_INT_BITS-1) downto -X_FRAC_BITS); -- Format: 1.1.14
		coeff						: in sfixed((COEFF_INT_BITS-1) downto -COEFF_FRAC_BITS); -- Format: 1.1.14
		ready						: out std_logic;
		Q0, Q1, Q2				: out sfixed(Q_INT_BITS-1 downto -Q_FRAC_BITS) -- Format: 1.10.5
	);

end entity;

architecture rtl of goertzel_calc_registered_v3 is
	
	constant BLOCK_SIZE : natural := 320;
	
	type state_type is (idle, load, update, compute);
	signal state_reg, state_next : state_type;
	
	-- %%Defining register calculation
	-- Three register chain registers
	signal Q0_reg, Q1_reg, Q2_reg: sfixed(Q_INT_BITS-1 downto -Q_FRAC_BITS);
	-- input register
	signal x_reg : sfixed((X_INT_BITS-1) downto -X_FRAC_BITS);
	signal n_reg : unsigned(DATA_WIDTH-1 downto 0);

	-- %%Defining signals for calculation
	-- state update signal
	signal Q0_next, Q1_next, Q2_next : sfixed (Q_INT_BITS-1 downto -Q_FRAC_BITS);
	signal x_next : sfixed((X_INT_BITS-1) downto -X_FRAC_BITS);
	signal n_next : unsigned(DATA_WIDTH-1 downto 0);
	
	-- The size is based on the fixed-point designer tools from MATLAB
	signal coeff_q1 : sfixed (Q_INT_BITS downto -Q_FRAC_BITS+1);
	signal x_min_q2 : sfixed (Q_INT_BITS-1 downto -Q_FRAC_BITS);
	
	
begin
	-- Register update circuit 
	process (clk, rst)  
	begin
		if rst = '1' then 
			state_reg <= idle;
			Q0_reg	 <= (others => '0');
			Q1_reg	 <= (others => '0');
			Q2_reg 	 <= (others => '0');
			n_reg		 <= (others => '0');
			x_reg		 <= (others => '0');
		elsif rising_edge(clk) then 
			state_reg <= state_next;
			Q0_reg	 <= Q0_next;
			Q1_reg	 <= Q1_next;
			Q2_reg	 <= Q2_next;
			n_reg		 <= n_next;
			x_reg		 <= x_next;
		end if;
	end process;
	
	-- Combinational logic
	coeff_q1 <= resize(coeff * Q1_reg, coeff_q1);
	x_min_q2 <= resize(x_reg - Q2_reg, x_min_q2);
	
	process (start, Q0_reg, Q1_reg, Q2_reg, x_reg, n_reg, state_reg, x_in, coeff, Q0_next, n_next, coeff_q1, x_min_q2)
	begin 
		-- Default value
		Q0_next <= Q0_reg;
		Q1_next <= Q1_reg;
		Q2_next <= Q2_reg;
		x_next  <= x_reg;
		n_next  <= n_reg;
		ready   <= '0';
		-- Next state logic and output logic
		case state_reg is 
			when idle => 
				if start = '1' then 
					n_next   <= to_unsigned(BLOCK_SIZE, n_next'length);
					Q0_next <= (others => '0');
					Q1_next <= (others => '0');
					Q2_next <= (others => '0');
					x_next  <= (others => '0');
					state_next <= load;
				else 
					state_next <= idle;
				end if; 
				ready <= '1';
			when load => 
				x_next <= x_in;
				state_next <= update;
			when update =>
				Q1_next <= Q0_reg;
				Q2_next <= Q1_reg;
				state_next <= compute;
			when compute => 
				Q0_next 	<= resize(coeff_q1 + x_min_q2, Q0_next);
				n_next   <= n_reg - 1;
				if (n_next /= "0000000000000000") then
					state_next <= load;
				else 
					state_next <= idle;
				end if;
		end case;
	end process; 
	
	-- Output port assignment
	Q0 <= Q0_reg;
	Q1 <= Q1_reg;
	Q2	<=	Q2_reg;
	
end rtl;