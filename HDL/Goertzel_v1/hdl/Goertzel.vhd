library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

--library ieee_proposed;
use ieee.fixed_pkg.all;

entity Goertzel is
    generic (
        DATA_WIDTH : integer := 16;
        BLOCK_SIZE : integer := 640;
        COEFF      : real := 1.98113868088715
    );
    port (
        clk : in std_logic;
        rst : in std_logic;

        -- Input bus signals
        in_ready : buffer std_logic;
        in_valid : in std_logic;
        DTMF_sig : in std_logic_vector(DATA_WIDTH-1 DOWNTO 0);

        -- Output bus signals
        out_ready : in std_logic;
        out_valid : buffer std_logic;
        Q0, Q1, Q2    : out std_logic_vector(DATA_WIDTH-1 DOWNTO 0) 

    );
end Goertzel;

architecture rtl of Goertzel is
    
    -- Constant for determining the Q format (obtained from MATLAB Fixed-point tools)
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
    
    constant TEMP_INT_BITS     : integer := 27;
    constant TEMP_FRAC_BITS    : integer := 3; 

    -- Constant for calculating the sfixed representation of coeff
    constant coeff_sfixed : sfixed(COEFF_INT_BITS-1 downto -COEFF_FRAC_BITS) := to_sfixed(coeff, COEFF_INT_BITS-1, -COEFF_FRAC_BITS);
    
    --%% Declaring register %%
    -- Temporary register
    signal coeff_Q1 : sfixed(COEFF_Q1_INT_BITS-1 downto -COEFF_Q1_FRAC_BITS); -- Format: Signed Q14.2
    signal x_min_q2 : sfixed(X_MIN_Q2_INT_BITS-1 downto -X_MIN_Q2_FRAC_BITS); -- Format: Signed Q13.3
    -- Input sample register
    signal DTMF_sampled : sfixed(X_INT_BITS - 1 downto -X_FRAC_BITS); -- Format: Signed Q2.14
    -- Delay register
    signal Q0_reg, Q1_reg, Q2_reg   : sfixed(Q_INT_BITS-1 downto -Q_FRAC_BITS); -- Format : Signed Q13.3
    -- Accumulator temporary register
    --signal temp : sfixed(TEMP_INT_BITS-1 downto -TEMP_FRAC_BITS); -- Format: Signed Q27.3

    --%% Declaring signals for each combinational block %%
    -- Signals for multiplier (signed Q2.14 with signed Q13.3)
    signal mult_a : sfixed(COEFF_INT_BITS-1 downto -COEFF_FRAC_BITS); -- For coeff   
    signal mult_b : sfixed(Q_INT_BITS-1 downto -Q_FRAC_BITS); -- For Q1
    signal mult_out : sfixed(COEFF_INT_BITS + Q_INT_BITS - 1 downto -(Q_FRAC_BITS + COEFF_FRAC_BITS)); -- 32 bit

    -- Signals for substraction (signed Q2.14 with signed Q13.3)
    signal sub_a : sfixed(X_INT_BITS - 1 downto -X_FRAC_BITS); -- For DTMF signal
    signal sub_b : sfixed(Q_INT_BITS-1 downto -Q_FRAC_BITS); -- For Q2 
    signal sub_out : sfixed(Q_INT_BITS  downto -X_FRAC_BITS); -- 28 bit 
    
    -- Signals for the adder (signed Q14.2 with signed Q13.3)
    signal add_a : sfixed(COEFF_Q1_INT_BITS-1 downto -COEFF_Q1_FRAC_BITS); -- For coeff_Q1
    signal add_b : sfixed(X_MIN_Q2_INT_BITS-1 downto -X_MIN_Q2_FRAC_BITS); -- For x_min_Q2
    signal add_out : sfixed(COEFF_Q1_INT_BITS  downto -X_MIN_Q2_FRAC_BITS); -- 18 bit 

    -- %% Declaring counter %%
    -- Counter for determining the recursive part length
    signal counter : integer range 0 to BLOCK_SIZE - 1;
    
    type state_type is (IDLE, COMPUTE_FILTER_1, COMPUTE_FILTER_2, COMPUTE_FILTER_3, STORE_TO_TEMP, UPDATE, OUTPUT);
    signal state : state_type;

