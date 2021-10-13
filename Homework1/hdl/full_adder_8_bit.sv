module full_adder_8_bit (
	// DATA 
	input logic [7:0]    a,
	input logic [7:0]    b,
	input logic		     c_in,	
	output logic [7:0]   sum,
	output logic     	 c_out);

// Internal components 
wire c1; 				// shared wire between the 4 bit full_adder 

// Operations 
full_adder_4_bit FA4_0 (
	.a(a[3:0]),
	.b(b[3:0]),
	.c_in(c_in),
	.sum(sum[3:0]),
	.c_out(c1));

full_adder_4_bit FA4_1 (
	.a(a[7:4]),
	.b(b[7:4]),
	.c_in(c1),
	.sum(sum[7:4]),
	.c_out(c_out));

endmodule
	


	
