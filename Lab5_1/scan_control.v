`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company		: NTHUEE
// Engineer		: Chun You, Yang
// Create Date	: 21:00 04/11/2015 
// Module Name	: scan_control 
// Project Name	: Lab5_2
//////////////////////////////////////////////////////////////////////////////////
`include "global.v"
module scan_control(
	in1,
	in2,
	in3,
	in4,
	clk,
	display
);

	//Inputs Defs
	input [14:0]in1,in2,in3,in4;
	input [1:0]clk;
	output reg [18:0]display;
	
always @*
	begin
	case(clk)
		2'b00: display={4'b0111,in1};
		2'b01: display={4'b1011,in2};
		/*2'b10: display={4'b1101,in3};
		2'b11: display={4'b1110,in4};*/
		default: display={19'b1111_1111_1111_1111_111};
	endcase
	end		

endmodule
