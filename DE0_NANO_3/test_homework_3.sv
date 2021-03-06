`timescale 1ms/1us // time unit / compiler time precision 

module test_homework_3();

// set up variables 
reg clk, reset, left, right;

// output variables
wire la, lb, lc, ra, rb, rc;

// module under test 
Homework_3 H3(
	.clk(clk),
	.reset(reset),
	.left(left),
	.right(right),
	.la(la),
	.lb(lb),
	.lc(lc),
	.ra(ra),
	.rb(rb),
	.rc(rc)
);

// Init Clock of period (10*TimeUnit)/2
always #500 clk = ~clk;

initial 
	begin 
		clk = 1'b0;
		left = 1'b0;
		right = 1'b0;
		
		// start with state S0 
		reset = 1'b1;
		#1200
		
		// turn left
		reset = 1'b0;
		left = 1'b1;
		#1000
		left = 1'b0;
		#1000
		
		// turn right
		right = 1'b1;
		#1000
		right = 1'b0;
		#1000
		
		// turn both direction
		left = 1'b1;
		right = 1'b1;
		#1500
		
		// quit left so should turn on only right
		left = 1'b0;
		#1100
		
		// resetting mid turning signal
		reset = 1'b1;
		#1200
		right = 1'b0;
		#1200;
	end
endmodule 
		
		
		
		
		
		
		

	