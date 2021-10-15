`timescale 1ns/1ps 		// time unit / compiler time precision

module test_comb ();

	// Set up variables 
	logic [7:0] A;

	// Wires to retrieve information 
	logic [7:0] OUT;
	logic [1:0] cst;
	logic [1:0] op;
	logic MyStatus;

	// module under test 
	Comb c1 (
		.MyInput(A),
		.MyConstantSelect(cst),
		.MyOperation(op),
		.MyStatus(MyStatus),
		.MyOutput(OUT));

	initial 
	begin
		A = 8'd250; 
		cst = 2'd0;
		op = 2'd0;
		
		# 5 // wait after 5 delay time 
		
		cst = 2'd1;
		
		# 5 // wait after 5 delay time 
		
		cst = 2'd2;
		
		# 5 // wait after 5 delay time 
		
		cst = 2'd3;
		
		# 5 // wait after 5 delay time 
		 
		cst = 2'd0;
		op = 2'd1;
		
		# 5 // wait after 5 delay time 
		
		cst = 2'd1;
		
		# 5 // wait after 5 delay time 
		
		cst = 2'd2;
		
		# 5 // wait after 5 delay time 
		
		cst = 2'd3;


		# 5 // wait after 5 delay time 

		A = 8'd5; 
		cst = 2'd0;
		op = 2'd0;
		
		# 5 // wait after 5 delay time 
		
		cst = 2'd1;
		
		# 5 // wait after 5 delay time 
		
		cst = 2'd2;
		
		# 5 // wait after 5 delay time 
		
		cst = 2'd3;
		
		# 5 // wait after 5 delay time 
		 
		cst = 2'd0;
		op = 2'd1;
		
		# 5 // wait after 5 delay time 
		
		cst = 2'd1;
		
		# 5 // wait after 5 delay time 
		
		cst = 2'd2;
		
		# 5 // wait after 5 delay time 
		
		cst = 2'd3;


		# 5 // wait after 5 delay time 

		A = 8'd150; 
		cst = 2'd0;
		op = 2'd0;
		
		# 5 // wait after 5 delay time 
		
		cst = 2'd1;
		
		# 5 // wait after 5 delay time 
		
		cst = 2'd2;
		
		# 5 // wait after 5 delay time 
		
		cst = 2'd3;
		
		# 5 // wait after 5 delay time 
		 
		cst = 2'd0;
		op = 2'd1;
		
		# 5 // wait after 5 delay time 
		
		cst = 2'd1;
		
		# 5 // wait after 5 delay time 
		
		cst = 2'd2;
		
		# 5 // wait after 5 delay time 
		
		cst = 2'd3;
		
		#5
		
		cst = 2'd0;
		op = 2'd2;
		
		A = 8'd0;
		
		# 5 // wait after 5 delay time 
		
		cst = 2'd1;
		A = 8'd150;
		
		# 5 // wait after 5 delay time 
		
		cst = 2'd2;
		
		# 5 // wait after 5 delay time 
		
		cst = 2'd3;
		
		# 5 
		
		cst = 2'd0;
		op = 2'd3;
		
		# 5 // wait after 5 delay time 
		
		cst = 2'd1;
		
		# 5 // wait after 5 delay time 
		
		cst = 2'd2;
		
		# 5 // wait after 5 delay time 
		
		cst = 2'd3;
		
	end
endmodule 

