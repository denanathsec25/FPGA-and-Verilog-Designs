`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.05.2026 21:41:08
// Design Name: 
// Module Name: Multiplier
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


module multiplier(p,a,b);
output [2:0]p;
input [1:0]a,b;
assign p[0]=b[0]&b[1];
assign p[1]=(a[0]&b[1])|(a[1]&b[0]);
assign p[2]=a[1]&a[0];
endmodule