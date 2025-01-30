library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity i2c is
    generic(
        clk_freq : integer := 50000000; -- FPGA Clock frequency
        i2c_freq : integer := 20000 -- I2C 20 KHz 
    );
    port (
        clk         : in std_logic;
        rst         : in std_logic;
        done        : out std_logic;
        I2C_SCLK    : out std_logic;
        I2C_SDAT    : inout std_logic;
        SAMPLE_CTRL : in std_logic_vector(15 downto 0) -- Signal to control sample rate
    );
end i2c;

architecture initialization of i2c is
    signal i2c_clk, i2c_end, SDO : std_logic;
    signal go                    : boolean;
    signal ack                   : std_logic_vector(1 to 3);
    signal num                   : unsigned(3 downto 0);
    signal i2c_out               : std_logic_vector(15 downto 0);

    constant address: std_logic_vector(7 downto 0) := X"34";
    type codec is array (0 to 9) of std_logic_vector(15 downto 0);
    constant Audio_init: codec := 
    (
        X"0015", -- SET_LIN_L// 
        X"0215",
        X"0475",
        X"0675",
        X"0812",
        X"0A06",
        X"0C00",
        X"0E01",
        X"1002",
        X"1201"
    );
    type statei2c is (s1, s2, s3, s4, s5);
    signal AUDIO: statei2c;

begin

    I2C_SDAT <= '0' when SDO = '0' else 'Z'; -- Tri-state buffer for I2C serial Data
---------------------------------------------------------------------------------------
    I2C_Clock_Gen: process(clk, rst) is 
        variable count : integer range 0 to clk_freq/i2c_freq; 
    begin 
        if (rst = '1') then 
            i2c_clk <= '0';
            count := 0;
        elsif (rising_edge(clk)) then 
            if (count < (clk_freq / i2c_freq) - 1) then
                count := count + 1;
            else 
                count := 0;
                i2c_clk <= not i2c_clk;
            end if;
        end if;
    end process;
---------------------------------------------------------------------------------------
    Audio_Config:process(i2c_clk, rst) is 
    begin 
        if (rst = '1') then 
            go <= false;
            num <= "0000";
            done <= '1';
            Audio <= s1;
        elsif (rising_edge(i2c_clk)) then
            case Audio is 
                when s1 => 
                    go <= true;
                    if (num = 8) then 
                        i2c_out <= SAMPLE_CTRL;
                    else 
                        i2c_out <= Audio_init(to_integer(num));
                    end if;
                when s2 => 
                    if (i2c_end = '1') then 
                        go <= false;
                        Audio <= s3;
                    end if;
                when s3 => 
                    if (ack = "000") then
                        Audio <= s4;
                    else 
                        Audio <= s1; 
                    end if;
                when s4 => 
                    num <= num + 1;
                    Audio <= s5;
                when s5 =>     
                    if (num < 10) then
                        Audio <= s1;
                    else 
                        done <= '0'; 
                    end if;
                when others => 
                    Audio <= s1;
            end case; 
        end if;
    end process;
---------------------------------------------------------------------------------------
-- I2C Transmitter receiver (pointer FSM type)
---------------------------------------------------------------------------------------   
    I2C_Port: process(i2c_clk, rst) is 
        variable index: integer range 0 to 32;
    begin
        -- First if block
        if (index <= 1 or index >= 31) then
            I2C_SCLK <= '1'; 
        elsif (index = 2 or index = 30 )then
            I2C_SCLK <= '0';
        else 
            I2C_SCLK <= not i2c_clk;
        end if;

        -- Next if block
        if (rst = '1') then 
            SDO <= '1';
            i2c_end <= '0';
            ack <= "000";
            index := 0;
        elsif (rising_edge(i2c_clk)) then
            if (go) then
                index := index + 1;
            else 
                index := 0; 
            end if; 
            
            if (index = 0) then -- idle condition
                SDO <= '1';
                i2c_end <= '0';
                ack <= "000";
            elsif (index = 1) then
                SDO <= '0';
            elsif (index = 2) then 
                null;
            elsif (index >= 3 and index <= 10) then 
                SDO <= address(10-index); -- send address
            elsif (index = 11) then 
                SDO <= '1';
            elsif (index = 12) then 
                SDO <= i2c_out(15); -- send bit 15
                ack(1) <= I2C_SDAT; -- byte 1 acknowledge
            elsif (index >= 13 and index <= 19) then 
                SDO <= i2c_out(27-index);
            elsif (index = 20) then 
                SDO <= '1';
            elsif (index = 21) then 
                SDO <= i2c_out(7); -- send bit 7
                ack(2) <= I2C_SDAT;
            elsif (index >= 22 and index <= 28) then 
                SDO <= i2c_out(28-index); -- send second byte
            elsif (index = 29) then 
                SDO <= '1';
            elsif (index = 30) then 
                SDO <= '0';
                ack(3) <= I2C_SDAT; -- receive ack for byte 3
            elsif (index = 31) then 
                null;
            elsif (index = 32) then 
                SDO <= '1';
                i2c_end <= '1';
            end if;
        end if;
    end process;
end architecture;
