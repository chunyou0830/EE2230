`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:58:48 04/02/2015 
// Design Name: 
// Module Name:    display 
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
module display(
	clk,
	rst_n,
	display
    );
	 
	input clk;
	input rst_n;
	output [18:0]display;

	wire [1:0]clk_scn;
	wire clk_shift;
	wire [14:0]SSDa, SSDb, SSDc, SSDd;
	
	freq_div divider(
		.clk_cnt(clk_shift),
		.clk_scn(clk_scn),
		.clk(clk),
		.rst_n(rst_n)
	);
	
	scan_ctl scan(
		.display(display),
		.clk(clk_scn),
		.rst_n(rst_n),
		.SSDa(SSDa),
		.SSDb(SSDb),
		.SSDc(SSDc),
		.SSDd(SSDd)
    );
	 
	shifter S14(.q({SSDa[14],SSDb[14],SSDc[14],SSDd[14]}),.clk(clk_shift),.rst_n(rst_n),.in(6'b111100));
	shifter S13(.q({SSDa[13],SSDb[13],SSDc[13],SSDd[13]}),.clk(clk_shift),.rst_n(rst_n),.in(6'b110011));
	shifter S12(.q({SSDa[12],SSDb[12],SSDc[12],SSDd[12]}),.clk(clk_shift),.rst_n(rst_n),.in(6'b010011));
	shifter S11(.q({SSDa[11],SSDb[11],SSDc[11],SSDd[11]}),.clk(clk_shift),.rst_n(rst_n),.in(6'b101000));
	shifter S10(.q({SSDa[10],SSDb[10],SSDc[10],SSDd[10]}),.clk(clk_shift),.rst_n(rst_n),.in(6'b000000));
	shifter S9(.q({SSDa[9],SSDb[9],SSDc[9],SSDd[9]}),.clk(clk_shift),.rst_n(rst_n),.in(6'b100000));
	shifter S8(.q({SSDa[8],SSDb[8],SSDc[8],SSDd[8]}),.clk(clk_shift),.rst_n(rst_n),.in(6'b000100));
	shifter S7(.q({SSDa[7],SSDb[7],SSDc[7],SSDd[7]}),.clk(clk_shift),.rst_n(rst_n),.in(6'b000100));
	shifter S6(.q({SSDa[6],SSDb[6],SSDc[6],SSDd[6]}),.clk(clk_shift),.rst_n(rst_n),.in(6'b111111));
	shifter S5(.q({SSDa[5],SSDb[5],SSDc[5],SSDd[5]}),.clk(clk_shift),.rst_n(rst_n),.in(6'b111111));
	shifter S4(.q({SSDa[4],SSDb[4],SSDc[4],SSDd[4]}),.clk(clk_shift),.rst_n(rst_n),.in(6'b111111));
	shifter S3(.q({SSDa[3],SSDb[3],SSDc[3],SSDd[3]}),.clk(clk_shift),.rst_n(rst_n),.in(6'b111111));
	shifter S2(.q({SSDa[2],SSDb[2],SSDc[2],SSDd[2]}),.clk(clk_shift),.rst_n(rst_n),.in(6'b111111));
	shifter S1(.q({SSDa[1],SSDb[1],SSDc[1],SSDd[1]}),.clk(clk_shift),.rst_n(rst_n),.in(6'b111111));
	shifter S0(.q({SSDa[0],SSDb[0],SSDc[0],SSDd[0]}),.clk(clk_shift),.rst_n(rst_n),.in(6'b111111));

endmodule
