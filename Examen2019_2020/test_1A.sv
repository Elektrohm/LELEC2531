`timescale 1ns/1ps 		// time unit / compiler time precision

module test();

	// set up variable
	logic c1;
	logic c2;
	logic c3;
	logic[15:0] opA;
	logic[15:0] opB;

	// output variable
	logic zero1;
	logic zero2;
	
	//DUT
	comb_A C1A(c1, c2, c3, opA, opB, zero1, zero2);
	
	initial 
	begin
		c1 = 1'b0;
		c2 = 1'b0;
		c3 = 1'b0;
		
		#10
		opA = 8'b1;
		opB = 8'b0;
		
		#10
		c3 = 1'b1;
		#10
		c1 = 1'b1;
		c2 = 1'b1;
		#10;
	end
endmodule
		
		
		
		