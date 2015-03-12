`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: NTHUEE
// Engineer: Chun You, Yang
// 
// Create Date:    18:10:50 03/05/2015 
// Design Name: 
// Module Name:    Decoder 
// Project Name: Lab1
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
module Decoder(
    input en,
    input [1:0]in,
    output [3:0]d
    );

assign d[3]=en&in[0]&in[1];
assign d[2]=en&~in[0]&in[1];
assign d[1]=en&in[0]&~in[1];
assign d[0]=en&~in[0]&~in[1];

endmodule
