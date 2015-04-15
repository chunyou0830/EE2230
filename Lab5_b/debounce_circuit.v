`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company      : NTHUEE
// Engineer     : Chun You, Yang
// Create Date  : 10:52 03/28/2012
// Module Name  : debounce_circuit 
// Project Name : Lab5_2
//////////////////////////////////////////////////////////////////////////////////
`include "global.v"
module debounce(
	clk,
	rst_n,
	pb_in,
	pb_debounced
);

// declare the I/Os
input clk;
input rst_n;
input pb_in;
output reg pb_debounced;

// declare the internal nodes
reg [3:0] debounce_window; // shift register flip flop
reg pb_debounced_next; // debounce result

// Shift register
always @(posedge clk or negedge rst_n)
if (~rst_n)
debounce_window <= 4'd0;
else
debounce_window <= {debounce_window[2:0],~pb_in}; 

// debounce circuit
always @*
if (debounce_window == 4'b1111) 
pb_debounced_next = 1'b1;
else
pb_debounced_next = 1'b0;

always @(posedge clk or negedge rst_n)
if (~rst_n)
pb_debounced <= 1'b0;
else
pb_debounced <= pb_debounced_next;

endmodule
