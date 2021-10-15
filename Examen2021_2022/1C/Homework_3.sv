module Homework_3(input logic clk,
	input logic reset,
	input logic left, right, brake, fog, alarm,
	output logic la, lb, lc, ra, rb, rc
);

taillight leftside( 
	.clk(clk),
	.reset(reset),
	.Turn(left),
	.brake(brake),
	.fog(fog),
	.alarm(alarm),
	.a(la),
	.b(lb),
	.c(lc));

taillight rightside( 
	.clk(clk),
	.reset(reset),
	.Turn(right),
	.brake(brake),
	.fog(fog),
	.alarm(alarm),
	.a(ra),
	.b(rb),
	.c(rc));
endmodule


// Generic module for taillight, Turn takes left or right input
module taillight(
	input logic clk,
	input logic reset,
	input logic Turn,
	input logic brake,
	input logic fog,
	input logic alarm,
	output logic a, b, c
);
typedef enum logic [2:0] {S0, S1, S2, S3, S4, S5, S6} statetype;
statetype state, nextstate;

// FSM register
always_ff @(posedge clk, posedge reset) begin
		if (reset) state <= S0;
		else state <= nextstate;
	end
	
// FSM combinational logic
always_comb
	case (state)
		S0 : if (Turn) nextstate = S1;
			 else if (brake) nextstate = S4;
			 else if (fog) nextstate = S6;
			 else if (alarm) nextstate = S5;
			 else nextstate = S0;
		S1 : nextstate = S2;
		S2 : nextstate = S3;
		S3 : nextstate = S0;
		S4 : if (brake) nextstate = S4;
			 else nextstate = S0;
		S5 : nextstate = S0;
		S6 : if (fog) nextstate = S6;
			 else nextstate = S0;
		default nextstate = S0; // just for security purposes
	endcase
	
assign a = (state == S1 | state == S2 | state == S3 | state == S4 | state == S5 | state == S6);
assign b = (state == S2 | state == S3 | state == S4 | state == S5);
assign c = (state == S3 | state == S4 | state == S5);

endmodule 

		


 