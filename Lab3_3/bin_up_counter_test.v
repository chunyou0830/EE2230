`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:47:13 03/19/2015
// Design Name:   bin_up_counter
// Module Name:   D:/103061142/Lab3_2/bin_up_counter_test.v
// Project Name:  Lab3_2
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
	reg orig_clk;
	reg rst_n;

	// Outputs
	wire [3:0] bcd;

	// Instantiate the Unit Under Test (UUT)
	bin_up_counter uut (
		.bcd(bcd), 
		.orig_clk(orig_clk), 
		.rst_n(rst_n)
	);

	initial begin
		// Initialize Inputs
		orig_clk = 0;
		rst_n = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#10 rst_n=1;

	end
      
	always
	begin
		#10 orig_clk=~orig_clk;
	end
	
	
endmodule

