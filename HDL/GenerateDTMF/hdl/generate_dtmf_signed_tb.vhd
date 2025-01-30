library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity generate_dtmf_signed_tb is
end generate_dtmf_signed_tb;

architecture sim of generate_dtmf_signed_tb is

    constant clk_hz : integer := 32e3;
    constant clk_period : time := 1 sec / clk_hz;

    constant addr_bits : integer := 9;
    constant data_bits : integer := 16;

    signal clk         : std_logic := '1';
    signal rst         : std_logic := '1';
    signal command     : std_logic := '0';
    signal tone_digit  : std_logic_vector(9 downto 0);
    signal dtmf_out    : signed(data_bits - 1 downto 0);

begin

    clk <= not clk after clk_period / 2;

    DUT : entity work.generate_dtmf_signed(rtl)
    generic map (
        addr_bits => addr_bits,
        data_bits => data_bits
    )
    port map (
        clk => clk,
        rst => rst,
        command    => command,
        tone_digit => tone_digit,
        dtmf_out   => dtmf_out
    );

    SEQUENCER_PROC : process
    begin
        rst <= '0';
        command <= '1';
        wait for 10 ns;

        tone_digit <= "0000000000";
        wait for 20 ms;

        tone_digit <= "0000000001";
        wait for 20 ms;

        wait;
    end process;

end architecture;