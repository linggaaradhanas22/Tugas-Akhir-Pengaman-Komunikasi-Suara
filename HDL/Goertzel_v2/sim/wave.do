onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /goertzel_tb/sample_clk
add wave -noupdate /goertzel_tb/rst
add wave -noupdate /goertzel_tb/clk
add wave -noupdate /goertzel_tb/in_ready
add wave -noupdate /goertzel_tb/in_valid
add wave -noupdate -format Analog-Step -height 74 -max 32648.999999999996 -min -32723.0 /goertzel_tb/DTMF_sig
add wave -noupdate -radix ufixed /goertzel_tb/power_697
add wave -noupdate -radix ufixed /goertzel_tb/power_770
add wave -noupdate -radix ufixed /goertzel_tb/power_852
add wave -noupdate -radix ufixed /goertzel_tb/power_941
add wave -noupdate -radix ufixed /goertzel_tb/power_1209
add wave -noupdate -radix ufixed /goertzel_tb/power_1336
add wave -noupdate -radix ufixed /goertzel_tb/power_1477
add wave -noupdate /goertzel_tb/out_ready
add wave -noupdate /goertzel_tb/out_valid
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {20013040000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 137
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
WaveRestoreZoom {0 ps} {22050 us}
