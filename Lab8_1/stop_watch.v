`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Chun You, Yang
// Create Date:    18:50 05/09/2015 
// Module Name:    stop_watch 
//////////////////////////////////////////////////////////////////////////////////
module stop_watch(
	clk,
	pb_rst,
	pb_in,
	display,
	led
);

	//Clocks
	input clk;
	wire clk_cnt;
	wire [1:0] clk_scn;
	
	//Action Controlling
	input pb_rst;
	wire rst;
	input [1:0] pb_in;
	wire pb_pause, pb_lap;
	wire cnt_pause, cnt_lap, cnt_rst;
	assign rst=~pb_rst;
	
	//Counting
	wire [7:0] min, sec;
	wire cout_sec, cout_min;
	
	//Display
	output [18:0] display;
	wire [3:0] numA, numB, numC, numD;
	wire [14:0] dispA, dispB, dispC, dispD;
	output [15:0] led;
	
	//assign led[0] = lap;
	//assign led[1] = pause[0];
	//assign led[2]= pause[1];
	//assign led[3] = pb_op_lap;
	//assign led[4] = pb_in[0];
	//assign led[5] = pb_in[1];
	
	// Frequency
	frequency_divider freq_div(
		.clk_cnt(clk_cnt),
		.clk_scn(clk_scn),
		.clk(clk),
		.rst(rst)
	);

	// Control

	push_button cnt_pause_pb(
		.clk(clk_scn[0]),
		.rst(rst),
		.pb_in(pb_in[0]),
		.pb_out(pb_pause),
		.debounced()
	);

	push_button cnt_lap_pb(
		.clk(clk_scn[0]),
		.rst(rst),
		.pb_in(pb_in[1]),
		.pb_out(pb_lap),
		.debounced()
	);

	upcounter_control cnt_pause_ctl(
		.clk(clk_scn[0]),
		.rst(rst),
		.pb_in({pb_lap,pb_pause}),
		.cnt_en(cnt_pause),
		.rst_en(cnt_rst)
	);

	upcounter_lap cnt_lap_ctl(
		.clk(clk_scn[0]),
		.rst(rst),
		.pb_in(pb_lap),
		.cnt_in(cnt_pause),
		.min_in(min),
		.sec_in(sec),
		.display({numA, numB, numC, numD})
	);

	// Counters

	upcounter_tens cnt_sec(
		.cnt(sec),
		.increase(cnt_pause),
		.cout(cout_sec),
		.rst_val({4'd5, 4'd9}),
		.def_val({4'd0, 4'd0}),
		.clk(clk_cnt),
		.rst(cnt_rst)
	);

	upcounter_tens cnt_min(
		.cnt(min),
		.increase(cout_sec),
		.cout(cout_min),
		.rst_val({4'd5, 4'd9}),
		.def_val({4'd0, 4'd0}),
		.clk(clk_cnt),
		.rst(cnt_rst)
	);

	// Display

	FTSD_decoder ftsd_dec_A(
		.bcd({2'b00,numA}),
		.ftsd(dispA)
	);

	FTSD_decoder ftsd_dec_B(
		.bcd({2'b00,numB}),
		.ftsd(dispB)
	);

	FTSD_decoder ftsd_dec_C(
		.bcd({2'b00,numC}),
		.ftsd(dispC)
	);

	FTSD_decoder ftsd_dec_D(
		.bcd({2'b00,numD}),
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
