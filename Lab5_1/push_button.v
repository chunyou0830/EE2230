`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:38:53 04/12/2015 
// Design Name: 
// Module Name:    push_button 
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
module push_button(
	clk,
	rst_n,
	pb_in,
	pb_out,
	debounced
);

	//Defs
	input clk;
	input rst_n;
	input pb_in;
	output pb_out;
	output reg debounced;
	
	wire deb_to_op;
	
	//Module Connection
debounce PB_1(
	.clk(clk),
	.rst_n(rst_n),
	.pb_in(pb_in),
	.pb_debounced(deb_to_op)
);

one_pulse PB_2(
	.clk(clk),
	.rst_n(rst_n),
	.in_trig(debounced),
	.out_pulse(pb_out)
);

always@*
	debounced=deb_to_op;

endmodule
