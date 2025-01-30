library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.fixed_pkg.all;
use ieee.math_real.all;
use std.textio.all;

entity Goertzel_770_tb is
end Goertzel_770_tb;

architecture sim of Goertzel_770_tb is

    constant clk_hz : integer := 50e6;
    constant clk_period : time := 1 sec / clk_hz; -- Clock of 10 ns period

    constant sample_clk_hz : integer := 32e3;
    constant sample_clk_period : time := 1 sec / sample_clk_hz; -- Clock of 10 ns period

    constant DATA_WIDTH : integer := 16;
    constant BLOCK_SIZE : integer := 640;
    constant COEFF      : real    := 1.97537668119028; -- For frequency 770 Hz 

    -- Constant for determining the Q format (obtained from MATLAB Fixed-point tools)
    constant X_INT_BITS  : integer   := 2;
    constant X_FRAC_BITS : integer   := 14;

    -- Clock for generating sample
    signal sample_clk   : std_logic := '1';

    -- Signals for interfacing with the design
    -- Input port
    signal rst	        : std_logic := '1';
    signal clk          : std_logic := '1';
    signal in_ready     : std_logic;
    signal in_valid     : std_logic := '0';
    signal DTMF_sig     : std_logic_vector(DATA_WIDTH - 1 downto 0);
    -- Output port
    signal Q0           : std_logic_vector(DATA_WIDTH-1 DOWNTO 0);
    signal Q1           : std_logic_vector(DATA_WIDTH-1 DOWNTO 0);
    signal Q2           : std_logic_vector(DATA_WIDTH-1 DOWNTO 0);
    signal out_ready    : std_logic := '0';
    signal out_valid    : std_logic;

begin
    -- Component instantiation
    DUT : entity work.Goertzel(rtl)
    generic map (
        DATA_WIDTH => DATA_WIDTH,
        BLOCK_SIZE => BLOCK_SIZE,
        COEFF      => COEFF 
    )
    port map (
        clk => clk,
        rst => rst,

        -- Input bus signals
        in_ready => in_ready,
        in_valid => in_valid,
        DTMF_sig => DTMF_sig,

        -- Output bus signals
        out_ready => out_ready,
        out_valid => out_valid,
        Q0    => Q0, 
        Q1    => Q1,
        Q2    => Q2 
    );
    
    -- Generate clock process
    clk <= not clk after clk_period / 2;
    sample_clk <= not sample_clk after sample_clk_period/2;

    RST_PROC: process  
    begin 
        rst <= '0' after 3 ns;
        wait;
    end process;

    DATA_READ: process
        file data_file    : text open read_mode is "dtmf_1.txt";
        variable x_var    : real := 0.0;
        variable line_in  : line;
    begin
--        x_in <= to_sfixed(0.000000000000000, x_in);
--        wait for 60 ns;
--        x_in <= to_sfixed(0.727443130630800, x_in);
--        wait;
        while not endfile(data_file) loop
            readline(data_file, line_in);
            read(line_in, x_var);
            DTMF_sig <= to_std_logic_vector(to_sfixed(x_var, X_INT_BITS-1, -X_FRAC_BITS));
            in_valid <= '1';
            wait for clk_period;
            in_valid <= '0';
            wait for sample_clk_period;
        end loop;

        file_close(data_file);
        wait;
    end process;

end architecture;