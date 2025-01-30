library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

use std.textio.all;
use std.env.finish;

entity Audio_tb is
end Audio_tb;

architecture sim of Audio_tb is
    ---------------------------------
    -- Emulating entity signals
    ---------------------------------
    -- Generic
    constant SAMPLE_RATE	:  natural := 32; -- in KHz
    -- Input signals
    signal clock            : std_logic := '1';
    signal reset            : std_logic := '1';
    signal Rout, Lout	    : signed(15 downto 0);
    signal AUD_ADCDAT 	    : std_logic;
    -- Buffer signals
    signal AUD_BCLK         : std_logic; 
    signal AUD_XCK 	        : std_logic := '1';
    -- Output signals
    signal AUD_DACLRCK      : std_logic;
    signal AUD_ADCLRCK      : std_logic;
    signal AUD_DACDAT 	    : std_logic;
    signal Rdone, Ldone     : std_logic;
    signal Rin, Lin 	    : signed(15 downto 0);
    
    constant clk_hz : integer := 50e6;
    constant clk_period : time := 1 sec / clk_hz;

    constant AUD_XCK_hz : real := 18.432e6;
    constant AUD_XCK_period : time := 1 sec / AUD_XCK_hz;
    
    --------------------------------------------
    -- Internal constant and signals declaration
    --------------------------------------------
    type state is (wait1, wait2, left1, left2, left3, left4, left5,
    right1, right2, right3, right4, right5);
    signal RCV : state;

    constant word_count	: natural := 18432 / (2 * SAMPLE_RATE);
	constant bit_count 	: natural := word_count / (2 * 16);
	signal SAMPLE_CTRL	: std_logic_vector(15 downto 0);
	signal word_range	: natural;
	signal bit_range : natural;
	
	signal done : std_logic;
	signal LRCK : std_logic;

begin
    
	word_range <= word_count * 2 when SAMPLE_RATE = 96 else
				  word_count;
						
	bit_range <=  bit_count * 2 when SAMPLE_RATE = 96 else
				  bit_count;    

	AUD_DACLRCK <= LRCK;
	AUD_ADCLRCK <= LRCK;  

	Lout <= Lin;
	Rout <= Rin;
    
    -- Generate AUD_XCK clock
    AUD_XCK <= not AUD_XCK after AUD_XCK_period / 2;

	RST_PROC : process is
	begin
		reset <= '0' after 10 ns;
		wait;	
	end process;

	-- ADC Data Generation Process
