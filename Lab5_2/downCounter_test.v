`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:43:39 04/09/2015
// Design Name:   display_decoder
// Module Name:   D:/Programming/EE2230/Lab5_0/downCounter_test.v
// Project Name:  Lab5_0
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: display_decoder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module downCounter_test;

	// Inputs
	reg oscillator;
	reg rst_n;

	// Outputs
	wire [18:0] display;

	// Instantiate the Unit Under Test (UUT)
	display_decoder uut (
		.display(display), 
		.oscillator(oscillator), 
		.rst_n(rst_n)
	);

	initial begin
		// Initialize Inputs
		oscillator = 0;
		rst_n = 0;

		// Wait 100 ns for global reset to finish
		#10;
        
		// Add stimulus here
		#10 rst_n = 1;
		#700 rst_n = 0;
		#10 rst_n = 1;
	end
	
	always
		begin
			#10 oscillator=~oscillator;
		end
      
endmodule

