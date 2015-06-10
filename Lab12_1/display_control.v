`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:28:23 05/05/2015 
// Design Name: 
// Module Name:    display_control 
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
module display_control(
	dip,
	sec,
	min,
	hr,
	day,
	mon,
	year,
	disp
);

	//Defs
	input dip;
	input [7:0] sec, min, hr, day, mon;
	input [15:0] year;
	output reg [95:0] disp;
	
	wire [23:0] hr_12;
	wire [7:0] hr_bin, hr_disp;
	reg [7:0] hr_conv;
	reg [11:0] am_pm;
	
	assign hr_bin = hr[7:4]*4'd10 + hr[3:0];
	
	//24-12 Convert
	always @*
		if(hr=={4'd0,4'd0})
			begin
			am_pm = {`FONT_A,`FONT_M};
			hr_conv = 8'd12;
			end
		else if(hr=={4'd1,4'd2})
			begin
			am_pm = {`FONT_P,`FONT_M};
			hr_conv = 8'd12;
			end
		else if(hr_bin > 4'd12)
			begin
			am_pm = {`FONT_P,`FONT_M};
			hr_conv = hr_bin - 8'd12;
			end
		else
			begin
			am_pm = {`FONT_A,`FONT_M};
			hr_conv = hr_bin;
			end

	BIN_converter_BCD hr_converter(
		.in(hr_conv),
		.units(hr_disp[3:0]),
		.tens(hr_disp[7:4]),
		.hunds()
	);

	always @*
	begin
		if (dip)
		begin
			disp = {2'b00, year[15:12],
					  2'b00, year[11:8],
					  2'b00, year[7:4],
					  2'b00, year[3:0], 
					  2'b00, mon[7:4], 
					  2'b00, mon[3:0], 
					  2'b00, day[7:4], 
					  2'b00, day[3:0], 
					  2'b00, hr_disp[7:4], 
					  2'b00, hr_disp[3:0], 
					  am_pm, 
					  2'b00, min[7:4], 
					  2'b00, min[3:0], 
					  2'b00, sec[7:4], 
					  2'b00, sec[3:0]};
		end
		else
		begin
			disp = {2'b00, year[15:12], 
					  2'b00, year[11:8], 
					  2'b00, year[7:4], 
					  2'b00, year[3:0], 
					  2'b00, mon[7:4], 
					  2'b00, mon[3:0], 
					  2'b00, day[7:4], 
					  2'b00, day[3:0], 
					  2'b00, hr[7:4], 
					  2'b00, hr[3:0], 
					  12'b111111_111111, 
					  2'b00, min[7:4], 
					  2'b00, min[3:0], 
					  2'b00, sec[7:4], 
					  2'b00, sec[3:0]};
		end
	end
endmodule
