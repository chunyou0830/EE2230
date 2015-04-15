`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company		: NTHUEE
// Engineer		: Chun You, Yang
// Create Date	: 19:25 04/13/2015 
// Module Name	: keypad 
// Project Name	: Lab6_0
//////////////////////////////////////////////////////////////////////////////////
`include "global.v"
module keypad(
	clk,
	rst_n,
	col_in,
	row_scn,
	key

);

	//Defs
	input clk;
	input rst_n;
	input [3:0] col_in;
	output [3:0] row_scn;
	output [3:0] key;

//Module Connection

keypad_scan pad_scn(
	.clk(clk),
	.rst_n(rst_n),
	.row_scn(row_scn),
	.col_in(col_in),
	.key(key)
);

endmodule
