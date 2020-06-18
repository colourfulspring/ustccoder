`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/14 17:35:00
// Design Name: 
// Module Name: ALUT
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


module alut
   #(parameter WIDTH = 32) 	//���ݿ��
   (output reg [WIDTH-1:0] y, 		//������
   output reg zf, 					//���־
   output reg cf, 					//��λ/��λ��־
   output reg of, 					//�����־
   input [WIDTH-1:0] a,b,		//��������
   input [3:0] m				//��������
   );

always @(*)
case (m)
   4'b0000:begin        //��
       {cf,y}=a+b;
       of = (~a[WIDTH-1] & ~b[WIDTH-1] & y[WIDTH-1]) | (a[WIDTH-1] & b[WIDTH-1] & ~y[WIDTH-1]);
       zf = ~| y;
       end
   4'b0001:begin       //��
       {cf,y}=a-b;
       of = (~a[WIDTH-1] & b[WIDTH-1] & y[WIDTH-1]) | (a[WIDTH-1] & ~b[WIDTH-1] & ~y[WIDTH-1]) ;
       zf = ~| y;
       end
   4'b0010:begin y=a&b;cf=0;zf=0;of=0;end //��
   4'b0011:begin y=a|b;cf=0;zf=0;of=0;end //��
   4'b0100:begin y=a^b;cf=0;zf=0;of=0;end //���
   4'b0101:begin y=~(a|b);cf=0;zf=0;of=0;end //���
   4'b0110:begin y=b<<a;cf=0;zf=0;of=0;end //����
   4'b0111:begin y=b>>a;cf=0;zf=0;of=0;end //����
   4'b1010:begin y=(a<b)?1:0;cf=0;zf=0;of=0;end  //С������һ
   4'b1110:begin y=(a>b)?1:0;cf=0;zf=0;of=0;end  //��������һ
   4'b1011:begin y=(a<b)?1:0;cf=0;zf=0;of=0;end  //�޷���С������һ
   4'b1000:begin        //�޷��ż�
       {cf,y}=a+b;
       of = 0;
       zf = 0;
       end
   4'b1001:begin       //�޷��ż�
       {cf,y}=a-b;
       of = 0;
       zf = ~| y;
       end
   default:begin y=0;cf=0;zf=0;of=0;end  //����
endcase
endmodule
