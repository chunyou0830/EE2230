`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:51:01 06/13/2015 
// Design Name: 
// Module Name:    RAM_GAME_controll 
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
`define STATE_READ 1'b0
`define STATE_WRITE 1'b1
module RAM_GAME_controll(
	clk,
	pb_in_switch,
	//pb_in_data,
	pb_in_rst,
	dip,
	led,
	col_in,
	row_scn
);

	input clk;
	input pb_in_switch;
	input pb_in_rst;
	wire rst;
	assign rst = ~pb_in_rst;
	input [3:0] col_in;
	output [3:0] row_scn;
	input [3:0] dip;
	output [14:0] led;

	reg state;
	reg state_next;
	
	reg [9:0] data_in;
	wire [9:0] data_out;
	reg [9:0] data;

	wire clk_scn;
	wire pressed;
	wire [3:0] key;
	
frequency_divider freq_div(
	.clk_cnt(),
	.clk_scn(clk_scn),
	.clk(clk),
	.rst(rst)
);

keypad_scan pad_scn(
	.clk(clk_scn),
	.rst(rst),
	.row_scn(row_scn),
	.col_in(col_in),
	.key(key),
	.pressed(pressed)
);

	always @*
	begin
		if(~state)
		begin
			data = data_out;
		end
		case(key)
			4'd0:
				if (pressed && state) begin
					data[0] = ~data[0];
				end
			4'd1:
				if (pressed && state) begin
					data[1] = ~data[1];
				end
			4'd2:
				if (pressed && state) begin
					data[2] = ~data[2];
				end
			4'd3:
				if (pressed && state) begin
					data[3] = ~data[3];
				end
			4'd4:
				if (pressed && state) begin
					data[4] = ~data[4];
				end
			4'd5:
				if (pressed && state) begin
					data[5] = ~data[5];
				end
			4'd6:
				if (pressed && state) begin
					data[6] = ~data[6];
				end
			4'd7:
				if (pressed && state) begin
					data[7] = ~data[7];
				end
			4'd8:
				if (pressed && state) begin
					data[8] = ~data[8];
				end
			4'd9:
				if (pressed && state) begin
					data[9] = ~data[9];
				end
		endcase
	end

	always @*
	begin
		case(state)
			`STATE_READ:
				if(~pb_in_switch)
					state_next = `STATE_WRITE;
				else
					state_next = `STATE_READ;
			`STATE_WRITE:
				if(~pb_in_switch)
					state_next = `STATE_READ;
				else
					state_next = `STATE_WRITE;
		endcase
	end

	always @(posedge clk or posedge rst)
	begin
		if (rst)
		begin
			state <= `STATE_READ;
		end
		else
		begin
			state <= state_next;
		end
	end

	assign led = {dip,state,data_out};

    RAM_GAME RAM(
        .clka(clk),
        .wea(state),
        .addra(dip),
        .dina(data),
        .douta(data_out)
    );


endmodule

