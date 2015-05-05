`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Chun You, Yang
// Create Date:    17:10 04/30/2015 
// Module Name:    electronic_clock 
//////////////////////////////////////////////////////////////////////////////////
`include "global.v"
module electronic_clock(
	clk,
	pb_in_rst,
	dip,
	display,
	led
);

	//Basic input and operators
	input clk;
	input pb_in_rst;
	input [2:0] dip;
	wire rst;
	assign rst = ~pb_in_rst;
	
	//Counters
	wire clk_1hz, clk_100hz, clk_fst;
	wire carry_sec, carry_min, carry_hr, carry_day, carry_mon;
	
	//Clock
	wire [7:0] sec, min, hr, day, mon;
	wire [15:0] year;
	wire [7:0] day_rst_val;
	
	//Display I/Os
	wire [23:0] disp_dec;
	wire [14:0] dispA, dispB, dispC, dispD;
	wire [1:0] clk_scn;
	output [18:0] display;
	output [15:0] led;


	//Module Connection

clock_generator clk_gen(
	.clk(clk),
	.rst(rst),
	.clk_1(clk_1hz),
	.clk_100(clk_100hz)
);

frequency_divider freq_div(
	.clk_cnt(),
	.clk_scn(clk_scn),
	.clk_fst(clk_fst),
	.clk(clk),
	.rst(rst)
);

upcounter_tens cnt_sec(
	.cnt(sec),
	.increase(`ENABLED),
	.cout(carry_sec),
	.rst_val({4'd6,4'd0}),
	.def_val({4'd0,4'd0}),
	.clk(clk_fst),
	.rst(rst)
);

upcounter_tens cnt_min(
	.cnt(min),
	.increase(carry_sec),
	.cout(carry_min),
	.rst_val({4'd6,4'd0}),
	.def_val({4'd0,4'd0}),
	.clk(clk_fst),
	.rst(rst)
);

upcounter_tens cnt_hr(
	.cnt(hr),
	.increase(carry_min),
	.cout(carry_hr),
	.rst_val({4'd2,4'd4}),
	.def_val({4'd0,4'd0}),
	.clk(clk_fst),
	.rst(rst)
);

upcounter_tens cnt_day(
	.cnt(day),
	.increase(carry_hr),
	.cout(carry_day),
	.rst_val(day_rst_val),
	.def_val({4'd0,4'd1}),
	.clk(clk_fst),
	.rst(rst)
);

upcounter_tens cnt_mon(
	.cnt(mon),
	.increase(carry_day),
	.cout(carry_mon),
	.rst_val({4'd1,4'd3}),
	.def_val({4'd0,4'd1}),
	.clk(clk_fst),
	.rst(rst)
);

upcounter_thousands cnt_year(
	.cnt(year),
	.increase(carry_mon),
	.cout(),
	.rst_val({4'd2,4'd2,4'd0,4'd1}),
	.def_val({4'd2,4'd0,4'd0,4'd0}),
	.clk(clk_fst),
	.rst(rst)
);

date_setting day_set(
	.mon(mon),
	.year(year),
	.day_rst_val(day_rst_val)
);

display_control disp_ctl(
	.dip(dip),
	.sec(sec),
	.min(min),
	.hr(hr),
	.day(day),
	.mon(mon),
	.year(year),
	.disp(disp_dec)
);

FTSD_decoder ftsd_dec_A(
	.bcd(disp_dec[23:18]),
	.ftsd(dispA)
);

FTSD_decoder ftsd_dec_B(
	.bcd(disp_dec[17:12]),
	.ftsd(dispB)
);

FTSD_decoder ftsd_dec_C(
	.bcd(disp_dec[11:6]),
	.ftsd(dispC)
);

FTSD_decoder ftsd_dec_D(
	.bcd(disp_dec[5:0]),
	.ftsd(dispD)
);

FTSD_scan ftsd_scn(
	.in1(dispA),
	.in2(dispB),
	.in3(dispC),
	.in4(dispD),
	.clk(clk_scn),
	.display(display)
);

assign led[0] = carry_sec;
assign led[1] = carry_min;
assign led[2] = carry_hr;
endmodule