begin
    -- Multplication for coeff and Q1
    MULT_PROC: process(mult_a, mult_b)
    begin 
        mult_out <= mult_a * mult_b;
    end process;

    -- Subtraction of signed
    SUB_PROC: process(sub_a, sub_b) 
    begin 
        sub_out <= sub_a - sub_b;
    end process;    

    -- Addition of signed
    ADD_PROC: process(add_a, add_b) 
    begin 
        add_out <= add_a + add_b;
    end process;

    GOERTZEL_PROC: process(clk, rst) 
    begin 
        if rst = '1' then
            -- Control signal reset value
            in_ready <= '0';
            out_valid <= '0';
            state <= IDLE;
            
            -- Block counter reset value
            counter <= 0;
            
            -- Delay register reset value
            Q0_reg <= (others => '0');
            Q1_reg <= (others => '0');
            Q2_reg <= (others => '0');

            -- Input register reset value
            DTMF_sampled <= (others => '0');

            -- Intermediate register reset value
            coeff_Q1 <= (others => '0');
            x_min_Q2 <= (others => '0');

        elsif rising_edge(clk) then 
            case state is
                WHEN IDLE => 
                    in_ready <= '1';
                    if in_ready = '1' and in_valid = '1' then 
                        state <= COMPUTE_FILTER_1;
                        in_ready <= '0'; -- The module will not accept any input after consuming data 
                        DTMF_sampled <= to_sfixed(DTMF_sig, X_INT_BITS - 1, -X_FRAC_BITS);
                    end if; 
                WHEN COMPUTE_FILTER_1 =>
                    state <= COMPUTE_FILTER_2;
                    -- load multiplier with coeff and Q1 (multiplication of signed Q2.14)
                    mult_a <= coeff_sfixed;
                    mult_b <= Q1_reg;
                    -- load subtractor with x and Q2 
                    sub_a <= DTMF_sampled;  
                    sub_b <= Q2_reg;
                WHEN COMPUTE_FILTER_2 =>  
                    state <= COMPUTE_FILTER_3;
                    -- store multiplier and subtractor result
                    coeff_Q1 <= resize(mult_out, COEFF_Q1_INT_BITS-1, -COEFF_Q1_FRAC_BITS);
                    x_min_Q2 <= resize(sub_out, X_MIN_Q2_INT_BITS-1, -X_MIN_Q2_FRAC_BITS); 
                WHEN COMPUTE_FILTER_3 =>
                    state <= STORE_TO_TEMP;
                    -- load coeff_Q1 and x_min_Q2 to adder 
                    add_a <= coeff_Q1;
                    add_b <= x_min_Q2;
                WHEN STORE_TO_TEMP =>  
                    state <= UPDATE;
                    -- temp <= resize(add_out, temp'high, temp'low);
                    Q0_reg <= resize(add_out, Q_INT_BITS-1, -Q_FRAC_BITS);
                WHEN UPDATE =>
                    Q2_reg <= Q1_reg;
                    Q1_reg <= Q0_reg;
                    
                    if counter = BLOCK_SIZE - 1 then 
                        counter <= 0;
                        state <= OUTPUT;
                    else
                        counter <= counter + 1;
                        state <= IDLE;
                    end if;
                WHEN OUTPUT =>
                    Q0 <= to_std_logic_vector(Q0_reg);
                    Q1 <= to_std_logic_vector(Q1_reg);
                    Q2 <= to_std_logic_vector(Q2_reg);

                    out_valid <= '1';

                    if out_valid = '1' and out_ready = '1' then
                        state <= IDLE;
                        out_valid <= '0';
                    end if;
            end case;
        end if;  
    end process;

end architecture;