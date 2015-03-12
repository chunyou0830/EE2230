`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:00:08 03/05/2015
// Design Name:   FourBitAdder
// Module Name:   D:/Lab1/FBA_Test.v
// Project Name:  Lab1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FourBitAdder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module FBA_Test;

	// Inputs
	reg [3:0] a;
	reg [3:0] b;
	reg ci;

	// Outputs
	wire [3:0] s;
	wire co;

	// Instantiate the Unit Under Test (UUT)
	FourBitAdder uut (
		.a(a), 
		.b(b), 
		.ci(ci), 
		.s(s), 
		.co(co)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		ci = 0;

		// Wait 100 ns for global reset to finish
		#100 a=4'd1; b=4'd1;
		#100 a=4'd2; b=4'd3;
		#100 a=4'd4; b=4'd5;
		#100 a=4'd10; b=4'd10;
        
		// Add stimulus here

	end
      
endmodule

