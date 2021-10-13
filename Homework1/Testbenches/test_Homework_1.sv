`timescale 1ns/1ps 		// time unit / compiler time precision

module test_Homework_1 ();

	// Set up variables 
	logic [7:0] In;

	// Wires to retrieve information 
	logic [7:0] Out;
	logic [1:0] Constant;
	logic Operation;

	// module under test 
	Homework_1 H_1 (
		.MyInput(In),
		.MyConstantSelect(Constant),
		.MyOperation(Operation),
		.MyOutput(Out));

	integer loop_counter; 
	integer constant;

	initial 
	begin
		$display("Testing addition");
		Operation = 0;
		
		// looping over all possible 8 bits inputs 
		for(loop_counter=0; loop_counter<256; loop_counter = loop_counter + 1)
		begin 
			In = loop_counter;
			
			// looping over the 4 possible constants
			for (constant=0; constant<4; constant = constant + 1)
			begin 
				Constant = constant;
				#5;
			end
		end 	
			
		$display("Testing Subtraction");
		Operation = 1;
		
		// looping over all possible 8 bits inputs 
		for(loop_counter=0; loop_counter<256; loop_counter = loop_counter + 1)
		begin 
			In = loop_counter;
			
			// looping over the 4 possible constants
			for (constant=0; constant<4; constant = constant + 1)
			begin 
				Constant = constant;
				#5;
			end 
		end
		
	end
endmodule 

