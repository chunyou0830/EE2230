`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company		: NTHUEE
// Engineer		: Chun You, Yang
// Create Date	: 19:25 04/13/2015 
// Module Name	: keypad 
// Project Name	: Lab6_2
//////////////////////////////////////////////////////////////////////////////////
`include "global.v"
module keypad(
	clk,
	rst_n,
	col_in,
	row_scn,
	display,
	led //DEBUGGING
);

	//Defs
	input clk;
	input rst_n;
	
	//Pad Scanning
	input [3:0] col_in;
	output [3:0] row_scn;
	//Clocks
	wire [1:0] clk_scn;
	wire clk_pad;
	
	
	wire [3:0] key;
	wire [14:0] FTSD_num;
	
	//Adders
	wire augend;
	wire addend;
	wire sum;
	wire cout;
	
	//Displaying
	output [18:0] display;
	output [15:0] led; //DEBUGGING

//Module Connection
frequency_divider freq_div(
	.clk_cnt(),
	.clk_scn(clk_scn),
	.clk(clk),
	.rst_n(rst_n)
);

keypad_scan pad_scn(
	.clk(clk_scn[1]),
	.rst_n(rst_n),
	.row_scn(row_scn),
	.col_in(col_in),
	.key(key),
	.pressed(led[0])//DEBUGGING
);

full_adder f_add(
	.a(augend),
	.b(addend),
	.cin(1'b0),
	.s(sum),
	.cout(cout)
);

FTSD_decoder ftsd_dec(
	.ftsd(FTSD_num),
	.bcd(key)
);

FTSD_scan ftsd_scn(
	.in1(augend),
	.in2(addend),
	.in3(cout),
	.in4(sum),
	.clk(clk_scn),
	.display(display)
);
endmodule
