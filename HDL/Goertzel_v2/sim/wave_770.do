onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /goertzel_770_tb/sample_clk
add wave -noupdate /goertzel_770_tb/rst
add wave -noupdate /goertzel_770_tb/clk
add wave -noupdate /goertzel_770_tb/in_ready
add wave -noupdate /goertzel_770_tb/in_valid
add wave -noupdate /goertzel_770_tb/DTMF_sig
add wave -noupdate /goertzel_770_tb/power
add wave -noupdate /goertzel_770_tb/out_ready
add wave -noupdate /goertzel_770_tb/out_valid
add wave -noupdate -format Analog-Step -height 74 -max 2350.9999999999995 -min -2189.0 -radix sfixed /goertzel_770_tb/DUT/Q0_reg
add wave -noupdate -format Analog-Step -height 74 -max 2350.9999999999995 -min -2189.0 -radix sfixed /goertzel_770_tb/DUT/Q1_reg
add wave -noupdate -format Analog-Step -height 74 -max 2350.9999999999995 -min -2189.0 -radix sfixed /goertzel_770_tb/DUT/Q2_reg
add wave -noupdate -format Analog-Step -height 74 -max 2322.0 -min -2162.0 -radix sfixed /goertzel_770_tb/DUT/coeff_Q1
add wave -noupdate /goertzel_770_tb/DUT/state
add wave -noupdate -radix sfixed /goertzel_770_tb/DUT/square_in
add wave -noupdate -radix ufixed /goertzel_770_tb/DUT/square_out
add wave -noupdate /goertzel_770_tb/DUT/mult_coeff_q1
add wave -noupdate /goertzel_770_tb/DUT/mult_q2
add wave -noupdate /goertzel_770_tb/DUT/mult_out_2
add wave -noupdate -radix sfixed /goertzel_770_tb/DUT/Q1_squared_plus_Q2_squared
add wave -noupdate -radix sfixed /goertzel_770_tb/DUT/coeff_Q1_Q2
add wave -noupdate -radix sfixed /goertzel_770_tb/DUT/power_fix
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {20616508 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 140
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ms
update
WaveRestoreZoom {0 ns} {22050 us}
