`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.05.2026 12:20:44
// Design Name: 
// Module Name: JK_FF_tb
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


module JK_FF_tb;
reg j,k,clk;
wire q,qbar;

JK_FF uut(.q(q),.qbar(qbar),.j(j),.k(k),.clk(clk));

initial begin
force uut.q=0;
force uut.qbar=1;
#1;
release q;
release qbar;
end

initial begin
clk=0;
forever begin
    #10 clk = 1;
    #1  clk = 0;
end
end

initial begin
j=0;k=0;
#10 j=0;k=1;
#10 j=1;k=0;
#10 j=1;k=1;
#10 $finish;

end

initial begin
$monitor ("j=%b,k=%b,clk=%b,q=%b,qbar=%b\n",j,k,clk,q,qbar);
end

endmodule