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
display,
oscillator,
rst_n
    );
//Defs
	 input rst_n;
	 wire clk_out;
	 //Displays
	 wire [14:0] fsd_u;
	 wire [14:0] fsd_t;
	 output reg [18:0] display;
	 //Clocks
	 input oscillator;
	 wire [1:0] clk_scn;
	 wire clk_cnt;
	 wire clk_add;
	 
//Module Connection
	freq_div divider(.clk_cnt(clk_cnt),.clk_scn(clk_scn),.clk(oscillator),.rst_n(rst_n));
	counter fsd_0(.fsd(fsd_u),.clk(clk_cnt),.clk_add(clk_add),.rst_n(rst_n));
	counter fsd_1(.fsd(fsd_t),.clk(clk_add),.rst_n(rst_n));

//Display
always @*
	case(clk_scn)
		2'b00: display={4'b1110,fsd_u};
		2'b01: display={4'b1101,fsd_t};
		2'b10: display={4'b1110,fsd_u};
		2'b11: display={4'b1101,fsd_t};
		default: display={19'b0000_0000_0000_0000_000};
	endcase

endmodule
