-- Copyright (C) 2018  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 18.1.0 Build 625 09/12/2018 SJ Lite Edition"

-- DATE "01/07/2025 23:12:09"

-- 
-- Device: Altera 5CSXFC6D6F31C8 Package FBGA896
-- 

-- 
-- This VHDL file should be used for ModelSim (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	sine_gen IS
    PORT (
	clk : IN std_logic;
	rst : IN std_logic;
	phase_incr : IN std_logic_vector(31 DOWNTO 0);
	data : BUFFER std_logic_vector(18 DOWNTO 0)
	);
END sine_gen;

-- Design Ports Information
-- data[0]	=>  Location: PIN_W15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[1]	=>  Location: PIN_AB15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[2]	=>  Location: PIN_AG15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[3]	=>  Location: PIN_AJ10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[4]	=>  Location: PIN_AK11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[5]	=>  Location: PIN_AK13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[6]	=>  Location: PIN_AF15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[7]	=>  Location: PIN_AK12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[8]	=>  Location: PIN_AH13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[9]	=>  Location: PIN_AH8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[10]	=>  Location: PIN_AJ9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[11]	=>  Location: PIN_AA14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[12]	=>  Location: PIN_AK9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[13]	=>  Location: PIN_AH14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[14]	=>  Location: PIN_AF14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[15]	=>  Location: PIN_AA15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[16]	=>  Location: PIN_AH10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[17]	=>  Location: PIN_AJ11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[18]	=>  Location: PIN_AH7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_Y27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rst	=>  Location: PIN_AG12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- phase_incr[30]	=>  Location: PIN_AJ5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- phase_incr[20]	=>  Location: PIN_AK4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- phase_incr[21]	=>  Location: PIN_AE14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- phase_incr[22]	=>  Location: PIN_AE13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- phase_incr[23]	=>  Location: PIN_AK3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- phase_incr[24]	=>  Location: PIN_AK6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- phase_incr[25]	=>  Location: PIN_AK2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- phase_incr[26]	=>  Location: PIN_AJ4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- phase_incr[27]	=>  Location: PIN_AB13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- phase_incr[28]	=>  Location: PIN_AF13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- phase_incr[29]	=>  Location: PIN_AD14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- phase_incr[31]	=>  Location: PIN_AA13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- phase_incr[19]	=>  Location: PIN_AD12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- phase_incr[18]	=>  Location: PIN_AC12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- phase_incr[17]	=>  Location: PIN_AH5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- phase_incr[16]	=>  Location: PIN_AJ2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- phase_incr[15]	=>  Location: PIN_AG10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- phase_incr[14]	=>  Location: PIN_AG13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- phase_incr[13]	=>  Location: PIN_AH9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- phase_incr[12]	=>  Location: PIN_AG11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- phase_incr[11]	=>  Location: PIN_AG5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- phase_incr[10]	=>  Location: PIN_AJ1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- phase_incr[9]	=>  Location: PIN_AF11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- phase_incr[8]	=>  Location: PIN_AK8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- phase_incr[7]	=>  Location: PIN_AK7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- phase_incr[6]	=>  Location: PIN_AH3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- phase_incr[5]	=>  Location: PIN_AJ7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- phase_incr[4]	=>  Location: PIN_AC14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- phase_incr[3]	=>  Location: PIN_AA12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- phase_incr[2]	=>  Location: PIN_AJ6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- phase_incr[1]	=>  Location: PIN_AB12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- phase_incr[0]	=>  Location: PIN_AG2,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF sine_gen IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_rst : std_logic;
SIGNAL ww_phase_incr : std_logic_vector(31 DOWNTO 0);
SIGNAL ww_data : std_logic_vector(18 DOWNTO 0);
SIGNAL \Mux17_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \Mux17_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \Mux17_rtl_0|auto_generated|ram_block1a1_PORTAADDR_bus\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \Mux17_rtl_0|auto_generated|ram_block1a1_PORTADATAOUT_bus\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputCLKENA0_outclk\ : std_logic;
SIGNAL \phase_incr[28]~input_o\ : std_logic;
SIGNAL \phase_incr[29]~input_o\ : std_logic;
SIGNAL \phase_incr[26]~input_o\ : std_logic;
SIGNAL \phase_incr[27]~input_o\ : std_logic;
SIGNAL \Equal0~2_combout\ : std_logic;
SIGNAL \phase_incr[23]~input_o\ : std_logic;
SIGNAL \phase_incr[21]~input_o\ : std_logic;
SIGNAL \Add1~6\ : std_logic;
SIGNAL \Add1~9_sumout\ : std_logic;
SIGNAL \phase_acc~2_combout\ : std_logic;
SIGNAL \rst~input_o\ : std_logic;
SIGNAL \phase_incr[20]~input_o\ : std_logic;
SIGNAL \phase_incr[19]~input_o\ : std_logic;
SIGNAL \phase_incr[18]~input_o\ : std_logic;
SIGNAL \phase_incr[17]~input_o\ : std_logic;
SIGNAL \phase_incr[16]~input_o\ : std_logic;
SIGNAL \phase_incr[15]~input_o\ : std_logic;
SIGNAL \phase_incr[14]~input_o\ : std_logic;
SIGNAL \phase_incr[13]~input_o\ : std_logic;
SIGNAL \phase_incr[12]~input_o\ : std_logic;
SIGNAL \phase_incr[11]~input_o\ : std_logic;
SIGNAL \phase_incr[10]~input_o\ : std_logic;
SIGNAL \phase_incr[9]~input_o\ : std_logic;
SIGNAL \phase_incr[8]~input_o\ : std_logic;
SIGNAL \phase_incr[7]~input_o\ : std_logic;
SIGNAL \phase_incr[6]~input_o\ : std_logic;
SIGNAL \phase_incr[5]~input_o\ : std_logic;
SIGNAL \phase_incr[4]~input_o\ : std_logic;
SIGNAL \phase_incr[3]~input_o\ : std_logic;
SIGNAL \phase_incr[2]~input_o\ : std_logic;
SIGNAL \phase_incr[1]~input_o\ : std_logic;
SIGNAL \phase_incr[0]~input_o\ : std_logic;
SIGNAL \Add0~125_sumout\ : std_logic;
SIGNAL \Add0~126\ : std_logic;
SIGNAL \Add0~121_sumout\ : std_logic;
SIGNAL \Add0~122\ : std_logic;
SIGNAL \Add0~117_sumout\ : std_logic;
SIGNAL \Add0~118\ : std_logic;
SIGNAL \Add0~113_sumout\ : std_logic;
SIGNAL \Add0~114\ : std_logic;
SIGNAL \Add0~109_sumout\ : std_logic;
SIGNAL \Add0~110\ : std_logic;
SIGNAL \Add0~105_sumout\ : std_logic;
SIGNAL \Add0~106\ : std_logic;
SIGNAL \Add0~101_sumout\ : std_logic;
SIGNAL \Add0~102\ : std_logic;
SIGNAL \Add0~97_sumout\ : std_logic;
SIGNAL \Add0~98\ : std_logic;
SIGNAL \Add0~93_sumout\ : std_logic;
SIGNAL \Add0~94\ : std_logic;
SIGNAL \Add0~89_sumout\ : std_logic;
SIGNAL \Add0~90\ : std_logic;
SIGNAL \Add0~85_sumout\ : std_logic;
SIGNAL \Add0~86\ : std_logic;
SIGNAL \Add0~81_sumout\ : std_logic;
SIGNAL \Add0~82\ : std_logic;
SIGNAL \Add0~77_sumout\ : std_logic;
SIGNAL \Add0~78\ : std_logic;
SIGNAL \Add0~73_sumout\ : std_logic;
SIGNAL \Add0~74\ : std_logic;
SIGNAL \Add0~69_sumout\ : std_logic;
SIGNAL \Add0~70\ : std_logic;
SIGNAL \Add0~65_sumout\ : std_logic;
SIGNAL \Add0~66\ : std_logic;
SIGNAL \Add0~61_sumout\ : std_logic;
SIGNAL \Add0~62\ : std_logic;
SIGNAL \Add0~57_sumout\ : std_logic;
SIGNAL \Add0~58\ : std_logic;
SIGNAL \Add0~53_sumout\ : std_logic;
SIGNAL \Add0~54\ : std_logic;
SIGNAL \Add0~49_sumout\ : std_logic;
SIGNAL \Add0~50\ : std_logic;
SIGNAL \Add0~6\ : std_logic;
SIGNAL \Add0~9_sumout\ : std_logic;
SIGNAL \Add1~10\ : std_logic;
SIGNAL \Add1~13_sumout\ : std_logic;
SIGNAL \phase_acc~3_combout\ : std_logic;
SIGNAL \phase_incr[22]~input_o\ : std_logic;
SIGNAL \Add0~10\ : std_logic;
SIGNAL \Add0~13_sumout\ : std_logic;
SIGNAL \Add1~14\ : std_logic;
SIGNAL \Add1~17_sumout\ : std_logic;
SIGNAL \phase_acc~4_combout\ : std_logic;
SIGNAL \Add0~14\ : std_logic;
SIGNAL \Add0~17_sumout\ : std_logic;
SIGNAL \Add1~18\ : std_logic;
SIGNAL \Add1~21_sumout\ : std_logic;
SIGNAL \phase_acc~5_combout\ : std_logic;
SIGNAL \phase_incr[24]~input_o\ : std_logic;
SIGNAL \Add0~18\ : std_logic;
SIGNAL \Add0~21_sumout\ : std_logic;
SIGNAL \Add1~22\ : std_logic;
SIGNAL \Add1~25_sumout\ : std_logic;
SIGNAL \phase_acc~6_combout\ : std_logic;
SIGNAL \phase_incr[25]~input_o\ : std_logic;
SIGNAL \Add0~22\ : std_logic;
SIGNAL \Add0~25_sumout\ : std_logic;
SIGNAL \Add1~26\ : std_logic;
SIGNAL \Add1~30\ : std_logic;
SIGNAL \Add1~33_sumout\ : std_logic;
SIGNAL \phase_acc~8_combout\ : std_logic;
SIGNAL \Add0~26\ : std_logic;
SIGNAL \Add0~30\ : std_logic;
SIGNAL \Add0~33_sumout\ : std_logic;
SIGNAL \Add1~29_sumout\ : std_logic;
SIGNAL \phase_acc~7_combout\ : std_logic;
SIGNAL \Add0~29_sumout\ : std_logic;
SIGNAL \Equal0~1_combout\ : std_logic;
SIGNAL \Add1~34\ : std_logic;
SIGNAL \Add1~38\ : std_logic;
SIGNAL \Add1~41_sumout\ : std_logic;
SIGNAL \phase_acc~10_combout\ : std_logic;
SIGNAL \Add0~34\ : std_logic;
SIGNAL \Add0~38\ : std_logic;
SIGNAL \Add0~41_sumout\ : std_logic;
SIGNAL \Add1~37_sumout\ : std_logic;
SIGNAL \phase_acc~9_combout\ : std_logic;
SIGNAL \Add0~37_sumout\ : std_logic;
SIGNAL \Add1~5_sumout\ : std_logic;
SIGNAL \phase_acc~1_combout\ : std_logic;
SIGNAL \Add0~5_sumout\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \phase_incr[30]~input_o\ : std_logic;
SIGNAL \Add0~42\ : std_logic;
SIGNAL \Add0~1_sumout\ : std_logic;
SIGNAL \Add1~42\ : std_logic;
SIGNAL \Add1~1_sumout\ : std_logic;
SIGNAL \phase_acc~0_combout\ : std_logic;
SIGNAL \rom_addr[0]~0_combout\ : std_logic;
SIGNAL \rom_addr[1]~1_combout\ : std_logic;
SIGNAL \rom_addr[2]~2_combout\ : std_logic;
SIGNAL \rom_addr[3]~3_combout\ : std_logic;
SIGNAL \rom_addr[4]~4_combout\ : std_logic;
SIGNAL \rom_addr[5]~5_combout\ : std_logic;
SIGNAL \rom_addr[6]~6_combout\ : std_logic;
SIGNAL \rom_addr[7]~7_combout\ : std_logic;
SIGNAL \rom_addr[8]~8_combout\ : std_logic;
SIGNAL \rom_addr[9]~9_combout\ : std_logic;
SIGNAL \Mux17_rtl_0|auto_generated|ram_block1a0~portadataout\ : std_logic;
SIGNAL \phase_incr[31]~input_o\ : std_logic;
SIGNAL \Add0~2\ : std_logic;
SIGNAL \Add0~45_sumout\ : std_logic;
SIGNAL \Add1~2\ : std_logic;
SIGNAL \Add1~45_sumout\ : std_logic;
SIGNAL \phase_acc~11_combout\ : std_logic;
SIGNAL \data[4]~0_combout\ : std_logic;
SIGNAL \Mux17_rtl_0|auto_generated|ram_block1a0~_wirecell_combout\ : std_logic;
SIGNAL \data~1_combout\ : std_logic;
SIGNAL \data[0]~reg0_q\ : std_logic;
SIGNAL \Mux17_rtl_0|auto_generated|ram_block1a16\ : std_logic;
SIGNAL \Mux17_rtl_0|auto_generated|ram_block1a16~_wirecell_combout\ : std_logic;
SIGNAL \data~2_combout\ : std_logic;
SIGNAL \data[1]~reg0_q\ : std_logic;
SIGNAL \Mux17_rtl_0|auto_generated|ram_block1a15\ : std_logic;
SIGNAL \Mux17_rtl_0|auto_generated|ram_block1a15~_wirecell_combout\ : std_logic;
SIGNAL \data~3_combout\ : std_logic;
SIGNAL \data[2]~reg0_q\ : std_logic;
SIGNAL \Mux17_rtl_0|auto_generated|ram_block1a14\ : std_logic;
SIGNAL \Mux17_rtl_0|auto_generated|ram_block1a14~_wirecell_combout\ : std_logic;
SIGNAL \data~4_combout\ : std_logic;
SIGNAL \data[3]~reg0_q\ : std_logic;
SIGNAL \Mux17_rtl_0|auto_generated|ram_block1a13\ : std_logic;
SIGNAL \Mux17_rtl_0|auto_generated|ram_block1a13~_wirecell_combout\ : std_logic;
SIGNAL \data~5_combout\ : std_logic;
SIGNAL \data[4]~reg0_q\ : std_logic;
SIGNAL \Mux17_rtl_0|auto_generated|ram_block1a12\ : std_logic;
SIGNAL \Mux17_rtl_0|auto_generated|ram_block1a12~_wirecell_combout\ : std_logic;
SIGNAL \data~6_combout\ : std_logic;
SIGNAL \data[5]~reg0_q\ : std_logic;
SIGNAL \Mux17_rtl_0|auto_generated|ram_block1a11\ : std_logic;
SIGNAL \Mux17_rtl_0|auto_generated|ram_block1a11~_wirecell_combout\ : std_logic;
SIGNAL \data~7_combout\ : std_logic;
SIGNAL \data[6]~reg0_q\ : std_logic;
SIGNAL \Mux17_rtl_0|auto_generated|ram_block1a10\ : std_logic;
SIGNAL \Mux17_rtl_0|auto_generated|ram_block1a10~_wirecell_combout\ : std_logic;
SIGNAL \data~8_combout\ : std_logic;
SIGNAL \data[7]~reg0_q\ : std_logic;
SIGNAL \Mux17_rtl_0|auto_generated|ram_block1a9\ : std_logic;
SIGNAL \Mux17_rtl_0|auto_generated|ram_block1a9~_wirecell_combout\ : std_logic;
SIGNAL \rom_data[8]~feeder_combout\ : std_logic;
SIGNAL \data~9_combout\ : std_logic;
SIGNAL \data[8]~reg0_q\ : std_logic;
SIGNAL \Mux17_rtl_0|auto_generated|ram_block1a8\ : std_logic;
SIGNAL \rom_data[9]~feeder_combout\ : std_logic;
SIGNAL \Mux17_rtl_0|auto_generated|ram_block1a8~_wirecell_combout\ : std_logic;
SIGNAL \data~10_combout\ : std_logic;
SIGNAL \data[9]~reg0_q\ : std_logic;
SIGNAL \Mux17_rtl_0|auto_generated|ram_block1a7\ : std_logic;
SIGNAL \Mux17_rtl_0|auto_generated|ram_block1a7~_wirecell_combout\ : std_logic;
SIGNAL \data~11_combout\ : std_logic;
SIGNAL \data[10]~reg0_q\ : std_logic;
SIGNAL \Mux17_rtl_0|auto_generated|ram_block1a6\ : std_logic;
SIGNAL \Mux17_rtl_0|auto_generated|ram_block1a6~_wirecell_combout\ : std_logic;
SIGNAL \data~12_combout\ : std_logic;
SIGNAL \data[11]~reg0_q\ : std_logic;
SIGNAL \Mux17_rtl_0|auto_generated|ram_block1a5\ : std_logic;
SIGNAL \Mux17_rtl_0|auto_generated|ram_block1a5~_wirecell_combout\ : std_logic;
SIGNAL \data~13_combout\ : std_logic;
SIGNAL \data[12]~reg0_q\ : std_logic;
SIGNAL \Mux17_rtl_0|auto_generated|ram_block1a4\ : std_logic;
SIGNAL \Mux17_rtl_0|auto_generated|ram_block1a4~_wirecell_combout\ : std_logic;
SIGNAL \data~14_combout\ : std_logic;
SIGNAL \data[13]~reg0_q\ : std_logic;
SIGNAL \Mux17_rtl_0|auto_generated|ram_block1a3\ : std_logic;
SIGNAL \Mux17_rtl_0|auto_generated|ram_block1a3~_wirecell_combout\ : std_logic;
SIGNAL \data~15_combout\ : std_logic;
SIGNAL \data[14]~reg0_q\ : std_logic;
SIGNAL \Mux17_rtl_0|auto_generated|ram_block1a2\ : std_logic;
SIGNAL \Mux17_rtl_0|auto_generated|ram_block1a2~_wirecell_combout\ : std_logic;
SIGNAL \data~16_combout\ : std_logic;
SIGNAL \data[15]~reg0_q\ : std_logic;
SIGNAL \Mux17_rtl_0|auto_generated|ram_block1a1~portadataout\ : std_logic;
SIGNAL \Mux17_rtl_0|auto_generated|ram_block1a1~_wirecell_combout\ : std_logic;
SIGNAL \data~17_combout\ : std_logic;
SIGNAL \data[16]~reg0_q\ : std_logic;
SIGNAL \Mux17_rtl_0|auto_generated|ram_block1a17\ : std_logic;
SIGNAL \Mux17_rtl_0|auto_generated|ram_block1a17~_wirecell_combout\ : std_logic;
SIGNAL \data~18_combout\ : std_logic;
SIGNAL \data[17]~reg0_q\ : std_logic;
SIGNAL \data[18]~reg0_q\ : std_logic;
SIGNAL rom_data : std_logic_vector(17 DOWNTO 0);
SIGNAL quadrant_p2 : std_logic_vector(1 DOWNTO 0);
SIGNAL rom_data_inv : std_logic_vector(17 DOWNTO 0);
SIGNAL quadrant_p1 : std_logic_vector(1 DOWNTO 0);
SIGNAL phase_acc : std_logic_vector(31 DOWNTO 0);
SIGNAL \ALT_INV_phase_incr[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_phase_incr[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_phase_incr[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_phase_incr[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_phase_incr[4]~input_o\ : std_logic;
SIGNAL \ALT_INV_phase_incr[5]~input_o\ : std_logic;
SIGNAL \ALT_INV_phase_incr[6]~input_o\ : std_logic;
SIGNAL \ALT_INV_phase_incr[7]~input_o\ : std_logic;
SIGNAL \ALT_INV_phase_incr[8]~input_o\ : std_logic;
SIGNAL \ALT_INV_phase_incr[9]~input_o\ : std_logic;
SIGNAL \ALT_INV_phase_incr[10]~input_o\ : std_logic;
SIGNAL \ALT_INV_phase_incr[11]~input_o\ : std_logic;
SIGNAL \ALT_INV_phase_incr[12]~input_o\ : std_logic;
SIGNAL \ALT_INV_phase_incr[13]~input_o\ : std_logic;
SIGNAL \ALT_INV_phase_incr[14]~input_o\ : std_logic;
SIGNAL \ALT_INV_phase_incr[15]~input_o\ : std_logic;
SIGNAL \ALT_INV_phase_incr[16]~input_o\ : std_logic;
SIGNAL \ALT_INV_phase_incr[17]~input_o\ : std_logic;
SIGNAL \ALT_INV_phase_incr[18]~input_o\ : std_logic;
SIGNAL \ALT_INV_phase_incr[19]~input_o\ : std_logic;
SIGNAL \ALT_INV_phase_incr[31]~input_o\ : std_logic;
SIGNAL \ALT_INV_phase_incr[29]~input_o\ : std_logic;
SIGNAL \ALT_INV_phase_incr[28]~input_o\ : std_logic;
SIGNAL \ALT_INV_phase_incr[27]~input_o\ : std_logic;
SIGNAL \ALT_INV_phase_incr[26]~input_o\ : std_logic;
SIGNAL \ALT_INV_phase_incr[25]~input_o\ : std_logic;
SIGNAL \ALT_INV_phase_incr[24]~input_o\ : std_logic;
SIGNAL \ALT_INV_phase_incr[23]~input_o\ : std_logic;
SIGNAL \ALT_INV_phase_incr[22]~input_o\ : std_logic;
SIGNAL \ALT_INV_phase_incr[21]~input_o\ : std_logic;
SIGNAL \ALT_INV_phase_incr[20]~input_o\ : std_logic;
SIGNAL \ALT_INV_phase_incr[30]~input_o\ : std_logic;
SIGNAL \ALT_INV_Equal0~2_combout\ : std_logic;
SIGNAL \ALT_INV_Equal0~1_combout\ : std_logic;
SIGNAL \ALT_INV_Equal0~0_combout\ : std_logic;
SIGNAL \ALT_INV_data[4]~0_combout\ : std_logic;
SIGNAL ALT_INV_phase_acc : std_logic_vector(31 DOWNTO 0);
SIGNAL \ALT_INV_Add1~45_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~45_sumout\ : std_logic;
SIGNAL \ALT_INV_Add1~41_sumout\ : std_logic;
SIGNAL \ALT_INV_Add1~37_sumout\ : std_logic;
SIGNAL \ALT_INV_Add1~33_sumout\ : std_logic;
SIGNAL \ALT_INV_Add1~29_sumout\ : std_logic;
SIGNAL \ALT_INV_Add1~25_sumout\ : std_logic;
SIGNAL \ALT_INV_Add1~21_sumout\ : std_logic;
SIGNAL \ALT_INV_Add1~17_sumout\ : std_logic;
SIGNAL \ALT_INV_Add1~13_sumout\ : std_logic;
SIGNAL \ALT_INV_Add1~9_sumout\ : std_logic;
SIGNAL \ALT_INV_Add1~5_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~41_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~37_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~33_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~29_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~25_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~21_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~17_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~13_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~9_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~5_sumout\ : std_logic;
SIGNAL \ALT_INV_Add1~1_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~1_sumout\ : std_logic;
SIGNAL \Mux17_rtl_0|auto_generated|ALT_INV_ram_block1a2\ : std_logic;
SIGNAL \Mux17_rtl_0|auto_generated|ALT_INV_ram_block1a3\ : std_logic;
SIGNAL \Mux17_rtl_0|auto_generated|ALT_INV_ram_block1a4\ : std_logic;
SIGNAL \Mux17_rtl_0|auto_generated|ALT_INV_ram_block1a5\ : std_logic;
SIGNAL \Mux17_rtl_0|auto_generated|ALT_INV_ram_block1a6\ : std_logic;
SIGNAL \Mux17_rtl_0|auto_generated|ALT_INV_ram_block1a7\ : std_logic;
SIGNAL \Mux17_rtl_0|auto_generated|ALT_INV_ram_block1a17\ : std_logic;
SIGNAL \Mux17_rtl_0|auto_generated|ALT_INV_ram_block1a1~portadataout\ : std_logic;
SIGNAL \Mux17_rtl_0|auto_generated|ALT_INV_ram_block1a8\ : std_logic;
SIGNAL \Mux17_rtl_0|auto_generated|ALT_INV_ram_block1a9\ : std_logic;
SIGNAL \Mux17_rtl_0|auto_generated|ALT_INV_ram_block1a10\ : std_logic;
SIGNAL \Mux17_rtl_0|auto_generated|ALT_INV_ram_block1a11\ : std_logic;
SIGNAL \Mux17_rtl_0|auto_generated|ALT_INV_ram_block1a12\ : std_logic;
SIGNAL \Mux17_rtl_0|auto_generated|ALT_INV_ram_block1a13\ : std_logic;
SIGNAL \Mux17_rtl_0|auto_generated|ALT_INV_ram_block1a14\ : std_logic;
SIGNAL \Mux17_rtl_0|auto_generated|ALT_INV_ram_block1a15\ : std_logic;
SIGNAL \Mux17_rtl_0|auto_generated|ALT_INV_ram_block1a16\ : std_logic;
SIGNAL \Mux17_rtl_0|auto_generated|ALT_INV_ram_block1a0~portadataout\ : std_logic;
SIGNAL ALT_INV_rom_data_inv : std_logic_vector(17 DOWNTO 0);
SIGNAL ALT_INV_rom_data : std_logic_vector(17 DOWNTO 0);
SIGNAL ALT_INV_quadrant_p2 : std_logic_vector(1 DOWNTO 0);

BEGIN

ww_clk <= clk;
ww_rst <= rst;
ww_phase_incr <= phase_incr;
data <= ww_data;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\Mux17_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\ <= (\rom_addr[9]~9_combout\ & \rom_addr[8]~8_combout\ & \rom_addr[7]~7_combout\ & \rom_addr[6]~6_combout\ & \rom_addr[5]~5_combout\ & \rom_addr[4]~4_combout\ & \rom_addr[3]~3_combout\ & 
\rom_addr[2]~2_combout\ & \rom_addr[1]~1_combout\ & \rom_addr[0]~0_combout\);

\Mux17_rtl_0|auto_generated|ram_block1a0~portadataout\ <= \Mux17_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(0);
\Mux17_rtl_0|auto_generated|ram_block1a8\ <= \Mux17_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(1);
\Mux17_rtl_0|auto_generated|ram_block1a9\ <= \Mux17_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(2);
\Mux17_rtl_0|auto_generated|ram_block1a10\ <= \Mux17_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(3);
\Mux17_rtl_0|auto_generated|ram_block1a11\ <= \Mux17_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(4);
\Mux17_rtl_0|auto_generated|ram_block1a12\ <= \Mux17_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(5);
\Mux17_rtl_0|auto_generated|ram_block1a13\ <= \Mux17_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(6);
\Mux17_rtl_0|auto_generated|ram_block1a14\ <= \Mux17_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(7);
\Mux17_rtl_0|auto_generated|ram_block1a15\ <= \Mux17_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(8);
\Mux17_rtl_0|auto_generated|ram_block1a16\ <= \Mux17_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(9);

\Mux17_rtl_0|auto_generated|ram_block1a1_PORTAADDR_bus\ <= (\rom_addr[9]~9_combout\ & \rom_addr[8]~8_combout\ & \rom_addr[7]~7_combout\ & \rom_addr[6]~6_combout\ & \rom_addr[5]~5_combout\ & \rom_addr[4]~4_combout\ & \rom_addr[3]~3_combout\ & 
\rom_addr[2]~2_combout\ & \rom_addr[1]~1_combout\ & \rom_addr[0]~0_combout\);

\Mux17_rtl_0|auto_generated|ram_block1a1~portadataout\ <= \Mux17_rtl_0|auto_generated|ram_block1a1_PORTADATAOUT_bus\(0);
\Mux17_rtl_0|auto_generated|ram_block1a2\ <= \Mux17_rtl_0|auto_generated|ram_block1a1_PORTADATAOUT_bus\(1);
\Mux17_rtl_0|auto_generated|ram_block1a3\ <= \Mux17_rtl_0|auto_generated|ram_block1a1_PORTADATAOUT_bus\(2);
\Mux17_rtl_0|auto_generated|ram_block1a4\ <= \Mux17_rtl_0|auto_generated|ram_block1a1_PORTADATAOUT_bus\(3);
\Mux17_rtl_0|auto_generated|ram_block1a5\ <= \Mux17_rtl_0|auto_generated|ram_block1a1_PORTADATAOUT_bus\(4);
\Mux17_rtl_0|auto_generated|ram_block1a6\ <= \Mux17_rtl_0|auto_generated|ram_block1a1_PORTADATAOUT_bus\(5);
\Mux17_rtl_0|auto_generated|ram_block1a7\ <= \Mux17_rtl_0|auto_generated|ram_block1a1_PORTADATAOUT_bus\(6);
\Mux17_rtl_0|auto_generated|ram_block1a17\ <= \Mux17_rtl_0|auto_generated|ram_block1a1_PORTADATAOUT_bus\(7);
\ALT_INV_phase_incr[0]~input_o\ <= NOT \phase_incr[0]~input_o\;
\ALT_INV_phase_incr[1]~input_o\ <= NOT \phase_incr[1]~input_o\;
\ALT_INV_phase_incr[2]~input_o\ <= NOT \phase_incr[2]~input_o\;
\ALT_INV_phase_incr[3]~input_o\ <= NOT \phase_incr[3]~input_o\;
\ALT_INV_phase_incr[4]~input_o\ <= NOT \phase_incr[4]~input_o\;
\ALT_INV_phase_incr[5]~input_o\ <= NOT \phase_incr[5]~input_o\;
\ALT_INV_phase_incr[6]~input_o\ <= NOT \phase_incr[6]~input_o\;
\ALT_INV_phase_incr[7]~input_o\ <= NOT \phase_incr[7]~input_o\;
\ALT_INV_phase_incr[8]~input_o\ <= NOT \phase_incr[8]~input_o\;
\ALT_INV_phase_incr[9]~input_o\ <= NOT \phase_incr[9]~input_o\;
\ALT_INV_phase_incr[10]~input_o\ <= NOT \phase_incr[10]~input_o\;
\ALT_INV_phase_incr[11]~input_o\ <= NOT \phase_incr[11]~input_o\;
\ALT_INV_phase_incr[12]~input_o\ <= NOT \phase_incr[12]~input_o\;
\ALT_INV_phase_incr[13]~input_o\ <= NOT \phase_incr[13]~input_o\;
\ALT_INV_phase_incr[14]~input_o\ <= NOT \phase_incr[14]~input_o\;
\ALT_INV_phase_incr[15]~input_o\ <= NOT \phase_incr[15]~input_o\;
\ALT_INV_phase_incr[16]~input_o\ <= NOT \phase_incr[16]~input_o\;
\ALT_INV_phase_incr[17]~input_o\ <= NOT \phase_incr[17]~input_o\;
\ALT_INV_phase_incr[18]~input_o\ <= NOT \phase_incr[18]~input_o\;
\ALT_INV_phase_incr[19]~input_o\ <= NOT \phase_incr[19]~input_o\;
\ALT_INV_phase_incr[31]~input_o\ <= NOT \phase_incr[31]~input_o\;
\ALT_INV_phase_incr[29]~input_o\ <= NOT \phase_incr[29]~input_o\;
\ALT_INV_phase_incr[28]~input_o\ <= NOT \phase_incr[28]~input_o\;
\ALT_INV_phase_incr[27]~input_o\ <= NOT \phase_incr[27]~input_o\;
\ALT_INV_phase_incr[26]~input_o\ <= NOT \phase_incr[26]~input_o\;
\ALT_INV_phase_incr[25]~input_o\ <= NOT \phase_incr[25]~input_o\;
\ALT_INV_phase_incr[24]~input_o\ <= NOT \phase_incr[24]~input_o\;
\ALT_INV_phase_incr[23]~input_o\ <= NOT \phase_incr[23]~input_o\;
\ALT_INV_phase_incr[22]~input_o\ <= NOT \phase_incr[22]~input_o\;
\ALT_INV_phase_incr[21]~input_o\ <= NOT \phase_incr[21]~input_o\;
\ALT_INV_phase_incr[20]~input_o\ <= NOT \phase_incr[20]~input_o\;
\ALT_INV_phase_incr[30]~input_o\ <= NOT \phase_incr[30]~input_o\;
\ALT_INV_Equal0~2_combout\ <= NOT \Equal0~2_combout\;
\ALT_INV_Equal0~1_combout\ <= NOT \Equal0~1_combout\;
\ALT_INV_Equal0~0_combout\ <= NOT \Equal0~0_combout\;
\ALT_INV_data[4]~0_combout\ <= NOT \data[4]~0_combout\;
ALT_INV_phase_acc(0) <= NOT phase_acc(0);
ALT_INV_phase_acc(1) <= NOT phase_acc(1);
ALT_INV_phase_acc(2) <= NOT phase_acc(2);
ALT_INV_phase_acc(3) <= NOT phase_acc(3);
ALT_INV_phase_acc(4) <= NOT phase_acc(4);
ALT_INV_phase_acc(5) <= NOT phase_acc(5);
ALT_INV_phase_acc(6) <= NOT phase_acc(6);
ALT_INV_phase_acc(7) <= NOT phase_acc(7);
ALT_INV_phase_acc(8) <= NOT phase_acc(8);
ALT_INV_phase_acc(9) <= NOT phase_acc(9);
ALT_INV_phase_acc(10) <= NOT phase_acc(10);
ALT_INV_phase_acc(11) <= NOT phase_acc(11);
ALT_INV_phase_acc(12) <= NOT phase_acc(12);
ALT_INV_phase_acc(13) <= NOT phase_acc(13);
ALT_INV_phase_acc(14) <= NOT phase_acc(14);
ALT_INV_phase_acc(15) <= NOT phase_acc(15);
ALT_INV_phase_acc(16) <= NOT phase_acc(16);
ALT_INV_phase_acc(17) <= NOT phase_acc(17);
ALT_INV_phase_acc(18) <= NOT phase_acc(18);
ALT_INV_phase_acc(19) <= NOT phase_acc(19);
\ALT_INV_Add1~45_sumout\ <= NOT \Add1~45_sumout\;
\ALT_INV_Add0~45_sumout\ <= NOT \Add0~45_sumout\;
\ALT_INV_Add1~41_sumout\ <= NOT \Add1~41_sumout\;
\ALT_INV_Add1~37_sumout\ <= NOT \Add1~37_sumout\;
\ALT_INV_Add1~33_sumout\ <= NOT \Add1~33_sumout\;
\ALT_INV_Add1~29_sumout\ <= NOT \Add1~29_sumout\;
\ALT_INV_Add1~25_sumout\ <= NOT \Add1~25_sumout\;
\ALT_INV_Add1~21_sumout\ <= NOT \Add1~21_sumout\;
\ALT_INV_Add1~17_sumout\ <= NOT \Add1~17_sumout\;
\ALT_INV_Add1~13_sumout\ <= NOT \Add1~13_sumout\;
\ALT_INV_Add1~9_sumout\ <= NOT \Add1~9_sumout\;
\ALT_INV_Add1~5_sumout\ <= NOT \Add1~5_sumout\;
\ALT_INV_Add0~41_sumout\ <= NOT \Add0~41_sumout\;
\ALT_INV_Add0~37_sumout\ <= NOT \Add0~37_sumout\;
\ALT_INV_Add0~33_sumout\ <= NOT \Add0~33_sumout\;
\ALT_INV_Add0~29_sumout\ <= NOT \Add0~29_sumout\;
\ALT_INV_Add0~25_sumout\ <= NOT \Add0~25_sumout\;
\ALT_INV_Add0~21_sumout\ <= NOT \Add0~21_sumout\;
\ALT_INV_Add0~17_sumout\ <= NOT \Add0~17_sumout\;
\ALT_INV_Add0~13_sumout\ <= NOT \Add0~13_sumout\;
\ALT_INV_Add0~9_sumout\ <= NOT \Add0~9_sumout\;
\ALT_INV_Add0~5_sumout\ <= NOT \Add0~5_sumout\;
\ALT_INV_Add1~1_sumout\ <= NOT \Add1~1_sumout\;
\ALT_INV_Add0~1_sumout\ <= NOT \Add0~1_sumout\;
ALT_INV_phase_acc(31) <= NOT phase_acc(31);
ALT_INV_phase_acc(29) <= NOT phase_acc(29);
ALT_INV_phase_acc(28) <= NOT phase_acc(28);
ALT_INV_phase_acc(27) <= NOT phase_acc(27);
ALT_INV_phase_acc(26) <= NOT phase_acc(26);
ALT_INV_phase_acc(25) <= NOT phase_acc(25);
ALT_INV_phase_acc(24) <= NOT phase_acc(24);
ALT_INV_phase_acc(23) <= NOT phase_acc(23);
ALT_INV_phase_acc(22) <= NOT phase_acc(22);
ALT_INV_phase_acc(21) <= NOT phase_acc(21);
ALT_INV_phase_acc(20) <= NOT phase_acc(20);
ALT_INV_phase_acc(30) <= NOT phase_acc(30);
\Mux17_rtl_0|auto_generated|ALT_INV_ram_block1a2\ <= NOT \Mux17_rtl_0|auto_generated|ram_block1a2\;
\Mux17_rtl_0|auto_generated|ALT_INV_ram_block1a3\ <= NOT \Mux17_rtl_0|auto_generated|ram_block1a3\;
\Mux17_rtl_0|auto_generated|ALT_INV_ram_block1a4\ <= NOT \Mux17_rtl_0|auto_generated|ram_block1a4\;
\Mux17_rtl_0|auto_generated|ALT_INV_ram_block1a5\ <= NOT \Mux17_rtl_0|auto_generated|ram_block1a5\;
\Mux17_rtl_0|auto_generated|ALT_INV_ram_block1a6\ <= NOT \Mux17_rtl_0|auto_generated|ram_block1a6\;
\Mux17_rtl_0|auto_generated|ALT_INV_ram_block1a7\ <= NOT \Mux17_rtl_0|auto_generated|ram_block1a7\;
\Mux17_rtl_0|auto_generated|ALT_INV_ram_block1a17\ <= NOT \Mux17_rtl_0|auto_generated|ram_block1a17\;
\Mux17_rtl_0|auto_generated|ALT_INV_ram_block1a1~portadataout\ <= NOT \Mux17_rtl_0|auto_generated|ram_block1a1~portadataout\;
\Mux17_rtl_0|auto_generated|ALT_INV_ram_block1a8\ <= NOT \Mux17_rtl_0|auto_generated|ram_block1a8\;
\Mux17_rtl_0|auto_generated|ALT_INV_ram_block1a9\ <= NOT \Mux17_rtl_0|auto_generated|ram_block1a9\;
\Mux17_rtl_0|auto_generated|ALT_INV_ram_block1a10\ <= NOT \Mux17_rtl_0|auto_generated|ram_block1a10\;
\Mux17_rtl_0|auto_generated|ALT_INV_ram_block1a11\ <= NOT \Mux17_rtl_0|auto_generated|ram_block1a11\;
\Mux17_rtl_0|auto_generated|ALT_INV_ram_block1a12\ <= NOT \Mux17_rtl_0|auto_generated|ram_block1a12\;
\Mux17_rtl_0|auto_generated|ALT_INV_ram_block1a13\ <= NOT \Mux17_rtl_0|auto_generated|ram_block1a13\;
\Mux17_rtl_0|auto_generated|ALT_INV_ram_block1a14\ <= NOT \Mux17_rtl_0|auto_generated|ram_block1a14\;
\Mux17_rtl_0|auto_generated|ALT_INV_ram_block1a15\ <= NOT \Mux17_rtl_0|auto_generated|ram_block1a15\;
\Mux17_rtl_0|auto_generated|ALT_INV_ram_block1a16\ <= NOT \Mux17_rtl_0|auto_generated|ram_block1a16\;
\Mux17_rtl_0|auto_generated|ALT_INV_ram_block1a0~portadataout\ <= NOT \Mux17_rtl_0|auto_generated|ram_block1a0~portadataout\;
ALT_INV_rom_data_inv(17) <= NOT rom_data_inv(17);
ALT_INV_rom_data(17) <= NOT rom_data(17);
ALT_INV_rom_data_inv(16) <= NOT rom_data_inv(16);
ALT_INV_rom_data(16) <= NOT rom_data(16);
ALT_INV_rom_data_inv(15) <= NOT rom_data_inv(15);
ALT_INV_rom_data(15) <= NOT rom_data(15);
ALT_INV_rom_data_inv(14) <= NOT rom_data_inv(14);
ALT_INV_rom_data(14) <= NOT rom_data(14);
ALT_INV_rom_data_inv(13) <= NOT rom_data_inv(13);
ALT_INV_rom_data(13) <= NOT rom_data(13);
ALT_INV_rom_data_inv(12) <= NOT rom_data_inv(12);
ALT_INV_rom_data(12) <= NOT rom_data(12);
ALT_INV_rom_data_inv(11) <= NOT rom_data_inv(11);
ALT_INV_rom_data(11) <= NOT rom_data(11);
ALT_INV_rom_data_inv(10) <= NOT rom_data_inv(10);
ALT_INV_rom_data(10) <= NOT rom_data(10);
ALT_INV_rom_data_inv(9) <= NOT rom_data_inv(9);
ALT_INV_rom_data(9) <= NOT rom_data(9);
ALT_INV_rom_data_inv(8) <= NOT rom_data_inv(8);
ALT_INV_rom_data(8) <= NOT rom_data(8);
ALT_INV_rom_data_inv(7) <= NOT rom_data_inv(7);
ALT_INV_rom_data(7) <= NOT rom_data(7);
ALT_INV_rom_data_inv(6) <= NOT rom_data_inv(6);
ALT_INV_rom_data(6) <= NOT rom_data(6);
ALT_INV_rom_data_inv(5) <= NOT rom_data_inv(5);
ALT_INV_rom_data(5) <= NOT rom_data(5);
ALT_INV_rom_data_inv(4) <= NOT rom_data_inv(4);
ALT_INV_rom_data(4) <= NOT rom_data(4);
ALT_INV_rom_data_inv(3) <= NOT rom_data_inv(3);
ALT_INV_rom_data(3) <= NOT rom_data(3);
ALT_INV_rom_data_inv(2) <= NOT rom_data_inv(2);
ALT_INV_rom_data(2) <= NOT rom_data(2);
ALT_INV_rom_data_inv(1) <= NOT rom_data_inv(1);
ALT_INV_rom_data(1) <= NOT rom_data(1);
ALT_INV_rom_data_inv(0) <= NOT rom_data_inv(0);
ALT_INV_quadrant_p2(0) <= NOT quadrant_p2(0);
ALT_INV_quadrant_p2(1) <= NOT quadrant_p2(1);
ALT_INV_rom_data(0) <= NOT rom_data(0);

-- Location: IOOBUF_X40_Y0_N2
\data[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \data[0]~reg0_q\,
	devoe => ww_devoe,
	o => ww_data(0));

-- Location: IOOBUF_X28_Y0_N2
\data[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \data[1]~reg0_q\,
	devoe => ww_devoe,
	o => ww_data(1));

-- Location: IOOBUF_X38_Y0_N2
\data[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \data[2]~reg0_q\,
	devoe => ww_devoe,
	o => ww_data(2));

-- Location: IOOBUF_X34_Y0_N93
\data[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \data[3]~reg0_q\,
	devoe => ww_devoe,
	o => ww_data(3));

-- Location: IOOBUF_X34_Y0_N59
\data[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \data[4]~reg0_q\,
	devoe => ww_devoe,
	o => ww_data(4));

-- Location: IOOBUF_X36_Y0_N53
\data[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \data[5]~reg0_q\,
	devoe => ww_devoe,
	o => ww_data(5));

-- Location: IOOBUF_X32_Y0_N19
\data[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \data[6]~reg0_q\,
	devoe => ww_devoe,
	o => ww_data(6));

-- Location: IOOBUF_X36_Y0_N36
\data[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \data[7]~reg0_q\,
	devoe => ww_devoe,
	o => ww_data(7));

-- Location: IOOBUF_X30_Y0_N2
\data[8]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \data[8]~reg0_q\,
	devoe => ww_devoe,
	o => ww_data(8));

-- Location: IOOBUF_X32_Y0_N53
\data[9]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \data[9]~reg0_q\,
	devoe => ww_devoe,
	o => ww_data(9));

-- Location: IOOBUF_X30_Y0_N36
\data[10]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \data[10]~reg0_q\,
	devoe => ww_devoe,
	o => ww_data(10));

-- Location: IOOBUF_X36_Y0_N2
\data[11]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \data[11]~reg0_q\,
	devoe => ww_devoe,
	o => ww_data(11));

-- Location: IOOBUF_X30_Y0_N53
\data[12]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \data[12]~reg0_q\,
	devoe => ww_devoe,
	o => ww_data(12));

