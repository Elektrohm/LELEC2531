transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/LELEC2531/DE0_NANO_3 {C:/LELEC2531/DE0_NANO_3/my_pll.v}
vlog -vlog01compat -work work +incdir+C:/LELEC2531/DE0_NANO_3/db {C:/LELEC2531/DE0_NANO_3/db/my_pll_altpll.v}
vlog -sv -work work +incdir+C:/LELEC2531/DE0_NANO_3 {C:/LELEC2531/DE0_NANO_3/Homework_3.sv}
vlog -sv -work work +incdir+C:/LELEC2531/DE0_NANO_3 {C:/LELEC2531/DE0_NANO_3/DE0_NANO_3.sv}

vlog -sv -work work +incdir+C:/LELEC2531/DE0_NANO_3 {C:/LELEC2531/DE0_NANO_3/test_homework_3.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  test_homework_3

add wave *
view structure
view signals
run 10500 ms
