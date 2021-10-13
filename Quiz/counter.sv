module counter(d, clk, reset, enable, load, out);
	input [7:0] d;
	input logic clk, reset, enable, load; 
	output [7:0] out;
	reg[7:0] out;

	always_ff@(posedge clk, posedge reset) begin
		if (reset) out <= 8'b0;
		else if (load) out <= d;
		else if (enable) out <= out + 1'b1;
	end
	
endmodule
	