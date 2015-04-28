`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company		: NTHUEE
// Engineer		: Chun You, Yang
// Create Date	: 19:25 04/13/2015 
// Module Name	: calculator
// Project Name	: Lab6_2
//////////////////////////////////////////////////////////////////////////////////
`include "global.v"
module calculator(
	clk,
	pb_in_rst,
	col_in,
	row_scn,
	display,
	led //DEBUGGING
);

	//Clocks
	input clk;
	wire [1:0] clk_scn;
	
	//Reset Signal
	input pb_in_rst;
	wire rst;
	
	//Pad Scanning
	input [3:0] col_in;
	output [3:0] row_scn;
	wire [3:0] key;
	wire pad_pressed;
	
	//Calculatiom
	wire [1:0] calculation;
	wire [1:0] state_num_input;
	wire [7:0] numA, numB;
	wire [9:0] equal;
	wire [11:0] result;
	wire [14:0] sign;
	
	//Display
	wire [29:0] numA_FTSD, numB_FTSD;
	wire [44:0] result_FTSD;
	wire [14:0] sign_FTSD;
	
	wire state_disp;
	wire [14:0] dispA, dispB, dispC, dispD;
	output [18:0] display;
	output [15:0] led; //DEBUGGING

//Module Connection
frequency_divider freq_div(
	.clk_cnt(),
	.clk_scn(clk_scn),
	.clk(clk),
	.rst(rst)
);

assign rst = ~pb_in_rst;

keypad_scan pad_scn(
	.clk(clk_scn[0]),
	.rst(rst),
	.row_scn(row_scn),
	.col_in(col_in),
	.key(key),
	.pressed(pad_pressed)
);

keypad_FSM pad_fsm(
	.clk(clk_scn[0]),
	.rst(rst),
	.key(key),
	.pressed(pad_pressed),
	.numA(numA),
	.numB(numB),
	.state(state_num_input),
	.state_disp(state_disp),
	.calculation(calculation)
);

num_calculator num_calc(
	.numA(numA),
	.numB(numB),
	.calculation(calculation),
	.equal(equal),
	.sign(sign)
);

BIN_converter_BCD bcd_conv(
	.in(equal),
	.units(result[3:0]),
	.tens(result[7:4]),
	.hunds(result[11:8])
);

FTSD_decoder ftsd_dec_numA_u(
	.ftsd(numA_FTSD[14:0]),
	.bcd(numA[3:0])
);

FTSD_decoder ftsd_dec_numA_t(
	.ftsd(numA_FTSD[29:15]),
	.bcd(numA[7:4])
);

FTSD_decoder ftsd_dec_numB_u(
	.ftsd(numB_FTSD[14:0]),
	.bcd(numB[3:0])
);

FTSD_decoder ftsd_dec_numB_t(
	.ftsd(numB_FTSD[29:15]),
	.bcd(numB[7:4])
);

FTSD_decoder ftsd_dec_result_u(
	.ftsd(result_FTSD[14:0]),
	.bcd(result[3:0])
);

FTSD_decoder ftsd_dec_result_t(
	.ftsd(result_FTSD[29:15]),
	.bcd(result[7:4])
);

FTSD_decoder ftsd_dec_result_h(
	.ftsd(result_FTSD[44:30]),
	.bcd(result[11:8])
);

FTSD_control ftsd_ctl(
	.state(state_disp),
	.rst(rst),
	.numA_FTSD(numA_FTSD),
	.numB_FTSD(numB_FTSD),
	.sign_FTSD(sign),
	.result_FTSD(result_FTSD),
	.dispA(dispA),
	.dispB(dispB),
	.dispC(dispC),
	.dispD(dispD)
);

FTSD_scan ftsd_scn(
	.in1(dispA),
	.in2(dispB),
	.in3(dispC),
	.in4(dispD),
	.clk(clk_scn),
	.display(display)
);

endmodule
