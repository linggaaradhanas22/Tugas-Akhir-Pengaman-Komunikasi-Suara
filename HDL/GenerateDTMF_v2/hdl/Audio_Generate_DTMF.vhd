library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Audio_Generate_DTMF is
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
	AUD_XCK         	:buffer   	std_logic;

	------------ I2C for Audio and Video-In ------------
	FPGA_I2C_SCLK   	:out   	std_logic;
	FPGA_I2C_SDAT   	:inout 	std_logic
);

end entity;



---------------------------------------------------------
--  Structural coding
---------------------------------------------------------


architecture rtl of Audio_Generate_DTMF is
	
	signal Lin, Lout, Rout : signed(15 downto 0);
	signal command : std_logic := '0';
	signal dtmf_out : signed(15 downto 0);
	signal LED : std_logic := '0';
	signal tone_digit : std_logic_vector(9 downto 0);
	signal counter : integer := 0;

	type command_state is (WAIT_FOR_PRESS, WAIT_FOR_RELEASE, RELEASE_STATE);
	signal button_state : command_state; 

	type sending_state is (IDLE, SEND_SYNCH_HASH_FIRST, SEND_SYNCH_3, SEND_SYNCH_HASH_FINAL, SILENT);
	signal dtmf_state : sending_state;

begin

	Lout <= dtmf_out;
	Rout <= dtmf_out;
	
	LEDR(0) <= LED;

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

	-- FSM for generating ##3# DTMF sequence
	FSM_GENERATE_DTMF : process(AUD_XCK, KEY(0))
	begin 
		if(KEY(0)='0') then
			tone_digit <= (others => 'X');
			dtmf_state <= IDLE;
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
					if (command = '0') then 
						dtmf_state <= IDLE;
						tone_digit <= (others => 'X');
					else 
						if (counter >= 737280) then
							counter <= 0;
							tone_digit <= "0000000100"; -- set to sending 3
							dtmf_state <= SEND_SYNCH_3;
						else 
							counter <= counter + 1;
						end if;
					end if;
				when SEND_SYNCH_3 => 
					if (command = '0') then 
						dtmf_state <= IDLE;
						tone_digit <= (others => 'X');
					else 
						if (counter >= 368640) then
							counter <= 0;
							dtmf_state <= SEND_SYNCH_HASH_FINAL;
							tone_digit <= "1000000001";
						else 
							counter <= counter + 1;
						end if;
					end if;
				when SEND_SYNCH_HASH_FINAL =>
					if (command = '0') then 
						dtmf_state <= IDLE;
						tone_digit <= (others => 'X');
					else 
						if (counter >= 368640) then -- If it reaches 20 ms based on the clock
							counter <= 0;
							dtmf_state <= SILENT;
							tone_digit <= (others => 'X');
						else 
							counter <= counter + 1;
						end if;
					end if;
				when SILENT =>
					if (command = '0') then 
						dtmf_state <= IDLE;
					else 
						if (counter >= 18432000) then
							counter <= 0;
							dtmf_state <= SEND_SYNCH_HASH_FIRST;
							tone_digit <= "1000000001"; -- set to sending #
						else 
							counter <= counter + 1;
						end if;
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
		elsif(AUD_XCK'event and AUD_XCK='1') then
			case button_state is
				when WAIT_FOR_PRESS =>
					if(KEY(1)='0') then
						button_state <= WAIT_FOR_RELEASE;
					end if;
				when WAIT_FOR_RELEASE =>
					if(KEY(1)='1') then
						button_state <= RELEASE_STATE;
					end if;
				when RELEASE_STATE =>
					LED <= not LED;
					command <= not command;
					button_state <= WAIT_FOR_PRESS;
				when others =>
					button_state <= WAIT_FOR_PRESS;
			end case;
		end if;
	end process;

end rtl;

