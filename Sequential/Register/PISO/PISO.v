`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.06.2026 06:14:49
// Design Name: 
// Module Name: PISO
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


module PISO(y,d,l,clk);
output y;
input [3:0]d;
input clk,l;
wire [3:0]w;
wire [2:0]q;
not G0(w[0],l);
D_FF G1(q[0],d[0],clk);
combo G2(w[1],q[0],l,w[0],d[1]);
D_FF G3(q[1],w[1],clk);
combo G4(w[2],q[1],l,w[0],d[2]);
D_FF G5(q[2],w[2],clk);
combo G6(w[3],q[2],l,w[0],d[3]); 
D_FF G7(y,w[3],clk);
endmodule

module D_FF(q,d,clk);
output q;
reg q;
input d,clk;
always @(posedge clk)
begin
q<=d;
end
endmodule

module combo(y,q,l,nl,b);
output y;
input q,l,nl,b;
assign y=((q&l)|(nl&b));
endmodule
