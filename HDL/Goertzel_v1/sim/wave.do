onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /goertzel_tb/sample_clk
add wave -noupdate /goertzel_tb/rst
add wave -noupdate /goertzel_tb/clk
add wave -noupdate /goertzel_tb/in_ready
add wave -noupdate /goertzel_tb/in_valid
add wave -noupdate -radix sfixed /goertzel_tb/DTMF_sig
add wave -noupdate /goertzel_tb/Q0
add wave -noupdate /goertzel_tb/Q1
add wave -noupdate /goertzel_tb/Q2
add wave -noupdate -format Analog-Step -height 74 -max 30071.999999999993 -min -18199.0 -radix sfixed /goertzel_tb/DUT/DTMF_sampled
add wave -noupdate -divider -height 20 DUT
add wave -noupdate /goertzel_tb/out_ready
add wave -noupdate /goertzel_tb/out_valid
add wave -noupdate /goertzel_tb/DUT/state
add wave -noupdate -format Analog-Step -height 74 -max 17683.999999999996 -min -18460.0 -radix sfixed /goertzel_tb/DUT/Q2_reg
add wave -noupdate -format Analog-Step -height 74 -max 17684.0 -min -18738.0 -radix sfixed /goertzel_tb/DUT/Q1_reg
add wave -noupdate -format Analog-Step -height 74 -max 17684.0 -min -18738.0 -radix sfixed /goertzel_tb/DUT/Q0_reg
add wave -noupdate -radix sfixed /goertzel_tb/DUT/x_min_q2
add wave -noupdate -radix sfixed /goertzel_tb/DUT/coeff_Q1
add wave -noupdate -divider Multiplication
add wave -noupdate -radix sfixed /goertzel_tb/DUT/mult_out
add wave -noupdate -radix sfixed /goertzel_tb/DUT/mult_b
add wave -noupdate -radix sfixed /goertzel_tb/DUT/mult_a
add wave -noupdate -divider Subtraction
add wave -noupdate -radix sfixed /goertzel_tb/DUT/sub_out
add wave -noupdate -radix sfixed /goertzel_tb/DUT/sub_b
add wave -noupdate -radix sfixed /goertzel_tb/DUT/sub_a
add wave -noupdate -radix sfixed /goertzel_tb/DUT/add_out
add wave -noupdate -radix sfixed /goertzel_tb/DUT/add_b
add wave -noupdate -radix sfixed /goertzel_tb/DUT/add_a
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {20000141 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 142
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
WaveRestoreZoom {0 ns} {21144774 ns}
