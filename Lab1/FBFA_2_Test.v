`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:56:09 03/05/2015
// Design Name:   FBFA_2
// Module Name:   D:/Lab1/FBFA_2_Test.v
// Project Name:  Lab1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FBFA_2
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module FBFA_2_Test;

	// Outputs
	reg ci;
	reg [3:0]a;
	reg [3:0]b;
	wire [3:0]s;
	wire co;

	// Instantiate the Unit Under Test (UUT)
	FBFA_2 uut (
		.()
	);

	initial begin
		// Initialize Inputs

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

