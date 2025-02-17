
---------------------------------------------------------
--  This code is generated by Terasic System Builder
---------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity DTMFcorr is
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
architecture rtl of DTMFcorr is

-- declare --
	signal Lin, Rin, Lout, Rout : signed(15 downto 0);
	signal Ldone, Rdone : std_logic;

	-- signal out_ready : std_logic := 1;
	signal out_valid : std_logic;
	signal Aud_interface_ready : std_logic := '1';
	signal enable : std_logic := '0';

begin

-- body --
	
	LEDR(0) <= enable;
		
  -- Audio interface core instantiation
  Audio_interface: entity work.Audio_interface
  Generic map (
	SAMPLE_RATE => 32 --in KHz
  )
  Port map (
		clk => clock_50,
		rst => not KEY(0),
		AUD_XCK => AUD_XCK,
		I2C_SCLK => FPGA_I2C_SCLK,
      I2C_SDAT => FPGA_I2C_SDAT,
		AUD_BCLK => AUD_BCLK,
		AUD_DACLRCK => AUD_DACLRCK,
		AUD_ADCLRCK => AUD_ADCLRCK,
		AUD_ADCDAT => AUD_ADCDAT,
		AUD_DACDAT => AUD_DACDAT,
		Rin => Rin,
		Lin => Lin,
		Rout => Rout,
		Lout => Lout,
		Rdone => Rdone,
		Ldone => Ldone
	);
	
	DTMF_corr: entity work.toplevel_iq
	generic map (
		mult_INT_BITS   => 2,
		mult_FRAC_BITS  => 14,
		acc_INT_BITS    => 6,
		acc_FRAC_BITS   => 10,
		power_INT_BITS  => 10,
		power_FRAC_BITS => 6,
		batch_INT_BITS  => 14,
		batch_FRAC_BITS => 2
	)
	port map (
		clk		  => AUD_XCK,
		reset 	  => not KEY(0),
		in_valid  => Ldone, 
		out_ready => '1',
		-- Output port 
		in_ready  => Aud_interface_ready,
		out_valid => out_valid,
		-- Data interfacing
		dataA  	  => std_logic_vector(Lin),
		enable    => enable
	);

end rtl;

