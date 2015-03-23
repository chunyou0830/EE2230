`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:40:12 03/19/2015
// Design Name:   bin_up_counter
// Module Name:   D:/103061142/Lab3_2/bi_up_counter_test.v
// Project Name:  Lab3_2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: bin_up_counter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module bi_up_counter_test;

	// Inputs
	reg freq;
	reg rst_n;

	// Outputs
	wire [3:0] bcd;

	// Instantiate the Unit Under Test (UUT)
	bin_up_counter uut (
		.bcd(bcd), 
		.freq(freq), 
		.rst_n(rst_n)
	);

	initial begin
		// Initialize Inputs
		freq = 0;
		rst_n = 0;

		// Wait 100 ns for global reset to finish
		#1;
		
		#1 rst_n=1;
        
		// Add stimulus here

	end
	
	always
	begin
	#1 freq = ~freq;
	end
      
endmodule

