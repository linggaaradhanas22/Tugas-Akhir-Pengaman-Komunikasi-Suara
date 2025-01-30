onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {Aud_Bclk Process}
add wave -noupdate /audio_tb/Aud_Bclock/bcount
add wave -noupdate /audio_tb/Aud_Bclock/wcount
add wave -noupdate /audio_tb/AUD_XCK
add wave -noupdate /audio_tb/LRCK
add wave -noupdate /audio_tb/AUD_DACLRCK
add wave -noupdate /audio_tb/AUD_ADCLRCK
add wave -noupdate /audio_tb/AUD_BCLK
add wave -noupdate /audio_tb/reset
add wave -noupdate /audio_tb/bit_range
add wave -noupdate /audio_tb/word_range
add wave -noupdate -divider Aud_Rcv_Xmt
add wave -noupdate /audio_tb/Aud_RCV_XMT/k
add wave -noupdate /audio_tb/AUD_DACDAT
add wave -noupdate /audio_tb/RCV
add wave -noupdate /audio_tb/Rdone
add wave -noupdate /audio_tb/Ldone
add wave -noupdate -max 24335.0 -min 1365.0 /audio_tb/Rin
add wave -noupdate -max -1366.0 -min -24336.0 /audio_tb/Lin
add wave -noupdate /audio_tb/Rout
add wave -noupdate /audio_tb/Lout
add wave -noupdate -divider ADC_PROC
add wave -noupdate /audio_tb/AUD_ADCDAT
add wave -noupdate /audio_tb/ADC_GEN/bit_counter
add wave -noupdate /audio_tb/ADC_GEN/data_valid
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 3} {20735 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 122
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
WaveRestoreZoom {20480 ns} {21242 ns}
