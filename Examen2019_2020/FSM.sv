module FSM(input logic clk,
		   input logic start, 
		   input logic[15:0] d,
		   output logic done
	);
	typedef enum logic[1:0] {S0, S1, S2, S3} statetype;
	statetype state, next_state;

	// internal variable
	logic select;
	logic reset;
	reg[15:0] out;
	
	// combinational circuit
	sequential seq(clk, select, reset, d, out);

	// register management
	always_ff@(posedge clk) begin
		if (start) state <= S0;
		else state <= next_state;
	end
	
	// combinational logic
	always_comb
		case(state)
			S0 : next_state = S1;
			S1 : next_state = out[2] ? S2 : S1;
			S2 : next_state = out[3] ? S3 : S2;
			S3 : next_state = S3;
		endcase
	
	// output state value
	assign reset = (state == S0);
	assign select = (state == S1 & out[2]==1);
	assign done = (state == S3);
endmodule
	
			