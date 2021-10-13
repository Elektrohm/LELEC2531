module mux1 (input logic select, 
			input logic[15:0] a, input logic[15:0] b, 
			output logic[15:0] out
	);
	
	reg[15:0] val;

	always_comb
		case(select)
			1'b0 : val = a;
			1'b1 : val = b;
		endcase
	assign out = val;
endmodule


module sequential (input logic clk, 
				   input logic select, 
				   input logic reset,
				   input logic[15:0] d,
				   output logic[15:0] out
	);
	
	reg[15:0] w1, w2, w3, w4, w5, q;
	reg[15:0] cst = 16'b0;
	
	
	mux1 m1(select, w3, w2, w4);
	mux1 m2 (reset, w4, cst, w5);
	
	always_ff@(posedge clk) begin
		w2 <= d;
		w3 <= w1;
		q <= w5;
	end
	
	assign w1 = out +1; // suppose it's combinational logic 	
	assign out = q;
	
endmodule
			
		