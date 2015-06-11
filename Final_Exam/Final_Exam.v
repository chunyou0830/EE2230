`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:42:42 06/11/2015 
// Design Name: 
// Module Name:    Final_exam 
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
module Final_exam(
	clk,
	row_scn,
	col_in,
	display,
	led,
	pb_in_rst,
	pb_in_state
);

	// I/O DECLARATION
	// Clocks
	input clk;
	wire clk_cnt;
	wire [1:0] clk_scn;

	// Controlling and FSM
	input pb_in_state;
	wire state_switch;
	wire state;
	input pb_in_rst;
	wire rst;
	assign rst = ~pb_in_rst;
	assign state_switch = ~pb_in_state;

	// Keypad Data
	input [3:0] col_in;
	output [3:0] row_scn;
	wire [3:0] key;
	wire pressed;
	wire [35:0] ID_data;

	// Display
	wire [15:0] disp_effect, disp_input, disp_choose;
	wire [15:0] led_input;
	wire [14:0] disp_decA, disp_decB, disp_decC, disp_decD;
	output [18:0] display;
	output [15:0] led;

	// Module Connection
frequency_divider freq_div(
	.clk_cnt(clk_cnt),
	.clk_scn(clk_scn),
	.clk(clk),
	.rst(rst)
);

keypad_scan pad_scn(
	.clk(clk_scn[0]),
	.rst(rst),
	.row_scn(row_scn),
	.col_in(col_in),
	.key(key),
	.pressed(pressed)
);

state_controll stat_ctl(
	.clk(clk_scn[0]),
	.rst(rst),
	.state(state),
	.state_switch(state_switch)
);

input_controll input_ctrl(
	.rst(rst),
	.key(key),
	.pressed(pressed),
	.state(state),
	.ID_data(ID_data),
	.disp_input(disp_input)
);

display_effect disp_effctl(
	.clk(clk_scn[0]),
	.clk_cnt(clk_cnt),
	.rst(rst),
	.state(state),
	.ID_data(ID_data),
	.disp_effect(disp_effect),
	.led(led_input)
);

//----------

display_controll disp_ctl(
	.disp_effect(disp_effect),
	.disp_input(disp_input),
	.led_input(led_input),
	.display(disp_choose),
	.led(led[14:0]),
	.state(state)
);

assign led[15] = state;

FTSD_decoder ftsd_dec_a(
	.bcd({2'b00,disp_choose[3:0]}),
	.ftsd(disp_decA)
);

FTSD_decoder ftsd_dec_b(
	.bcd({2'b00,disp_choose[7:4]}),
	.ftsd(disp_decB)
);

FTSD_decoder ftsd_dec_c(
	.bcd({2'b00,disp_choose[11:8]}),
	.ftsd(disp_decC)
);

FTSD_decoder ftsd_dec_d(
	.bcd({2'b00,disp_choose[15:12]}),
	.ftsd(disp_decD)
);
FTSD_scan ftsd_scn(
	.in1(disp_decA),
	.in2(disp_decB),
	.in3(disp_decC),
	.in4(disp_decD),
	.clk(clk_scn),
	.display(display)
);

endmodule
