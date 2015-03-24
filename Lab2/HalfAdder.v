`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: NTHUEE
// Engineer: Chun You, Yang
// 
// Create Date:    17:39:23 03/12/2015 
// Design Name: 
// Module Name:    HalfAdder 
// Project Name: Lab2
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
    input a,
    input b,
    output s,
    output co
    );

assign s=a^b;
assign co=a&b;

endmodule
