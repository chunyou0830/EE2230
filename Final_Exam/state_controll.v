`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:49:55 06/11/2015 
// Design Name: 
// Module Name:    state_controll 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
`define STATE_INPUT 1'b1
`define STATE_DISPLAY 1'b0

module state_controll(
	clk,
	rst,
	state,
	state_switch
);

	output reg state;
	input state_switch;
	input clk;
	input rst;
	reg state_next;

	always @*
		case(state)
			`STATE_INPUT:
			begin
				if(state_switch)
				begin
					state_next = `STATE_DISPLAY;
				end
				else
				begin
					state_next = `STATE_INPUT;
				end
			end
			`STATE_DISPLAY:
			begin
				if (state_switch)
				begin
					state_next = `STATE_INPUT;
				end
				else
				begin
					state_next = `STATE_DISPLAY;
				end
			end
			default:
			begin
				state_next = `STATE_INPUT;
			end
		endcase

	always @(posedge clk or posedge rst)
	begin
		if (rst)
		begin
			state <= `STATE_INPUT;
		end
		else
		begin
			state <= state_next;
		end
	end
endmodule
