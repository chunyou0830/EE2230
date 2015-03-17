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
	 q,
	 clk,
	 rst_n
    );
output [3:0] q;
input clk;
input rst_n;
reg [3:0] q;
reg [3:0] q_tmp;

always @*
	q_tmp = q + 1'b1;
	
always @(posedge clk or negedge rst_n)
	if(~rst_n) q<=4'b0000;
	else q<=q_tmp;


endmodule
