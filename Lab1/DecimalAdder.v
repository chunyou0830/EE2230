`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: NTHUEE
// Engineer: Chun You, Yang
// 
// Create Date:    14:36:28 03/09/2015 
// Design Name: 
// Module Name:    DecimalAdder 
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
module DecimalAdder(
    input [3:0]a,
    input [3:0]b,
    input ci,
    output [3:0]s,
    output co
    );

wire c;
wire [3:0]z;

FourBitAdder D1(.ci(ci),.a(a),.b(b),.co(c),.s(z));

assign co=c|z[3]&z[2]|z[3]&z[1];

FourBitAdder D2(.a(z),.b({1'b0,co,co,1'b0}),.s(s),.ci(1'b0));

endmodule
