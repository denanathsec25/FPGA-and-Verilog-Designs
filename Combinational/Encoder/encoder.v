`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.05.2026 17:08:05
// Design Name: 
// Module Name: encoder
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


module encoder(y,d);
output [2:0]y;
input [7:0]d;
assign y[0]=d[1]|d[3]|d[5]|d[7];
assign y[1]=d[2]|d[3]|d[6]|d[7];
assign y[2]=d[4]|d[5]|d[6]|d[7];
endmodule
