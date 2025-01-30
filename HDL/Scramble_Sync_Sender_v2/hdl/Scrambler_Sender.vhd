library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Scrambler_Sender is
port
(

	------------ CLOCK ------------
	CLOCK2_50       	:in    	std_logic;
	CLOCK3_50       	:in    	std_logic;
	CLOCK4_50       	:in    	std_logic;
	CLOCK_50        	:in    	std_logic;

	------------ KEY ------------
	KEY             	:in    	std_logic_vector(3 downto 0);

	------------ SW ------------
	SW              	:in    	std_logic_vector(9 downto 0);

	------------ LED ------------
	LEDR            	:out   	std_logic_vector(9 downto 0);

	------------ Audio ------------
	AUD_ADCDAT      	:in    	std_logic;
	AUD_ADCLRCK     	:inout 	std_logic;
	AUD_BCLK        	:inout 	std_logic;
	AUD_DACDAT      	:out   	std_logic;
	AUD_DACLRCK     	:inout 	std_logic;
	AUD_XCK         	:buffer  std_logic;

	------------ I2C for Audio and Video-In ------------
	FPGA_I2C_SCLK   	:out   	std_logic;
	FPGA_I2C_SDAT   	:inout 	std_logic
);

end entity;

---------------------------------------------------------
--  Structural coding
---------------------------------------------------------
architecture rtl of Scrambler_Sender is
-- declare --
	-- For interfacing with the Audio Interface design
	signal Lin, Rin, Lout, Rout : signed(15 downto 0);
	signal Ldone, Rdone : std_logic;

	-- For interfacing with the scrambler
	signal in_real, out_real : std_logic_vector(15 downto 0);
	signal do_en 	  : std_logic;
	signal shift_key  : std_logic_vector(23 downto 0);
	signal sync_start : std_logic := '0';

	-- %% For interfacing with the DTMF Generator %%
	signal command : std_logic;
	signal dtmf_out : signed(15 downto 0);
	signal counter : natural := 0;
	signal tone_digit : std_logic_vector(9 downto 0);
	signal LED : std_logic := '0';
	-- State machine for button pressing 
	type command_state is (WAIT_FOR_PRESS, WAIT_FOR_RELEASE, RELEASE_STATE);
	signal button_state : command_state;
	-- State machine for sending syncronization signal
	type sending_state is (IDLE, SEND_SYNCH_HASH_FIRST, SEND_SYNCH_3, SEND_SYNCH_HASH_FINAL, SCRAMBLE);
	signal dtmf_state : sending_state;

	-- Scrambler Component declaration (Verilog entity)
	component Scrambler_TOP
	port (
		clock  	  : in std_logic;
		reset     : in std_logic;
		di_en 	  :	in std_logic;
		shift_key : in std_logic_vector(23 downto 0);
		in_real	  : in std_logic_vector(15 downto 0);
		do_en	  : out std_logic;
		out_real  : out std_logic_vector(15 downto 0)
	);
	end component Scrambler_TOP;

begin
	-- %% Direct signal routing %%
	LEDR(0) <= sync_start;
	LEDR(1) <= SW(0);
	LEDR(2) <= do_en;
	shift_key <= "101001100010100110000000" when SW(0) = '1' else (others => '0');

	-- For Interfacing the audio data 
	in_real <= std_logic_vector(Lin) when Ldone = '1' else (others => '0');
	Lout <= dtmf_out		 when command = '1' 	else 
			signed(out_real) when do_en = '1'   	else 
			(others => '0');

	-- Audio interface core instantiation
	Audio_interface: entity work.Audio_interface
	generic map (
		SAMPLE_RATE => 32 --in KHz
	)
	port map (
		clk => clock_50,
		rst => not key(0),
		AUD_XCK => AUD_XCK,
		I2C_SCLK => FPGA_I2C_SCLK,
		I2C_SDAT => FPGA_I2C_SDAT,
		AUD_BCLK => AUD_BCLK,
		AUD_DACLRCK => AUD_DACLRCK,
		AUD_ADCLRCK => AUD_ADCLRCK,
		AUD_ADCDAT => AUD_ADCDAT,
		AUD_DACDAT => AUD_DACDAT,
		Lin => Lin,
		Ldone => Ldone,
		Rout => Rout,
		Lout => Lout
	);

	-- DTMF Generator instance
	DTMF_generator : entity work.generate_dtmf_signed(rtl)
	generic map (
		addr_bits => 9,
		data_bits => 16
	)
	port map (
		clk => AUD_XCK,
		rst => not KEY(0),
		command => command,
		tone_digit => tone_digit, 
		dtmf_out => dtmf_out
	);

	-- Scrambler instance
	Scrambler_interface: Scrambler_TOP
	port map (
		clock => AUD_XCK,
		reset => not KEY(0),
		di_en => sync_start,
		do_en => do_en,
		shift_key => shift_key,
		in_real => in_real,
		out_real => out_real
	);

	-- FSM for generating ##3# DTMF sequence
	FSM_GENERATE_DTMF : process(AUD_XCK, KEY(0))
	begin 
		if(KEY(0)='0') then
			tone_digit <= (others => 'X');
			dtmf_state <= IDLE;
			sync_start <= '0';
			counter <= 0;
		elsif(AUD_XCK'event and AUD_XCK='1') then
			case dtmf_state is
				when IDLE => 
					tone_digit <= (others => 'X');
					if (command = '1') then 
						dtmf_state <= SEND_SYNCH_HASH_FIRST;
						tone_digit <= "1000000001"; -- set to sending #
					end if;
				when SEND_SYNCH_HASH_FIRST => 
					if (counter >= 737280) then -- Send for 40 ms
						counter <= 0;
						tone_digit <= "0000000100"; -- set to sending 3
						dtmf_state <= SEND_SYNCH_3;
					else 
						counter <= counter + 1;
					end if;
				when SEND_SYNCH_3 => 
					if (counter >= 368640) then -- Send for 20 ms
						counter <= 0;
						dtmf_state <= SEND_SYNCH_HASH_FINAL;
						tone_digit <= "1000000001"; -- Set to sending #
					else 
						counter <= counter + 1;
					end if;
				when SEND_SYNCH_HASH_FINAL =>
					if (counter >= 368640) then -- Send for 20 ms
						counter <= 0;
						dtmf_state <= SCRAMBLE;
						tone_digit <= (others => 'X');
						sync_start <= '1';
					else 
						counter <= counter + 1;
					end if;
				when SCRAMBLE =>
					if sync_start = '1' then
						dtmf_state <= IDLE;
					end if;
			end case;
		end if;
	end process;

	-- FSM for issueing the "Go" command of transmitting DTMF
	FSM_COMMAND : process(AUD_XCK, KEY(0)) 
	begin 
		if(KEY(0)='0') then
			LED <= '0';
			button_state <= WAIT_FOR_PRESS;
			command <= '0';
		elsif(AUD_XCK'event and AUD_XCK='1') then
			case button_state is
				when WAIT_FOR_PRESS =>
					if (dtmf_state = SCRAMBLE) then 
						command <= '0';
					elsif(KEY(1)='0') then
						button_state <= WAIT_FOR_RELEASE;
					end if;
				when WAIT_FOR_RELEASE =>
					if(KEY(1)='1') then
						button_state <= RELEASE_STATE;
					end if;
				when RELEASE_STATE =>
					command <= not command;
					button_state <= WAIT_FOR_PRESS;
			end case;
		end if;
	end process;


end rtl;