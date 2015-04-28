`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Chun You, Yang
// Create Date:    19:55 04/28/2015 
// Module Name:    num_calculator 
//////////////////////////////////////////////////////////////////////////////////
`include "global.v"
module num_calculator(
	numA,
	numB,
	calculation,
	equal,
	sign
);

	input [7:0] numA, numB;
	input [1:0] calculation;
	
	output reg [7:0] equal;
	output reg [14:0] sign;
	
	wire [7:0] binA, binB;
	
	assign binA = numA[7:4]*4'd10 + numA[3:0];
	assign binB = numB[7:4]*4'd10 + numB[3:0];
	
	always @*
		if(calculation == `CALC_ADD)
			begin
			equal = binA + binB;
			sign = 15'b1111_1111_1111_111;
			end
		else if(calculation == `CALC_SUB & binA < binB)
			begin
			equal = ~(binA - binB - 1'b1);
			sign = 15'b1111_1100_1111_111;
			end
		else if(calculation == `CALC_SUB & binA >= binB)
			begin
			equal = binA - binB;
			sign = 15'b1111_1111_1111_111;
			end
		else if(calculation == `CALC_MULTI)
			begin
			equal = binA * binB;
			sign = 15'b1111_1111_1111_111;
			end

endmodule
