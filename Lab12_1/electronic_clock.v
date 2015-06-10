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
	LCD_rst,
	LCD_cs,
	LCD_rw,
	LCD_di,
	LCD_data,
	LCD_en
);

	//Basic input and operators
	input clk;
	input pb_in_rst;
	input [2:0] dip;
	wire rst;
	assign rst = ~pb_in_rst;
	wire clk_div;
	
	//Counters
	wire clk_1hz, clk_100hz, clk_fst;
	wire carry_sec, carry_min, carry_hr, carry_day, carry_mon;
	wire [95:0] count_data;
	
	//Clock
	wire [7:0] sec, min, hr, day, mon;
	wire [15:0] year;
	wire [7:0] day_rst_val;
	
	//RAM Operations
	wire en;
	wire out_valid;
	wire [7:0] ram_data_out;

	//LCD Display I/Os
	output LCD_rst;
	output [1:0] LCD_cs;
	output LCD_rw;
	output LCD_di;
	output [7:0] LCD_data;
	output LCD_en;


	//Module Connection

clock_generator clk_gen(
	.clk(clk),
	.rst(rst),
	.clk_1(clk_1hz),
	.clk_100(clk_100hz)
);

  clock_divider #(
    .half_cycle(200),         // half cycle = 200 (divided by 400)
    .counter_width(8)         // counter width = 8 bits
  ) clk100K (
    .rst_n(pb_in_rst),
    .clk(clk),
    .clk_div(clk_div)
  );

frequency_divider freq_div(
	.dip(dip[1:0]),
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
	.dip(dip[2]),
	.sec(sec),
	.min(min),
	.hr(hr),
	.day(day),
	.mon(mon),
	.year(year),
	.disp(count_data)
);

RAM_control RAM_ctrl (
    .clk(clk_div),
    .rst_n(pb_in_rst),
    .change(1'b1),
    .en(en),
    .input_data(count_data),
    .data_out(ram_data_out),
    .data_valid(out_valid)
);

LCD_control LCD_ctrl (
    .clk(clk_div),
    .rst_n(pb_in_rst),
    .data(ram_data_out),           // memory value  
    .data_valid(out_valid),    // if data_valid = 1 the data is valid
    .LCD_di(LCD_di),
    .LCD_rw(LCD_rw),
    .LCD_en(LCD_en),
    .LCD_rst(LCD_rst),
    .LCD_cs(LCD_cs),
    .LCD_data(LCD_data),
    .en_tran(en)
);
endmodule
