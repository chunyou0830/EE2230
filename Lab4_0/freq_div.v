`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: NTHUEE
// Engineer: Chun You, Yang
// 
// Create Date:    15:04:24 03/07/2012 
// Design Name: 
// Module Name:    freqdiv24 
// Project Name: Lab 4
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
`define FREQ_DIV_BIT 25 // If old board set to 24, new board 25
module freq_div(
  clk_cnt, //divided clock output
  clk_scn, // divided clock for 14-segment display scan
  clk, // clock from the 40MHz oscillator
  rst_n // low active reset
);

output clk_cnt; //divided clock output
output [1:0] clk_scn; // divided clock for 14-segment display scan
input clk; // clock from the 40MHz oscillator
input rst_n; //low active reset

reg clk_cnt; // divided clock output (in the always block)
reg [1:0] clk_scn; // divided clock for seven-segment display scan (in the always block)
reg [14:0] cnt_l; // temperatory buffer
reg [6:0] cnt_h; // temperatory buffer
reg [`FREQ_DIV_BIT-1:0] cnt_tmp; // input node to flip flops

// Combinational block 
always @*
  cnt_tmp = {clk_cnt,cnt_h,clk_scn,cnt_l} + 1'b1;
  
// Sequential block 
always @(posedge clk or negedge rst_n)
  if (~rst_n)
    {clk_cnt,cnt_h,clk_scn,cnt_l} <= `FREQ_DIV_BIT'b0;
  else
    {clk_cnt,cnt_h,clk_scn,cnt_l} <= cnt_tmp;

endmodule
