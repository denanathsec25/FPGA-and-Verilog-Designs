`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.05.2026 05:28:57
// Design Name: 
// Module Name: adder_and_sub
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


module adder_and_sub(s,cout,a,b,d);
output [3:0]s;
output cout;
input [3:0]a,b;
input d;
wire [3:0]w;
wire [2:0]c;
xor x1(w[0],d,b[0]);
xor x2(w[1],d,b[1]);
xor x3(w[2],d,b[2]);
xor x4(w[3],d,b[3]);
fa FA1(s[0],c[0],a[0],w[0],d);
fa FA2(s[1],c[1],a[1],w[1],c[0]);
fa FA3(s[2],c[2],a[2],w[2],c[1]);
fa FA4(s[3],cout,a[3],w[3],c[2]);
endmodule

module fa(Sum,Carry,a,b,c);
input a,b,c;
output Sum,Carry;
assign Sum=a^b^c;
assign Carry=(a&b)|(b&c)|(c&a);
endmodule