`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Chun You, Yang
// Create Date:    12:41 05/14/2015 
// Module Name:    cnt_setting 
//////////////////////////////////////////////////////////////////////////////////
module cnt_setting(
	clk,
	rst,
	add_sec,
	add_min,
	rst_val_sec,
	rst_val_min
);

	// Control
	input clk;
	input rst;
	input add_sec, add_min;

	// Value Output
	output [7:0] rst_val_sec, rst_val_min;

upcounter_tens sec_push_adder(
	.cnt(rst_val_sec),
	.increase(add_sec),
	.cout(),
	.rst_val({4'd6, 4'd0}),
	.def_val({4'd0, 4'd0}),
	.clk(clk),
	.rst(rst)
);

upcounter_tens min_push_adder(
	.cnt(rst_val_min),
	.increase(add_min),
	.cout(),
	.rst_val({4'd2, 4'd4}),
	.def_val({4'd0, 4'd0}),
	.clk(clk),
	.rst(rst)
);

endmodule
