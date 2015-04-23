`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company		: NTHUEE
// Engineer		: Chun You, Yang
// Create Date	: 14:06 03/24/2015
// Module Name	: downcounter_2d 
// Project Name	: Lab5_2
//////////////////////////////////////////////////////////////////////////////////
`include "global.v"
module downcounter_2d(
	enable,
	ftsd_u,
	ftsd_t,
	led,
	clk,
	rst_n
);

	input enable;
	input rst_n;
	input wire clk;
	reg [3:0] bcd_u, bcd_t;
	output [14:0] ftsd_u, ftsd_t;
	output reg [15:0] led;

always @(posedge clk or posedge rst_n)
	if(rst_n)
		begin
		{bcd_u, bcd_t}<={4'd0, 4'd3};
		led<=16'b0000_0000_0000_0000;
		end
	else if(~enable)
		bcd_u<=bcd_u;
	else if(bcd_t==4'd0 & bcd_u==4'd0)
		begin
		{bcd_u, bcd_t}<={4'd0, 4'd0};
		led<=16'b1111_1111_1111_1111;
		end
	else if(bcd_u==4'd0)
		begin
			bcd_u<=4'd9;
			bcd_t<=bcd_t - 1'b1;
			led<=16'b0000_0000_0000_0000;
		end
	else
		begin
		bcd_u<=bcd_u - 1'b1;
		led<=16'b0000_0000_0000_0000;
		end

FTSD_Decoder U(
	.ftsd(ftsd_u),
	.bcd(bcd_u)
);

FTSD_Decoder T(
	.ftsd(ftsd_t),
	.bcd(bcd_t)
);

endmodule
