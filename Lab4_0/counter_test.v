`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:14:13 04/01/2015
// Design Name:   counter
// Module Name:   D:/Programming/EE2230/Lab4_0/counter_test.v
// Project Name:  Lab4_0
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: counter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module counter_test;

	// Inputs
	reg mode;
	reg in;
	reg clk;

	// Outputs
	wire [7:0] q;

	// Instantiate the Unit Under Test (UUT)
	counter uut (
		.mode(mode), 
		.in(in), 
		.clk(clk), 
		.q(q)
	);

	initial begin
		// Initialize Inputs
		mode = 0;
		in = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#10;
		
        
		// Add stimulus here
		#20 in=0;
		#20 in=1;
		#20 in=0;
		#20 in=1;
		#20 in=0;
		#20 in=1;
		#20 in=0;
		#20 in=1;
		#20 mode=1;

	end
      
	always
	begin
	#10 clk=~clk;
	end
endmodule

