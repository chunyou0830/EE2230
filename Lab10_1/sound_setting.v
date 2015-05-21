`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Chun You, Yang
// Create Date:    16:20 05/19/2015 
// Module Name:    sound_setting 
//////////////////////////////////////////////////////////////////////////////////
module sound_setting(
	clk,
	clk_cnt,
	rst,
	note_data
);

	input clk, clk_cnt;
	input rst;
	output reg [19:0] note_data;
	reg [6:0] note_choose;

	// Note Control
	always @*
	begin
		if(note_choose[0])			// Do
			note_data = 20'd76628;
		else if (note_choose[1])	// Re
			note_data = 20'd68259;
		else if(note_choose[2])		// Mi
			note_data = 20'd60606;
		else if(note_choose[3])		// Fa
			note_data = 20'd57306;
		else if(note_choose[4])		// Sol
			note_data = 20'd51020;
		else if(note_choose[5])		// La
			note_data = 20'd45454;
		else if(note_choose[6])		// Si
			note_data = 20'd40485;
		else
			note_data = 20'd0;
	end
	
	// Note Choose Shifter
	always @(posedge clk_cnt or posedge rst) begin
		if (rst)
		begin
			note_choose[0]<=1;
			note_choose[6:1]<=6'b000000;
		end
		else
		begin
			note_choose[1]<=note_choose[0];
			note_choose[2]<=note_choose[1];
			note_choose[3]<=note_choose[2];
			note_choose[4]<=note_choose[3];
			note_choose[5]<=note_choose[4];
			note_choose[6]<=note_choose[5];
			note_choose[0]<=note_choose[6];
		end
	end
endmodule
