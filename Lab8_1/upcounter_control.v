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
	state
);

	// I/O
	input clk;
	input rst;
	input [1:0] pb_in;
	output reg [1:0] state;

	reg [1:0] state_next;

	always @(posedge clk or posedge rst)
		if(rst)
			state = `CNT_START;
		else
			state = state_next;

	always @*
		case(state)
			`CNT_STOP:
				if(pb_in[0])
					state_next = `CNT_START;
				else if(pb_in[1])
					state_next = `CNT_RST;
				else
					state_next = `CNT_STOP;
			`CNT_START:
				if(pb_in[0])
					state_next = `CNT_STOP;
				else
					state_next = `CNT_START;
			`CNT_RST:
				state_next = `CNT_STOP;
			default:
				state_next = `CNT_START;
		endcase

endmodule
