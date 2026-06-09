`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.05.2026 19:17:43
// Design Name: 
// Module Name: 3bit_up_counter
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


module bit_up_counter(q,clk);
output [3:1]q;
input clk;
Master_Slave G1(.q(q[1]),.qbar(),.j(1'b1),.k(1'b1),.clk(clk));
Master_Slave G2(.q(q[2]),.qbar(),.j(1'b1),.k(1'b1),.clk(q[1]));
Master_Slave G3(.q(q[3]),.qbar(),.j(1'b1),.k(1'b1),.clk(q[2]));
endmodule


module Master_Slave(q,qbar,j,k,clk);
output q,qbar;
input j,k,clk;
wire [6:0]w;
nand3 G1(w[0],j,qbar,clk);
nand3 G2(w[1],k,q,clk);
nand G3(w[2],w[0],w[3]);
nand G4(w[3],w[1],w[2]);
not G5(w[4],clk);
nand G6(w[5],w[2],w[4]);
nand G7(w[6],w[3],w[4]);
nand G8(q,w[5],qbar);
nand G9(qbar,w[6],q);
endmodule

module nand3(y,a,b,c);
output y;
input a,b,c;
assign y=~(a&b&c);
endmodule