--	ADC_GEN: process(AUD_BCLK, reset)
--		variable bit_counter : integer range 0 to 15;
--		variable left_data  : std_logic_vector(15 downto 0) := x"AAAA";  -- Test pattern for left
--		variable right_data : std_logic_vector(15 downto 0) := x"5555";  -- Test pattern for right
--		variable data_valid : boolean := false;  -- To handle wait states
--	begin
--		if reset = '1' then
--			AUD_ADCDAT <= '0';
--			bit_counter := 0;
--			data_valid := false;
--		elsif falling_edge(AUD_BCLK) then
--			-- Start data transmission after a complete LRCK cycle
--			if LRCK'event then
--				if LRCK = '1' then  -- Rising edge of LRCK
--					data_valid := true;  -- Start transmitting after wait states
--					bit_counter := 0;
--				end if;
--			end if;
--
--			if data_valid then
--				if LRCK = '1' then  -- Left channel
--					AUD_ADCDAT <= left_data(15 - bit_counter);
--				else               -- Right channel
--					AUD_ADCDAT <= right_data(15 - bit_counter);
--				end if;
--				
--				if bit_counter = 15 then
--					bit_counter := 0;
--				else
--					bit_counter := bit_counter + 1;
--				end if;
--			else
--				AUD_ADCDAT <= '0';  -- Default value during wait states
--			end if;
--		end if;
--	end process;


	-- ADC Data Generation Process
	ADC_GEN: process(AUD_BCLK, reset)
	variable bit_counter : integer range 0 to 15;
	variable left_data1  : std_logic_vector(15 downto 0) := x"AAAA";  -- Test pattern for left
	variable right_data1 : std_logic_vector(15 downto 0) := x"5555";  -- Test pattern for right
	variable left_data2  : std_logic_vector(15 downto 0) := x"F0F0";  -- Second test pattern for left
	variable right_data2 : std_logic_vector(15 downto 0) := x"0F0F";  -- Second test pattern for right
	variable data_valid : boolean := false;  -- To handle wait states
	variable pattern_select : boolean := false;  -- To toggle between patterns
	variable frame_complete : boolean := false;  -- To track frame completion
	begin
	if reset = '1' then
		AUD_ADCDAT <= '0';
		bit_counter := 0;
		data_valid := false;
		pattern_select := false;
		frame_complete := false;
	elsif falling_edge(AUD_BCLK) then
		-- Start data transmission after a complete LRCK cycle
		if LRCK'event then
			if LRCK = '1' then  -- Rising edge of LRCK
				data_valid := true;  -- Start transmitting after wait states
				bit_counter := 0;
				if frame_complete then
					pattern_select := not pattern_select;  -- Toggle pattern
					frame_complete := false;
				end if;
			end if;
		end if;

		if data_valid then
			if LRCK = '1' then  -- Left channel
				if not pattern_select then
					AUD_ADCDAT <= left_data1(15 - bit_counter);
				else
					AUD_ADCDAT <= left_data2(15 - bit_counter);
				end if;
			else               -- Right channel
				if not pattern_select then
					AUD_ADCDAT <= right_data1(15 - bit_counter);
				else
					AUD_ADCDAT <= right_data2(15 - bit_counter);
				end if;
			end if;
			
			if bit_counter = 15 then
				bit_counter := 0;
				if LRCK = '0' then  -- End of right channel
					frame_complete := true;
				end if;
			else
				bit_counter := bit_counter + 1;
			end if;
		else
			AUD_ADCDAT <= '0';  -- Default value during wait states
		end if;
	end if;
	end process;
		
    -------------------------------------------------
	-- The bit clock (BCLK) and left/right clock (LRCK) 
	-------------------------------------------------      
    Aud_Bclock: process(AUD_XCK, reset) is
		variable bcount : integer range 0 to bit_count * 2;
		variable wcount : integer range 0 to word_count * 2;
	begin
		if(reset = '1') then
			AUD_BCLK <= '0';
			LRCK <= '1';
			bcount := 0;
			wcount := 0;
		elsif(AUD_XCK'event and AUD_XCK = '1') then
			if(bcount >= bit_range - 1) then
				bcount := 0;
				AUD_BCLK <= not AUD_BCLK;
			else
				bcount := bcount + 1;
			end if;
			if(wcount >= word_range - 1) then
				wcount := 0;
				LRCK <= not LRCK;
			else
				wcount := wcount + 1;
			end if;			
		end if;
	end process;

	-------------------------------------------------------------
	-- Send Audio data Rout and Lout to DAC via AUD_DACDAT
	-- Receive audio data from ADC; AUD_ADCDAT --> Rin and Lin.
	--------------------------------------------------------------
	Aud_RCV_XMT: process(AUD_XCK, reset)
		variable k: integer range 0 to 15;
	begin
		if(reset = '1') then			
			k := 0;
			RCV <= wait1;
			Rdone <= '0';
			Ldone <= '0';	
		elsif(AUD_XCK'event AND AUD_XCK = '1') then
			case RCV is
				when wait1 =>	
					if(LRCK='0') then RCV <= wait2; end if;
				when wait2 =>	
					Rdone <= '0';
					if(LRCK='1') then RCV <= left1; end if;
				when left1 =>
					if(AUD_BCLK='0') then RCV <= left2; end if;
					AUD_DACDAT <= Lout(15-k);
				when left2 =>
					if(AUD_BCLK='1') then 
						RCV <= left3;	
						Lin(15-k) <= AUD_ADCDAT;
					end if;
				when left3 =>
					if (k >= 15) then
						k := 0;
					else
						k := k+1;  
					end if;
					RCV <= left4;
				when left4 =>
					if(k = 0) then
						RCV <= left5;
					else 
						RCV <= left1; 
					end if;
				when left5 =>
					Ldone <= '1';
					RCV <= right1;
		------------------------------------------------ 		
				when right1 =>
					if(AUD_BCLK='0') then RCV <= right2; end if;
					AUD_DACDAT <= Rout(15-k);
					Ldone <= '0';
				when right2 =>
					if(AUD_BCLK='1') then 
						RCV <= right3; 
						Rin(15-k) <= AUD_ADCDAT;
					end if;
				when right3 =>
					if (k >= 15) then
						k := 0;
					else
						k := k+1;  
					end if;
					RCV <= right4;
				when right4 =>
					if(k = 0) then 
						RCV <= right5; 
					else 
						RCV <= right1;
					end if;	
				when right5 =>
					Rdone <= '1';
					RCV <= wait2;						
				when OTHERS =>
					RCV <= wait1;
			end case;
		end if;		
	end process;

end architecture;