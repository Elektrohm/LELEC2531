module Homework_4(input logic [31:0] a, b, 
				input logic [1:0]    ALUControl,
				output logic [31:0]  Result,
				output logic [3:0]   ALUFlags);
	
	// variables for the adder
	logic [31:0] b_add, Sum;
	logic cout;
	assign b_add = ALUControl[0] ? ~b : b;
	
	// adder output
	assign {cout, Sum} = a + b_add + ALUControl[0];

	always_comb
		// result of MUX4
		case(ALUControl)
			2'b11 : Result = a | b;
			2'b10 : Result = a & b;
			2'b01 : Result =  Sum;
			2'b00 : Result =  Sum;
		endcase
	
	// results for ALUFlags
	assign ALUFlags[0] = (~(ALUControl[0] ^ a[31] ^ b[31]) 
							& (a[31] ^ Sum[31]) & (~ALUControl[1]));
	assign ALUFlags[1] = ~ALUControl[1] & cout;
	assign ALUFlags[2] = Result == 32'b0 ? 1 : 0;
	assign ALUFlags[3] = Result[31];
		
endmodule