`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.05.2026 19:30:18
// Design Name: 
// Module Name: 3bit_up_counter_tb
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


module bit_up_counter_tb;
reg clk;
wire [3:1]q;

bit_up_counter uut(.q(q),.clk(clk));

always @(posedge clk)
begin
#1
$display("clk=%b,q=%b\n",clk,q);
end

initial begin
force uut.G1.q = 0; force uut.G1.qbar = 1;
force uut.G1.w[2] = 1; force uut.G1.w[3] = 0;
force uut.G1.w[5] = 0; force uut.G1.w[6] = 1;
force uut.G2.q = 0; force uut.G2.qbar = 1;
force uut.G2.w[2] = 1; force uut.G2.w[3] = 0;
force uut.G2.w[5] = 0; force uut.G2.w[6] = 1;
force uut.G3.q = 0; force uut.G3.qbar = 1;
force uut.G3.w[2] = 1; force uut.G3.w[3] = 0;
force uut.G3.w[5] = 0; force uut.G3.w[6] = 1;
#1;
release uut.G1.w[2]; release uut.G1.w[3];
release uut.G1.w[5]; release uut.G1.w[6];
release uut.G2.w[2]; release uut.G2.w[3];
release uut.G2.w[5]; release uut.G2.w[6];
release uut.G3.w[2]; release uut.G3.w[3];
release uut.G3.w[5]; release uut.G3.w[6];
#1
release uut.G1.q;    release uut.G1.qbar;
release uut.G2.q;    release uut.G2.qbar;
release uut.G3.q;    release uut.G3.qbar;
end

initial begin
clk=0;
forever #5 clk=~clk;
end

initial begin
#100 $finish;
end

endmodule
