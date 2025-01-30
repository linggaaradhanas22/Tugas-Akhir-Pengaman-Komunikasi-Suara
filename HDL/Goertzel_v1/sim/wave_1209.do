onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider TB
add wave -noupdate /goertzel_1209_tb/sample_clk
add wave -noupdate -format Analog-Step -height 74 -max 32648.999999999996 -min -32723.0 /goertzel_1209_tb/DUT/DTMF_sig
add wave -noupdate -radix hexadecimal /goertzel_1209_tb/DUT/Q0
add wave -noupdate -radix hexadecimal /goertzel_1209_tb/DUT/Q1
add wave -noupdate -radix hexadecimal /goertzel_1209_tb/DUT/Q2
add wave -noupdate -divider -height 20 DUT
add wave -noupdate /goertzel_1209_tb/DUT/clk
add wave -noupdate /goertzel_1209_tb/DUT/rst
add wave -noupdate /goertzel_1209_tb/DUT/state
add wave -noupdate /goertzel_1209_tb/DUT/in_ready
add wave -noupdate /goertzel_1209_tb/DUT/in_valid
add wave -noupdate /goertzel_1209_tb/DUT/out_ready
add wave -noupdate /goertzel_1209_tb/DUT/out_valid
add wave -noupdate /goertzel_1209_tb/DUT/counter
add wave -noupdate -format Analog-Step -height 74 -max 32648.999999999996 -min -32723.0 /goertzel_1209_tb/DUT/DTMF_sampled
add wave -noupdate -format Analog-Step -height 74 -max 923.99999999999989 -min -1000.0 -radix sfixed /goertzel_1209_tb/DUT/Q2_reg
add wave -noupdate -format Analog-Step -height 74 -max 923.99999999999989 -min -1000.0 -radix sfixed /goertzel_1209_tb/DUT/Q1_reg
add wave -noupdate -format Analog-Step -height 74 -max 923.99999999999989 -min -1000.0 -radix sfixed /goertzel_1209_tb/DUT/Q0_reg
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {20291807 ns} 0}
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
WaveRestoreZoom {0 ns} {22050 us}
