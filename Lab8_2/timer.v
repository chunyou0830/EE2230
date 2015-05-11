`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Chun You, Yang
// Create Date:    11:58 05/10/2015 
// Module Name:    timer 
//////////////////////////////////////////////////////////////////////////////////
module timer(
	clk,
	pb_rst,
	pb_in,
	dip,
	display,
	led
);

	// Clocks
	input clk;
	wire clk_cnt;
	wire [1:0] clk_scn;

	// Control
	input pb_rst;
	wire rst;
	assign rst = ~pb_rst;
	input [1:0] pb_in;
	input dip;

	// Counting
	wire [7:0] sec, min, hr;
	wire cout_sec, cout_min, cout_hr;

	// Display
	wire [3:0] numA, numB, numC, numD;
	wire [14:0] dispA, dispB, dispC, dispD;
	output [18:0] display;
	output [15:0] led;

frequency_divider freq_div(
	.clk_cnt(clk_cnt),
	.clk_scn(clk_scn),
	.clk(clk),
	.rst(rst)
);

downcounter_tens cnt_sec(
	.cnt(sec),
	.decrease(1'b1),
	.cout(cout_sec),
	.rst_val({4'd0, 4'd0}),
	.def_val({4'd5, 4'd9}),
	.clk(clk_cnt),
	.rst(rst)
);

downcounter_tens cnt_min(
	.cnt(min),
	.decrease(cout_sec),
	.cout(cout_min),
	.rst_val({4'd0, 4'd0}),
	.def_val({4'd5, 4'd9}),
	.clk(clk_cnt),
	.rst(rst)
);

FTSD_decoder ftsd_dec_A(
	.bcd({2'b00,min[7:4]}),
	.ftsd(dispA)
);

FTSD_decoder ftsd_dec_B(
	.bcd({2'b00,min[3:0]}),
	.ftsd(dispB)
);

FTSD_decoder ftsd_dec_C(
	.bcd({2'b00,sec[7:4]}),
	.ftsd(dispC)
);

FTSD_decoder ftsd_dec_D(
	.bcd({2'b00,sec[3:0]}),
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

endmodule
