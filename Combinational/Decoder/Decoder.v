`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.06.2026 05:37:17
// Design Name: 
// Module Name: Decoder
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


module Decoder(y,a);
input [2:0]a;
output [7:0]y;
assign y[0]=~a[0] & ~a[1] & ~a[2];
assign y[1]=a[0] & ~a[1] & ~a[2];
assign y[2]=~a[0] & a[1] & ~a[2];
assign y[3]=a[0] & a[1] & ~a[2];
assign y[4]=~a[0] & ~a[1] & a[2];
assign y[5]=a[0] & ~a[1] & a[2];
assign y[6]=~a[0] & a[1] & a[2];
assign y[7]=a[0] & a[1] & a[2];
endmodule
