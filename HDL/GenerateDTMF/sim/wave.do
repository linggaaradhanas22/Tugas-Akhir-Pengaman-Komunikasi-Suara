onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /sine_gen_tb/clk
add wave -noupdate /sine_gen_tb/rst
add wave -noupdate -radix hexadecimal /sine_gen_tb/phase_incr_low
add wave -noupdate -radix hexadecimal /sine_gen_tb/phase_incr_high
add wave -noupdate -format Analog-Step -height 74 -max 65534.999999999993 -radix hexadecimal /sine_gen_tb/data_low
add wave -noupdate -format Analog-Step -height 74 -max 65534.999999999993 -radix unsigned /sine_gen_tb/data_high
add wave -noupdate -format Analog-Step -height 77 -max 110805.00000000001 -radix hexadecimal /sine_gen_tb/data_out_17
add wave -noupdate -format Analog-Step -height 74 -max 65534.999999999993 -radix hexadecimal /sine_gen_tb/data_out_16
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {470900000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
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
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {1050042 ns}
