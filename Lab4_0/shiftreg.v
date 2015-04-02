`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:27:26 04/02/2015 
// Design Name: 
// Module Name:    shiftreg 
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
module shiftreg(
	q,
	clk,
//	in,
	rst_n
    );
	output [7:0]q;
	input clk;
//	input in;
	input rst_n;
	
	wire clk_div;
	wire [7:0]q;
	
	freq_div F(
		.clk_cnt(clk_div),
		.clk(clk),
		.rst_n(rst_n)
	);
	
	shifter S(
//		.in(in),
		.q(q),
		.clk(clk_div),
		.rst_n(rst_n)
	);

endmodule