-- Location: IOOBUF_X30_Y0_N19
\data[13]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \data[13]~reg0_q\,
	devoe => ww_devoe,
	o => ww_data(13));

-- Location: IOOBUF_X32_Y0_N2
\data[14]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \data[14]~reg0_q\,
	devoe => ww_devoe,
	o => ww_data(14));

-- Location: IOOBUF_X36_Y0_N19
\data[15]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \data[15]~reg0_q\,
	devoe => ww_devoe,
	o => ww_data(15));

-- Location: IOOBUF_X34_Y0_N76
\data[16]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \data[16]~reg0_q\,
	devoe => ww_devoe,
	o => ww_data(16));

-- Location: IOOBUF_X34_Y0_N42
\data[17]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \data[17]~reg0_q\,
	devoe => ww_devoe,
	o => ww_data(17));

-- Location: IOOBUF_X32_Y0_N36
\data[18]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \data[18]~reg0_q\,
	devoe => ww_devoe,
	o => ww_data(18));

-- Location: IOIBUF_X89_Y25_N21
\clk~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G10
\clk~inputCLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \clk~input_o\,
	outclk => \clk~inputCLKENA0_outclk\);

-- Location: IOIBUF_X22_Y0_N18
\phase_incr[28]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_phase_incr(28),
	o => \phase_incr[28]~input_o\);

