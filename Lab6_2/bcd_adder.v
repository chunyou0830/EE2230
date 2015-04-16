`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: NTHUEE
// Engineer: Chun You, Yang
// Create Date: 15:34 04/16/2015 
// Module Name: bcd_adder 
// Project Name: Lab6_2
//////////////////////////////////////////////////////////////////////////////////
module bcd_adder(
	augend,
	addend,
	cin,
	sum,
	cout
);

	input [3:0] augend;
	input [3:0] addend;
	input [3:0] cin;
	
	output reg [3:0] sum;
	output reg [3:0] cout;
	
	reg [4:0] sum_tmp;
	
	always @*
	begin
		sum_tmp = augend + addend + cin;
		if (sum_tmp > 4'd9)
			sum_tmp = sum_tmp + 4'd6;
		else
			sum_tmp = sum_tmp;
	end
endmodule
