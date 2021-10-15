module Comb (
	MyInput,
	MyConstantSelect,
	MyOperation,
	MyStatus,
	MyOutput
);
input 	[7:0]	MyInput;
input 	[1:0]	MyConstantSelect;  // 0: Constant = 1, 1: Constant = 3, 2: Constant = 5, 3: Constant = 7
input 	[1:0]   MyOperation;       // 3 for OR, 2 for AND, 1 for Subtraction, 0 for Addition
output MyStatus;
output 	[7:0]   MyOutput;

// full adder entries
logic c_in;
assign c_in = 1'b0;
logic c_out;

// constant value 
logic [7:0] constant; 

logic [7:0] intermediate;
logic [7:0] intermediate2;

// Operations
// if any input changes (@*) this block has to be re-evaluated.
always @* begin 
	// gets Constant value and flips sign if MyOperation = 1
	case(MyConstantSelect)	
		// MyConstantSelect : constant = condition ? if_true : if_false; 
		2'd0: constant = MyOperation ? 8'b11111111 : 8'b00000001;		
		2'd1: constant = MyOperation ? 8'b11111101 : 8'b00000011;
		2'd2: constant = MyOperation ? 8'b11111011 : 8'b00000101;
		2'd3: constant = MyOperation ? 8'b11111001 : 8'b00000111;
		default : constant = 8'b00000000;
	endcase
	
	case(MyOperation)
		2'd2 : intermediate2 = MyInput & constant;
		2'd3 : intermediate2 = MyInput | constant;
	endcase
end

assign MyOutput = MyOperation <= 2'd1 ? intermediate : intermediate2; 
assign MyStatus = MyOutput == 8'b0 ? 1 : 0;  
	
// Compute with 8-bit full adder
full_adder_8_bit FA8_0 (
	.a(MyInput[7:0]),
	.b(constant),
	.c_in(c_in),
	.sum(intermediate[7:0]),
	.c_out(c_out));
endmodule 