`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:12:39 05/05/2015 
// Design Name: 
// Module Name:    date_setting 
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
`include "global.v"
module date_setting(
	mon,
	year,
	day_rst_val
);

	//Defs
	input [7:0] mon;
	input [15:0] year;
	output reg [7:0] day_rst_val;
	
	wire [11:0] year_bin;
	reg leap_year;
	
	assign year_bin = year[15:12]*11'd1000 + year[11:8]*11'd100 + year[7:4]*11'd10 + year[3:0];
	
	always @*
		if(year_bin[1:0] == 2'b00)
			leap_year = 1'b1;
		else
			leap_year = 1'b0;
	
	always @*
		if(mon=={4'd0,4'd1}|mon=={4'd0,4'd3}|mon=={4'd0,4'd5}|mon=={4'd0,4'd7}|mon=={4'd0,4'd8}|mon=={4'd1,4'd0}|mon=={4'd1,4'd2})
			day_rst_val={4'd3,4'd2};
		else if(mon=={4'd0,4'd4}|mon=={4'd0,4'd6}|mon=={4'd0,4'd9}|mon=={4'd1,4'd1})
			day_rst_val={4'd3,4'd1};
		else if(mon=={4'd0,4'd2} && leap_year)
			day_rst_val={4'd3,4'd0};
		else if(mon=={4'd0,4'd2} && ~leap_year)
			day_rst_val={4'd2,4'd9};
		else
			day_rst_val={4'd3,4'd1};


endmodule
