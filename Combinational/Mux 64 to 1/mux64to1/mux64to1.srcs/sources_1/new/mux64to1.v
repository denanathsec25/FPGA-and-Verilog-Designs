`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.05.2026 21:09:53
// Design Name: 
// Module Name: 16 to 1 mux
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
module mux64to1(y,a,s);
output y;
input [63:0]a;
input [5:0]s;
wire [2:1]w;
mux32to1 M1(w[1],a[31:0],s[4:0]);
mux32to1 M2(w[2],a[63:32],s[4:0]);
mux M3(y,w[1],w[2],s[5]);
endmodule

module mux32to1(y,a,s);
output y;
input [31:0]a;
input [4:0]s;
wire [2:1]w;
mux16to1 M1(w[1],a[15:0],s[3:0]);
mux16to1 M2(w[2],a[31:16],s[3:0]);
mux M3(y,w[1],w[2],s[4]);
endmodule

module mux16to1(y,a,s);
output y;
input [15:0]a;
input [3:0]s;
wire [13:0]w;
mux M1(w[0],a[0],a[1],s[0]);
mux M2(w[1],a[2],a[3],s[0]);
mux M3(w[2],a[4],a[5],s[0]);
mux M4(w[3],a[6],a[7],s[0]);
mux M5(w[4],a[8],a[9],s[0]);
mux M6(w[5],a[10],a[11],s[0]);
mux M7(w[6],a[12],a[13],s[0]);
mux M8(w[7],a[14],a[15],s[0]);
mux M9(w[8],w[0],w[1],s[1]);
mux M10(w[9],w[2],w[3],s[1]);
mux M11(w[10],w[4],w[5],s[1]);
mux M12(w[11],w[6],w[7],s[1]);
mux M13(w[12],w[8],w[9],s[2]);
mux M14(w[13],w[10],w[11],s[2]);
mux M15(y,w[12],w[13],s[3]);
endmodule

module mux(output y,input a,b,s);
wire w[2:0];
not G1(w[0],s);
and G2(w[1],a,w[0]);
and G3(w[2],b,s);
or G4(y,w[1],w[2]);
endmodule
