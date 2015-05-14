`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:21:21 05/14/2015
// Design Name:   speaker
// Module Name:   D:/Programming/EE2230/Lab9_1/speaker_test.v
// Project Name:  Lab9_1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: speaker
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module speaker_test;

	// Inputs
	reg clk;
	reg pb_in_rst;

	// Outputs
	wire audio_appsel;
	wire audio_sysclk;
	wire audio_bck;
	wire audio_ws;
	wire audio_data;

	// Instantiate the Unit Under Test (UUT)
	speaker uut (
		.clk(clk), 
		.pb_in_rst(pb_in_rst), 
		.audio_appsel(audio_appsel), 
		.audio_sysclk(audio_sysclk), 
		.audio_bck(audio_bck), 
		.audio_ws(audio_ws), 
		.audio_data(audio_data)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		pb_in_rst = 0;

		// Wait 100 ns for global reset to finish
		#1 pb_in_rst = 1;
        
		// Add stimulus here

	end
   always 
		#1 clk = ~clk;
endmodule

