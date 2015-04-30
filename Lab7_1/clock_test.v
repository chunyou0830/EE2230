`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:24:39 05/01/2015
// Design Name:   electronic_clock
// Module Name:   D:/Programming/EE2230/Lab7_1/clock_test.v
// Project Name:  Lab7_1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: electronic_clock
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module clock_test;

	// Inputs
	reg clk;
	reg pb_in_rst;
	reg hours_switch;

	// Outputs
	wire [18:0] display;
	wire [15:0] led;

	// Instantiate the Unit Under Test (UUT)
	electronic_clock uut (
		.clk(clk), 
		.pb_in_rst(pb_in_rst), 
		.display(display), 
		.led(led), 
		.hours_switch(hours_switch)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		pb_in_rst = 0;
		hours_switch = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	
	always
	begin
	#1 clk=~clk;
	end
      
endmodule

