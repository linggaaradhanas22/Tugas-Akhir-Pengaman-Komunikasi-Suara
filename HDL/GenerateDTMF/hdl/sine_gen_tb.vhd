library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use std.textio.all;
use std.env.finish;

entity sine_gen_tb is
end sine_gen_tb;

architecture sim of sine_gen_tb is

  constant addr_bits : integer := 9;
  constant data_bits : integer := 16;

  constant clk_hz : integer := 32e3;
  constant clk_period : time := 1 sec / clk_hz;

  signal clk : std_logic := '1';
  signal rst : std_logic := '1';
  signal phase_incr_low : unsigned(31 downto 0);
  signal phase_incr_high : unsigned(31 downto 0);
  signal data_low : unsigned(data_bits - 1 downto 0);
  signal data_high : unsigned(data_bits - 1 downto 0);
  signal data_out_17  : unsigned(data_bits  downto 0);
  signal data_out_16  : unsigned(data_bits - 1 downto 0);

  procedure print(msg : string) is
    variable l : line;
  begin
    write(l, to_string(now) & " - " & msg);
    writeline(output, l);
  end procedure;

begin

  clk <= not clk after clk_period / 2;

  DUT_LOW : entity work.sine_gen(rtl)
  generic map (
    addr_bits => addr_bits,
    data_bits => data_bits
  )
  port map (
    clk => clk,
    rst => rst,
    phase_incr => phase_incr_low,
    data => data_low
  );

  DUT_HIGH : entity work.sine_gen(rtl)
  generic map (
    addr_bits => addr_bits,
    data_bits => data_bits
  )
  port map (
    clk => clk,
    rst => rst,
    phase_incr => phase_incr_high,
    data => data_high
  );

  ADDER_PROC : process(data_low, data_high)
  begin 
    --data_out <= data_low + data_high;
    data_out_17 <= resize(data_low, 17) + resize(data_high, 17); 
    --resize(data_low + data_high, data_out'length); 
    --
  end process;

  data_out_16 <= data_out_17(16) & data_out_17(15 downto 1);

  SEQUENCER_PROC : process
  begin
    print("Starting simulation with generics:" & LF &
      "   addr_bits = " & to_string(addr_bits) & LF &
      "   data_bits = " & to_string(data_bits) & LF &
      "We will test setting different values on the phase_incr input." & LF);

    wait for clk_period * 2;

    rst <= '0';

    print("Test generate DTMF tone 1");
    -- 50 Mhz Clock system
--    phase_incr_low <= to_unsigned(59869, phase_incr_low'length);
--    phase_incr_high <= to_unsigned(103842, phase_incr_high'length);
    phase_incr_low <= to_unsigned(86052438, phase_incr_low'length);
    phase_incr_high <= to_unsigned(140965780, phase_incr_high'length);
    wait for 20 ms;

    print("Test silencing output");
    phase_incr_low <= to_unsigned(0, phase_incr_low'length);
    phase_incr_high <= to_unsigned(0, phase_incr_high'length);
    wait for 20 ms;

    print("Testing generate DTMF tone 9");
    -- 50 Mhz clock system
--    phase_incr_low <= to_unsigned(103842, phase_incr_low'length);
--    phase_incr_high <= to_unsigned(126858, phase_incr_high'length);

    -- 32 kHz clock system
    phase_incr_low <= to_unsigned(113006493, phase_incr_low'length);
    phase_incr_high <= to_unsigned(140965780, phase_incr_high'length);
    wait for 20 ms;

    print("Simulation done. Check the waveform.");
    finish;
  end process;

end architecture;