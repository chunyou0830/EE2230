`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Chun You, Yang
// Create Date:    16:32 05/14/2015 
// Module Name:    speaker 
//////////////////////////////////////////////////////////////////////////////////
module speaker(
	clk,
	pb_in_rst,
	audio_appsel,
	audio_sysclk,
	audio_bck,
	audio_ws,
	audio_data
);

	input clk;
	input pb_in_rst;
	output audio_appsel;
	output audio_sysclk;
	output audio_bck;
	output audio_ws;
	output audio_data;

	wire rst;
	wire [15:0] audio_in_left, audio_in_right;

	assign rst = ~pb_in_rst;

	buzzer_control buz_ctl(
		.clk(clk),
		.rst(rst),
		.note_div(20'd76628),
		.audio_left(audio_in_left),
		.audio_right(audio_in_right)
	);

	speaker_control spk_ctl(
		.clk(clk),
		.rst(rst),
		.audio_in_left(audio_in_left),
		.audio_in_right(audio_in_right),
		.audio_appsel(audio_appsel),
		.audio_sysclk(audio_sysclk),
		.audio_bck(audio_bck),
		.audio_ws(audio_ws),
		.audio_data(audio_data)
	);

endmodule
