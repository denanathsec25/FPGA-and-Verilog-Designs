`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.05.2026 17:31:31
// Design Name: 
// Module Name: SISO
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


module SISO(Q,D,clk);
output Q;
input D,clk;
wire [2:0]w;
D_FF G3(w[2],D,clk);
D_FF G2(w[1],w[2],clk);
D_FF G1(w[0],w[1],clk);
D_FF G0(Q,w[0],clk);
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