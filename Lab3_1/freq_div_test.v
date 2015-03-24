`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:28:20 03/19/2015
// Design Name:   freq_div
// Module Name:   D:/103061142/Lab3_1/freq_div_test.v
// Project Name:  Lab3_1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: freq_div
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module freq_div_test;

	// Inputs
	reg clk;
	reg rst_n;

	// Outputs
	wire clk_out;

	// Instantiate the Unit Under Test (UUT)
	freq_div uut (
		.clk_out(clk_out), 
		.clk(clk), 
		.rst_n(rst_n)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst_n = 0;

		// Wait 100 ns for global reset to finish
		#100;
		#100 rst_n=1;
        
		// Add stimulus here

	end
      
	always
		begin
			#10 clk=~clk;
		end
endmodule

