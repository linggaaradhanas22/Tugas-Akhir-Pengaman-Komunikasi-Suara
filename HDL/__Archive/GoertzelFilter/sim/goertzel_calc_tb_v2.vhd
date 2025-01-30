library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.fixed_pkg.all;
use STD.textio.all;

entity goertzel_calc_tb_v2 is
end goertzel_calc_tb_v2;

architecture sim of goertzel_calc_tb_v2 is

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

    file input_file: text;

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
        variable file_line : line;
        variable read_ok : boolean;
        variable space : character;
    begin
        -- Open the input file
        file_open(input_file, "goertzel_selected_data.txt", read_mode);

        while not endfile(input_file) loop
            -- Read a line from the file
            readline(input_file, file_line);
            
            -- Read values from the line
            -- Format expected: x_value Q1_value Q2_value
            read(file_line, x_var, read_ok);
            if not read_ok then
                report "Failed to read x_var" severity error;
                exit;
            end if;
            
            read(file_line, space);  -- Read space between numbers
            read(file_line, Q1_var, read_ok);
            if not read_ok then
                report "Failed to read Q1_var" severity error;
                exit;
            end if;
            
            read(file_line, space);  -- Read space between numbers
            read(file_line, Q2_var, read_ok);
            if not read_ok then
                report "Failed to read Q2_var" severity error;
                exit;
            end if;
            
            -- Apply the values to the signals
            coeff <= to_sfixed(coeff_var, coeff);
            x_reg <= to_sfixed(x_var, x_reg);
            Q1_reg <= to_sfixed(Q1_var, Q1_reg);
            Q2_reg <= to_sfixed(Q2_var, Q2_reg);
            
            wait for 10 ns;
        end loop;

        -- Close the file
        file_close(input_file);
        wait;
    end process;

end architecture sim;