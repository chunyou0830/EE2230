`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:53:58 03/24/2015 
// Design Name: 
// Module Name:    display_decoder 
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
module display_decoder(
bcd_u,
bcd_t,
display,
oscillator,
clk_scn,
//clk_cnt,
//clk_add,
rst_n
    );
//Defs
	 input rst_n;
	 //Displays
	 input wire [14:0] bcd_u;
	 input wire [14:0] bcd_t;
	 output reg [18:0] display;
	 //Clocks
	 input oscillator;
	 input [1:0] clk_scn;
	 wire clk_cnt;
	 wire clk_add;
	 
//Module Connection
	freq_div divider(.clk_cnt(clk_cnt),.clk_scn(clk_scn),.clk(oscillator),.rst_n(rst_n));
	bcd_counter bcd_0(.fsd(bcd_u),.clk(clk_cnt),.clk_add(clk_add),.rst_n(rst_n));
	bcd_counter bcd_1(.fsd(bcd_t),.clk(clk_add),.rst_n(rst_n));

//Decode
always @*
	case(clk_scn)
		2'b00: display={4'b1110,bcd_u};
		2'b01: display={4'b1101,bcd_t};
		2'b10: display={4'b1110,bcd_u};
		2'b11: display={4'b1101,bcd_t};
	endcase

endmodule