-- Location: IOIBUF_X24_Y0_N1
\phase_incr[29]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_phase_incr(29),
	o => \phase_incr[29]~input_o\);

-- Location: IOIBUF_X22_Y0_N35
\phase_incr[26]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_phase_incr(26),
	o => \phase_incr[26]~input_o\);

-- Location: IOIBUF_X20_Y0_N18
\phase_incr[27]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_phase_incr(27),
	o => \phase_incr[27]~input_o\);

-- Location: MLABCELL_X21_Y4_N45
\Equal0~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal0~2_combout\ = ( \Add0~29_sumout\ & ( \Add0~33_sumout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_Add0~33_sumout\,
	dataf => \ALT_INV_Add0~29_sumout\,
	combout => \Equal0~2_combout\);

-- Location: IOIBUF_X20_Y0_N52
\phase_incr[23]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_phase_incr(23),
	o => \phase_incr[23]~input_o\);

-- Location: IOIBUF_X24_Y0_N18
\phase_incr[21]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_phase_incr(21),
	o => \phase_incr[21]~input_o\);

-- Location: LABCELL_X22_Y4_N0
\Add1~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~5_sumout\ = SUM(( \Add0~5_sumout\ ) + ( VCC ) + ( !VCC ))
-- \Add1~6\ = CARRY(( \Add0~5_sumout\ ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_Add0~5_sumout\,
	cin => GND,
	sumout => \Add1~5_sumout\,
	cout => \Add1~6\);

-- Location: LABCELL_X22_Y4_N3
\Add1~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~9_sumout\ = SUM(( \Add0~9_sumout\ ) + ( GND ) + ( \Add1~6\ ))
-- \Add1~10\ = CARRY(( \Add0~9_sumout\ ) + ( GND ) + ( \Add1~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Add0~9_sumout\,
	cin => \Add1~6\,
	sumout => \Add1~9_sumout\,
	cout => \Add1~10\);

-- Location: MLABCELL_X21_Y4_N54
\phase_acc~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \phase_acc~2_combout\ = ( \Add0~9_sumout\ & ( \Add1~9_sumout\ ) ) # ( !\Add0~9_sumout\ & ( \Add1~9_sumout\ & ( (\Add0~37_sumout\ & (\Add0~41_sumout\ & (\Equal0~0_combout\ & \Equal0~2_combout\))) ) ) ) # ( \Add0~9_sumout\ & ( !\Add1~9_sumout\ & ( 
-- (!\Add0~37_sumout\) # ((!\Add0~41_sumout\) # ((!\Equal0~0_combout\) # (!\Equal0~2_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111000000000000000011111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Add0~37_sumout\,
	datab => \ALT_INV_Add0~41_sumout\,
	datac => \ALT_INV_Equal0~0_combout\,
	datad => \ALT_INV_Equal0~2_combout\,
	datae => \ALT_INV_Add0~9_sumout\,
	dataf => \ALT_INV_Add1~9_sumout\,
	combout => \phase_acc~2_combout\);

-- Location: IOIBUF_X26_Y0_N41
\rst~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rst,
	o => \rst~input_o\);

-- Location: FF_X21_Y4_N56
\phase_acc[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \phase_acc~2_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => phase_acc(21));

-- Location: IOIBUF_X22_Y0_N52
\phase_incr[20]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_phase_incr(20),
	o => \phase_incr[20]~input_o\);

