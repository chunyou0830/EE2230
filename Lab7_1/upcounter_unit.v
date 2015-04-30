`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Chun You, Yang
// Create Date:    17:36 04/30/2015
// Module Name:    upcounter_unit 
//////////////////////////////////////////////////////////////////////////////////
`include "global.v"
module upcounter_unit(
value, //counter value
carry, // carry out to enable counting in next stage
clk, //global clock
rst, // active low reset
increase, // enable control of the counter
load_default, // enable to load default value
def_value // default value
);

// outputs
output [`BCD_BIT_WIDTH-1:0] value;  // counter value
output carry;  // carry out to enable counting for next stag
// inputs
input clk;  // global clock
input rst;  // active low reset
input load_default;  // enable to load default value
input increase;  // enable control of the counter 
input [`BCD_BIT_WIDTH-1:0] def_value;  // counter upper limit

reg [`BCD_BIT_WIDTH-1:0] value; // output (in always block)
reg [`BCD_BIT_WIDTH-1:0] value_tmp; // input to dff (in always block)
reg carry; // carry out indicator for counter to next stage 

// combinational part for BCD counter 
always @*
  if (increase==`DISABLED)
    value_tmp = value;
  else if (load_default==`ENABLED)
    value_tmp = def_value;
  else if ((increase==`ENABLED)&&(value==`BCD_NINE))
    value_tmp = `BCD_ZERO;
  else
    value_tmp = value + `INCREMENT;

always @*
  if ((increase==`ENABLED)&&(value == `BCD_NINE))
    carry = `ENABLED;
  else
    carry = `DISABLED;

// register part for BCD counter
always @(posedge clk or posedge rst)
  if (rst) value <= def_value;
  else value <= value_tmp;

endmodule
