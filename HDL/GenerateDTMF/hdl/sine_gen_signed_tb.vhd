library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sine_gen_signed_tb is
end sine_gen_signed_tb;

architecture sim of sine_gen_signed_tb is

    constant clk_hz : integer := 32e3;
    constant clk_period : time := 1 sec / clk_hz;

    signal clk : std_logic := '1';
    signal rst : std_logic := '1';

    constant addr_bits : integer := 20;
    constant data_bits : integer := 16;

    signal phase_incr : unsigned(31 downto 0); 
    signal data : signed(data_bits - 1 downto 0);

begin

    clk <= not clk after clk_period / 2;

    DUT : entity work.sine_gen_signed(rtl)
    generic map (
      addr_bits => addr_bits,
      data_bits => data_bits
    )
    port map (
      clk => clk,
      rst => rst,
      phase_incr => phase_incr,
      data => data
    );

    SEQUENCER_PROC : process
    begin
        rst <= '0';
        wait for 10 ns;

        phase_incr <= to_unsigned(86052438, phase_incr'length);
        wait for 20 ms;

        phase_incr <= to_unsigned(0, phase_incr'length);

        wait;
    end process;

end architecture;