`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Chun You, Yang
// Create Date:    12:59 05/14/2015 
// Module Name:    downcounter_control 
//////////////////////////////////////////////////////////////////////////////////
`include "global.v"
`define CNT_START 2'b01
`define CNT_PAUSE 2'b00
`define CNT_STOP 2'b10
`define CNT_RST 2'b11
module downcounter_control(
	clk,
	rst,
	setting,
	pb_pause,
	pb_stop,
	cnt_en,
	rst_en
);

	// I/O
	input clk;
	input rst;
	input setting, pb_pause, pb_stop;
	output reg cnt_en;
	output reg rst_en;
	reg [1:0] state;
	reg [1:0] state_next;

	always @(posedge clk or posedge rst)
		if(rst)
			state = `CNT_STOP;
		else
			state = state_next;

	always @*
		case(state)
			`CNT_STOP:
			begin
				cnt_en = 1'b0;
				rst_en = 1'b0;
				state_next = `CNT_RST;
			end
			`CNT_START:
			begin
				cnt_en = 1'b1;
				rst_en = 1'b0;
				if(setting)
					state_next = `CNT_RST;
				else if(pb_pause)
					state_next = `CNT_PAUSE;
				else if(pb_stop)
					state_next = `CNT_STOP;
				else
					state_next = `CNT_START;
			end
			`CNT_PAUSE:
			begin
				cnt_en = 1'b0;
				rst_en = 1'b0;
				if(setting)
					state_next = `CNT_RST;
				else if(pb_pause)
					state_next = `CNT_START;
				else if(pb_stop)
					state_next = `CNT_STOP;
				else
					state_next = `CNT_PAUSE;
			end
			`CNT_RST:
			begin
				cnt_en = 1'b0;
				rst_en = 1'b1;
				if(setting)
					state_next = `CNT_RST;
				else
					state_next = `CNT_PAUSE;
			end
			default:
				state_next = `CNT_STOP;
		endcase
endmodule
