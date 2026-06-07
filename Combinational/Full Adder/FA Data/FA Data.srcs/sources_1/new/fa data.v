`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.05.2026 05:47:31
// Design Name: 
// Module Name: fa data
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


module fa_data(output sum,carry,input a,b,c);
assign sum=a^b^c;
assign carry=(a^b)|(b&c)|(c&a);
endmodule
