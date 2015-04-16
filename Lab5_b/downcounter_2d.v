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
	ftsd_m,
	ftsd_u,
	ftsd_t,
	clk,
	rst_val,
	rst_n
);

	input enable;
	input rst_n;
	input [11:0] rst_val;
	input wire clk;
	reg [3:0] bcd_m ,bcd_u, bcd_t;
	output [14:0] ftsd_m, ftsd_u, ftsd_t;

always @(posedge clk or posedge rst_n)
	if(rst_n)
		{bcd_m, bcd_t, bcd_u} <= rst_val;
	else if(~enable)
		begin
			bcd_t<=bcd_t;
			bcd_u<=bcd_u;
			bcd_m<=bcd_m;
		end
	else if(bcd_m==4'd0 & bcd_t==4'd0 & bcd_u==4'd0)
		begin
			{bcd_m, bcd_u, bcd_t}<={4'd0, 4'd0, 4'd0};
		end
	else if(bcd_t==4'd0 & bcd_u==4'd0)
		begin
			bcd_m<=bcd_m - 1'b1;
			bcd_t<=4'd5;
			bcd_u<=4'd9;
		end
	else if(bcd_u==4'd0)
		begin
			bcd_t<=bcd_t - 1'b1;
			bcd_u<=4'd9;
		end
	else
		bcd_u<=bcd_u - 1'b1;

FTSD_Decoder U(
	.ftsd(ftsd_u),
	.bcd(bcd_u)
);

FTSD_Decoder T(
	.ftsd(ftsd_t),
	.bcd(bcd_t)
);

FTSD_Decoder M(
	.ftsd(ftsd_m),
	.bcd(bcd_m)
);

endmodule
