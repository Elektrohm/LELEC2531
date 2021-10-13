module mux4(input logic c1, input logic c2, 
			input logic[15:0] opA, input logic[15:0] opB,
			output logic[15:0] Result1
	);
 
	reg[1:0] muxin;
	assign muxin = {c1,c2};
	reg[15:0] out;
	always_comb
		case(muxin)
			2'b00 : out = opA + opB;
			2'b01 : out = opA - opB;
			2'b10 : out = opA + 1'b1;
			2'b11 : out = opA - 1'b1;
		endcase
	assign Result1 = out;
endmodule

module mux8(input logic c1, input logic c2, input logic c3,
			input logic[15:0] opA, input logic[15:0] opB,
			output logic[15:0] Result2
	);
	
	reg[2:0] muxin;
	assign muxin = {c1,c2,c3};
	reg[15:0] out;
	always_comb
		case(muxin)
			3'b000 : out = opA & opB;
			3'b001 : out = ~(opA & opB);
			3'b010 : out = opA | opB;
			3'b011 : out = ~(opA | opB);
			3'b100 : out = opA ^ opB;
			3'b101 : out = opA ~^ opB;
			3'b110 : out = ~opA;
			3'b111 : out = ~opB;
		endcase
	assign Result2 = out;
endmodule
			
			
module comb_A (input logic c1, input logic c2, input logic c3,
		   input logic[15:0] opA, input logic[15:0] opB,
		   output logic zero1, output logic zero2
	);
	
	wire[15:0] Result1;
	wire[15:0] Result2;
	
	mux4 m4(c1, c2, opA, opB, Result1);
	mux8 m8(c1, c2, c3, opA, opB, Result2);
	
	assign zero1 = Result1==16'b0 ? 1 : 0;
	assign zero2 = ~Result2 ? 1 : 0;
	
endmodule
	
	
	
		