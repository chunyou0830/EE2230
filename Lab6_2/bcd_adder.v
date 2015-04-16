`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:31:11 04/16/2015 
// Design Name: 
// Module Name:    bcd_adder 
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
module bcd_adder(
	addend,
	augend,
	sum,
	cout
);
	input [3:0] addend, augend;
	output [3:0] sum, cout;
	
	reg [7:0] sum_tmp;
	
	always @*
	begin
		sum_tmp = addend + augend;
		if(sum_tmp > 4'd9)
			sum_tmp = sum_tmp + 4'd6;
	end
	
	assign {cout, sum} = sum_tmp;

endmodule
