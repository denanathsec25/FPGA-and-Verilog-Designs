`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.05.2026 06:03:21
// Design Name: 
// Module Name: bcd_adder
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
module BCD(s,c,a,b,cin);
output [3:0]s;
output c;
input [3:0]a,b;
input cin;
wire [7:1]w;
adder G1(w[4:1],w[7],a[3:0],b[3:0],cin);
and G2(w[5],w[3],w[2]);
and G3(w[6],w[3],w[1]);
or3 G4(c,w[5],w[6],w[7]);
adder G5(.s(s[3:0]),.cout(),.a(w[4:1]),.b({1'b0,c,c,1'b0}),.cin(1'b0));
endmodule

//RCA
module adder(s,cout,a,b,cin);
output [3:0]s;
output cout;
input [3:0]a,b;
input cin;
wire [0:2]c;
fa FA1(s[0],c[0],a[0],b[0],cin);
fa FA2(s[1],c[1],a[1],b[1],c[0]);
fa FA3(s[2],c[2],a[2],b[2],c[1]);
fa FA4(s[3],cout,a[3],b[3],c[2]);
endmodule

//Full adder
module fa(Sum,Carry,a,b,c);
output Sum,Carry;
input a,b,c;
assign Sum=a^b^c;
assign Carry=(a&b)|(b&c)|(c&a);
endmodule

//OR
module or3(y,a,b,c);
output y;
input a,b,c;
assign y=a|b|c;
endmodule