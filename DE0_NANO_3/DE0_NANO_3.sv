
module DE0_NANO_3(input logic CLOCK_50, input logic [1:0] KEY, output logic [7:0] LED);

//=======================================================
//  set up variables
//=======================================================
logic reset, left, right, la, lb, lc, ra, rb, rc;

//=======================================================
//  PORT declarations
//=======================================================

//////////// CLOCK //////////
logic clock_1Hz;
logic clock_tap;

Clock_divider CLK1(
	.clock_in(CLOCK_50), 
	.clock_out(clock_1Hz)
);

my_pll test(
	.areset(),
	.inclk0(CLOCK_50),
	.c0(clock_tap),
	.locked());

//////////// LED //////////
assign LED[0] = lc;
assign LED[1] = lb;
assign LED[2] = la;
assign LED[4] = ra;
assign LED[5] = rb;
assign LED[6] = rc;

//////////// KEY //////////
assign left = ~KEY[0]; 
assign right = ~KEY[1];

//=======================================================
//  Module under test
//=======================================================

Homework_3 H3(
	.clk(clock_1Hz),
	.reset(reset),
	.left(left),
	.right(right),
	.la(la),
	.lb(lb),
	.lc(lc),
	.ra(ra),
	.rb(rb),
	.rc(rc)
);

endmodule

// Ad hoc clock divider to go from 50Mhz to 1Hz 
module Clock_divider(
	clock_in,
	clock_out);
	
	input clock_in; 
	output reg clock_out; 
	reg[27:0] counter=28'd0;
	parameter DIVISOR = 28'd50000000;

	always @(posedge clock_in)
	begin
		counter <= counter + 28'd1;
		if(counter>=(DIVISOR-1)) 
			counter <= 28'd0;
			clock_out <= (counter<DIVISOR/2) ? 1'b1 : 1'b0;
	end
endmodule


