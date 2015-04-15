`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company		: NTHUEE
// Engineer		: Chun You, Yang
// Create Date	: 17:53 04/09/2015 
// Module Name	: fsm 
// Project Name	: Lab5_b
//////////////////////////////////////////////////////////////////////////////////
`include "global.v"
`define STAT_60 1'b1
`define STAT_30 1'b0 
`define RST_VAL_60 8'b0101_0000
`define RST_VAL_30 8'b0010_0000

module rst_fsm(
	rst_value,
	in,
	rst_n,
	clk,
);

	reg [7:0] rst_next;
	output reg [7:0] rst_value;
	input in;
	input rst_n;
	input clk;
	
	reg state;
	reg next_state;
	
	always @*
		case(state)
		`STAT_60:
			if(in)
				begin
				next_state = `STAT_30;
				rst_next = {4'd3,4'd0};//`RST_VAL_30;
				end
			else
				begin
				next_state = `STAT_60;
				rst_next = {4'd6,4'd0};//`RST_VAL_60;
				end
		`STAT_30:
			if(in)
				begin
				next_state = `STAT_60;
				rst_next = {4'd6,4'd0};//`RST_VAL_60;
				end
			else
				begin
				next_state = `STAT_30;
				rst_next = {4'd3,4'd0};//`RST_VAL_30;
				end
		default:
				begin
				next_state = `STAT_30;
				rst_next = {4'd3,4'd0};//`RST_VAL_30;
				end
		endcase
			
			
	always @(posedge clk or negedge rst_n)
		if(~rst_n)
		begin
			state <= `STAT_30;
			rst_value <= {4'd3,4'd0};
		end
		else
		begin
			state <= next_state;
			rst_value <= rst_next;
		end

endmodule
