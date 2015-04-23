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
	pb_in,
	clk,
	rst_n,
	col_in,
	row_scn,
	display,
	led //DEBUGGING
);

	//Defs
	input pb_in;
	input clk;
	input rst_n;
	
	//Pad Scanning
	input [3:0] col_in;
	output [3:0] row_scn;
	wire pad_pressed;
	//Clocks
	wire [1:0] clk_scn;
	wire clk_pad;
	wire add_stat;//DEBUGGING
	
	
	wire [3:0] key;
	wire [14:0] FTSD_num;
	
	//Adders
	wire [3:0] augend, addend, sum, cout;
	wire add;
	
	//Displaying
	wire [7:0] bcd_display;
	output [18:0] display;
	output [15:0] led; //DEBUGGING

//Module Connection
frequency_divider freq_div(
	.clk_cnt(),
	.clk_scn(clk_scn),
	.clk(clk),
	.rst_n(rst_n)
);

push_button add_pb( 
	.clk(clk_scn[0]),
	.rst_n(rst_n),
	.pb_in(pb_in),
	.pb_out(add)
);

keypad_scan pad_scn(
	.clk(clk_scn[1]),
	.rst_n(rst_n),
	.row_scn(row_scn),
	.col_in(col_in),
	.key(key),
	.pressed(pad_pressed)
);

num_input_fsm num_in(
	.in(key),
	.plus(add),
	.clk(clk_scn[0]),
	.rst_n(rst_n),
	.augend(augend),
	.addend(addend),
	.state(add_stat),
	.pad_pressed(pad_pressed)
);

bcd_adder bcd_add(
	.augend(augend),
	.addend(addend),
	.sum(sum),
	.cout(cout)
);

FTSD_scan ftsd_scn(
	.in1(augend),
	.in2(addend),
	.in3(cout),
	.in4(sum),
	.clk(clk_scn),
	.display(bcd_display)
);

FTSD_decoder ftsd_dec(
	.ftsd(display[14:0]),
	.bcd(bcd_display[3:0])
);

assign display[18:15] = bcd_display[7:4];

assign led[15:12] = addend;
assign led[10:7] = augend;
assign led[2] = add_stat;
assign led[0] = pad_pressed;
endmodule
