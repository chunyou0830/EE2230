`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: NTHUEE
// Engineer: Chun You, Yang
// 
// Create Date:    17:23:02 03/05/2015 
// Design Name: 
// Module Name:    HalfAdder 
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
module HalfAdder(
    output s,
    output co,
    input a,
    input b
    );

assign s=a^b;
assign co=a&b;
endmodule
