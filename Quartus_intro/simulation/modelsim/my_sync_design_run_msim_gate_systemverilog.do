transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -sv -work work +incdir+. {my_sync_design_6_1200mv_85c_slow.svo}

vlog -sv -work work +incdir+C:/LELEC2531/Quartus_intro {C:/LELEC2531/Quartus_intro/testbench.sv}

vsim -t 1ps +transport_int_delays +transport_path_delays -L altera_ver -L cycloneive_ver -L gate_work -L work -voptargs="+acc"  my_wonderful_testbench

do C:/LELEC2531/Quartus_intro/simulation/modelsim/wave.do
