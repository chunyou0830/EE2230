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
module counter(
	enable,
	 fsd_u,
	 fsd_t,
	 clk,
	 led,
	 rst_n
    );
	 input enable;
	 output [14:0]fsd_u;
	 output [14:0]fsd_t;
	 output reg [15:0]led;
	 reg [3:0] bcd_u;
	 reg [3:0] bcd_t;
	 input wire clk;
	 input rst_n;

always @(posedge clk or negedge rst_n)
	if(~rst_n)
		begin
			bcd_u<=4'd0;
			bcd_t<=4'd3;
			led<=16'b0000000000000000;
		end
	else if(bcd_t==4'd0 & bcd_u==4'd0)
		begin
			bcd_u<=4'd0;
			bcd_t<=4'd0;
			led<=16'b1111111111111111;
		end
	else if(bcd_u==4'd0)
		begin
			bcd_u<=4'd9;
			bcd_t<=bcd_t - 1'b1;
		end
	else if(~enable)
		begin
		bcd_u<=bcd_u;
		led<=16'b0000000000000000;
		end
	else
		begin
		bcd_u<=bcd_u - 1'b1;
		led<=16'b0000000000000000;
		end
SSD_Decoder U(.D_ssd(fsd_u),.i(bcd_u));
SSD_Decoder T(.D_ssd(fsd_t),.i(bcd_t));

endmodule
