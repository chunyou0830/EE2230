`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Chun You, Yang
// Create Date:    17:53 04/30/2015 
// Module Name:    downcounter_tens 
//////////////////////////////////////////////////////////////////////////////////
`include "global.v"
module downcounter_tens(
	cnt,
	decrease,
	cout,
	rst_val,
	def_val,
	zero,
	upper_zero,
	clk,
	rst
);

// outputs
output [7:0] cnt; // digit 1 for second
output reg cout;
output reg zero;
// inputs
input decrease;
input [7:0] rst_val; //Counter starting value
input [7:0] def_val; //Counter counting value
input upper_zero;
input clk; // global clock signal
input rst; // low active reset

// temporatory nets
reg load_def; // enabled to load second value
reg keep_cnt;
wire cout_d0, cout_d1; // BCD counter carryout

// return from 00 to 59
always @* //DEBUGGING
	if(cnt=={4'd0, 4'd0} && upper_zero)
	begin
		load_def = `DISABLED;
		cout = `DISABLED;
		keep_cnt = `DISABLED;
	end
	else if (cnt=={4'd0, 4'd0} && decrease)
		begin
		load_def = `ENABLED;
		cout = `ENABLED;
		keep_cnt = `ENABLED;
		end
	else
		begin
		load_def = `DISABLED;
		cout = `DISABLED;
		keep_cnt = `ENABLED;
		end

// counter for digit 0
downcounter_unit dig0(
  .value(cnt[3:0]),  // digit 0 of second
  .carry(cout_d0),  // carry out for digit 0
  .clk(clk),  // clock
  .rst(rst),  // asynchronous low active reset
  .decrease(decrease && keep_cnt),  // always increasing
  .load_default(load_def),  // enable load default value
  .def_value(def_val[3:0]), // default value for counter
  .rst_value(rst_val[3:0])
);

// counter for digit 1
downcounter_unit dig1(
  .value(cnt[7:4]),  // digit 1 of second
  .carry(cout_d1),  // carry out for digit 1
  .clk(clk),  // clock
  .rst(rst),  // asynchronous low active reset
  .decrease(cout_d0),  // increasing when digit 0 carry out
  .load_default(load_def),  // enable load default value
  .def_value(def_val[7:4]), // default value for counter
  .rst_value(rst_val[7:4])
);

always @*
	if(cnt=={4'd0, 4'd0})
		zero = 1'b1;
	else
		zero = 1'b0;


endmodule
