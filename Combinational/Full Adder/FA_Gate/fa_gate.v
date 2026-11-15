`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.05.2026 05:54:15
// Design Name: 
// Module Name: fa_gate
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


module fa_gate(output sum,carry,input a,b,c);
wire [1:3]w;
xor G1(w[1],a,b);
and G2(w[2],a,b);
xor G3(sum,w[1],c);
and G4(w[3],w[1],c);
or G5(carry,w[2],w[3]);
endmodule
