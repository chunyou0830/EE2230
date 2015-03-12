`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:45:00 03/05/2015
// Design Name:   FourBitFullAdder
// Module Name:   D:/Lab1/FBFA_Test.v
// Project Name:  Lab1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FourBitFullAdder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module FBFA_Test;

	// Inputs
	reg a0;
	reg a1;
	reg a2;
	reg a3;
	reg b0;
	reg b1;
	reg b2;
	reg b3;
	reg ci;

	// Outputs
	wire s0;
	wire s1;
	wire s2;
	wire s3;
	wire co;

	// Instantiate the Unit Under Test (UUT)
	FourBitFullAdder uut (
		.a0(a0), 
		.a1(a1), 
		.a2(a2), 
		.a3(a3), 
		.b0(b0), 
		.b1(b1), 
		.b2(b2), 
		.b3(b3), 
		.ci(ci), 
		.s0(s0), 
		.s1(s1), 
		.s2(s2), 
		.s3(s3), 
		.co(co)
	);

	initial begin
		// Initialize Inputs
		a0 = 0;
		a1 = 0;
		a2 = 0;
		a3 = 0;
		b0 = 0;
		b1 = 0;
		b2 = 0;
		b3 = 0;
		ci = 0;

		// Wait 100 ns for global reset to finish
		#100 a3=0; a2=0; a1=0; a0=1; b3=0; b2=0; b1=0; b0=1;
		#100 a3=0; a2=0; a1=0; a0=1; b3=0; b2=0; b1=1; b0=1;
		#100 a3=0; a2=0; a1=1; a0=1; b3=0; b2=0; b1=1; b0=1;
        
		// Add stimulus here

	end
      
endmodule

