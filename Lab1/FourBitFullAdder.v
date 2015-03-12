`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: NTHUEE
// Engineer: Chun You, Yang
// 
// Create Date:    17:39:28 03/05/2015 
// Design Name: 
// Module Name:    FourBitFullAdder 
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
module FourBitFullAdder(
    input a0,
    input a1,
    input a2,
    input a3,
    input b0,
    input b1,
    input b2,
    input b3,
    input ci,
    output s0,
    output s1,
    output s2,
    output s3,
    output co
    );

wire c1,c2,c3;

FullAdder F0(.co(c1),.s(s0),.a(a0),.b(b0),.ci(ci));
FullAdder F1(.co(c2),.s(s1),.a(a1),.b(b1),.ci(c1));
FullAdder F2(.co(c3),.s(s2),.a(a2),.b(b2),.ci(c2));
FullAdder F3(.co(co),.s(s3),.a(a3),.b(b3),.ci(c3));

endmodule
