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
	led,
	hours_switch
);

	//Basic input and operators
	input clk;
	input pb_in_rst;
	wire rst;
	assign rst = ~pb_in_rst;
	
	//Counters
	wire clk_1hz, clk_100hz, clk_fst;
	wire carry_sec, carry_min, carry_hr, carry_day, carry_mon;
	
	//Clock
	wire [7:0] sec, min, hr, day, mon;
	wire [15:0] year;
	reg [7:0] day_rst_val;
	input hours_switch;
	
	//Display I/Os
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


always @*
if(mon=={4'd0,4'd1}|mon=={4'd0,4'd3}|mon=={4'd0,4'd5}|mon=={4'd0,4'd7}|mon=={4'd0,4'd8}|mon=={4'd1,4'd0}|mon=={4'd1,4'd2})
	day_rst_val={4'd3,4'd2};
else if(mon=={4'd0,4'd4}|mon=={4'd0,4'd6}|mon=={4'd0,4'd9}|mon=={4'd1,4'd1})
	day_rst_val={4'd3,4'd1};
else if(mon=={4'd0,4'd2})
	day_rst_val={4'd2,4'd9};
else
	day_rst_val={4'd3,4'd1};

FTSD_decoder ftsd_dec_A(
	.bcd(year[15:12]),
	.ftsd(dispA)
);

FTSD_decoder ftsd_dec_B(
	.bcd(year[11:8]),
	.ftsd(dispB)
);

FTSD_decoder ftsd_dec_C(
	.bcd(year[7:4]),
	.ftsd(dispC)
);

FTSD_decoder ftsd_dec_D(
	.bcd(year[3:0]),
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
