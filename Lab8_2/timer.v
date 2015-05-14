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
	pb_in_set,
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
	input [1:0] pb_in, pb_in_set;
	input dip;
	wire pb_pause, pb_stop, pb_min_add, pb_sec_add;

	// Counting
	wire [7:0] rst_val_sec, rst_val_min;
	wire [7:0] sec, min;
	wire cout_sec, cout_min;
	wire zero_min, zero_sec;
	wire cnt_en, cnt_rst;

	// Display
	wire [3:0] numA, numB, numC, numD;
	wire [14:0] dispA, dispB, dispC, dispD;
	output [18:0] display;
	output reg [15:0] led;
	
frequency_divider freq_div(
	.clk_cnt(clk_cnt),
	.clk_scn(clk_scn),
	.clk(clk),
	.rst(rst)
);

push_button pb_in_1(
	.clk(clk_scn[0]),
	.rst(rst),
	.pb_in(pb_in[0]),
	.pb_out(pb_pause),
	.debounced()
);

push_button pb_in_2(
	.clk(clk_scn[0]),
	.rst(rst),
	.pb_in(pb_in[1]),
	.pb_out(pb_stop),
	.debounced()
);

push_button pb_in_set_1(
	.clk(clk_scn[0]),
	.rst(rst),
	.pb_in(pb_in_set[0]),
	.pb_out(pb_sec_add),
	.debounced()
);

push_button pb_in_set_2(
	.clk(clk_scn[0]),
	.rst(rst),
	.pb_in(pb_in_set[1]),
	.pb_out(pb_min_add),
	.debounced()
);

cnt_setting cnt_val_set(
	.clk(clk_scn[0]),
	.rst(rst),
	.add_sec(pb_sec_add),
	.add_min(pb_min_add),
	.rst_val_sec(rst_val_sec),
	.rst_val_min(rst_val_min)
);

downcounter_control cnt_ctl(
	.clk(clk_scn[0]),
	.rst(rst),
	.setting(dip),
	.pb_pause(pb_pause),
	.pb_stop(pb_stop),
	.cnt_en(cnt_en),
	.rst_en(cnt_rst)
);

downcounter_tens cnt_sec(
	.cnt(sec),
	.decrease(cnt_en),
	.cout(cout_sec),
	.rst_val(rst_val_sec),
	.def_val({4'd5, 4'd9}),
	.zero(zero_sec),
	.upper_zero(zero_min),
	.clk(clk_cnt),
	.rst(cnt_rst)
);
//assign led[0] = cnt_en;
downcounter_tens cnt_min(
	.cnt(min),
	.decrease(cout_sec),
	.cout(cout_min),
	.rst_val(rst_val_min),
	.def_val({4'd2, 4'd3}),
	.zero(zero_min),
	.upper_zero(1'b1),
	.clk(clk_cnt),
	.rst(cnt_rst)
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

always @*
	if(zero_sec && zero_min)
		led = 16'b1111111111111111;
	else
		led = 16'b0000000000000000;

endmodule
