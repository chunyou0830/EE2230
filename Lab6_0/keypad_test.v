`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: NTHUEE
// Engineer: Chun You, Yang
// Create Date: 16:29 04/15/2015
// Design Name: keypad
// Module Name: D:/Programming/EE2230/Lab6_0/keypad_test.v
// Project Name: Lab6_0
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
		col_in = 4'b1111;
		
		// Add stimulus here
		#1 rst_n = 1; col_in = 4'b0111;
		#200 col_in = 4'b1011;
		#200 col_in = 4'b1101;
		#200 col_in = 4'b1110;
		#200 col_in = 4'b1111;
		
	end
	
	always 
	begin
		#1 clk=~clk;
	end
      
endmodule

