`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:40:23 03/12/2015 
// Design Name: 
// Module Name:    FullAdder 
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
module FullAdder(
    input a,
    input b,
    input cin,
    output s,
    output cout
    );
	 
wire t0,t1,t2;

HalfAdder H0(.s(t0),.co(t1),.a(a),.b(b));
HalfAdder H1(.s(s),.co(t2),.a(t0),.b(cin));

assign cout=t1|t2;

endmodule
