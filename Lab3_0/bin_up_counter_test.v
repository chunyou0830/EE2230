`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:43:43 03/17/2015
// Design Name:   bin_up_counter
// Module Name:   D:/Programming/EE2230/Lab3_0/bin_up_counter_test.v
// Project Name:  Lab3_0
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: bin_up_counter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module bin_up_counter_test;

	// Inputs
	reg clk;
	reg rst_n;

	// Outputs
	wire [3:0] q;

	// Instantiate the Unit Under Test (UUT)
	bin_up_counter uut (
		.q(q), 
		.clk(clk), 
		.rst_n(rst_n)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst_n = 0;

		// Wait 100 ns for global reset to finish
		#20 rst_n=1;
        
		// Add stimulus here

	end
	
	always
	begin
		#20 clk = ~clk;
	end
      
endmodule

