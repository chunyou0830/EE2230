`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company		: NTHUEE
// Engineer		: Chun You, Yang
// Create Date	: 17:39 03/12/2015 
// Module Name	: half_adder 
// Project Name	: Lab6_2
//////////////////////////////////////////////////////////////////////////////////
module half_adder(
    input a,
    input b,
    output s,
    output co
    );

assign s=a^b;
assign co=a&b;

endmodule
