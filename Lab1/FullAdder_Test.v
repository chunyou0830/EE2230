`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:32:02 03/05/2015
// Design Name:   FullAdder
// Module Name:   D:/Lab1/FullAdder_Test.v
// Project Name:  Lab1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FullAdder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module FullAdder_Test;

	// Inputs
	reg a;
	reg b;
	reg ci;

	// Outputs
	wire co;
	wire s;

	// Instantiate the Unit Under Test (UUT)
	FullAdder uut (
		.co(co), 
		.s(s), 
		.a(a), 
		.b(b), 
		.ci(ci)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		ci = 0;

		// Wait 100 ns for global reset to finish
		#100 a=0; b=1; ci=0;
		#100 a=1; b=0; ci=0;
		#100 a=1; b=1; ci=0;
		#100 a=0; b=0; ci=1;
		#100 a=0; b=1; ci=1;
		#100 a=1; b=0; ci=1;
		#100 a=1; b=1; ci=1;
        
		// Add stimulus here

	end
      
endmodule

