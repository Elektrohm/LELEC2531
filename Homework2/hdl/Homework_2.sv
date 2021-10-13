module Homework_2 (
	Clock,
	CounterOut,
	CounterInMSB, CounterInLSB,
	DoReset,
	DoIncrement, DoDecrement,
	DoShiftL2R, DoShiftR2L
);
input  logic		Clock;
output logic[7:0]	CounterOut;		 
input  logic 		CounterInMSB, CounterInLSB;	// Input bit when loading serially
input  logic		DoReset;			// DoReset = 1     -> CounterOut = 0
input  logic		DoIncrement;		        // DoIncrement = 1 -> CounterOut++
input  logic 		DoDecrement;		        // DoDecrement = 1 -> CounterOut--
input  logic		DoShiftL2R;			// DoShiftL2R = 1  -> CounterOut = (CounterOut >> 1) + CounterInMSB * (2**7)
input  logic		DoShiftR2L;			// DoShiftR2L = 1  -> CounterOut = (CounterOut << 1) + CounterInLSB 

reg[7:0] value;

always_ff @(posedge Clock) begin
	if (DoReset) value <= 8'b0;
	else if (DoIncrement) value <= value + 8'b1; 
	else if (DoDecrement) value <= value - 8'b1;
	else if (DoShiftL2R) value <= (value >> 1) + CounterInMSB * (2**7);
	else if (DoShiftR2L) value <= (value << 1) + CounterInLSB;
	else value <= value;
end 

assign CounterOut = value;

endmodule
	