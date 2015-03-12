`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: NTHUEE
// Engineer: Chun You, Yang
//
// Create Date:   18:13:53 03/05/2015
// Design Name:   Decoder
// Module Name:   D:/Lab1/Decoder_Test.v
// Project Name:  Lab1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Decoder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Decoder_Test;

	// Inputs
	reg en;
	reg [1:0] in;

	// Outputs
	wire [3:0] d;

	// Instantiate the Unit Under Test (UUT)
	Decoder uut (
		.en(en), 
		.in(in), 
		.d(d)
	);

	initial begin
		// Initialize Inputs
		en = 0;
		in = 0;

		// Wait 100 ns for global reset to finish
		#100 en=0; in=2'b00;
		#100 en=0; in=2'b01;
		#100 en=0; in=2'b10;
		#100 en=0; in=2'b11;
		#100 en=1; in=2'b00;
		#100 en=1; in=2'b01;
		#100 en=1; in=2'b10;
		#100 en=1; in=2'b11;
        
		// Add stimulus here

	end
      
endmodule

