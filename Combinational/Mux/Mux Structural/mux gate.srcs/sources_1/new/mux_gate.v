`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.05.2026 06:49:52
// Design Name: 
// Module Name: mux_gate
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


module mux_gate(y,a,b,s);
output y;
input a,b,s;
wire [2:0]w;
not G1(w[0],s);
and G2(w[2],a,w[0]);
and G3(w[1],s,b);
or G4(y,w[1],w[2]);
endmodule
