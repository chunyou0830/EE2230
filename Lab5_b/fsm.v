`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company		: NTHUEE
// Engineer		: Chun You, Yang
// Create Date	: 16:19 04/09/2015 
// Module Name	: fsm 
// Project Name	: Lab5_2
//////////////////////////////////////////////////////////////////////////////////
`include "global.v"
module fsm(
	count_enable,
	in,
	rst_n,
	clk
);

	output reg count_enable;
	input in;
	input rst_n;
	input clk;
	
	reg state;
	reg next_state;
	
	always @*
		case(state)
		1'b0:
			if(~in)
				begin
				next_state = `STAT_COUNT;
				count_enable = `CNT_EN;
				end
			else
				begin
				next_state = `STAT_PAUSE;
				count_enable = `CNT_DIS;
				end
		1'b1:
			if(~in)
				begin
				next_state = `STAT_PAUSE;
				count_enable = `CNT_DIS;
				end
			else
				begin
				next_state = `STAT_COUNT;
				count_enable = `CNT_EN;
				end
		default:
			if(~in)
				begin
				next_state = `STAT_PAUSE;
				count_enable = `CNT_DIS;
				end
			else
				begin
				next_state = `STAT_COUNT;
				count_enable = `CNT_EN;
				end
		endcase
			
			
	always @(posedge clk or negedge rst_n)
		if(~rst_n)
			state <= 1'b1;
		else
			state <= next_state;

endmodule
