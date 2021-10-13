`timescale 1ns/1ps

module test_FSM ();

	// set up variables
	logic clk, start;
	logic [15:0] d;
	wire done;
	
	// dut 
	FSM fsm(clk, start, d, done);
	
	// initialize clock
	always #10 clk = ~clk;
	
	
	initial
	begin
		// initialize every variables
		clk = 1'b0;
		start = 1'b0;
		d = 16'b111111110000000;
		#40
		
		// drive to state S0
		start = 1'b1;
		#40
		
		// let out increase 
		start = 1'b0;
		#200
		
		// restart then let finish
		start = 1'b1;
		#100
		start = 1'b0;
		d = 16'b0000000000000000;
		#500;
	end
endmodule