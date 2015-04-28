`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Chun You, Yang
// Create Date:    17:40 04/23/2015 
// Module Name:    keypad_FSM 
//////////////////////////////////////////////////////////////////////////////////
`include "global.v"
`define STAT_numA 2'b10
`define STAT_numB 2'b11
`define STAT_result 2'b01
`define STAT_reset 2'b00
`define DISP_INPUT 1'b0;
`define DISP_RESULT 1'b1
module keypad_FSM(
	clk,
	rst,
	key,
	pressed,
	numA,
	numB,
	state,
	state_disp,
	calculation
);

	//Basic input
	input clk;
	input rst;
	
	//Keypad input
	input [3:0] key;
	input pressed;
	
	//Numbers and Calculation
	output reg [7:0] numA;
	output reg [7:0] numB;
	output reg [1:0] calculation;
	
	//FSM State
	output reg [1:0] state;
	reg [1:0] state_next;
	
	//Display
	output reg state_disp;

	always @(posedge pressed)
		case(state)
		`STAT_numA:
			begin
			if(key == `KEY_F)
				begin
				state_next = `STAT_numA;
				state_disp = `DISP_INPUT;
				calculation = `CALC_RST;
				numA <= 8'd0; numB <= 8'd0;
				end
			else if(key==`KEY_A)
				begin
				state_next = `STAT_numB;
				state_disp = `DISP_INPUT;
				calculation = `CALC_ADD;
				end
			else if(key==`KEY_D)
				begin
				state_next = `STAT_numB;
				state_disp = `DISP_INPUT;
				calculation = `CALC_SUB;
				end
			else if(key==`KEY_B)
				begin
				state_next = `STAT_numB;
				state_disp = `DISP_INPUT;
				calculation = `CALC_MULTI;
				end
			else
				begin
				state_next = `STAT_numA;
				state_disp = `DISP_INPUT;
				numA[7:4] <= numA[3:0]; numA[3:0] <= key; numB <= numB;
				end
			end
			
		`STAT_numB:
			begin
			if(key == `KEY_F)
				begin
				calculation = `CALC_RST;
				state_next = `STAT_numA;
				state_disp = `DISP_INPUT;
				numA <= 8'd0; numB <= 8'd0;
				end
			else if(key==`KEY_E)
				begin
				state_next = `STAT_result;
				state_disp = `DISP_RESULT;
				end
			else
				begin
				state_next = `STAT_numB;
				state_disp = `DISP_INPUT;
				numB[7:4] <= numB[3:0]; numB[3:0] <= key; numA <= numA;
				end
			end
			
			`STAT_result:
				begin
				if(key == `KEY_F)
					begin
					calculation = `CALC_RST;
					state_next = `STAT_numA;
					state_disp = `DISP_INPUT;
					numA <= 8'd0; numB <= 8'd0;
					end
				else
					begin
					state_next = `STAT_result;
					state_disp = `DISP_RESULT;
					end
				end
			
			`STAT_reset:
				begin
				state_next = `STAT_numA;
				end				
			
			default:
				begin
				state_next = `STAT_numA;
				end
			endcase
			
	always @(posedge clk or posedge rst)
		if(rst)
			state <= `STAT_numA;
		else
			state <= state_next;

endmodule
