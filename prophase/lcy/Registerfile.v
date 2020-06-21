`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/08 11:57:13
// Design Name: 
// Module Name: register_file
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module Registerfile				//32 x WIDTH�Ĵ�����
    #(parameter WIDTH = 32) 	//���ݿ��
    (input clk,						//ʱ�ӣ���������Ч��
    input [4:0] ra0,				//���˿�0��ַ
    output [WIDTH-1:0] rd0, 	//���˿�0����
    input [4:0] ra1, 				//���˿�1��ַ
    output [WIDTH-1:0] rd1, 	//���˿�1����
    input [4:0] ra_debug,       //���Զ��˿ڵ�ַ
    output [WIDTH-1:0] rd_debug,     //���Զ��˿�����
    input [4:0] wa, 				//д�˿ڵ�ַ
    input we,					//дʹ�ܣ��ߵ�ƽ��Ч
    input [WIDTH-1:0] wd 		//д�˿�����
    );
    
    reg [WIDTH-1:0]REG_Files[0:31];
    
    always@(posedge clk )
	begin
		if(we && wa!=0)
		    REG_Files[wa] <= wd;
		else
		    REG_Files[wa] <= REG_Files[wa];
	end
	
	assign  rd0= (ra0 == 0) ? 0 :REG_Files[ra0];
    assign  rd1= (ra1 == 0) ? 0 :REG_Files[ra1];
    assign  rd_debug= (ra_debug == 0) ? 0 :REG_Files[ra_debug];
endmodule

