`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Chun You, Yang
// Create Date:    18:19 04/23/2015
// Module Name:    FTSD_control 
//////////////////////////////////////////////////////////////////////////////////
module FTSD_control(
	state,
	rst,
	numA_FTSD,
	numB_FTSD,
	sign_FTSD,
	result_FTSD,
	dispA,
	dispB,
	dispC,
	dispD
);

	//Basic Input
	input state;
	input rst;
	
	//Numbers Input
	input [29:0] numA_FTSD, numB_FTSD;
	input [44:0] result_FTSD;
	input [14:0] sign_FTSD;
	
	//Display Output
	output reg [14:0] dispA, dispB, dispC, dispD;
	
	always @*
	if(~state)
		{dispA,dispB,dispC,dispD} = {numA_FTSD,numB_FTSD};
	else
		{dispA,dispB,dispC,dispD} = {sign_FTSD,result_FTSD};


endmodule
