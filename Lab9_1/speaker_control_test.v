`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:33:34 05/14/2015
// Design Name:   speaker_control
// Module Name:   D:/Programming/EE2230/Lab9_1/speaker_control_test.v
// Project Name:  Lab9_1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: speaker_control
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module speaker_control_test;

	// Inputs
	reg clk;
	reg rst;
	reg [15:0] audio_in_left;
	reg [15:0] audio_in_right;

	// Outputs
	wire audio_appsel;
	wire audio_sysclk;
	wire audio_bck;
	wire audio_ws;
	wire audio_data;

	// Instantiate the Unit Under Test (UUT)
	speaker_control uut (
		.clk(clk), 
		.rst(rst), 
		.audio_in_left(audio_in_left), 
		.audio_in_right(audio_in_right), 
		.audio_appsel(audio_appsel), 
		.audio_sysclk(audio_sysclk), 
		.audio_bck(audio_bck), 
		.audio_ws(audio_ws), 
		.audio_data(audio_data)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		audio_in_left = 0;
		audio_in_right = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

