`timescale 1ns/1ps 		// time unit / compiler time precision

module Test_Homework_2();

	// Set up variables 
	reg		CLK; 
	reg[31:0] CounterInData;
	reg		MSB;
	reg     LSB;
	reg		Rst;
	reg 	DoReset;
	reg 	DoLoad;
	reg 	DoSet;
	reg		Inc;		        
	reg 	Dec;		       
	reg		L2R;			
	reg		R2L;	
	
	// Output variables
	wire[31:0]	Out;
	
	// module under test 
	Homework_2 H_2 (
		.Clock(CLK),
		.CounterOut(Out),
		.CounterInData(CounterInData),
		.CounterInMSB(MSB),
		.CounterInLSB(LSB),
		.DoReset(Rst),
		.DoLoad(DoLoad),
		.DoSet(DoSet),
		.DoIncrement(Inc),
		.DoDecrement(Dec),
		.DoShiftL2R(L2R),
		.DoShiftR2L(R2L)
		);

	// Init Clock of period (10*TimeUnit)/2
	always #10 CLK = ~CLK;
	
	initial 
		begin 
		// instantiate all variables 
		CLK = 1'b0;
		Inc = 1'b0;
		Dec = 1'b0;
		MSB = 1'b0;
		LSB = 1'b0;
		L2R = 1'b0;
		R2L = 1'b0;
		
		Rst = 1'b1;
		
		#30;
		
		// testing incrementation
		Rst = 1'b0;
		Inc = 1'b1;
		
		#150 
		
		// testing decrementation
		Inc = 1'b0;
		Dec = 1'b1;
		
		#70 
		
		// testing reset
		Dec = 1'b0;
		Rst = 1'b1;
		
		#20
		
		// testing DoLoad
		Rst = 1'b0;
		CounterInData = 32'b10111111111111111111111111111111;
		DoLoad = 1'b1;
		
		#50
		
		// testing DoSet
		DoLoad = 1'b0;
		DoSet = 1'b1;
		
		#50
		
		// Increment before L2R 
		DoSet = 1'b0;
		Rst = 1'b0;
		Inc = 1'b1;
		
		#200
		Inc = 1'b0;
		L2R = 1'b1;
		
		#100
		
		// Increment before R2L
		L2R = 1'b0;
		Inc = 1'b1;
		
		#200
		Inc = 1'b0;
		R2L = 1'b1;
		
		#60
		
		// Testing LSB
		R2L = 1'b0;
		LSB = 1'b1;
		R2L = 1'b1;
		
		#60
		
		// Testing MSB
		R2L	= 1'b0;
		MSB = 1'b1;
		L2R	= 1'b1;

		end
endmodule 

