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
//	in,
	q,
	clk,
	rst_n
    );
	output reg [7:0]q;
//	input in;
	input clk;
	input rst_n;
	
	always @(posedge clk or negedge rst_n)
		if(~rst_n)
			begin
				q<=8'b01010101;
			end
		else
			begin
				q[0]<=q[7];
				q[1]<=q[0];
				q[2]<=q[1];
				q[3]<=q[2];
				q[4]<=q[3];
				q[5]<=q[4];
				q[6]<=q[5];
				q[7]<=q[6];
			end
			
endmodule
