`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer		: Chun You, Yang
// Create Date	: 17:53 03/12/2015
// Module Name	: LCD_decoder 
//////////////////////////////////////////////////////////////////////////////////
`include "global.v"
module LCD_decoder(
	bcd,
	mark
);

	output reg [255:0]mark;
	input [5:0]bcd;

	always @*
		case(bcd)
			`FONT_ZERO: mark=`LCD_0;
			`FONT_ONE: mark=`LCD_1;
			`FONT_TWO: mark=`LCD_2;
			`FONT_THREE: mark=`LCD_3;
			`FONT_FOUR: mark=`LCD_4;
			`FONT_FIVE: mark=`LCD_5;
			`FONT_SIX: mark=`LCD_6;
			`FONT_SEVEN: mark=`LCD_7;
			`FONT_EIGHT: mark=`LCD_8;
			`FONT_NINE: mark=`LCD_9;
			`FONT_A: mark=`LCD_A;
			`FONT_B: mark=`LCD_B;
			`FONT_C: mark=`LCD_C;
			`FONT_D: mark=`LCD_D;
			`FONT_E: mark=`LCD_E;
			`FONT_F: mark=`LCD_F;
			`FONT_G: mark=`LCD_G;
			`FONT_H: mark=`LCD_H;
			`FONT_I: mark=`LCD_I;
			`FONT_J: mark=`LCD_J;
			`FONT_K: mark=`LCD_K;
			`FONT_L: mark=`LCD_L;
			`FONT_M: mark=`LCD_M;
			`FONT_N: mark=`LCD_N;
			`FONT_O: mark=`LCD_O;
			`FONT_P: mark=`LCD_P;
			/*`FONT_Q: mark=`LCD_Q;
			`FONT_R: mark=`LCD_R;
			`FONT_S: mark=`LCD_S;
			`FONT_T: mark=`LCD_T;
			`FONT_U: mark=`LCD_U;
			`FONT_V: mark=`LCD_V;
			`FONT_W: mark=`LCD_W;
			`FONT_X: mark=`LCD_X;
			`FONT_Y: mark=`LCD_Y;
			`FONT_Z: mark=`LCD_Z;*/
			default: mark=`LCD_NONE;
		endcase

endmodule
