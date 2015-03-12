`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:48:14 03/09/2015
// Design Name:   DecimalAdder
// Module Name:   C:/XilinxISE/Project/Lab1/DA_Test.v
// Project Name:  Lab1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: DecimalAdder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module DA_Test;

	// Inputs
	reg [3:0] a;
	reg [3:0] b;
	reg ci;

	// Outputs
	wire [3:0] s;
	wire co;

	// Instantiate the Unit Under Test (UUT)
	DecimalAdder uut (
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
		#100 a=4'd1; b=4'd0;
		#100 a=4'd2; b=4'd1;
		#100 a=4'd1; b=4'd4;
		#100 a=4'd4; b=4'd3;
		#100 a=4'd2; b=4'd7;
		#100 a=4'd5; b=4'd5;
		#100 a=4'd7; b=4'd4;
		#100 a=4'd9; b=4'd6;
		#100 a=4'd9; b=4'd9;
        
		// Add stimulus here

	end
      
endmodule

