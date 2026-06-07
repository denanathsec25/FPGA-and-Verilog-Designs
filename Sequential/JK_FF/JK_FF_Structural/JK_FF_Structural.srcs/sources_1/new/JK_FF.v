`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.05.2026 12:15:16
// Design Name: 
// Module Name: JK_FF
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


module JK_FF(q,qbar,j,k,clk);
output q,qbar;
input j,k,clk;
wire [1:0]w;
nand3 G1(w[0],j,qbar,clk);
nand3 G2(w[1],k,q,clk);
nand G3(q,w[0],qbar);
nand G4(qbar,w[1],q);
endmodule

module nand3(y,a,b,c);
output y;
input a,b,c;
assign y=~(a&b&c);
endmodule
