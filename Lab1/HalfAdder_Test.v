`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:25:13 03/05/2015
// Design Name:   HalfAdder
// Module Name:   D:/Lab1/HalfAdder_Test.v
// Project Name:  Lab1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: HalfAdder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module HalfAdder_Test;

	// Inputs
	reg a;
	reg b;

	// Outputs
	wire s;
	wire co;

	// Instantiate the Unit Under Test (UUT)
	HalfAdder uut (
		.s(s), 
		.co(co), 
		.a(a), 
		.b(b)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;

		// Wait 100 ns for global reset to finish
		#100 a=0; b=1;
		#100 a=1; b=0;
		#100 a=1; b=1;
        
		// Add stimulus here

	end
      
endmodule

