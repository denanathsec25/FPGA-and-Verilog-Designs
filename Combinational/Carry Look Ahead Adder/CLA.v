`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.05.2026 07:28:34
// Design Name: 
// Module Name: CLA
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


module CLA(c,S,a,b,Cin);
output [2:0]c,S;
input [2:0]a,b;
input Cin;
wire [2:0]G,P;
G G0(G[0],a[0],b[0]);
P G1(P[0],a[0],b[0]);
G G2(G[1],a[1],b[1]);
P G3(P[1],a[1],b[1]);
G G4(G[2],a[2],b[2]);
P G5(P[2],a[2],b[2]);
assign c[0]=G[0]|(P[0]&Cin);
assign c[1]=G[1]|P[1]&G[0]|P[1]&P[0]&Cin;
assign c[2]=G[2]|P[2]&G[1]|P[2]&P[1]&G[0]|P[0]&P[1]&P[2]&Cin;
assign S[0]= P[0]^Cin;
assign S[1]=P[1]^c[0];
assign S[2]= P[2]^c[1];
endmodule

module G(output y,input a,b);
assign y=a&b;
endmodule

module P(output y,input a,b);
xor G1(y,a,b);
endmodule
