`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:53:06 04/30/2015 
// Design Name: 
// Module Name:    upcounter_tens 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
`include "global.v"
module upcounter_tens(
	cnt,
	increase,
	cout,
	rst_val,
	def_val,
	clk,
	rst
);

// outputs
output [7:0] cnt; // digit 1 for second
output cout;
reg cout_tmp;
// inputs
input increase;
input [7:0] rst_val;
input [7:0] def_val;
input clk; // global clock signal
input rst; // low active reset

// temporatory nets
reg load_def; // enabled to load second value
wire cout_d0, cout_d1; // BCD counter carryout

// return from 59 to 00
always @* //DEBUGGING
	if (cnt==rst_val)
		begin
		load_def = `ENABLED;
		cout_tmp = `ENABLED;
		end
	else
		begin
		load_def = `DISABLED;
		cout_tmp = `DISABLED;
		end

// counter for digit 0
upcounter_unit dig0(
  .value(cnt[3:0]),  // digit 0 of second
  .carry(cout_d0),  // carry out for digit 0
  .clk(clk),  // clock
  .rst(rst),  // asynchronous low active reset
  .increase(increase),  // always increasing
  .load_default(load_def),  // enable load default value
  .def_value(def_val[3:0]) // default value for counter
);

// counter for digit 1
upcounter_unit dig1(
  .value(cnt[7:4]),  // digit 1 of second
  .carry(cout_d1),  // carry out for digit 1
  .clk(clk),  // clock
  .rst(rst),  // asynchronous low active reset
  .increase(cout_d0),  // increasing when digit 0 carry out
  .load_default(load_def),  // enable load default value
  .def_value(def_val[7:4]) // default value for counter
);

/*one_pulse cout_op(
	.clk(clk),  // clock input
	.rst(rst), //active low reset
	.in_trig(cout_tmp), // input trigger
	.out_pulse(cout) // output one pulse 
);*/
assign cout = cout_tmp;


endmodule
