`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: NTHUEE
// Engineer: Chun You, Yang
// 
// Create Date:    15:21:56 03/17/2015 
// Design Name: 
// Module Name:    bin_up_counter 
// Project Name: Lab3_0
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
module bin_up_counter(
	 bcd,
	 orig_clk,
	 rst_n
    );
output reg [3:0] bcd;
input orig_clk;
input rst_n;
wire clk;
//reg [3:0] bcd_tmp;

freq_div CLK(.clk_out(clk),.clk(orig_clk),.rst_n(rst_n));

//always @*
//	bcd_tmp = bcd + 1'b1;

always @(posedge clk or negedge rst_n)
	if(~rst_n) bcd<=4'b0000;
	else if(bcd>=4'd9) bcd<=4'b0000;
	else bcd<=bcd + 1'b1;


endmodule
