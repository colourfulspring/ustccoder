`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/14 18:05:54
// Design Name: 
// Module Name: DMU
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


module dmu
   #(parameter WIDTH = 32) 	//���ݿ��
   (output reg [WIDTH-1:0] hi, 		//������
   output reg [WIDTH-1:0] lo,
   input [WIDTH-1:0] a,b,		//��������
   input [3:0] m,				//��������
   input en
   );

always @(*)
if(en)
case (m)
   4'b0000:begin        //��
       {hi,lo}=a*b;
       end
   4'b0001:begin       //��
       lo=a/b;
       hi=a-b*lo;
       end
   4'b1000:begin        //�޷��ų�
       {hi,lo}=a*b;
       end
   4'b1001:begin       //�޷��ų�
       lo=a/b;
       hi=a-b*lo;
       end
   default:begin hi=0;lo=0;end  //����
endcase
endmodule
