`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company		: NTHUEE
// Engineer		: Chun You, Yang
// Create Date	: 17:40 03/12/2015 
// Module Name	: full_adder 
// Project Name	: Lab6_2
//////////////////////////////////////////////////////////////////////////////////
module full_adder(
	a,
	b,
	cin,
	s,
	cout
);
	input a,
	input b,
	input cin,
	output s,
	output cout
		 
	wire t0,t1,t2;

	half_adder H0(.s(t0),.co(t1),.a(a),.b(b));
	half_adder H1(.s(s),.co(t2),.a(t0),.b(cin));

	assign cout=t1|t2;

endmodule
