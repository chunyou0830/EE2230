`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:29:37 04/15/2015
// Design Name:   keypad
// Module Name:   D:/Programming/EE2230/Lab6_0/keypad_test.v
// Project Name:  Lab6_0
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: keypad
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module keypad_test;

	// Inputs
	reg clk;
	reg rst_n;
	reg [3:0] col_in;

	// Outputs
	wire [3:0] row_scn;
	wire [3:0] key;

	// Instantiate the Unit Under Test (UUT)
	keypad uut (
		.clk(clk), 
		.rst_n(rst_n), 
		.col_in(col_in), 
		.row_scn(row_scn), 
		.key(key)
	);

	initial begin
		// Initialize Inputs
		clk = 1;
		rst_n = 0;
		col_in = 1111;

		// Wait 100 ns for global reset to finish
		#200 rst_n=1;
		
		
		// Add stimulus here
		#200 col_in=4'b0111;
		#200 col_in=4'b1011;
		#200 col_in=4'b1101;
		#200 col_in=4'b1110;
		
	end
	
	always
	begin
		#10 clk=~clk;
	end
      
endmodule

