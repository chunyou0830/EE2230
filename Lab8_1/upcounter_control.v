`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Chun You, Yang
// Create Date:    19:50 05/09/2015 
// Module Name:    upcounter_control 
//////////////////////////////////////////////////////////////////////////////////
`include "global.v"
`define CNT_START 2'b01
`define CNT_STOP 2'b00
`define CNT_RST 2'b10
module upcounter_control(
	clk,
	rst,
	pb_in,
	cnt_en,
	rst_en
);

	// I/O
	input clk;
	input rst;
	input [1:0] pb_in;
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
				if(pb_in[0])
					state_next = `CNT_START;
				else if(pb_in[1])
					state_next = `CNT_RST;
				else
					state_next = `CNT_STOP;
			end
			`CNT_START:
			begin
				cnt_en = 1'b1;
				rst_en = 1'b0;
				if(pb_in[0])
					state_next = `CNT_STOP;
				else
					state_next = `CNT_START;
			end
			`CNT_RST:
			begin
				cnt_en = 1'b0;
				rst_en = 1'b1;
				state_next = `CNT_STOP;
			end
			default:
				state_next = `CNT_STOP;
		endcase

endmodule