-- Location: IOIBUF_X16_Y0_N18
\phase_incr[19]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_phase_incr(19),
	o => \phase_incr[19]~input_o\);

-- Location: IOIBUF_X16_Y0_N1
\phase_incr[18]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_phase_incr(18),
	o => \phase_incr[18]~input_o\);

-- Location: IOIBUF_X14_Y0_N52
\phase_incr[17]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_phase_incr(17),
	o => \phase_incr[17]~input_o\);

-- Location: IOIBUF_X14_Y0_N18
\phase_incr[16]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_phase_incr(16),
	o => \phase_incr[16]~input_o\);

-- Location: IOIBUF_X18_Y0_N75
\phase_incr[15]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_phase_incr(15),
	o => \phase_incr[15]~input_o\);

-- Location: IOIBUF_X26_Y0_N58
\phase_incr[14]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_phase_incr(14),
	o => \phase_incr[14]~input_o\);

-- Location: IOIBUF_X18_Y0_N92
\phase_incr[13]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_phase_incr(13),
	o => \phase_incr[13]~input_o\);

-- Location: IOIBUF_X18_Y0_N58
\phase_incr[12]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_phase_incr(12),
	o => \phase_incr[12]~input_o\);

-- Location: IOIBUF_X14_Y0_N35
\phase_incr[11]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_phase_incr(11),
	o => \phase_incr[11]~input_o\);

-- Location: IOIBUF_X14_Y0_N1
\phase_incr[10]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_phase_incr(10),
	o => \phase_incr[10]~input_o\);

-- Location: IOIBUF_X18_Y0_N41
\phase_incr[9]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_phase_incr(9),
	o => \phase_incr[9]~input_o\);

-- Location: IOIBUF_X28_Y0_N52
\phase_incr[8]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_phase_incr(8),
	o => \phase_incr[8]~input_o\);

-- Location: IOIBUF_X28_Y0_N35
\phase_incr[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_phase_incr(7),
	o => \phase_incr[7]~input_o\);

-- Location: IOIBUF_X16_Y0_N52
\phase_incr[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_phase_incr(6),
	o => \phase_incr[6]~input_o\);

-- Location: IOIBUF_X26_Y0_N92
\phase_incr[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_phase_incr(5),
	o => \phase_incr[5]~input_o\);

-- Location: IOIBUF_X28_Y0_N18
\phase_incr[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_phase_incr(4),
	o => \phase_incr[4]~input_o\);

-- Location: IOIBUF_X12_Y0_N1
\phase_incr[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_phase_incr(3),
	o => \phase_incr[3]~input_o\);

-- Location: IOIBUF_X26_Y0_N75
\phase_incr[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_phase_incr(2),
	o => \phase_incr[2]~input_o\);

-- Location: IOIBUF_X12_Y0_N18
\phase_incr[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_phase_incr(1),
	o => \phase_incr[1]~input_o\);

-- Location: IOIBUF_X16_Y0_N35
\phase_incr[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_phase_incr(0),
	o => \phase_incr[0]~input_o\);

