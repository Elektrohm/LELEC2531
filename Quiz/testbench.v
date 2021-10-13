`timescale 1ns/1ps 

module testbench ();
	
	// set up variables
	reg clk, reset, enable, load;
	reg[7:0] d;
	
	// output 
	wire[7:0] out;
	
	// module under test
	counter dut(
		.d(d),
		.clk(clk),
		.reset(reset),
		.enable(enable),
		.load(load),
		.out(out)
		);
		
	always #20 clk = ~clk;
	
	initial 
		begin
			clk = 1'b0;
			reset = 1'b1;
			enable = 1'b0;
			load = 1'b0;
			
			#50
			
			reset = 1'b0;
			
			#100
			
			enable = 1'b1;
			
			#400
			
			enable = 1'b0;
			d = 8'b11011011;
			load = 1'b1;
			
			#50
			
			load = 1'b0;
			enable = 1'b1;
			#100
			
			enable = 1'b0;
			reset = 1'b1;
			
			#50;
		end
endmodule
			
		