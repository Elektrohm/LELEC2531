`timescale 1ns / 1ps

module tb_clock_divider();

	// set up variables
	reg clock_in;

	// Output variables
	wire clock_out;

	// module under test 
	Clock_divider uut (
	.clock_in(clock_in), 
	.clock_out(clock_out)
	);


	initial begin
	// Initialize Inputs
	clock_in = 0;
	// create input clock 50MHz
		forever #10 clock_in = ~clock_in;
	end
      
endmodule