`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: NTHUEE
// Engineer: Chun You, Yang
// Create Date: 16:02:14 04/16/2015 
// Module Name: num_input_fsm 
// Project Name: Lab6_2
//////////////////////////////////////////////////////////////////////////////////
`include "global.v"
`define STAT_AUGEND 1'b0
`define STAT_ADDEND 1'b1
module num_input_fsm(
	in,
	pad_pressed,
	plus,
	clk,
	rst_n,
	augend,
	addend,
	state
);
	input [3:0] in;
	input pad_pressed;
	input plus;
	input clk;
	input rst_n;
	output reg [3:0] augend;
	output reg [3:0] addend;
	
	output reg state;
	reg state_next;

always @*
	case(state)
	1'b0:
		begin
		if(plus)
			begin
			state_next = `STAT_ADDEND;
			end
		else
			begin
			state_next = `STAT_AUGEND;
			end
		if(~rst_n)
			begin
			addend = 4'd0;
			augend = 4'd0;
			end
		else if(pad_pressed)
			begin
			augend = in;
			addend = addend;
			end
		else
			begin
			addend = addend;
			augend = augend;
			end
		end
	1'b1:
		begin
		if(plus)
			state_next = `STAT_AUGEND;
		else
			state_next = `STAT_ADDEND;
		if (~rst_n)
			begin
			addend = 4'd0;
			augend = 4'd0;
			end
		else if(pad_pressed)
			begin
			augend = augend;
			addend = in;
			end
		else
			begin
			augend = augend;
			addend = addend;
			end
		end
	default:
			begin
			state_next = `STAT_AUGEND;
			end
	endcase
			

always @(posedge clk or negedge rst_n)
	if(~rst_n)
		state <= 1'b0;
	else
		state <= state_next;
		
endmodule
