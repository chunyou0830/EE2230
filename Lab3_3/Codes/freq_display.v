`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:08:02 03/19/2015 
// Design Name: 
// Module Name:    bcd_cnt 
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
module bcd_cnt(
    output [3:0]bcd,
    input clk,
	 input rst_n
    );
reg [3:0]bcd_tmp;

freq_div(.clk_out(clk));

always @*
	bcd_tmp = bcd + 1'b;
	
always @(posedge clk or negedge rst_n)
	if(~rst_n)
		bcd <= 4'b0000;
	else
		bcd <= bcd_tmp;
	
endmodule
