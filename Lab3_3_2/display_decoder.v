`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:59:11 03/24/2015 
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
module display_decoder(
    input osci,
    input [1:0]clk_scn,
	 input rst_n,
	 output s
    );
	 wire clk_cnt;

freq_div divider(.clk_out(clk_cnt),.clk_ctl(clk_scn),.clk(osci),.rst_n(rst_n));

assign s=clk_cnt;
endmodule
