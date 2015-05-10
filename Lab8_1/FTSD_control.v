`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Chun You, Yang
// Create Date:    19:50 05/09/2015 
// Module Name:    FTSD_control 
//////////////////////////////////////////////////////////////////////////////////
`include "global.v"
`define DISP_REAL 1'b0
`define DISP_LAP 1'b1
module FTSD_control(
	clk,
	rst,
	pb_in,
	cnt_in,
	min_in,
	sec_in,
	display
);

	// Basic I/O
	input clk;
	input rst;
	input pb_in;
	input cnt_in;

	//Display
	input [7:0] min_in, sec_in;
	output reg [15:0] display;
	reg display_next;
	reg state, state_next;

	// FSM for state switching
	always @(posedge clk or posedge rst)
		if(rst)
			state = `DISP_REAL;
		else
			state = state_next;

	always @*
		case(state)
			`DISP_LAP:
				if(pb_in && cnt_in)
					state_next = `DISP_REAL;
				else
					state_next = `DISP_LAP;
			`DISP_REAL:
				if(pb_in && cnt_in)
					state_next = `DISP_LAP;
				else
					state_next = `DISP_REAL;
			default:
				state_next = `DISP_REAL;
		endcase

	// MUX for choosing
	always @*
		if(state == `DISP_REAL)
			display = {min_in, sec_in};
		else
			display = display;

endmodule
