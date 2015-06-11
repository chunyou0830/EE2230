`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:50:09 06/11/2015 
// Design Name: 
// Module Name:    input_controll 
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
module input_controll(
	rst,
	key,
	pressed,
	state,
	ID_data,
	disp_input
);

	input rst;
	input [3:0] key;
	input pressed;
	input state;
	output reg [35:0] ID_data;
	output [15:0] disp_input;

	always @(posedge pressed or posedge rst) begin
		if (rst) begin
			ID_data <= 36'd0;
		end
		else if (pressed)
		begin
			ID_data[35:32] <= ID_data[31:28];
			ID_data[31:28] <= ID_data[27:24];
			ID_data[27:24] <= ID_data[23:20];
			ID_data[23:20] <= ID_data[19:16];
			ID_data[19:16] <= ID_data[15:12];
			ID_data[15:12] <= ID_data[11:8];
			ID_data[11:8] <= ID_data[7:4];
			ID_data[7:4] <= ID_data[3:0];
			ID_data[3:0] <= key;
		end
		else
		begin
			ID_data <= ID_data;
		end
	end

	assign disp_input = ID_data[15:0];


endmodule
