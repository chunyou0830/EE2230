`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:49:09 04/01/2015 
// Design Name: 
// Module Name:    dff 
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
module dff(
	d,
	clk,
	q
    );
	 input d;
	 input clk;
	 output q;
	 
	 always @(posedge clk)
		if(clk==1)
			q<=d;
		else
			q<=q;
		
endmodule
