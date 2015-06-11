`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:50:36 06/11/2015 
// Design Name: 
// Module Name:    display_effect 
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
module display_effect(
	clk,
	clk_cnt,
	rst,
	state,
	ID_data,
	disp_effect,
	led
);

	input clk;
	input clk_cnt;
	reg clk_use;
	input rst;
	input state;
	input [35:0] ID_data;
	reg [35:0] ID_display;
	output [15:0] disp_effect;
	output reg [15:0] led;
	reg [3:0] temp;
	reg [7:0] led_data;

	always @*
	begin
		if (state)
		begin
			clk_use = clk;
		end
		else
		begin
			clk_use = clk_cnt;
		end
	end

	always @(posedge clk_use or posedge rst) begin
		if (rst) begin
			ID_display <= 36'd0;
		end
		else if(state)
		begin
			ID_display <= ID_data;
			led_data <= ID_data[7:0];
			led[7:0] = 8'b0000_0000;
			led[15:8] = 8'b0000_0000;
		end
		else if(~state)
		begin
			temp <= ID_display[35:32];
			ID_display[35:32] <= ID_display[31:28];
			ID_display[31:28] <= ID_display[27:24];
			ID_display[27:24] <= ID_display[23:20];
			ID_display[23:20] <= ID_display[19:16];
			ID_display[19:16] <= ID_display[15:12];
			ID_display[15:12] <= ID_display[11:8];
			ID_display[11:8] <= ID_display[7:4];
			ID_display[7:4] <= ID_display[3:0];
			ID_display[3:0] <= ID_display[35:32];
			led[7:0] = led_data;
			led[15:8] = 8'b0000_0000;
		end
	end

	assign disp_effect = ID_display[15:0];
endmodule
