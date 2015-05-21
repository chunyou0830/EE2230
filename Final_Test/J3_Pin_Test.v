`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:40:19 05/21/2015 
// Design Name: 
// Module Name:    J3_Pin_Test 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module J3_Pin_Test(
	pb_in,
	pins_out,
	led
);
	input pb_in;
	output pins_out;
	output led;
	
	assign pins_out = pb_in;
	assign led = pins_out;

endmodule
