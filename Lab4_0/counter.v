`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:48:34 04/01/2015 
// Design Name: 
// Module Name:    counter 
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
	mode,
	in,
	clk,
	q
    );
	 input mode;
	 input in;
	 input clk;
	 output [7:0]q;
	 wire [7:0]send;
	 wire mux;
	 
	 always @*
		if(mode)
			mux=send[0];
		else
			mux=in;
	 
	 dff d7(.d(mux),.clk(clk),.q(send[7]));
	 dff d6(.d(send[7]),.clk(clk),.q(send[6]));
	 dff d5(.d(send[6]),.clk(clk),.q(send[5]));
	 dff d4(.d(send[5]),.clk(clk),.q(send[4]));
	 dff d3(.d(send[4]),.clk(clk),.q(send[3]));
	 dff d2(.d(send[3]),.clk(clk),.q(send[2]));
	 dff d1(.d(send[2]),.clk(clk),.q(send[1]));
	 dff d0(.d(send[1]),.clk(clk),.q(send[0]));
	 
	 always @*
	 q=send;


endmodule
