transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/LELEC2531/Homework3 {C:/LELEC2531/Homework3/Homework_3.sv}

vlog -sv -work work +incdir+C:/LELEC2531/Homework3/Testbench {C:/LELEC2531/Homework3/Testbench/test_homework_3.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  test_homework_3

add wave *
view structure
view signals
run 10400 ms
