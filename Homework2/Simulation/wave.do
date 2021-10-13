
# The $ sign can be used to pass argument through the “do” command ($1 for the first, $2 for the second, etc.)
if {$1 == 0} {
# restart the simulation (can be useful if you add a new signal to the Wave)
restart –f
} else {

# delete all signals in the Wave (actually not necessary if you start a new simulation (with vsim))
delete wave *

# restart a simulation (necessary if you recompile one of your design files)
vsim -gui -t ns work.Test_homework_2

onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix binary /Test_homework_2/CLK
add wave -noupdate -color Pink -radix binary /Test_homework_2/Dec
add wave -noupdate -color Cyan -radix binary /Test_homework_2/Inc
add wave -noupdate -color White -radix binary /Test_homework_2/L2R
add wave -noupdate -color Yellow -radix binary /Test_homework_2/LSB
add wave -noupdate -color {Orange Red} -radix binary /Test_homework_2/MSB
add wave -noupdate -radix binary /Test_homework_2/Out
add wave -noupdate -color White -radix binary /Test_homework_2/R2L
add wave -noupdate -color Red -radix binary /Test_homework_2/Rst
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1000 ns} 0}
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
WaveRestoreZoom {200 ns} {400 ns}
}
run 1000 ns
