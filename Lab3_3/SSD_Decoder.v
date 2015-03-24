`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:53:43 03/12/2015 
// Design Name: 
// Module Name:    SSD_Decoder 
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
module SSD_Decoder(
		 D_ssd,
		 i
);

	output reg [14:0]D_ssd;
	input [3:0]i;

always @*
	case(i)
		4'd0: D_ssd=15'b0000_0011_1111_111;
		4'd1: D_ssd=15'b1111_1111_1011_011;
		4'd2: D_ssd=15'b0010_0100_1111_111;
		4'd3: D_ssd=15'b0000_1100_1111_111;
		4'd4: D_ssd=15'b1001_1000_1111_111;
		4'd5: D_ssd=15'b0100_1000_1111_111;
		4'd6: D_ssd=15'b0100_0000_1111_111;
		4'd7: D_ssd=15'b0001_1111_1111_111;
		4'd8: D_ssd=15'b0000_0000_1111_111;
		4'd9: D_ssd=15'b0000_1000_1111_111;
		4'd9: D_ssd=15'b0000_1000_1111_111;
		default: D_ssd=15'b0111_0000_1111_111;
	endcase
endmodule
