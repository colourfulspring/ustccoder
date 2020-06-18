`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/16 15:08:39
// Design Name: 
// Module Name: RF1
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


module register_file1				//32 x WIDTH�Ĵ�����
#(parameter WIDTH = 32) 	//���ݿ��
(input clk,						//ʱ�ӣ���������Ч��
input [4:0] ra0,				//���˿�0��ַ
output [WIDTH-1:0] rd0, 	//���˿�0����
input [4:0] ra1, 				//���˿�1��ַ
output [WIDTH-1:0] rd1, 	//���˿�1����
input [4:0] wa, 				//д�˿ڵ�ַ
input we,					//дʹ�ܣ��ߵ�ƽ��Ч
input [WIDTH-1:0] wd, 		//д�˿�����
input alr,
input [WIDTH-1:0] pc
);
reg [WIDTH-1:0] r [31:0];
integer i=0;

  initial
  for(i=0;i<32;i=i+1)
  r[i]=0;//��ʼ���üĴ������������ݶ�Ϊ0
  always @(posedge clk)
  begin
  if(we==1&&wa!=0) r[wa]<=wd;//ͬ��д��
  if(alr) r[31]<=pc+4;
  end
  //���д���ַ��Ϊ0��дʹ�ܣ���д�����ݣ�
  //�Ӷ���֤0��ַ������ʼ��Ϊ0�����ı�
  assign rd1=(ra1==wa)?wd:r[ra1];
  assign rd0=(ra0==wa)?wd:r[ra0];//�첽���
endmodule
