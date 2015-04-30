`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company		: NTHUEE
// Engineer		: Chun You, Yang
// Create Date	: 20:15 04/11/2015 
// Module Name	: stopwatch 
// Project Name	: Lab5_2
//////////////////////////////////////////////////////////////////////////////////
`include "global.v"
module stopwatch(
	oscillator,
	display,
	led,
	cnt_in,
	rst_in
);
	//Inputs Defs
	input rst_in;
	input cnt_in;

	//Displays Defs
	wire [14:0] ftsd_2;
	wire [14:0] ftsd_1;
	output [18:0] display;
	output [15:0] led;

	//Clocks Defs
	input oscillator;
	wire [1:0] clk_scn;
	wire clk_1hz;
	wire clk_100hz;
	
	//Status
	wire cnt_en;
	wire cnt_tmp;
	wire rst_en;
	wire rst_tmp;
	 
//Module Connection
clock_generator clk_gen(
	.clk(oscillator),
	.rst_n(1'b1),
	.clk_1(clk_1hz),
	.clk_100(clk_100hz)
);

frequency_divider freq_div(
	.clk(oscillator),
	.rst_n(1'b1),
	.clk_scn(clk_scn)
);

push_button cnt_en_pb(
	.clk(clk_100hz),
	.rst_n(1'b1),
	.pb_in(cnt_in),
	.pb_out(cnt_tmp),
	.debounced(rst_tmp)
);

push_button rst_en_pb(
	.clk(clk_100hz),
	.rst_n(1'b1),
	.pb_in(rst_in),
	.pb_out(rst_en)
);

fsm status(
	.count_enable(cnt_en),
	.in(cnt_tmp),
	.clk(clk_100hz),
	.rst_n(1'b1)
);

downcounter_2d down_cnt(
	.ftsd_u(ftsd_2),
	.ftsd_t(ftsd_1),
	.led(led),
	.clk(clk_1hz),
	.rst_n(rst_en),
	.enable(cnt_en)
);

scan_control scn(
	.in1(ftsd_1),
	.in2(ftsd_2),
	.clk(clk_scn),
	.display(display)
);

endmodule