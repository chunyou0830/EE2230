`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: NTHUEE
// Engineer: Chun You, Yang
// 
// Create Date:    16:27:47 04/02/2015 
// Design Name: 
// Module Name:    shifter 
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
module shifter(
	q,
	clk,
	rst_n,
	in
    );
	output reg [3:0]q;
	reg [5:0]p;
	input [5:0]in;
	input clk;
	input rst_n;
	
	always @(posedge clk or negedge rst_n)
		if(~rst_n)
			begin
				p<=in;
			end
		else
			begin
				p[0]<=p[5];
				p[1]<=p[0];
				p[2]<=p[1];
				p[3]<=p[2];
				p[4]<=p[3];
				p[5]<=p[4];
			end
	
	always @*
		q={p[5],p[4],p[3],p[2]};
endmodule
