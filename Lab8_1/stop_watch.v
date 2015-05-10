`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Chun You, Yang
// Create Date:    18:50 05/09/2015 
// Module Name:    stop_watch 
//////////////////////////////////////////////////////////////////////////////////
module stop_watch(
	clk,
	pb_in_rst,
	pb_in,
	display,
	led
);

	//Clocks
	input clk;
	wire clk_cnt;
	wire [1:0] clk_scn;
	
	//Action Controlling
	input pb_in_rst;
	wire rst;
	input [1:0] pb_in;
	wire pb_op_pause, pb_op_lap;
	wire [1:0] pause;
	wire lap;
	assign rst=~pb_in_rst;
	
	//Counting
	wire [7:0] min, sec;
	wire cout_sec, cout_min;
	
	//Display
	output [18:0] display;
	wire [3:0] numA, numB, numC, numD;
	wire [14:0] dispA, dispB, dispC, dispD;
	output [15:0] led;
	
	assign led[0] = lap;
	assign led[1] = pause[0];
	assign led[2]= pause[1];
	//assign led[3] = pb_op_lap;
	//assign led[4] = pb_in[0];
	//assign led[5] = pb_in[1];
	
frequency_divider freq_div(
	.clk_cnt(clk_cnt),
	.clk_scn(clk_scn),
	.clk(clk),
	.rst(rst)
);

upcounter_tens cnt_sec(
	.cnt(sec),
	.increase(pause[0]),
	.cout(cout_sec),
	.rst_val({4'd5, 4'd9}),
	.def_val({4'd0, 4'd0}),
	.clk(clk_cnt),
	.rst(pause[1])
);

upcounter_tens cnt_min(
	.cnt(min),
	.increase(cout_sec),
	.cout(cout_min),
	.rst_val({4'd5, 4'd9}),
	.def_val({4'd0, 4'd0}),
	.clk(clk_cnt),
	.rst(pause[1])
);

push_button pb_pause(
	.clk(clk_scn[0]),
	.rst(rst),
	.pb_in(pb_in[0]),
	.pb_out(pb_op_pause),
	.debounced()
);

push_button pb_lap(
	.clk(clk_scn[0]),
	.rst(rst),
	.pb_in(pb_in[1]),
	.pb_out(pb_op_lap),
	.debounced()
);

upcounter_control cnt_ctl(
	.clk(clk_scn[0]),
	.rst(rst),
	.pb_in({pb_op_lap,pb_op_pause}),
	.state(pause)
);

FTSD_control ftsd_ctl(
	.clk(clk_scn[0]),
	.rst(rst),
	.pb_in(pb_op_lap),
	.cnt_in(pause[0]),
	.min_in(min),
	.sec_in(sec),
	.display({numA, numB, numC, numD})
);

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
