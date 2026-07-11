`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.05.2026 09:30:26
// Design Name: 
// Module Name: T_Flip_Flop
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


module T_Flip_Flop(q,qbar,t,clk);
output q,qbar;
input t,clk;
wire [1:0]w;
nand3 G1(w[0],t,qbar,clk);
nand3 G2(w[1],t,q,clk);
nand G3(q,w[0],qbar);
nand G4(qbar,w[1],q);
endmodule

module nand3(y,a,b,c);
output y;
input a,b,c;
assign y=~(a&b&c);
endmodule
