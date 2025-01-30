library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity i2c_tb is
end i2c_tb;

architecture behavior of i2c_tb is
    -- Component Declaration
    component i2c
        generic(
            clk_freq : integer := 50000000;
            i2c_freq : integer := 20000
        );
        port (
            clk         : in std_logic;
            rst         : in std_logic;
            done        : out std_logic;
            I2C_SCLK    : out std_logic;
            I2C_SDAT    : inout std_logic;
            SAMPLE_CTRL : in std_logic_vector(15 downto 0)
        );
    end component;

    -- Clock period definitions
    constant clk_period : time := 20 ns; -- 50MHz
    
    -- Test bench signals
    signal tb_clk         : std_logic := '0';
    signal tb_rst         : std_logic := '1';
    signal tb_done        : std_logic;
    signal tb_I2C_SCLK    : std_logic;
    signal tb_I2C_SDAT    : std_logic := 'Z';
    signal tb_SAMPLE_CTRL : std_logic_vector(15 downto 0) := X"1000"; -- Example sample rate control
    
    -- Simulation signals
    signal sim_finished : boolean := false;
    signal ack_count   : integer := 0;

begin
    -- Instantiate the Unit Under Test (UUT)
    uut: i2c
        generic map (
            clk_freq => 50000000,
            i2c_freq => 20000
        )
        port map (
            clk         => tb_clk,
            rst         => tb_rst,
            done        => tb_done,
            I2C_SCLK    => tb_I2C_SCLK,
            I2C_SDAT    => tb_I2C_SDAT,
            SAMPLE_CTRL => tb_SAMPLE_CTRL
        );

    -- Clock process
    clk_process: process
    begin
        while not sim_finished loop
            tb_clk <= '0';
            wait for clk_period/2;
            tb_clk <= '1';
            wait for clk_period/2;
        end loop;
        wait;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        -- Hold reset for 100 ns
        tb_rst <= '1';
        wait for 100 ns;
        
        -- Release reset
        tb_rst <= '0';
        wait for clk_period*2;
        
        -- Wait for initialization sequence
        while tb_done = '1' loop
            wait for clk_period;
        end loop;
        
        -- Continue simulation for some time to observe behavior
        wait for 1 ms;
        
        -- End simulation
        sim_finished <= true;
        wait;
    end process;

    -- I2C Slave (WM8731) emulation process
    slave_proc: process
    begin
        wait until falling_edge(tb_I2C_SCLK);
        
        -- Emulate slave acknowledgment
        if tb_I2C_SDAT = 'Z' then
            tb_I2C_SDAT <= '0';  -- ACK
            ack_count <= ack_count + 1;
            wait for clk_period;
            tb_I2C_SDAT <= 'Z';
        end if;
        
        wait for clk_period;
    end process;

    -- Monitor process
    monitor_proc: process
    begin
        wait until rising_edge(tb_clk);
        
        if tb_done = '0' then
            report "Initialization complete" severity note;
        end if;
        
        -- Monitor I2C transactions
        if tb_I2C_SCLK'event then
            report "SCLK transition detected" severity note;
        end if;
        
        wait for clk_period;
    end process;

end behavior;