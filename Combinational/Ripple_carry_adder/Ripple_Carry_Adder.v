`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.05.2026 22:05:42
// Design Name: 
// Module Name: ripple_carry_adder
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


module ripple_carry_adder(S,Cout,a,b,Cin);
output [3:0]S;
output Cout;
input [3:0]a,b;
input Cin;
wire [2:0]C;
fa FA1(S[0],C[0],a[0],b[0],Cin);
fa FA2(S[1],C[1],a[1],b[1],C[0]);
fa FA3(S[2],C[2],a[2],b[2],C[1]);
fa FA4(S[3],Cout,a[3],b[3],C[2]);
endmodule

module fa(Sum,Carry,a,b,c);
output Sum,Carry;
input a,b,c;
assign Sum=a^b^c;
assign Carry=(a&b)|(b&c)|(c&a);
endmodule
