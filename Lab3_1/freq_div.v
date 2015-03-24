`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:22:59 03/19/2015 
// Design Name: 
// Module Name:    freq_div 
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
`define FREQ_DIV_BIT 25
module freq_div(
 clk_out, // divided clock output
 clk, // global clock input
 rst_n // active low reset
);
output clk_out;
input clk;
input rst_n;
reg clk_out;
reg [`FREQ_DIV_BIT-2:0] cnt;
reg [`FREQ_DIV_BIT-1:0] cnt_tmp;

always @(clk_out or cnt)
	cnt_tmp = {clk_out,cnt} + 1'b1;

always @(posedge clk or negedge rst_n)
	if (~rst_n)
		{clk_out, cnt}<=`FREQ_DIV_BIT'd0;
	else
		{clk_out,cnt}<=cnt_tmp;

endmodule
