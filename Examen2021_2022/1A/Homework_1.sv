module Homework_1 (
	MyInput,
	MyConstantSelect,
	MyOperation,
	MyStatus,
	MyOutput
);
input 	[7:0]	MyInput;
input 	[1:0]	MyConstantSelect;  // 0: Constant = 1, 1: Constant = 3, 2: Constant = 5, 3: Constant = 7
input 	[2:0]   MyOperation;       // 5,6,7 for nothing, 4 for XOR, 3 for NOR, 2 for NAND, 1 for Subtraction, 0 for Addition
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
		3'd0: constant = MyOperation==3'd1 ? 8'b11111111 : 8'b00000001;		
		3'd1: constant = MyOperation==3'd1 ? 8'b11111101 : 8'b00000011;
		3'd2: constant = MyOperation==3'd1 ? 8'b11111011 : 8'b00000101;
		3'd3: constant = MyOperation==3'd1 ? 8'b11111001 : 8'b00000111;
		default : constant = 8'b00000000;
	endcase
	
	case(MyOperation)
		3'd2 : intermediate2 = ~(MyInput & constant);
		3'd3 : intermediate2 = ~(MyInput | constant);
		3'd4 : intermediate2 = MyInput ^ constant;
		3'd5 : intermediate2 = 8'b1;		
		3'd6 : intermediate2 = 8'b1;		
		3'd7 : intermediate2 = 8'b1;		
	endcase
end

assign MyOutput = MyOperation <= 3'd1 ? intermediate : intermediate2; 
assign MyStatus = MyOutput == 8'b0 ? 1 : 0;  
	
// Compute with 8-bit full adder
full_adder_8_bit FA8_0 (
	.a(MyInput[7:0]),
	.b(constant),
	.c_in(c_in),
	.sum(intermediate[7:0]),
	.c_out(c_out));
endmodule 

module full_adder_1_bit ( 
	input  logic a,
	input  logic b,
	input  logic c_in,
	output logic sum,
	output logic c_out);
								  								  
assign sum = a ^ b ^ c_in;
assign c_out = (a & b) | ((a ^ b) & c_in);

endmodule

module full_adder_4_bit ( 
	input  logic [3:0] 	a,
	input  logic [3:0] 	b,
	input  logic 		c_in,
	output logic [3:0] 	sum,
	output logic 		c_out);
								  
wire c1, c2, c3; 
								 
full_adder_1_bit FA0 ( 
	.a(a[0]),
	.b(b[0]),
	.c_in(c_in),
	.sum(sum[0]),
	.c_out(c1));
							  
full_adder_1_bit FA1 ( 
	.a(a[1]),
	.b(b[1]),
	.c_in(c1),
	.sum(sum[1]),
	.c_out(c2));
							  
full_adder_1_bit FA2 ( 
	.a(a[2]),
	.b(b[2]),
	.c_in(c2),
	.sum(sum[2]),
	.c_out(c3));
							  
full_adder_1_bit FA3 ( 
	.a(a[3]),
	.b(b[3]),
	.c_in(c3),
	.sum(sum[3]),
	.c_out(c_out));
							  
endmodule							 

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
	


	
