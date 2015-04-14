`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company		: NTHUEE
// Engineer		: Chun You, Yang
// Create Date	: 17:53 03/12/2015
// Module Name	: FTSD_decoder 
// Project Name	: Lab6_0
//////////////////////////////////////////////////////////////////////////////////
`include "global.v"
module FTSD_decoder(
	ftsd,
	bcd
);

	output reg [14:0]ftsd;
	input [3:0]bcd;

always @*
	case(bcd)
		4'd0: ftsd=`FTSD_ZERO;
		4'd1: ftsd=`FTSD_ONE;
		4'd2: ftsd=`FTSD_TWO;
		4'd3: ftsd=`FTSD_THREE;
		4'd4: ftsd=`FTSD_FOUR;
		4'd5: ftsd=`FTSD_FIVE;
		4'd6: ftsd=`FTSD_SIX;
		4'd7: ftsd=`FTSD_SEVEN;
		4'd8: ftsd=`FTSD_EIGHT;
		4'd9: ftsd=`FTSD_NINE;
		4'd10: ftsd=`FTSD_A;
		4'd11: ftsd=`FTSD_B;
		4'd12: ftsd=`FTSD_C;
		4'd13: ftsd=`FTSD_D;
		4'd14: ftsd=`FTSD_E;
		4'd15: ftsd=`FTSD_F;
		default: ftsd=`FTSD_DEFAULT;
	endcase

endmodule