-- Location: MLABCELL_X21_Y5_N0
\Add0~125\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~125_sumout\ = SUM(( phase_acc(0) ) + ( \phase_incr[0]~input_o\ ) + ( !VCC ))
-- \Add0~126\ = CARRY(( phase_acc(0) ) + ( \phase_incr[0]~input_o\ ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_phase_incr[0]~input_o\,
	datad => ALT_INV_phase_acc(0),
	cin => GND,
	sumout => \Add0~125_sumout\,
	cout => \Add0~126\);

-- Location: FF_X21_Y5_N2
\phase_acc[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~125_sumout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => phase_acc(0));

-- Location: MLABCELL_X21_Y5_N3
\Add0~121\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~121_sumout\ = SUM(( phase_acc(1) ) + ( \phase_incr[1]~input_o\ ) + ( \Add0~126\ ))
-- \Add0~122\ = CARRY(( phase_acc(1) ) + ( \phase_incr[1]~input_o\ ) + ( \Add0~126\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_phase_incr[1]~input_o\,
	datad => ALT_INV_phase_acc(1),
	cin => \Add0~126\,
	sumout => \Add0~121_sumout\,
	cout => \Add0~122\);

-- Location: FF_X21_Y5_N5
\phase_acc[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~121_sumout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => phase_acc(1));

-- Location: MLABCELL_X21_Y5_N6
\Add0~117\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~117_sumout\ = SUM(( phase_acc(2) ) + ( \phase_incr[2]~input_o\ ) + ( \Add0~122\ ))
-- \Add0~118\ = CARRY(( phase_acc(2) ) + ( \phase_incr[2]~input_o\ ) + ( \Add0~122\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_phase_incr[2]~input_o\,
	datad => ALT_INV_phase_acc(2),
	cin => \Add0~122\,
	sumout => \Add0~117_sumout\,
	cout => \Add0~118\);

-- Location: FF_X21_Y5_N7
\phase_acc[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~117_sumout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => phase_acc(2));

-- Location: MLABCELL_X21_Y5_N9
\Add0~113\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~113_sumout\ = SUM(( phase_acc(3) ) + ( \phase_incr[3]~input_o\ ) + ( \Add0~118\ ))
-- \Add0~114\ = CARRY(( phase_acc(3) ) + ( \phase_incr[3]~input_o\ ) + ( \Add0~118\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000110011001100110000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_phase_incr[3]~input_o\,
	datac => ALT_INV_phase_acc(3),
	cin => \Add0~118\,
	sumout => \Add0~113_sumout\,
	cout => \Add0~114\);

-- Location: FF_X21_Y5_N11
\phase_acc[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~113_sumout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => phase_acc(3));

-- Location: MLABCELL_X21_Y5_N12
\Add0~109\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~109_sumout\ = SUM(( phase_acc(4) ) + ( \phase_incr[4]~input_o\ ) + ( \Add0~114\ ))
-- \Add0~110\ = CARRY(( phase_acc(4) ) + ( \phase_incr[4]~input_o\ ) + ( \Add0~114\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_phase_acc(4),
	datac => \ALT_INV_phase_incr[4]~input_o\,
	cin => \Add0~114\,
	sumout => \Add0~109_sumout\,
	cout => \Add0~110\);

-- Location: FF_X21_Y5_N14
\phase_acc[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~109_sumout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => phase_acc(4));

-- Location: MLABCELL_X21_Y5_N15
\Add0~105\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~105_sumout\ = SUM(( phase_acc(5) ) + ( \phase_incr[5]~input_o\ ) + ( \Add0~110\ ))
-- \Add0~106\ = CARRY(( phase_acc(5) ) + ( \phase_incr[5]~input_o\ ) + ( \Add0~110\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_phase_acc(5),
	dataf => \ALT_INV_phase_incr[5]~input_o\,
	cin => \Add0~110\,
	sumout => \Add0~105_sumout\,
	cout => \Add0~106\);

-- Location: FF_X21_Y5_N17
\phase_acc[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~105_sumout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => phase_acc(5));

-- Location: MLABCELL_X21_Y5_N18
\Add0~101\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~101_sumout\ = SUM(( phase_acc(6) ) + ( \phase_incr[6]~input_o\ ) + ( \Add0~106\ ))
-- \Add0~102\ = CARRY(( phase_acc(6) ) + ( \phase_incr[6]~input_o\ ) + ( \Add0~106\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_phase_acc(6),
	dataf => \ALT_INV_phase_incr[6]~input_o\,
	cin => \Add0~106\,
	sumout => \Add0~101_sumout\,
	cout => \Add0~102\);

-- Location: FF_X21_Y5_N20
\phase_acc[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~101_sumout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => phase_acc(6));

-- Location: MLABCELL_X21_Y5_N21
\Add0~97\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~97_sumout\ = SUM(( phase_acc(7) ) + ( \phase_incr[7]~input_o\ ) + ( \Add0~102\ ))
-- \Add0~98\ = CARRY(( phase_acc(7) ) + ( \phase_incr[7]~input_o\ ) + ( \Add0~102\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010101010101000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_phase_incr[7]~input_o\,
	datad => ALT_INV_phase_acc(7),
	cin => \Add0~102\,
	sumout => \Add0~97_sumout\,
	cout => \Add0~98\);

-- Location: FF_X21_Y5_N23
\phase_acc[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~97_sumout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => phase_acc(7));

-- Location: MLABCELL_X21_Y5_N24
\Add0~93\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~93_sumout\ = SUM(( phase_acc(8) ) + ( \phase_incr[8]~input_o\ ) + ( \Add0~98\ ))
-- \Add0~94\ = CARRY(( phase_acc(8) ) + ( \phase_incr[8]~input_o\ ) + ( \Add0~98\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_phase_acc(8),
	dataf => \ALT_INV_phase_incr[8]~input_o\,
	cin => \Add0~98\,
	sumout => \Add0~93_sumout\,
	cout => \Add0~94\);

-- Location: FF_X21_Y5_N26
\phase_acc[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~93_sumout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => phase_acc(8));

-- Location: MLABCELL_X21_Y5_N27
\Add0~89\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~89_sumout\ = SUM(( phase_acc(9) ) + ( \phase_incr[9]~input_o\ ) + ( \Add0~94\ ))
-- \Add0~90\ = CARRY(( phase_acc(9) ) + ( \phase_incr[9]~input_o\ ) + ( \Add0~94\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010101010101000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_phase_incr[9]~input_o\,
	datad => ALT_INV_phase_acc(9),
	cin => \Add0~94\,
	sumout => \Add0~89_sumout\,
	cout => \Add0~90\);

-- Location: FF_X21_Y5_N29
\phase_acc[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~89_sumout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => phase_acc(9));

-- Location: MLABCELL_X21_Y5_N30
\Add0~85\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~85_sumout\ = SUM(( \phase_incr[10]~input_o\ ) + ( phase_acc(10) ) + ( \Add0~90\ ))
-- \Add0~86\ = CARRY(( \phase_incr[10]~input_o\ ) + ( phase_acc(10) ) + ( \Add0~90\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_phase_acc(10),
	datad => \ALT_INV_phase_incr[10]~input_o\,
	cin => \Add0~90\,
	sumout => \Add0~85_sumout\,
	cout => \Add0~86\);

-- Location: FF_X21_Y5_N31
\phase_acc[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~85_sumout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => phase_acc(10));

-- Location: MLABCELL_X21_Y5_N33
\Add0~81\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~81_sumout\ = SUM(( phase_acc(11) ) + ( \phase_incr[11]~input_o\ ) + ( \Add0~86\ ))
-- \Add0~82\ = CARRY(( phase_acc(11) ) + ( \phase_incr[11]~input_o\ ) + ( \Add0~86\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_phase_acc(11),
	dataf => \ALT_INV_phase_incr[11]~input_o\,
	cin => \Add0~86\,
	sumout => \Add0~81_sumout\,
	cout => \Add0~82\);

-- Location: FF_X21_Y5_N35
\phase_acc[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~81_sumout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => phase_acc(11));

-- Location: MLABCELL_X21_Y5_N36
\Add0~77\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~77_sumout\ = SUM(( phase_acc(12) ) + ( \phase_incr[12]~input_o\ ) + ( \Add0~82\ ))
-- \Add0~78\ = CARRY(( phase_acc(12) ) + ( \phase_incr[12]~input_o\ ) + ( \Add0~82\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000110011001100110000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_phase_incr[12]~input_o\,
	datac => ALT_INV_phase_acc(12),
	cin => \Add0~82\,
	sumout => \Add0~77_sumout\,
	cout => \Add0~78\);

-- Location: FF_X21_Y5_N38
\phase_acc[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~77_sumout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => phase_acc(12));

-- Location: MLABCELL_X21_Y5_N39
\Add0~73\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~73_sumout\ = SUM(( phase_acc(13) ) + ( \phase_incr[13]~input_o\ ) + ( \Add0~78\ ))
-- \Add0~74\ = CARRY(( phase_acc(13) ) + ( \phase_incr[13]~input_o\ ) + ( \Add0~78\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010101010101000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_phase_incr[13]~input_o\,
	datac => ALT_INV_phase_acc(13),
	cin => \Add0~78\,
	sumout => \Add0~73_sumout\,
	cout => \Add0~74\);

-- Location: FF_X21_Y5_N41
\phase_acc[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~73_sumout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => phase_acc(13));

-- Location: MLABCELL_X21_Y5_N42
\Add0~69\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~69_sumout\ = SUM(( phase_acc(14) ) + ( \phase_incr[14]~input_o\ ) + ( \Add0~74\ ))
-- \Add0~70\ = CARRY(( phase_acc(14) ) + ( \phase_incr[14]~input_o\ ) + ( \Add0~74\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_phase_incr[14]~input_o\,
	datad => ALT_INV_phase_acc(14),
	cin => \Add0~74\,
	sumout => \Add0~69_sumout\,
	cout => \Add0~70\);

-- Location: FF_X21_Y5_N43
\phase_acc[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~69_sumout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => phase_acc(14));

-- Location: MLABCELL_X21_Y5_N45
\Add0~65\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~65_sumout\ = SUM(( phase_acc(15) ) + ( \phase_incr[15]~input_o\ ) + ( \Add0~70\ ))
-- \Add0~66\ = CARRY(( phase_acc(15) ) + ( \phase_incr[15]~input_o\ ) + ( \Add0~70\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_phase_incr[15]~input_o\,
	datad => ALT_INV_phase_acc(15),
	cin => \Add0~70\,
	sumout => \Add0~65_sumout\,
	cout => \Add0~66\);

-- Location: FF_X21_Y5_N47
\phase_acc[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~65_sumout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => phase_acc(15));

-- Location: MLABCELL_X21_Y5_N48
\Add0~61\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~61_sumout\ = SUM(( phase_acc(16) ) + ( \phase_incr[16]~input_o\ ) + ( \Add0~66\ ))
-- \Add0~62\ = CARRY(( phase_acc(16) ) + ( \phase_incr[16]~input_o\ ) + ( \Add0~66\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010101010101000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_phase_incr[16]~input_o\,
	datac => ALT_INV_phase_acc(16),
	cin => \Add0~66\,
	sumout => \Add0~61_sumout\,
	cout => \Add0~62\);

-- Location: FF_X21_Y5_N50
\phase_acc[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~61_sumout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => phase_acc(16));

-- Location: MLABCELL_X21_Y5_N51
\Add0~57\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~57_sumout\ = SUM(( phase_acc(17) ) + ( \phase_incr[17]~input_o\ ) + ( \Add0~62\ ))
-- \Add0~58\ = CARRY(( phase_acc(17) ) + ( \phase_incr[17]~input_o\ ) + ( \Add0~62\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_phase_acc(17),
	dataf => \ALT_INV_phase_incr[17]~input_o\,
	cin => \Add0~62\,
	sumout => \Add0~57_sumout\,
	cout => \Add0~58\);

-- Location: FF_X21_Y5_N52
\phase_acc[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~57_sumout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => phase_acc(17));

-- Location: MLABCELL_X21_Y5_N54
\Add0~53\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~53_sumout\ = SUM(( phase_acc(18) ) + ( \phase_incr[18]~input_o\ ) + ( \Add0~58\ ))
-- \Add0~54\ = CARRY(( phase_acc(18) ) + ( \phase_incr[18]~input_o\ ) + ( \Add0~58\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010101010101000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_phase_incr[18]~input_o\,
	datac => ALT_INV_phase_acc(18),
	cin => \Add0~58\,
	sumout => \Add0~53_sumout\,
	cout => \Add0~54\);

-- Location: FF_X21_Y5_N56
\phase_acc[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~53_sumout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => phase_acc(18));

-- Location: MLABCELL_X21_Y5_N57
\Add0~49\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~49_sumout\ = SUM(( phase_acc(19) ) + ( \phase_incr[19]~input_o\ ) + ( \Add0~54\ ))
-- \Add0~50\ = CARRY(( phase_acc(19) ) + ( \phase_incr[19]~input_o\ ) + ( \Add0~54\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000110011001100110000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_phase_incr[19]~input_o\,
	datac => ALT_INV_phase_acc(19),
	cin => \Add0~54\,
	sumout => \Add0~49_sumout\,
	cout => \Add0~50\);

-- Location: FF_X21_Y5_N59
\phase_acc[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~49_sumout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => phase_acc(19));

-- Location: MLABCELL_X21_Y4_N0
\Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~5_sumout\ = SUM(( phase_acc(20) ) + ( \phase_incr[20]~input_o\ ) + ( \Add0~50\ ))
-- \Add0~6\ = CARRY(( phase_acc(20) ) + ( \phase_incr[20]~input_o\ ) + ( \Add0~50\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_phase_acc(20),
	dataf => \ALT_INV_phase_incr[20]~input_o\,
	cin => \Add0~50\,
	sumout => \Add0~5_sumout\,
	cout => \Add0~6\);

-- Location: MLABCELL_X21_Y4_N3
\Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~9_sumout\ = SUM(( phase_acc(21) ) + ( \phase_incr[21]~input_o\ ) + ( \Add0~6\ ))
-- \Add0~10\ = CARRY(( phase_acc(21) ) + ( \phase_incr[21]~input_o\ ) + ( \Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010101010101000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_phase_incr[21]~input_o\,
	datad => ALT_INV_phase_acc(21),
	cin => \Add0~6\,
	sumout => \Add0~9_sumout\,
	cout => \Add0~10\);

-- Location: LABCELL_X22_Y4_N6
\Add1~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~13_sumout\ = SUM(( \Add0~13_sumout\ ) + ( GND ) + ( \Add1~10\ ))
-- \Add1~14\ = CARRY(( \Add0~13_sumout\ ) + ( GND ) + ( \Add1~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_Add0~13_sumout\,
	cin => \Add1~10\,
	sumout => \Add1~13_sumout\,
	cout => \Add1~14\);

-- Location: MLABCELL_X21_Y4_N51
\phase_acc~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \phase_acc~3_combout\ = ( \Add0~13_sumout\ & ( \Add1~13_sumout\ ) ) # ( !\Add0~13_sumout\ & ( \Add1~13_sumout\ & ( (\Add0~37_sumout\ & (\Add0~41_sumout\ & (\Equal0~2_combout\ & \Equal0~0_combout\))) ) ) ) # ( \Add0~13_sumout\ & ( !\Add1~13_sumout\ & ( 
-- (!\Add0~37_sumout\) # ((!\Add0~41_sumout\) # ((!\Equal0~2_combout\) # (!\Equal0~0_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111000000000000000011111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Add0~37_sumout\,
	datab => \ALT_INV_Add0~41_sumout\,
	datac => \ALT_INV_Equal0~2_combout\,
	datad => \ALT_INV_Equal0~0_combout\,
	datae => \ALT_INV_Add0~13_sumout\,
	dataf => \ALT_INV_Add1~13_sumout\,
	combout => \phase_acc~3_combout\);

-- Location: FF_X21_Y4_N53
\phase_acc[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \phase_acc~3_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => phase_acc(22));

-- Location: IOIBUF_X22_Y0_N1
\phase_incr[22]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_phase_incr(22),
	o => \phase_incr[22]~input_o\);

-- Location: MLABCELL_X21_Y4_N6
\Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~13_sumout\ = SUM(( phase_acc(22) ) + ( \phase_incr[22]~input_o\ ) + ( \Add0~10\ ))
-- \Add0~14\ = CARRY(( phase_acc(22) ) + ( \phase_incr[22]~input_o\ ) + ( \Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_phase_acc(22),
	dataf => \ALT_INV_phase_incr[22]~input_o\,
	cin => \Add0~10\,
	sumout => \Add0~13_sumout\,
	cout => \Add0~14\);

-- Location: LABCELL_X22_Y4_N9
\Add1~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~17_sumout\ = SUM(( \Add0~17_sumout\ ) + ( GND ) + ( \Add1~14\ ))
-- \Add1~18\ = CARRY(( \Add0~17_sumout\ ) + ( GND ) + ( \Add1~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Add0~17_sumout\,
	cin => \Add1~14\,
	sumout => \Add1~17_sumout\,
	cout => \Add1~18\);

-- Location: LABCELL_X23_Y4_N12
\phase_acc~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \phase_acc~4_combout\ = ( \Equal0~2_combout\ & ( \Add1~17_sumout\ & ( ((\Add0~41_sumout\ & (\Equal0~0_combout\ & \Add0~37_sumout\))) # (\Add0~17_sumout\) ) ) ) # ( !\Equal0~2_combout\ & ( \Add1~17_sumout\ & ( \Add0~17_sumout\ ) ) ) # ( \Equal0~2_combout\ 
-- & ( !\Add1~17_sumout\ & ( (\Add0~17_sumout\ & ((!\Add0~41_sumout\) # ((!\Equal0~0_combout\) # (!\Add0~37_sumout\)))) ) ) ) # ( !\Equal0~2_combout\ & ( !\Add1~17_sumout\ & ( \Add0~17_sumout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001000110011001100110011001100110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Add0~41_sumout\,
	datab => \ALT_INV_Add0~17_sumout\,
	datac => \ALT_INV_Equal0~0_combout\,
	datad => \ALT_INV_Add0~37_sumout\,
	datae => \ALT_INV_Equal0~2_combout\,
	dataf => \ALT_INV_Add1~17_sumout\,
	combout => \phase_acc~4_combout\);

-- Location: FF_X23_Y4_N14
\phase_acc[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \phase_acc~4_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => phase_acc(23));

-- Location: MLABCELL_X21_Y4_N9
\Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~17_sumout\ = SUM(( phase_acc(23) ) + ( \phase_incr[23]~input_o\ ) + ( \Add0~14\ ))
-- \Add0~18\ = CARRY(( phase_acc(23) ) + ( \phase_incr[23]~input_o\ ) + ( \Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010101010101000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_phase_incr[23]~input_o\,
	datad => ALT_INV_phase_acc(23),
	cin => \Add0~14\,
	sumout => \Add0~17_sumout\,
	cout => \Add0~18\);

-- Location: LABCELL_X22_Y4_N12
\Add1~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~21_sumout\ = SUM(( \Add0~21_sumout\ ) + ( GND ) + ( \Add1~18\ ))
-- \Add1~22\ = CARRY(( \Add0~21_sumout\ ) + ( GND ) + ( \Add1~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_Add0~21_sumout\,
	cin => \Add1~18\,
	sumout => \Add1~21_sumout\,
	cout => \Add1~22\);

-- Location: MLABCELL_X21_Y4_N57
\phase_acc~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \phase_acc~5_combout\ = ( \Add0~21_sumout\ & ( \Add1~21_sumout\ ) ) # ( !\Add0~21_sumout\ & ( \Add1~21_sumout\ & ( (\Add0~37_sumout\ & (\Add0~41_sumout\ & (\Equal0~2_combout\ & \Equal0~0_combout\))) ) ) ) # ( \Add0~21_sumout\ & ( !\Add1~21_sumout\ & ( 
-- (!\Add0~37_sumout\) # ((!\Add0~41_sumout\) # ((!\Equal0~2_combout\) # (!\Equal0~0_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111000000000000000011111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Add0~37_sumout\,
	datab => \ALT_INV_Add0~41_sumout\,
	datac => \ALT_INV_Equal0~2_combout\,
	datad => \ALT_INV_Equal0~0_combout\,
	datae => \ALT_INV_Add0~21_sumout\,
	dataf => \ALT_INV_Add1~21_sumout\,
	combout => \phase_acc~5_combout\);

-- Location: FF_X21_Y4_N59
\phase_acc[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \phase_acc~5_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => phase_acc(24));

-- Location: IOIBUF_X24_Y0_N52
\phase_incr[24]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_phase_incr(24),
	o => \phase_incr[24]~input_o\);

-- Location: MLABCELL_X21_Y4_N12
\Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~21_sumout\ = SUM(( phase_acc(24) ) + ( \phase_incr[24]~input_o\ ) + ( \Add0~18\ ))
-- \Add0~22\ = CARRY(( phase_acc(24) ) + ( \phase_incr[24]~input_o\ ) + ( \Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_phase_acc(24),
	dataf => \ALT_INV_phase_incr[24]~input_o\,
	cin => \Add0~18\,
	sumout => \Add0~21_sumout\,
	cout => \Add0~22\);

-- Location: LABCELL_X22_Y4_N15
\Add1~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~25_sumout\ = SUM(( \Add0~25_sumout\ ) + ( GND ) + ( \Add1~22\ ))
-- \Add1~26\ = CARRY(( \Add0~25_sumout\ ) + ( GND ) + ( \Add1~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Add0~25_sumout\,
	cin => \Add1~22\,
	sumout => \Add1~25_sumout\,
	cout => \Add1~26\);

-- Location: LABCELL_X22_Y4_N39
\phase_acc~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \phase_acc~6_combout\ = ( \Add0~25_sumout\ & ( \Add1~25_sumout\ ) ) # ( !\Add0~25_sumout\ & ( \Add1~25_sumout\ & ( (\Equal0~0_combout\ & (\Add0~41_sumout\ & (\Add0~37_sumout\ & \Equal0~2_combout\))) ) ) ) # ( \Add0~25_sumout\ & ( !\Add1~25_sumout\ & ( 
-- (!\Equal0~0_combout\) # ((!\Add0~41_sumout\) # ((!\Add0~37_sumout\) # (!\Equal0~2_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111000000000000000011111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Equal0~0_combout\,
	datab => \ALT_INV_Add0~41_sumout\,
	datac => \ALT_INV_Add0~37_sumout\,
	datad => \ALT_INV_Equal0~2_combout\,
	datae => \ALT_INV_Add0~25_sumout\,
	dataf => \ALT_INV_Add1~25_sumout\,
	combout => \phase_acc~6_combout\);

-- Location: FF_X22_Y4_N41
\phase_acc[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \phase_acc~6_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => phase_acc(25));

-- Location: IOIBUF_X20_Y0_N35
\phase_incr[25]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_phase_incr(25),
	o => \phase_incr[25]~input_o\);

-- Location: MLABCELL_X21_Y4_N15
\Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~25_sumout\ = SUM(( phase_acc(25) ) + ( \phase_incr[25]~input_o\ ) + ( \Add0~22\ ))
-- \Add0~26\ = CARRY(( phase_acc(25) ) + ( \phase_incr[25]~input_o\ ) + ( \Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_phase_acc(25),
	datac => \ALT_INV_phase_incr[25]~input_o\,
	cin => \Add0~22\,
	sumout => \Add0~25_sumout\,
	cout => \Add0~26\);

-- Location: LABCELL_X22_Y4_N18
\Add1~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~29_sumout\ = SUM(( \Add0~29_sumout\ ) + ( GND ) + ( \Add1~26\ ))
-- \Add1~30\ = CARRY(( \Add0~29_sumout\ ) + ( GND ) + ( \Add1~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_Add0~29_sumout\,
	cin => \Add1~26\,
	sumout => \Add1~29_sumout\,
	cout => \Add1~30\);

-- Location: LABCELL_X22_Y4_N21
\Add1~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~33_sumout\ = SUM(( \Add0~33_sumout\ ) + ( GND ) + ( \Add1~30\ ))
-- \Add1~34\ = CARRY(( \Add0~33_sumout\ ) + ( GND ) + ( \Add1~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_Add0~33_sumout\,
	cin => \Add1~30\,
	sumout => \Add1~33_sumout\,
	cout => \Add1~34\);

-- Location: LABCELL_X22_Y4_N36
\phase_acc~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \phase_acc~8_combout\ = ( \Add0~33_sumout\ & ( \Add1~33_sumout\ ) ) # ( !\Add0~33_sumout\ & ( \Add1~33_sumout\ & ( (\Equal0~0_combout\ & (\Add0~41_sumout\ & (\Equal0~2_combout\ & \Add0~37_sumout\))) ) ) ) # ( \Add0~33_sumout\ & ( !\Add1~33_sumout\ & ( 
-- (!\Equal0~0_combout\) # ((!\Add0~41_sumout\) # ((!\Equal0~2_combout\) # (!\Add0~37_sumout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111000000000000000011111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Equal0~0_combout\,
	datab => \ALT_INV_Add0~41_sumout\,
	datac => \ALT_INV_Equal0~2_combout\,
	datad => \ALT_INV_Add0~37_sumout\,
	datae => \ALT_INV_Add0~33_sumout\,
	dataf => \ALT_INV_Add1~33_sumout\,
	combout => \phase_acc~8_combout\);

-- Location: FF_X22_Y4_N38
\phase_acc[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \phase_acc~8_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => phase_acc(27));

-- Location: MLABCELL_X21_Y4_N18
\Add0~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~29_sumout\ = SUM(( phase_acc(26) ) + ( \phase_incr[26]~input_o\ ) + ( \Add0~26\ ))
-- \Add0~30\ = CARRY(( phase_acc(26) ) + ( \phase_incr[26]~input_o\ ) + ( \Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000110011001100110000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_phase_incr[26]~input_o\,
	datad => ALT_INV_phase_acc(26),
	cin => \Add0~26\,
	sumout => \Add0~29_sumout\,
	cout => \Add0~30\);

-- Location: MLABCELL_X21_Y4_N21
\Add0~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~33_sumout\ = SUM(( phase_acc(27) ) + ( \phase_incr[27]~input_o\ ) + ( \Add0~30\ ))
-- \Add0~34\ = CARRY(( phase_acc(27) ) + ( \phase_incr[27]~input_o\ ) + ( \Add0~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010101010101000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_phase_incr[27]~input_o\,
	datad => ALT_INV_phase_acc(27),
	cin => \Add0~30\,
	sumout => \Add0~33_sumout\,
	cout => \Add0~34\);

-- Location: LABCELL_X22_Y4_N48
\phase_acc~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \phase_acc~7_combout\ = ( \Add0~33_sumout\ & ( \Add1~29_sumout\ & ( \Add0~29_sumout\ ) ) ) # ( !\Add0~33_sumout\ & ( \Add1~29_sumout\ & ( \Add0~29_sumout\ ) ) ) # ( \Add0~33_sumout\ & ( !\Add1~29_sumout\ & ( (\Add0~29_sumout\ & ((!\Equal0~0_combout\) # 
-- ((!\Add0~41_sumout\) # (!\Add0~37_sumout\)))) ) ) ) # ( !\Add0~33_sumout\ & ( !\Add1~29_sumout\ & ( \Add0~29_sumout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111000001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Equal0~0_combout\,
	datab => \ALT_INV_Add0~41_sumout\,
	datac => \ALT_INV_Add0~29_sumout\,
	datad => \ALT_INV_Add0~37_sumout\,
	datae => \ALT_INV_Add0~33_sumout\,
	dataf => \ALT_INV_Add1~29_sumout\,
	combout => \phase_acc~7_combout\);

-- Location: FF_X22_Y4_N50
\phase_acc[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \phase_acc~7_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => phase_acc(26));

-- Location: MLABCELL_X21_Y4_N42
\Equal0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal0~1_combout\ = ( \Add0~37_sumout\ & ( (\Add0~29_sumout\ & (\Add0~33_sumout\ & \Add0~41_sumout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000001010000000000000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Add0~29_sumout\,
	datac => \ALT_INV_Add0~33_sumout\,
	datad => \ALT_INV_Add0~41_sumout\,
	dataf => \ALT_INV_Add0~37_sumout\,
	combout => \Equal0~1_combout\);

-- Location: LABCELL_X22_Y4_N24
\Add1~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~37_sumout\ = SUM(( \Add0~37_sumout\ ) + ( GND ) + ( \Add1~34\ ))
-- \Add1~38\ = CARRY(( \Add0~37_sumout\ ) + ( GND ) + ( \Add1~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_Add0~37_sumout\,
	cin => \Add1~34\,
	sumout => \Add1~37_sumout\,
	cout => \Add1~38\);

-- Location: LABCELL_X22_Y4_N27
\Add1~41\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~41_sumout\ = SUM(( \Add0~41_sumout\ ) + ( GND ) + ( \Add1~38\ ))
-- \Add1~42\ = CARRY(( \Add0~41_sumout\ ) + ( GND ) + ( \Add1~38\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_Add0~41_sumout\,
	cin => \Add1~38\,
	sumout => \Add1~41_sumout\,
	cout => \Add1~42\);

-- Location: LABCELL_X22_Y4_N42
\phase_acc~10\ : cyclonev_lcell_comb
-- Equation(s):
-- \phase_acc~10_combout\ = ( \Add1~41_sumout\ & ( ((\Equal0~1_combout\ & \Equal0~0_combout\)) # (\Add0~41_sumout\) ) ) # ( !\Add1~41_sumout\ & ( (\Add0~41_sumout\ & ((!\Equal0~1_combout\) # (!\Equal0~0_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111100000000001111110000000011111111110000001111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_Equal0~1_combout\,
	datac => \ALT_INV_Equal0~0_combout\,
	datad => \ALT_INV_Add0~41_sumout\,
	dataf => \ALT_INV_Add1~41_sumout\,
	combout => \phase_acc~10_combout\);

-- Location: FF_X22_Y4_N44
\phase_acc[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \phase_acc~10_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => phase_acc(29));

-- Location: MLABCELL_X21_Y4_N24
\Add0~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~37_sumout\ = SUM(( phase_acc(28) ) + ( \phase_incr[28]~input_o\ ) + ( \Add0~34\ ))
-- \Add0~38\ = CARRY(( phase_acc(28) ) + ( \phase_incr[28]~input_o\ ) + ( \Add0~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000110011001100110000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_phase_incr[28]~input_o\,
	datad => ALT_INV_phase_acc(28),
	cin => \Add0~34\,
	sumout => \Add0~37_sumout\,
	cout => \Add0~38\);

-- Location: MLABCELL_X21_Y4_N27
\Add0~41\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~41_sumout\ = SUM(( phase_acc(29) ) + ( \phase_incr[29]~input_o\ ) + ( \Add0~38\ ))
-- \Add0~42\ = CARRY(( phase_acc(29) ) + ( \phase_incr[29]~input_o\ ) + ( \Add0~38\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010101010101000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_phase_incr[29]~input_o\,
	datac => ALT_INV_phase_acc(29),
	cin => \Add0~38\,
	sumout => \Add0~41_sumout\,
	cout => \Add0~42\);

-- Location: LABCELL_X22_Y4_N57
\phase_acc~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \phase_acc~9_combout\ = ( \Add1~37_sumout\ & ( \Add0~37_sumout\ ) ) # ( !\Add1~37_sumout\ & ( (\Add0~37_sumout\ & ((!\Equal0~0_combout\) # ((!\Add0~41_sumout\) # (!\Equal0~2_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111110000000001111111000000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Equal0~0_combout\,
	datab => \ALT_INV_Add0~41_sumout\,
	datac => \ALT_INV_Equal0~2_combout\,
	datad => \ALT_INV_Add0~37_sumout\,
	dataf => \ALT_INV_Add1~37_sumout\,
	combout => \phase_acc~9_combout\);

-- Location: FF_X22_Y4_N59
\phase_acc[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \phase_acc~9_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => phase_acc(28));

-- Location: MLABCELL_X21_Y4_N48
\phase_acc~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \phase_acc~1_combout\ = ( \Add0~5_sumout\ & ( \Add1~5_sumout\ ) ) # ( !\Add0~5_sumout\ & ( \Add1~5_sumout\ & ( (\Add0~37_sumout\ & (\Add0~41_sumout\ & (\Equal0~0_combout\ & \Equal0~2_combout\))) ) ) ) # ( \Add0~5_sumout\ & ( !\Add1~5_sumout\ & ( 
-- (!\Add0~37_sumout\) # ((!\Add0~41_sumout\) # ((!\Equal0~0_combout\) # (!\Equal0~2_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111000000000000000011111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Add0~37_sumout\,
	datab => \ALT_INV_Add0~41_sumout\,
	datac => \ALT_INV_Equal0~0_combout\,
	datad => \ALT_INV_Equal0~2_combout\,
	datae => \ALT_INV_Add0~5_sumout\,
	dataf => \ALT_INV_Add1~5_sumout\,
	combout => \phase_acc~1_combout\);

-- Location: FF_X21_Y4_N50
\phase_acc[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \phase_acc~1_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => phase_acc(20));

-- Location: MLABCELL_X21_Y4_N36
\Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = ( \Add0~9_sumout\ & ( \Add0~25_sumout\ & ( (\Add0~5_sumout\ & (\Add0~17_sumout\ & (\Add0~13_sumout\ & \Add0~21_sumout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Add0~5_sumout\,
	datab => \ALT_INV_Add0~17_sumout\,
	datac => \ALT_INV_Add0~13_sumout\,
	datad => \ALT_INV_Add0~21_sumout\,
	datae => \ALT_INV_Add0~9_sumout\,
	dataf => \ALT_INV_Add0~25_sumout\,
	combout => \Equal0~0_combout\);

-- Location: IOIBUF_X24_Y0_N35
\phase_incr[30]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_phase_incr(30),
	o => \phase_incr[30]~input_o\);

-- Location: MLABCELL_X21_Y4_N30
\Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~1_sumout\ = SUM(( phase_acc(30) ) + ( \phase_incr[30]~input_o\ ) + ( \Add0~42\ ))
-- \Add0~2\ = CARRY(( phase_acc(30) ) + ( \phase_incr[30]~input_o\ ) + ( \Add0~42\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010101010101000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_phase_incr[30]~input_o\,
	datac => ALT_INV_phase_acc(30),
	cin => \Add0~42\,
	sumout => \Add0~1_sumout\,
	cout => \Add0~2\);

-- Location: LABCELL_X22_Y4_N30
\Add1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~1_sumout\ = SUM(( \Add0~1_sumout\ ) + ( GND ) + ( \Add1~42\ ))
-- \Add1~2\ = CARRY(( \Add0~1_sumout\ ) + ( GND ) + ( \Add1~42\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Add0~1_sumout\,
	cin => \Add1~42\,
	sumout => \Add1~1_sumout\,
	cout => \Add1~2\);

-- Location: LABCELL_X22_Y4_N45
\phase_acc~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \phase_acc~0_combout\ = ( \Add1~1_sumout\ & ( ((\Equal0~0_combout\ & \Equal0~1_combout\)) # (\Add0~1_sumout\) ) ) # ( !\Add1~1_sumout\ & ( (\Add0~1_sumout\ & ((!\Equal0~0_combout\) # (!\Equal0~1_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011101110000000001110111000010001111111110001000111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Equal0~0_combout\,
	datab => \ALT_INV_Equal0~1_combout\,
	datad => \ALT_INV_Add0~1_sumout\,
	dataf => \ALT_INV_Add1~1_sumout\,
	combout => \phase_acc~0_combout\);

-- Location: FF_X22_Y4_N47
\phase_acc[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \phase_acc~0_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => phase_acc(30));

-- Location: LABCELL_X23_Y4_N33
\rom_addr[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \rom_addr[0]~0_combout\ = !phase_acc(30) $ (phase_acc(20))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101001010101101010100101010110101010010101011010101001010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_phase_acc(30),
	datad => ALT_INV_phase_acc(20),
	combout => \rom_addr[0]~0_combout\);

-- Location: LABCELL_X23_Y4_N30
\rom_addr[1]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \rom_addr[1]~1_combout\ = !phase_acc(30) $ (phase_acc(21))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010010110100101101001011010010110100101101001011010010110100101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_phase_acc(30),
	datac => ALT_INV_phase_acc(21),
	combout => \rom_addr[1]~1_combout\);

-- Location: LABCELL_X23_Y4_N39
\rom_addr[2]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \rom_addr[2]~2_combout\ = ( phase_acc(22) & ( phase_acc(30) ) ) # ( !phase_acc(22) & ( !phase_acc(30) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111100000000000000001111111111111111000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_phase_acc(30),
	datae => ALT_INV_phase_acc(22),
	combout => \rom_addr[2]~2_combout\);

-- Location: LABCELL_X23_Y4_N6
\rom_addr[3]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \rom_addr[3]~3_combout\ = ( phase_acc(23) & ( phase_acc(30) ) ) # ( !phase_acc(23) & ( !phase_acc(30) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010101010101010101010101001010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_phase_acc(30),
	dataf => ALT_INV_phase_acc(23),
	combout => \rom_addr[3]~3_combout\);

-- Location: LABCELL_X23_Y4_N9
\rom_addr[4]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \rom_addr[4]~4_combout\ = !phase_acc(30) $ (phase_acc(24))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101001010101101010100101010110101010010101011010101001010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_phase_acc(30),
	datad => ALT_INV_phase_acc(24),
	combout => \rom_addr[4]~4_combout\);

-- Location: LABCELL_X23_Y4_N21
\rom_addr[5]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \rom_addr[5]~5_combout\ = !phase_acc(25) $ (phase_acc(30))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000000001111111100000000111111110000000011111111000000001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_phase_acc(25),
	datad => ALT_INV_phase_acc(30),
	combout => \rom_addr[5]~5_combout\);

-- Location: LABCELL_X23_Y4_N0
\rom_addr[6]~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \rom_addr[6]~6_combout\ = ( phase_acc(26) & ( phase_acc(30) ) ) # ( !phase_acc(26) & ( !phase_acc(30) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000011110000111100001111000000001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_phase_acc(30),
	dataf => ALT_INV_phase_acc(26),
	combout => \rom_addr[6]~6_combout\);

-- Location: LABCELL_X23_Y4_N48
\rom_addr[7]~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \rom_addr[7]~7_combout\ = !phase_acc(30) $ (phase_acc(27))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010010110100101101001011010010110100101101001011010010110100101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_phase_acc(30),
	datac => ALT_INV_phase_acc(27),
	combout => \rom_addr[7]~7_combout\);

-- Location: LABCELL_X23_Y4_N42
\rom_addr[8]~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \rom_addr[8]~8_combout\ = !phase_acc(28) $ (phase_acc(30))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010010110100101101001011010010110100101101001011010010110100101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_phase_acc(28),
	datac => ALT_INV_phase_acc(30),
	combout => \rom_addr[8]~8_combout\);

-- Location: LABCELL_X23_Y4_N51
\rom_addr[9]~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \rom_addr[9]~9_combout\ = ( phase_acc(29) & ( phase_acc(30) ) ) # ( !phase_acc(29) & ( !phase_acc(30) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010101010101010101010101001010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_phase_acc(30),
	dataf => ALT_INV_phase_acc(29),
	combout => \rom_addr[9]~9_combout\);

-- Location: M10K_X26_Y4_N0
\Mux17_rtl_0|auto_generated|ram_block1a0\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init4 => "FFFFE7FAFEDFD7E1FABFCF83EB7A5FA7E1FBB86ECBACF1390EDDEB675997F9BA7F19877E8BBD6E1BEAECB42FB334E12A8A423F7DD476ACE3675D50E5B15F8765E9725F0B44E0D027EE78AF43BD6398472EC1B32BB2448C3EF21C534B4B9184761A97C190B00BE5BE0EE58C74EBAA3C81320C5D333D4492B8EA270D80FFBBDF7F9BFAFA9F378AFCDB574191B8CA431B055E639167EA6A2CBC29770DB97B80A2508056E4DA4786872F0A9DDD625E60F18859E5DDC746DB2908EC75604CA0916FB8E1985B1CC431B3956E688C861FF5EFA52BA2C74343E389C81EE95B3B7CB838B565C64D1AFAF6A18CBC8D6D857997433F9D9FBC2842330242A3A15BEE60691227",
	mem_init3 => "295E605097A5796E5397055E659027F1606DE2DB465AA221B3E47A2803DD5B80C55F25AEBE882C116089FA3616FE36B6C4C267FF589B58BCCC147037BE7CA9839D0D87802E41B33276A5625BF65DAB60AB42632083BDBB894D1E2908BDFA549AC816D01B907B4BAC811512BAFA649CD6E5E163EDBA8B754604175CAA9F7E42205FB1A322B479D85F786B036504897D47348CDB62C1B5ECA374C45464F16982C56097BF7B18EB48A2DE11C92FD568AFBC694F0C3A5BEF1852034690FC46F8FB4B249FDEA22E50F14BB9ADF4242447732C1CCE18099B53BD7C987D3B20AA4A45B6629ACA66BE21F22450307DCCA5B3982FE06B0D6464136BCE4C2A3EE96CBC7E04",
	mem_init2 => "089D63250D1ADEF3A36C9AB8EBC75598FBBBBF705901C728865B861764954B46362CBB45C0F77CC0D4248EA298DE238F1284C1238FE298CA230F4280D7C0F69CDB5CC437B4A55A4617B8865C85C790B057F87A8F75827EEB6B7C8E3FF3ED7D1E59E2A90C041E7CF629E5AC2CA2577F4894180C7008B8E7D6BB3409CDA93E9641DEEDC7A3CE028358422680A3807C2AFD1D039F429E79FAAF0C0C6E750FB92782B3D45129802D61AE828D468407D70A97DC528917EC6B4D2C0E720CD92BB73455400EFADBC49650838ABF720568156BCCCC7A7DF7E9C3F92512DF0AB34A847A5B0F0B9FFD0650EC488427E8AA5280A6A8C24707C710805FFCBA4F658878ABF320",
	mem_init1 => "96DF52F94C041A3D4612EC2CD4786472F01993DB239780F69ADBC21620F58F3933893BE2AFB4E85BB8B33131E5CA24179F32975E82BA437D0AE96DE42BA4D7C0A2965EBCA2427C72D17EE4CA841B953BE3CF84CB8A3FA39617730AE8759FDF24160F40909C1D0C406F37E076AF43016B957BF628A447C327E34F98999CDC03B2566E7330FECCC1809AF577E62D24BBC53CE5F790B297985D4C4FB634205AB15B79B2FE04E8896845F5CCC77BC3741CAF65C79534E27600F8971AACD851A157DEACB7883B8232526EB6E046F9537E336E376FF48811CCD084AB194EF04898E595D7423A2D3BE5C8F9FDD022258793340B2BC40BD232A2A7EB0619AD653B8E3BA5",
	mem_init0 => "E7FB3E10681507E12862168701106C14FBFE27A6E7BB0E0DA9649BBA36A6A6CB5200A9C533D43125872350102AF9DD87D6C33B0D6DFD485825E1D7876AE94AE08EC891D8C401F25E1B64F1D096E95878E31A327F3141A2E043DBBC4C2DA1531EB8C69C9ACD1010BBE3B78F4D0668145BCA372446430FEACFD99591D385AAF104F40B712EDD4E78129A527D3481BC9B8F5B9D0466A4914FC0B712E8D5A7AE3AA5C6635FFECBD8E5BECE87CBE17F7EF7D1E6BE4EB9C3625FA6D2DFA4AE829CCCC07724E556876600AC44FDDBD7429B394AED0D095EA3417BE36A6C7A30FECC95885C6DF058BBE4B7D75119AC25E3DFDAC4DBC556F88C49FEDB5B7C92DA12693000",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "sine_gen.sine_gen0.rtl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "altsyncram:Mux17_rtl_0|altsyncram_r361:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 10,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 10,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 1023,
	port_a_logical_ram_depth => 1024,
	port_a_logical_ram_width => 18,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 10,
	port_b_data_width => 10,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \clk~inputCLKENA0_outclk\,
	portaaddr => \Mux17_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \Mux17_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\);

-- Location: FF_X27_Y4_N14
\rom_data[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \Mux17_rtl_0|auto_generated|ram_block1a0~portadataout\,
	sclr => \rst~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rom_data(0));

-- Location: IOIBUF_X20_Y0_N1
\phase_incr[31]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_phase_incr(31),
	o => \phase_incr[31]~input_o\);

-- Location: MLABCELL_X21_Y4_N33
\Add0~45\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~45_sumout\ = SUM(( phase_acc(31) ) + ( \phase_incr[31]~input_o\ ) + ( \Add0~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_phase_incr[31]~input_o\,
	datad => ALT_INV_phase_acc(31),
	cin => \Add0~2\,
	sumout => \Add0~45_sumout\);

-- Location: LABCELL_X22_Y4_N33
\Add1~45\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~45_sumout\ = SUM(( \Add0~45_sumout\ ) + ( GND ) + ( \Add1~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_Add0~45_sumout\,
	cin => \Add1~2\,
	sumout => \Add1~45_sumout\);

-- Location: LABCELL_X22_Y4_N54
\phase_acc~11\ : cyclonev_lcell_comb
-- Equation(s):
-- \phase_acc~11_combout\ = ( \Add1~45_sumout\ & ( ((\Equal0~0_combout\ & \Equal0~1_combout\)) # (\Add0~45_sumout\) ) ) # ( !\Add1~45_sumout\ & ( (\Add0~45_sumout\ & ((!\Equal0~0_combout\) # (!\Equal0~1_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001010000011110000101000001111010111110000111101011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Equal0~0_combout\,
	datac => \ALT_INV_Add0~45_sumout\,
	datad => \ALT_INV_Equal0~1_combout\,
	dataf => \ALT_INV_Add1~45_sumout\,
	combout => \phase_acc~11_combout\);

-- Location: FF_X22_Y4_N56
\phase_acc[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \phase_acc~11_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => phase_acc(31));

-- Location: FF_X22_Y4_N52
\quadrant_p1[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => phase_acc(31),
	sclr => \rst~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => quadrant_p1(1));

-- Location: FF_X23_Y4_N56
\quadrant_p2[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => quadrant_p1(1),
	sclr => \rst~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => quadrant_p2(1));

-- Location: FF_X23_Y4_N19
\quadrant_p1[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => phase_acc(30),
	sclr => \rst~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => quadrant_p1(0));

-- Location: FF_X23_Y4_N58
\quadrant_p2[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => quadrant_p1(0),
	sclr => \rst~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => quadrant_p2(0));

-- Location: LABCELL_X23_Y4_N54
\data[4]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \data[4]~0_combout\ = ( !quadrant_p2(1) & ( quadrant_p2(0) ) ) # ( quadrant_p2(1) & ( !quadrant_p2(0) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111111111111111111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => ALT_INV_quadrant_p2(1),
	dataf => ALT_INV_quadrant_p2(0),
	combout => \data[4]~0_combout\);

-- Location: LABCELL_X27_Y4_N27
\Mux17_rtl_0|auto_generated|ram_block1a0~_wirecell\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux17_rtl_0|auto_generated|ram_block1a0~_wirecell_combout\ = !\Mux17_rtl_0|auto_generated|ram_block1a0~portadataout\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111100000000111111110000000011111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \Mux17_rtl_0|auto_generated|ALT_INV_ram_block1a0~portadataout\,
	combout => \Mux17_rtl_0|auto_generated|ram_block1a0~_wirecell_combout\);

-- Location: FF_X27_Y4_N28
\rom_data_inv[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Mux17_rtl_0|auto_generated|ram_block1a0~_wirecell_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rom_data_inv(0));

-- Location: LABCELL_X27_Y4_N24
\data~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \data~1_combout\ = ( rom_data_inv(0) & ( (!\data[4]~0_combout\) # (rom_data(0)) ) ) # ( !rom_data_inv(0) & ( (rom_data(0) & \data[4]~0_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001100000011000000110000001111110011111100111111001111110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_rom_data(0),
	datac => \ALT_INV_data[4]~0_combout\,
	dataf => ALT_INV_rom_data_inv(0),
	combout => \data~1_combout\);

-- Location: FF_X27_Y4_N25
\data[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \data~1_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \data[0]~reg0_q\);

-- Location: FF_X23_Y4_N5
\rom_data[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \Mux17_rtl_0|auto_generated|ram_block1a16\,
	sclr => \rst~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rom_data(1));

-- Location: LABCELL_X23_Y4_N27
\Mux17_rtl_0|auto_generated|ram_block1a16~_wirecell\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux17_rtl_0|auto_generated|ram_block1a16~_wirecell_combout\ = ( !\Mux17_rtl_0|auto_generated|ram_block1a16\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \Mux17_rtl_0|auto_generated|ALT_INV_ram_block1a16\,
	combout => \Mux17_rtl_0|auto_generated|ram_block1a16~_wirecell_combout\);

-- Location: FF_X23_Y4_N29
\rom_data_inv[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Mux17_rtl_0|auto_generated|ram_block1a16~_wirecell_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rom_data_inv(1));

-- Location: LABCELL_X23_Y4_N24
\data~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \data~2_combout\ = ( \data[4]~0_combout\ & ( rom_data(1) ) ) # ( !\data[4]~0_combout\ & ( rom_data_inv(1) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111101010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_rom_data(1),
	datac => ALT_INV_rom_data_inv(1),
	dataf => \ALT_INV_data[4]~0_combout\,
	combout => \data~2_combout\);

-- Location: FF_X23_Y4_N25
\data[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \data~2_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \data[1]~reg0_q\);

-- Location: LABCELL_X27_Y4_N51
\Mux17_rtl_0|auto_generated|ram_block1a15~_wirecell\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux17_rtl_0|auto_generated|ram_block1a15~_wirecell_combout\ = ( !\Mux17_rtl_0|auto_generated|ram_block1a15\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111000000000000000011111111111111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \Mux17_rtl_0|auto_generated|ALT_INV_ram_block1a15\,
	combout => \Mux17_rtl_0|auto_generated|ram_block1a15~_wirecell_combout\);

-- Location: FF_X27_Y4_N52
\rom_data_inv[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Mux17_rtl_0|auto_generated|ram_block1a15~_wirecell_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rom_data_inv(2));

-- Location: FF_X27_Y4_N50
\rom_data[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \Mux17_rtl_0|auto_generated|ram_block1a15\,
	sclr => \rst~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rom_data(2));

-- Location: LABCELL_X27_Y4_N9
\data~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \data~3_combout\ = ( rom_data_inv(2) & ( rom_data(2) ) ) # ( !rom_data_inv(2) & ( rom_data(2) & ( \data[4]~0_combout\ ) ) ) # ( rom_data_inv(2) & ( !rom_data(2) & ( !\data[4]~0_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010101010101001010101010101011111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_data[4]~0_combout\,
	datae => ALT_INV_rom_data_inv(2),
	dataf => ALT_INV_rom_data(2),
	combout => \data~3_combout\);

-- Location: FF_X27_Y4_N10
\data[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \data~3_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \data[2]~reg0_q\);

-- Location: LABCELL_X27_Y4_N42
\Mux17_rtl_0|auto_generated|ram_block1a14~_wirecell\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux17_rtl_0|auto_generated|ram_block1a14~_wirecell_combout\ = ( !\Mux17_rtl_0|auto_generated|ram_block1a14\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111000000000000000011111111111111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \Mux17_rtl_0|auto_generated|ALT_INV_ram_block1a14\,
	combout => \Mux17_rtl_0|auto_generated|ram_block1a14~_wirecell_combout\);

-- Location: FF_X27_Y4_N43
\rom_data_inv[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Mux17_rtl_0|auto_generated|ram_block1a14~_wirecell_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rom_data_inv(3));

-- Location: FF_X27_Y4_N47
\rom_data[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \Mux17_rtl_0|auto_generated|ram_block1a14\,
	sclr => \rst~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rom_data(3));

-- Location: LABCELL_X27_Y4_N15
\data~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \data~4_combout\ = ( rom_data_inv(3) & ( rom_data(3) ) ) # ( !rom_data_inv(3) & ( rom_data(3) & ( \data[4]~0_combout\ ) ) ) # ( rom_data_inv(3) & ( !rom_data(3) & ( !\data[4]~0_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010101010101001010101010101011111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_data[4]~0_combout\,
	datae => ALT_INV_rom_data_inv(3),
	dataf => ALT_INV_rom_data(3),
	combout => \data~4_combout\);

-- Location: FF_X27_Y4_N16
\data[3]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \data~4_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \data[3]~reg0_q\);

-- Location: FF_X27_Y4_N2
\rom_data[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \Mux17_rtl_0|auto_generated|ram_block1a13\,
	sclr => \rst~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rom_data(4));

-- Location: LABCELL_X27_Y4_N57
\Mux17_rtl_0|auto_generated|ram_block1a13~_wirecell\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux17_rtl_0|auto_generated|ram_block1a13~_wirecell_combout\ = !\Mux17_rtl_0|auto_generated|ram_block1a13\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000011110000111100001111000011110000111100001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \Mux17_rtl_0|auto_generated|ALT_INV_ram_block1a13\,
	combout => \Mux17_rtl_0|auto_generated|ram_block1a13~_wirecell_combout\);

-- Location: FF_X27_Y4_N58
\rom_data_inv[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Mux17_rtl_0|auto_generated|ram_block1a13~_wirecell_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rom_data_inv(4));

-- Location: LABCELL_X27_Y4_N54
\data~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \data~5_combout\ = ( rom_data_inv(4) & ( (!\data[4]~0_combout\) # (rom_data(4)) ) ) # ( !rom_data_inv(4) & ( (rom_data(4) & \data[4]~0_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000101000001010000010111110101111101011111010111110101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_rom_data(4),
	datac => \ALT_INV_data[4]~0_combout\,
	dataf => ALT_INV_rom_data_inv(4),
	combout => \data~5_combout\);

-- Location: FF_X27_Y4_N55
\data[4]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \data~5_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \data[4]~reg0_q\);

-- Location: LABCELL_X27_Y4_N39
\Mux17_rtl_0|auto_generated|ram_block1a12~_wirecell\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux17_rtl_0|auto_generated|ram_block1a12~_wirecell_combout\ = ( !\Mux17_rtl_0|auto_generated|ram_block1a12\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111000000000000000011111111111111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \Mux17_rtl_0|auto_generated|ALT_INV_ram_block1a12\,
	combout => \Mux17_rtl_0|auto_generated|ram_block1a12~_wirecell_combout\);

-- Location: FF_X27_Y4_N40
\rom_data_inv[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Mux17_rtl_0|auto_generated|ram_block1a12~_wirecell_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rom_data_inv(5));

-- Location: FF_X27_Y4_N37
\rom_data[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \Mux17_rtl_0|auto_generated|ram_block1a12\,
	sclr => \rst~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rom_data(5));

-- Location: LABCELL_X27_Y4_N3
\data~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \data~6_combout\ = ( rom_data_inv(5) & ( rom_data(5) ) ) # ( !rom_data_inv(5) & ( rom_data(5) & ( \data[4]~0_combout\ ) ) ) # ( rom_data_inv(5) & ( !rom_data(5) & ( !\data[4]~0_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010101010101001010101010101011111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_data[4]~0_combout\,
	datae => ALT_INV_rom_data_inv(5),
	dataf => ALT_INV_rom_data(5),
	combout => \data~6_combout\);

-- Location: FF_X27_Y4_N4
\data[5]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \data~6_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \data[5]~reg0_q\);

-- Location: FF_X27_Y3_N50
\rom_data[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \Mux17_rtl_0|auto_generated|ram_block1a11\,
	sclr => \rst~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rom_data(6));

-- Location: LABCELL_X27_Y3_N39
\Mux17_rtl_0|auto_generated|ram_block1a11~_wirecell\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux17_rtl_0|auto_generated|ram_block1a11~_wirecell_combout\ = !\Mux17_rtl_0|auto_generated|ram_block1a11\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000011110000111100001111000011110000111100001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \Mux17_rtl_0|auto_generated|ALT_INV_ram_block1a11\,
	combout => \Mux17_rtl_0|auto_generated|ram_block1a11~_wirecell_combout\);

-- Location: FF_X27_Y3_N40
\rom_data_inv[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Mux17_rtl_0|auto_generated|ram_block1a11~_wirecell_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rom_data_inv(6));

-- Location: LABCELL_X27_Y3_N36
\data~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \data~7_combout\ = ( rom_data_inv(6) & ( (!\data[4]~0_combout\) # (rom_data(6)) ) ) # ( !rom_data_inv(6) & ( (rom_data(6) & \data[4]~0_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000111011101110111011101110111011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_rom_data(6),
	datab => \ALT_INV_data[4]~0_combout\,
	dataf => ALT_INV_rom_data_inv(6),
	combout => \data~7_combout\);

-- Location: FF_X27_Y3_N37
\data[6]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \data~7_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \data[6]~reg0_q\);

-- Location: FF_X27_Y4_N35
\rom_data[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \Mux17_rtl_0|auto_generated|ram_block1a10\,
	sclr => \rst~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rom_data(7));

-- Location: LABCELL_X27_Y4_N30
\Mux17_rtl_0|auto_generated|ram_block1a10~_wirecell\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux17_rtl_0|auto_generated|ram_block1a10~_wirecell_combout\ = ( !\Mux17_rtl_0|auto_generated|ram_block1a10\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111000000000000000011111111111111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \Mux17_rtl_0|auto_generated|ALT_INV_ram_block1a10\,
	combout => \Mux17_rtl_0|auto_generated|ram_block1a10~_wirecell_combout\);

-- Location: FF_X27_Y4_N31
\rom_data_inv[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Mux17_rtl_0|auto_generated|ram_block1a10~_wirecell_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rom_data_inv(7));

-- Location: LABCELL_X27_Y4_N18
\data~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \data~8_combout\ = ( rom_data_inv(7) & ( (!\data[4]~0_combout\) # (rom_data(7)) ) ) # ( !rom_data_inv(7) & ( (rom_data(7) & \data[4]~0_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000101000001010000010111110101111101011111010111110101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_rom_data(7),
	datac => \ALT_INV_data[4]~0_combout\,
	dataf => ALT_INV_rom_data_inv(7),
	combout => \data~8_combout\);

-- Location: FF_X27_Y4_N19
\data[7]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \data~8_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \data[7]~reg0_q\);

-- Location: MLABCELL_X25_Y3_N12
\Mux17_rtl_0|auto_generated|ram_block1a9~_wirecell\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux17_rtl_0|auto_generated|ram_block1a9~_wirecell_combout\ = ( !\Mux17_rtl_0|auto_generated|ram_block1a9\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \Mux17_rtl_0|auto_generated|ALT_INV_ram_block1a9\,
	combout => \Mux17_rtl_0|auto_generated|ram_block1a9~_wirecell_combout\);

-- Location: FF_X25_Y3_N14
\rom_data_inv[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Mux17_rtl_0|auto_generated|ram_block1a9~_wirecell_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rom_data_inv(8));

-- Location: MLABCELL_X25_Y3_N45
\rom_data[8]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \rom_data[8]~feeder_combout\ = ( \Mux17_rtl_0|auto_generated|ram_block1a9\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \Mux17_rtl_0|auto_generated|ALT_INV_ram_block1a9\,
	combout => \rom_data[8]~feeder_combout\);

-- Location: FF_X25_Y3_N46
\rom_data[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \rom_data[8]~feeder_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rom_data(8));

-- Location: MLABCELL_X25_Y3_N15
\data~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \data~9_combout\ = ( rom_data(8) & ( (rom_data_inv(8)) # (\data[4]~0_combout\) ) ) # ( !rom_data(8) & ( (!\data[4]~0_combout\ & rom_data_inv(8)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110000001100000011000000110000111111001111110011111100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_data[4]~0_combout\,
	datac => ALT_INV_rom_data_inv(8),
	dataf => ALT_INV_rom_data(8),
	combout => \data~9_combout\);

-- Location: FF_X25_Y3_N16
\data[8]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \data~9_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \data[8]~reg0_q\);

-- Location: LABCELL_X27_Y3_N9
\rom_data[9]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \rom_data[9]~feeder_combout\ = ( \Mux17_rtl_0|auto_generated|ram_block1a8\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \Mux17_rtl_0|auto_generated|ALT_INV_ram_block1a8\,
	combout => \rom_data[9]~feeder_combout\);

-- Location: FF_X27_Y3_N11
\rom_data[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \rom_data[9]~feeder_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rom_data(9));

-- Location: LABCELL_X27_Y3_N45
\Mux17_rtl_0|auto_generated|ram_block1a8~_wirecell\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux17_rtl_0|auto_generated|ram_block1a8~_wirecell_combout\ = ( !\Mux17_rtl_0|auto_generated|ram_block1a8\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \Mux17_rtl_0|auto_generated|ALT_INV_ram_block1a8\,
	combout => \Mux17_rtl_0|auto_generated|ram_block1a8~_wirecell_combout\);

-- Location: FF_X27_Y3_N46
\rom_data_inv[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Mux17_rtl_0|auto_generated|ram_block1a8~_wirecell_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rom_data_inv(9));

-- Location: LABCELL_X27_Y3_N42
\data~10\ : cyclonev_lcell_comb
-- Equation(s):
-- \data~10_combout\ = ( rom_data_inv(9) & ( (!\data[4]~0_combout\) # (rom_data(9)) ) ) # ( !rom_data_inv(9) & ( (rom_data(9) & \data[4]~0_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000110011000000000011001111111111001100111111111100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_rom_data(9),
	datad => \ALT_INV_data[4]~0_combout\,
	dataf => ALT_INV_rom_data_inv(9),
	combout => \data~10_combout\);

-- Location: FF_X27_Y3_N43
\data[9]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \data~10_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \data[9]~reg0_q\);

-- Location: M10K_X26_Y3_N0
\Mux17_rtl_0|auto_generated|ram_block1a1\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init4 => "3FCFF3FCFF3FCFF3FCFF3FCFF3FCFF3FCFF3FCFF3FCFF3FCFF3FCFF3FCFF3FCFF3FCFF3FCFF3FCFF3FCFF3FCFF3FCFF3FCFF3FCFF3FCFF3FCFF3FCFF3FCFF3FCFF3FCFF3FCFF3FCBF2FCBF2FCBF2FCBF2FCBF2FCBF2FCBF2FCBF2FCBF2FCBF2FCBF2FCBF2FCDF37CDF37CDF37CDF37CDF37CDF37CDF37CDF37CDF37C9F27C9F27C9F27C9F27C9F27C9F27C9F27C9F27CEF3BCEF3BCEF3BCEF3BCEF3BCEF3BCEF3BCAF2BCAF2BCAF2BCAF2BCAF2BCAF2BCCF33CCF33CCF33CCF33CCF33CCF23C8F23C8F23C8F23C8F23C8F23CF73DCF73DCF73DCF73DCF73DCB72DCB72DCB72DCB72DCB735CD735CD735CD735CD735C9725C9725C9725C9725C9739CE739CE739",
	mem_init3 => "CE739CE729CA729CA729CA729CA731CC731CC731CC731CC721C8721C8721C8721CFB3ECFB3ECFB3ECFB2ECBB2ECBB2ECBB2ECDB36CDB36CDB36CDB26C9B26C9B26C9B26CEB3ACEB3ACEB3ACAB2ACAB2ACAB2ACAB32CCB32CCB32CCB22C8B22C8B22C8B3CCF33CCF33CCF32CCB32CCB32CCB334CD334CD334CD324C9324C9324CE338CE338CE338CA328CA328CA330CC330CC330CC320C8320C8320CFD3F4FD3F4FD2F4BD2F4BD2F4DD374DD374DD2749D2749D274ED3B4ED3B4ED2B4AD2B4AD2B4CD334CD334CD2348D2348D234F53D4F53D4F52D4B52D4B5354D5354D53549525495254E5394E5394E5294A5294A5314C5314C53148521485214F93E4F93E4F",
	mem_init2 => "92E4B92E4B9364D9364D926499264993A4E93A4E93A4A92A4A92A4C9324C93248922489224F13C4F13C4B12C4B12C4D1344D13449124491244E1384E1384A1284A1284C1304C13048120481204FE3F8FE2F8BE2F8BE378DE378DE2789E2789E3B8EE3B8EE2B8AE2B8CE338CE3388E2388E238F63D8F62D8B62D8B6358D6358D625896258E6398E6398A6298A6318C6318C621886218FA3E8FA3E8BA2E8BA368DA368DA2689A268EA3A8EA3A8AA2A8AA328CA3288A2288A228F23C8F22C8B22C8B2348D23489224892388E2388E2288A2288C2308C220882208FC3F0FC3F0BC2F0BC370DC3709C2709C3B0EC3B0EC2B0AC2B0CC330CC2308C230F43D0F42D0B42",
	mem_init1 => "D0D4350D43509425094390E4390A4290A4310C431084210843E0F83E0B82E0B8360D836098260983A0E83A0A82A0A8320C832088220883C0F03C0B02C0B0340D03409024090380E0380A0280A0300C030080200801FC7F1FC3F0FC3F17C5F17C1F07C1F1BC6F1BC2F0BC2F13C4F13C0F03C771DC770DC370DC5715C5705C1705C6719C6709C2709C4711C0701C071EC7B1EC3B0EC3B16C5B16C1B06C1B1AC6B0AC2B0AC4B12C4B02C0B02C731CC730CC3314C5314C1304C1318C6318C2308C4310C4300C0300C7D1F47D0F43D1745D1741D0741D1B46D1B42D0B44D1344D0340D034751D4350D43515455154150541519465094250944511445014051E4791E4",
	mem_init0 => "390E4391645906419064691A4690A4291244912409024091C4710C4310C451144510441118461184210842110441004010047E1F83E0F83E1785E1781E0786E1B86E0B82E0B84E1380E0380E1D8760D8360D856158560581619866198260984611846018060187A1E83A0E83A1685A0681A0686A1A82A0A82A1284A1280A028721C8720C83214852148120481218862088220884210802008021F07C0F03C0F05C1701C0701C1B06C1B02C0B04C1304C0300C1D0741D0340D05415054050140506419024090241104401004010781E0380E0381605806018060681A0280A0281204812008020701C0700C0301405014010040601806008020100401000000000",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "sine_gen.sine_gen0.rtl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "altsyncram:Mux17_rtl_0|altsyncram_r361:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 10,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 10,
	port_a_first_address => 0,
	port_a_first_bit_number => 1,
	port_a_last_address => 1023,
	port_a_logical_ram_depth => 1024,
	port_a_logical_ram_width => 18,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 10,
	port_b_data_width => 10,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \clk~inputCLKENA0_outclk\,
	portaaddr => \Mux17_rtl_0|auto_generated|ram_block1a1_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \Mux17_rtl_0|auto_generated|ram_block1a1_PORTADATAOUT_bus\);

-- Location: MLABCELL_X25_Y3_N0
\Mux17_rtl_0|auto_generated|ram_block1a7~_wirecell\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux17_rtl_0|auto_generated|ram_block1a7~_wirecell_combout\ = ( !\Mux17_rtl_0|auto_generated|ram_block1a7\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \Mux17_rtl_0|auto_generated|ALT_INV_ram_block1a7\,
	combout => \Mux17_rtl_0|auto_generated|ram_block1a7~_wirecell_combout\);

-- Location: FF_X25_Y3_N1
\rom_data_inv[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Mux17_rtl_0|auto_generated|ram_block1a7~_wirecell_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rom_data_inv(10));

-- Location: FF_X25_Y3_N4
\rom_data[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \Mux17_rtl_0|auto_generated|ram_block1a7\,
	sclr => \rst~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rom_data(10));

-- Location: MLABCELL_X25_Y3_N30
\data~11\ : cyclonev_lcell_comb
-- Equation(s):
-- \data~11_combout\ = ( rom_data_inv(10) & ( rom_data(10) ) ) # ( !rom_data_inv(10) & ( rom_data(10) & ( \data[4]~0_combout\ ) ) ) # ( rom_data_inv(10) & ( !rom_data(10) & ( !\data[4]~0_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000110011001100110000110011001100111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_data[4]~0_combout\,
	datae => ALT_INV_rom_data_inv(10),
	dataf => ALT_INV_rom_data(10),
	combout => \data~11_combout\);

-- Location: FF_X25_Y3_N31
\data[10]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \data~11_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \data[10]~reg0_q\);

-- Location: FF_X25_Y3_N59
\rom_data[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \Mux17_rtl_0|auto_generated|ram_block1a6\,
	sclr => \rst~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rom_data(11));

-- Location: MLABCELL_X25_Y3_N54
\Mux17_rtl_0|auto_generated|ram_block1a6~_wirecell\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux17_rtl_0|auto_generated|ram_block1a6~_wirecell_combout\ = ( !\Mux17_rtl_0|auto_generated|ram_block1a6\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111000000000000000011111111111111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \Mux17_rtl_0|auto_generated|ALT_INV_ram_block1a6\,
	combout => \Mux17_rtl_0|auto_generated|ram_block1a6~_wirecell_combout\);

-- Location: FF_X25_Y3_N55
\rom_data_inv[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Mux17_rtl_0|auto_generated|ram_block1a6~_wirecell_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rom_data_inv(11));

-- Location: MLABCELL_X25_Y3_N24
\data~12\ : cyclonev_lcell_comb
-- Equation(s):
-- \data~12_combout\ = ( \data[4]~0_combout\ & ( rom_data_inv(11) & ( rom_data(11) ) ) ) # ( !\data[4]~0_combout\ & ( rom_data_inv(11) ) ) # ( \data[4]~0_combout\ & ( !rom_data_inv(11) & ( rom_data(11) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001100110011001111111111111111110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_rom_data(11),
	datae => \ALT_INV_data[4]~0_combout\,
	dataf => ALT_INV_rom_data_inv(11),
	combout => \data~12_combout\);

-- Location: FF_X25_Y3_N25
\data[11]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \data~12_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \data[11]~reg0_q\);

-- Location: FF_X27_Y3_N25
\rom_data[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \Mux17_rtl_0|auto_generated|ram_block1a5\,
	sclr => \rst~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rom_data(12));

-- Location: LABCELL_X27_Y3_N27
\Mux17_rtl_0|auto_generated|ram_block1a5~_wirecell\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux17_rtl_0|auto_generated|ram_block1a5~_wirecell_combout\ = ( !\Mux17_rtl_0|auto_generated|ram_block1a5\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111000000000000000011111111111111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \Mux17_rtl_0|auto_generated|ALT_INV_ram_block1a5\,
	combout => \Mux17_rtl_0|auto_generated|ram_block1a5~_wirecell_combout\);

-- Location: FF_X27_Y3_N29
\rom_data_inv[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Mux17_rtl_0|auto_generated|ram_block1a5~_wirecell_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rom_data_inv(12));

-- Location: LABCELL_X27_Y3_N3
\data~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \data~13_combout\ = ( rom_data(12) & ( rom_data_inv(12) ) ) # ( !rom_data(12) & ( rom_data_inv(12) & ( !\data[4]~0_combout\ ) ) ) # ( rom_data(12) & ( !rom_data_inv(12) & ( \data[4]~0_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000011110000111111110000111100001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_data[4]~0_combout\,
	datae => ALT_INV_rom_data(12),
	dataf => ALT_INV_rom_data_inv(12),
	combout => \data~13_combout\);

-- Location: FF_X27_Y3_N4
\data[12]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \data~13_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \data[12]~reg0_q\);

-- Location: FF_X25_Y3_N41
\rom_data[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \Mux17_rtl_0|auto_generated|ram_block1a4\,
	sclr => \rst~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rom_data(13));

-- Location: MLABCELL_X25_Y3_N36
\Mux17_rtl_0|auto_generated|ram_block1a4~_wirecell\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux17_rtl_0|auto_generated|ram_block1a4~_wirecell_combout\ = ( !\Mux17_rtl_0|auto_generated|ram_block1a4\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111000000000000000011111111111111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \Mux17_rtl_0|auto_generated|ALT_INV_ram_block1a4\,
	combout => \Mux17_rtl_0|auto_generated|ram_block1a4~_wirecell_combout\);

-- Location: FF_X25_Y3_N37
\rom_data_inv[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Mux17_rtl_0|auto_generated|ram_block1a4~_wirecell_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rom_data_inv(13));

-- Location: MLABCELL_X25_Y3_N9
\data~14\ : cyclonev_lcell_comb
-- Equation(s):
-- \data~14_combout\ = ( \data[4]~0_combout\ & ( rom_data_inv(13) & ( rom_data(13) ) ) ) # ( !\data[4]~0_combout\ & ( rom_data_inv(13) ) ) # ( \data[4]~0_combout\ & ( !rom_data_inv(13) & ( rom_data(13) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001100110011001111111111111111110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_rom_data(13),
	datae => \ALT_INV_data[4]~0_combout\,
	dataf => ALT_INV_rom_data_inv(13),
	combout => \data~14_combout\);

-- Location: FF_X25_Y3_N10
\data[13]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \data~14_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \data[13]~reg0_q\);

-- Location: LABCELL_X27_Y3_N12
\Mux17_rtl_0|auto_generated|ram_block1a3~_wirecell\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux17_rtl_0|auto_generated|ram_block1a3~_wirecell_combout\ = !\Mux17_rtl_0|auto_generated|ram_block1a3\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000011110000111100001111000011110000111100001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \Mux17_rtl_0|auto_generated|ALT_INV_ram_block1a3\,
	combout => \Mux17_rtl_0|auto_generated|ram_block1a3~_wirecell_combout\);

-- Location: FF_X27_Y3_N14
\rom_data_inv[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Mux17_rtl_0|auto_generated|ram_block1a3~_wirecell_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rom_data_inv(14));

-- Location: FF_X27_Y3_N22
\rom_data[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \Mux17_rtl_0|auto_generated|ram_block1a3\,
	sclr => \rst~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rom_data(14));

-- Location: LABCELL_X27_Y3_N18
\data~15\ : cyclonev_lcell_comb
-- Equation(s):
-- \data~15_combout\ = ( \data[4]~0_combout\ & ( rom_data(14) ) ) # ( !\data[4]~0_combout\ & ( rom_data(14) & ( rom_data_inv(14) ) ) ) # ( !\data[4]~0_combout\ & ( !rom_data(14) & ( rom_data_inv(14) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011000000000000000000110011001100111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_rom_data_inv(14),
	datae => \ALT_INV_data[4]~0_combout\,
	dataf => ALT_INV_rom_data(14),
	combout => \data~15_combout\);

-- Location: FF_X27_Y3_N19
\data[14]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \data~15_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \data[14]~reg0_q\);

-- Location: FF_X25_Y3_N22
\rom_data[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \Mux17_rtl_0|auto_generated|ram_block1a2\,
	sclr => \rst~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rom_data(15));

-- Location: MLABCELL_X25_Y3_N18
\Mux17_rtl_0|auto_generated|ram_block1a2~_wirecell\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux17_rtl_0|auto_generated|ram_block1a2~_wirecell_combout\ = ( !\Mux17_rtl_0|auto_generated|ram_block1a2\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \Mux17_rtl_0|auto_generated|ALT_INV_ram_block1a2\,
	combout => \Mux17_rtl_0|auto_generated|ram_block1a2~_wirecell_combout\);

-- Location: FF_X25_Y3_N19
\rom_data_inv[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Mux17_rtl_0|auto_generated|ram_block1a2~_wirecell_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rom_data_inv(15));

-- Location: MLABCELL_X25_Y3_N51
\data~16\ : cyclonev_lcell_comb
-- Equation(s):
-- \data~16_combout\ = ( rom_data(15) & ( rom_data_inv(15) ) ) # ( !rom_data(15) & ( rom_data_inv(15) & ( !\data[4]~0_combout\ ) ) ) # ( rom_data(15) & ( !rom_data_inv(15) & ( \data[4]~0_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000011110000111111110000111100001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_data[4]~0_combout\,
	datae => ALT_INV_rom_data(15),
	dataf => ALT_INV_rom_data_inv(15),
	combout => \data~16_combout\);

-- Location: FF_X25_Y3_N52
\data[15]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \data~16_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \data[15]~reg0_q\);

-- Location: FF_X27_Y3_N32
\rom_data[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \Mux17_rtl_0|auto_generated|ram_block1a1~portadataout\,
	sclr => \rst~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rom_data(16));

-- Location: LABCELL_X27_Y3_N33
\Mux17_rtl_0|auto_generated|ram_block1a1~_wirecell\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux17_rtl_0|auto_generated|ram_block1a1~_wirecell_combout\ = ( !\Mux17_rtl_0|auto_generated|ram_block1a1~portadataout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111000000000000000011111111111111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \Mux17_rtl_0|auto_generated|ALT_INV_ram_block1a1~portadataout\,
	combout => \Mux17_rtl_0|auto_generated|ram_block1a1~_wirecell_combout\);

-- Location: FF_X27_Y3_N34
\rom_data_inv[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Mux17_rtl_0|auto_generated|ram_block1a1~_wirecell_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rom_data_inv(16));

-- Location: LABCELL_X27_Y3_N15
\data~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \data~17_combout\ = ( rom_data_inv(16) & ( (!\data[4]~0_combout\) # (rom_data(16)) ) ) # ( !rom_data_inv(16) & ( (rom_data(16) & \data[4]~0_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001100000011000000110000001111110011111100111111001111110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_rom_data(16),
	datac => \ALT_INV_data[4]~0_combout\,
	dataf => ALT_INV_rom_data_inv(16),
	combout => \data~17_combout\);

-- Location: FF_X27_Y3_N16
\data[16]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \data~17_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \data[16]~reg0_q\);

-- Location: LABCELL_X27_Y3_N51
\Mux17_rtl_0|auto_generated|ram_block1a17~_wirecell\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux17_rtl_0|auto_generated|ram_block1a17~_wirecell_combout\ = ( !\Mux17_rtl_0|auto_generated|ram_block1a17\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111000000000000000011111111111111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \Mux17_rtl_0|auto_generated|ALT_INV_ram_block1a17\,
	combout => \Mux17_rtl_0|auto_generated|ram_block1a17~_wirecell_combout\);

-- Location: FF_X27_Y3_N52
\rom_data_inv[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Mux17_rtl_0|auto_generated|ram_block1a17~_wirecell_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rom_data_inv(17));

-- Location: FF_X27_Y3_N55
\rom_data[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \Mux17_rtl_0|auto_generated|ram_block1a17\,
	sclr => \rst~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rom_data(17));

-- Location: LABCELL_X27_Y3_N57
\data~18\ : cyclonev_lcell_comb
-- Equation(s):
-- \data~18_combout\ = ( rom_data_inv(17) & ( rom_data(17) ) ) # ( !rom_data_inv(17) & ( rom_data(17) & ( \data[4]~0_combout\ ) ) ) # ( rom_data_inv(17) & ( !rom_data(17) & ( !\data[4]~0_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000001111000011111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_data[4]~0_combout\,
	datae => ALT_INV_rom_data_inv(17),
	dataf => ALT_INV_rom_data(17),
	combout => \data~18_combout\);

-- Location: FF_X27_Y3_N58
\data[17]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \data~18_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \data[17]~reg0_q\);

-- Location: FF_X27_Y3_N1
\data[18]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \data[4]~0_combout\,
	sclr => \rst~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \data[18]~reg0_q\);

-- Location: LABCELL_X18_Y39_N0
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;
END structure;


