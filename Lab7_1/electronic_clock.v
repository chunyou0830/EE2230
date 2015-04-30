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
	display,
	hours_switch
);

	//Basic input and operators
	input clk;
	input pb_in_rst;
	wire rst;
	assign rst = ~pb_in_rst;
	
	//Counters
	wire clk_1hz, clk_100hz;
	wire carry_sec, carry_min, carry_hr, carry_day, carry_mon;
	
	//Clock
	wire [7:0] sec, min, hr, day, mon, year;
	input hours_switch;
	
	//Display I/Os
	wire [14:0] dispA, dispB, dispC, dispD;
	wire [1:0] clk_scn;
	output [18:0] display;



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
	.clk(clk),
	.rst(rst)
);

upcounter_tens cnt_sec(
	.out(sec),
	.rst_val({4'd6,4'd0}),
	.clk(clk_1hz),
	.rst(rst)
);

FTSD_decoder ftsd_dec_A(
	.bcd(sec[7:4]),
	.ftsd(dispA)
);

FTSD_decoder ftsd_dec_B(
	.bcd(sec[3:0]),
	.ftsd(dispB)
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
