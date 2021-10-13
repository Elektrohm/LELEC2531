module Homework_3(input logic clk,
	input logic reset,
	input logic left, right,
	output logic la, lb, lc, ra, rb, rc
);

taillight leftside( 
	.clk(clk),
	.reset(reset),
	.Turn(left),
	.a(la),
	.b(lb),
	.c(lc));

taillight rightside( 
	.clk(clk),
	.reset(reset),
	.Turn(right),
	.a(ra),
	.b(rb),
	.c(rc));
endmodule


// Generic module for taillight, Turn takes left or right input
module taillight(
	input logic clk,
	input logic reset,
	input logic Turn,
	output logic a, b, c
);
typedef enum logic [1:0] {S0, S1, S2, S3} statetype;
statetype state, nextstate;

// FSM register
always_ff @(posedge clk, posedge reset) begin
		if (reset) state <= S0;
		else state <= nextstate;
	end
	
// FSM combinational logic
always_comb
	case (state)
		S0 : nextstate = Turn ? S1 : S0;
		S1 : nextstate = S2;
		S2 : nextstate = S3;
		S3 : nextstate = S0;
		default nextstate = S0; // just for security purposes
	endcase
	
assign a = (state == S1 | state == S2 | state == S3);
assign b = (state == S2 | state == S3);
assign c = (state == S3);

endmodule 

		


 