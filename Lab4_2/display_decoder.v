`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:53:58 03/24/2015 
// Design Name: 
// Module Name:    display_decoder 
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
module scan_ctl(
	display,
	clk,
	rst_n,
	SSDa,
	SSDb,
	SSDc,
	SSDd
    );
	
	//Defs
	input rst_n;
	input [1:0]clk;
	//Displays
	output reg [18:0] display;
	input [14:0]SSDa, SSDb, SSDc, SSDd;

//Display
always @*
	case(clk)
		2'b00: display={4'b0111,SSDa};
		2'b01: display={4'b1011,SSDb};
		2'b10: display={4'b1101,SSDc};
		2'b11: display={4'b1110,SSDd};
		default: display={19'b1111_1111_1111_1111_111};
	endcase

endmodule
