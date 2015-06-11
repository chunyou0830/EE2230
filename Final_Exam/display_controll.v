`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:50:46 06/11/2015 
// Design Name: 
// Module Name:    display_controll 
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
module display_controll(
	disp_effect,
	disp_input,
	led_input,
	display,
	led,
	state
);

	input [15:0] disp_effect, disp_input;
	input [15:0] led_input;
	input state;
	output reg [15:0] display;
	output reg [15:0] led;

	always @*
	begin
		if (state)
		begin
			display = disp_input;
			led = 16'd0;
		end
		else
		begin
			display = disp_effect;
			led = led_input;
		end
	end


endmodule
