`timescale 1ns/1ps

module test_sequential();

	// set up variables
	logic clk, select, reset;
	logic [15:0] d;
	reg [15:0] out;
	
	// dut 
	sequential seq(clk, select, reset, d, out);
	
	// initialize clock
	always #10 clk = ~clk;
	
	
	initial
	begin
		// initialize every variables
		clk = 1'b0;
		select = 1'b0;
		reset = 1'b0;
		d = 16'b0;
		#40
		
		// drive out to 0
		reset = 1'b1;
		#40
		
		// let w1 increase 
		reset = 1'b0;
		#200
		
		// drive d through mux 
		select = 1'b1;
		d = 16'b0110011100010101;
		#60
		
		// shut mux and start cycle again
		select = 1'b0;
		#200
		
		// reset out
		reset = 1'b1;
		#50;
		
	end
endmodule