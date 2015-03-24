`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:06:02 03/24/2015 
// Design Name: 
// Module Name:    bcd_counter_u 
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
module bcd_counter(
	 fsd,
	 //bcd,
	 clk,
	 clk_add,
	 rst_n
    );
	 output reg clk_add;
	 output [14:0]fsd;
	 reg [3:0] bcd;
	 input wire clk;
	 input rst_n;

always @(posedge clk or negedge rst_n)
	if(~rst_n) bcd<=4'b0000;
	else if(bcd>=4'd9)
		begin
			bcd<=4'b0000;
			clk_add<=1;
		end
	else
		begin
			bcd<=bcd + 1'b1;
			clk_add<=0;
		end

//always @*
SSD_Decoder decode(.D_ssd(fsd),.i(bcd));

endmodule
