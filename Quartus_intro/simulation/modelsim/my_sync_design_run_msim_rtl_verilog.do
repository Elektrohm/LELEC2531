transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/LELEC2531/Quartus_intro {C:/LELEC2531/Quartus_intro/my_sync_design.sv}

vlog -sv -work work +incdir+C:/LELEC2531/Quartus_intro {C:/LELEC2531/Quartus_intro/testbench.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  my_wonderful_testbench

do C:/LELEC2531/Quartus_intro/simulation/modelsim/wave.do
