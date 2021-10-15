`timescale 1ns/1ps 		// time unit / compiler time precision

module test_comb ();

	// Set up variables 
	logic [7:0] A;

	// Wires to retrieve information 
	logic [7:0] OUT;
	logic [1:0] cst;
	logic [2:0] op;
	logic MyStatus;

	// module under test 
	Homework_1 c1 (
		.MyInput(A),
		.MyConstantSelect(cst),
		.MyOperation(op),
		.MyStatus(MyStatus),
		.MyOutput(OUT));

	initial 
	begin
		A = 8'd250; 
		
		// TESTING ADD OPERATION
		cst = 2'd0;
		op = 3'd0;
		
		# 5 // wait after 5 delay time 
		
		cst = 2'd1;
		
		# 5 // wait after 5 delay time 
		
		cst = 2'd2;
		
		# 5 // wait after 5 delay time 
		
		cst = 2'd3;
		
		# 5 // wait after 5 delay time 
		 
		// TESTING SUBSTRACT OPERATION 
		
		cst = 2'd0;
		op = 3'd1;
		
		# 5 // wait after 5 delay time 
		
		cst = 2'd1;
		
		# 5 // wait after 5 delay time 
		
		cst = 2'd2;
		
		# 5 // wait after 5 delay time 
		
		cst = 2'd3;
		
		# 5
		
		// TESTING NAND OPERATION
		
		cst = 2'd0;
		op = 3'd2;
		
		A = 8'd0;
		
		# 5 // wait after 5 delay time 
		
		cst = 2'd1;
		A = 8'd150;
		
		# 5 // wait after 5 delay time 
		
		cst = 2'd2;
		
		# 5 // wait after 5 delay time 
		
		cst = 2'd3;
		
		# 5 
		
		// TESTING NOR OPERATION
		
		cst = 2'd0;
		op = 3'd3;
		
		# 5 // wait after 5 delay time 
		
		cst = 2'd1;
		
		# 5 // wait after 5 delay time 
		
		cst = 2'd2;
		
		# 5 // wait after 5 delay time 
		
		cst = 2'd3;
		
		# 5
		// TESTING XOR OPERATION 
		
		cst = 2'd0;
		op = 3'd4;
		
		# 5 // wait after 5 delay time 
		
		cst = 2'd1;
		
		# 5 // wait after 5 delay time 
		
		cst = 2'd2;
		
		# 5 // wait after 5 delay time 
		
		cst = 2'd3;
		
		# 5 
		
		// TESTING NOTHING OPERATION 
		
		cst = 2'd0;
		op = 3'd5;
		
		# 5 // wait after 5 delay time 
		
		cst = 2'd1;
		
		# 5 // wait after 5 delay time 
		
		cst = 2'd2;
		
		# 5 // wait after 5 delay time 
		
		cst = 2'd3;
		
		# 5
		
		cst = 2'd0;
		op = 3'd6;
		
		# 5 // wait after 5 delay time 
		
		cst = 2'd1;
		
		# 5 // wait after 5 delay time 
		
		cst = 2'd2;
		
		# 5 // wait after 5 delay time 
		
		cst = 2'd3;
		
		# 5
		cst = 2'd0;
		op = 3'd7;
		
		# 5 // wait after 5 delay time 
		
		cst = 2'd1;
		
		# 5 // wait after 5 delay time 
		
		cst = 2'd2;
		
		# 5 // wait after 5 delay time 
		
		cst = 2'd3;
	end
endmodule 

