`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:51:29 03/05/2015 
// Design Name: 
// Module Name:    FBFA_2 
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
module FBFA_2(
input ci;
input [3:0]a;
input [3:0]b;
output [3:0]s;
output co;
    );
wire c1,c2,c3;

FullAdder F0(.co(c1),.s(s[0]),.a(a[0]),.b(b[0]),.ci(ci));
FullAdder F1(.co(c2),.s(s[1]),.a(a[1]),.b(b[1]),.ci(c1));
FullAdder F2(.co(c3),.s(s[2]),.a(a[2]),.b(b[2]),.ci(c2));
FullAdder F3(.co(co),.s(s[3]),.a(a[3]),.b(b[3]),.ci(c3));

endmodule
