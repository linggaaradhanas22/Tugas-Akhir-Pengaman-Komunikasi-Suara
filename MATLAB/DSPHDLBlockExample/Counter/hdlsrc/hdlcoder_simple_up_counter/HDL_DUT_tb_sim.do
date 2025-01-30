onbreak resume
onerror resume
vsim -coverage -voptargs=+acc work.HDL_DUT_tb

add wave sim:/HDL_DUT_tb/u_HDL_DUT/clk
add wave sim:/HDL_DUT_tb/u_HDL_DUT/reset
add wave sim:/HDL_DUT_tb/u_HDL_DUT/clk_enable
add wave sim:/HDL_DUT_tb/u_HDL_DUT/count_threshold
add wave sim:/HDL_DUT_tb/u_HDL_DUT/alphaEnable
add wave sim:/HDL_DUT_tb/u_HDL_DUT/ce_out
add wave sim:/HDL_DUT_tb/u_HDL_DUT/out_rsvd
add wave sim:/HDL_DUT_tb/out_rsvd_ref
run -all
coverage report -html CodeCoverage.html
coverage save CodeCoverage.ucdb
