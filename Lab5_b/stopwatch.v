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
	rst_n,
	pb_in,
	rst_val_in,
	led//DEBUGGING
);
	//Inputs Defs
	input pb_in;
	input rst_val_in;
	input rst_n;

	//Displays Defs
	wire [14:0] ftsd_2;
	wire [14:0] ftsd_1;
	output [18:0] display;
	output [15:0] led;//DEBUGGING

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
	wire [7:0] rst_val;
	wire rst_val_tmp;
	 
//Module Connection
clock_generator clk_gen(
	.clk(oscillator),
	.rst_n(rst_n),
	.clk_1(clk_1hz),
	.clk_100(clk_100hz)
);

frequency_divider freq_div(
	.clk(oscillator),
	.rst_n(rst_n),
	.clk_scn(clk_scn)
);

push_button cnt_en_pb(
	.clk(clk_100hz),
	.rst_n(rst_n),
	.pb_in(pb_in),
	.pb_out(cnt_tmp),
	.debounced(rst_tmp)
);

push_button rst_en_pb(
	.clk(clk_1hz),
	.rst_n(rst_n),
	.pb_in(pb_in),
	.pb_out(rst_en)
);

push_button rst_val_pb(
	.clk(clk_100hz),
	.rst_n(rst_n),
	.pb_in(rst_val_in),
	.pb_out(rst_val_tmp)
);

fsm status(
	.count_enable(cnt_en),
	.in(cnt_tmp),
	.clk(clk_100hz),
	.rst_n(rst_n)
);

rst_fsm reset_val(
	.rst_value(rst_val),
	.in(rst_val_tmp),
	.rst_n(rst_n),
	.clk(clk_100hz)
);

downcounter_2d down_cnt(
	.ftsd_u(ftsd_2),
	.ftsd_t(ftsd_1),
	.clk(clk_1hz),
	.rst_val(rst_val),
	.rst_n(rst_en),
	.enable(cnt_en)
);

scan_control scn(
	.in1(ftsd_1),
	.in2(ftsd_2),
	.clk(clk_scn),
	.display(display)
);
//DEBUGGING
assign {led[7],led[6],led[5],led[4],led[3],led[2],led[1],led[0]}=rst_val;

endmodule
