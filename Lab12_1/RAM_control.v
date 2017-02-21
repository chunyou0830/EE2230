////////////////////////////////////////////////////////////////////////
// Department of Computer Science
// National Tsing Hua University
// Project   : Design Gadgets for Hardware Lab
// Module    : RAM_ctrl
// Author    : Chih-Tsun Huang
// E-mail    : cthuang@cs.nthu.edu.tw
// Revision  : 2
// Date      : 2011/04/13
`include "global.v"
module RAM_control (
    input clk,
    input rst_n,
    input change,
    input en,
    input [95:0] input_data,
    output reg [7:0] data_out,
    output reg data_valid
);

    parameter IDLE  = 2'd0;
    parameter WRITE = 2'd1;
    parameter GETDATA = 2'd2;
    parameter TRANSDATA = 2'd3;

    reg [5:0] addr, addr_next;
    reg [5:0] counter_word, counter_word_next;
    wire [63:0] data_out_64;
    reg [95:0] data_in;
    reg [23:0] trans;
    wire [255:0] mark_1, mark_2, mark_3, mark_4;
    wire [15:0] in_temp1, in_temp2, in_temp3;
	 reg [15:0] in_temp0;
    reg [1:0] cnt, cnt_next;  //count mark row
    reg [511:0] mem, mem_next;
    reg [1:0] state, state_next;
    reg flag, flag_next;
    reg [7:0] data_out_next;
    reg data_valid_next;
    reg wen, wen_next;
    reg temp_change, temp_change_next;
    
    always @*
    begin
        case(cnt)
            2'd0:
            begin
                trans = input_data[95:72];
            end
            2'd1:
            begin
                trans = input_data[71:48];
            end
            2'd2:
            begin
                trans = input_data[47:24];
            end
            2'd3:
            begin
                trans = input_data[23:0];
            end
        endcase
    end

    LCD_decoder lcd_dec_1(
        .bcd(trans[23:18]),
        .mark(mark_1)
    );
    LCD_decoder lcd_dec_2(
        .bcd(trans[17:12]),
        .mark(mark_2)
    );
    LCD_decoder lcd_dec_3(
        .bcd(trans[11:6]),
        .mark(mark_3)
    );
    LCD_decoder lcd_dec_4(
        .bcd(trans[5:0]),
        .mark(mark_4)
    );


	always @*
	begin
	if(cnt == 4'b1)
	in_temp0 = 16'b1111_1111_1111_1111;
	else
	in_temp0 = 16'b0000_0000_0000_0000;
	end
    //assign in_temp0 = 16'b1111_1111_1111_1111/*mark_1[(240-((addr%16)*16))+:16]*/;
    assign in_temp1 = mark_2[(240-((addr%16)*16))+:16];
    assign in_temp2 = mark_3[(240-((addr%16)*16))+:16];
    assign in_temp3 = mark_4[(240-((addr%16)*16))+:16];

    RAM RAM(
        .clka(clk),
        .wea(wen),
        .addra(addr),
        .dina(data_in),
        .douta(data_out_64)
    );

    always @(posedge clk or negedge rst_n)
    begin
        if (!rst_n)
        begin
            addr = 6'd0;
            cnt = 2'd0;
            mem = 512'd0;
            state = IDLE;
            flag = 1'b0;
            counter_word = 6'd0;
            data_out = 8'd0;
            data_valid = 1'd0;
            wen = 1'b1;
            temp_change = 1'b0;
        end
        else
        begin
            addr = addr_next;
            cnt = cnt_next;
            mem = mem_next;
            state = state_next;
            flag = flag_next;
            counter_word = counter_word_next;
            data_out = data_out_next;
            data_valid = data_valid_next;
            wen = wen_next;
            temp_change = temp_change_next;
        end
    end

    always @(*)
    begin
        state_next = state;
        case(state)
            IDLE:
            begin
                if (wen)
                begin
                    state_next = WRITE;
                end
                else
                begin
                    state_next = GETDATA;
                end
            end
            WRITE:
            begin
                if (addr == 6'd63)
                begin
                    state_next = GETDATA;
                end
            end
            GETDATA:
            begin
                if (flag == 1'b1)
                begin
                    state_next = TRANSDATA;
                end
            end
            TRANSDATA:
            begin
                if (addr == 6'd0 && counter_word == 6'd63 && en)
                begin
                    state_next = IDLE;
                end
                else if (counter_word == 6'd63 && en)
                begin
                    state_next = GETDATA;
                end
            end
        endcase
    end

    always @(*)
    begin
        addr_next = addr;
        data_in = 64'd0;
        cnt_next = cnt;
        mem_next = mem;
        flag_next = 1'b0;
        counter_word_next = counter_word;
        data_valid_next = 1'd0;
        data_out_next = 8'd0;
        case(state)
            WRITE:
            begin
                addr_next = addr + 1'b1;
                data_in = {in_temp0, in_temp1, in_temp2, in_temp3};
                if (addr == 6'd15 || addr == 6'd31 || addr == 6'd47 || addr == 6'd63)
                begin
                    cnt_next = cnt + 1'd1;
                end
            end
            GETDATA:
            begin
                if (!flag)
                begin
                    addr_next = addr + 1'b1;
                end
                if ((addr%8) == 6'd7)
                begin
                    flag_next = 1'b1;
                end
                if ((addr%8) >= 6'd1 || flag)
                begin
                    mem_next[(((addr-1)%8)*64)+:64] = data_out_64;
                end
            end
            TRANSDATA:
            begin
                if (en)
                begin
                    counter_word_next = counter_word + 1'b1;
                    data_valid_next = 1'b1;
                    data_out_next = {mem[511 - counter_word],
                                     mem[447 - counter_word],
                                     mem[383 - counter_word],
                                     mem[319 - counter_word],
                                     mem[255 - counter_word],
                                     mem[191 - counter_word],
                                     mem[127 - counter_word],
                                     mem[63 - counter_word]};
                end
            end
        endcase
    end
 
    //wen control
    always @*
    begin
        wen_next = wen;
        temp_change_next = temp_change;
        if (change)
        begin
            temp_change_next = 1'b1;
        end
        if (state == WRITE && addr == 6'd63)
        begin
            wen_next = 1'b0;
        end
        if (state == TRANSDATA && addr == 6'd0 && counter_word == 6'd63 && temp_change == 1'b1)
        begin
            temp_change_next = 1'b0;
            wen_next = 1'b1;
        end
    end
endmodule