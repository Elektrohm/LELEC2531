`timescale 1ms/1us // time unit / compiler time precision 

module test_FSM();

// set up variables 
reg clk, reset, left, right, brake, alarm;

// output variables
wire la, lb, lc, ra, rb, rc;

// module under test 
FSM fsm(
	.clk(clk),
	.reset(reset),
	.left(left),
	.right(right),
	.brake(brake),
	.alarm(alarm),
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
		
		// testing brake
		reset = 1'b0;
		#1200
		brake = 1'b1;
		#600
		brake = 1'b0;
		#600
		brake = 1'b1;
		#2000
		
		// testing alarm
		brake = 1'b0;
		#1800
		alarm = 1'b1;
		#4000
		alarm = 1'b0;
		#1200;
	end
endmodule 
		
		
		
		
		
		
		

	