# The $ sign can be used to pass argument through the “do” command ($1 for the first, $2 for the second, etc.)
if {$1 == 0} {
# restart the simulation (can be useful if you add a new signal to the Wave)
restart –f
} else {

# delete all signals in the Wave (actually not necessary if you start a new simulation (with vsim))
delete wave *

# restart a simulation (necessary if you recompile one of your design files)
vsim -gui -t ns work.test_Homework_1


onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix decimal /test_Homework_1/In
add wave -noupdate -radix decimal /test_Homework_1/Out
add wave -noupdate -radix unsigned /test_Homework_1/Constant
add wave -noupdate /test_Homework_1/Operation
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {6834 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
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
WaveRestoreZoom {6818 ns} {6974 ns}
}
run 8000 ns