`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.06.2026 18:23:16
// Design Name: 
// Module Name: JK_FF_Behavioural_tb
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


module JK_FF_Behavioural_tb;
reg clk,rst,j,k;
  
wire q,qbar;

JK_FF_Behavioural uut(.q(q),.qbar(qbar),.clk(clk),.rst(rst),.j(j),.k(k));
always @(posedge clk)
begin
#1
$display("j=%b,k=%b,q=%b,qbar=%b\n",j,k,q,qbar);
end
initial
begin
clk=0;
rst=0;
#10;
rst=1;
forever #5 clk=~clk;
end	
initial 
begin
#10
j=0;k=0;
#10
j=0;k= 1;
#10
j=1;k=0;
#10
j=1;k= 1;
#10
j=1;k=0;
end
initial begin
#50 $finish;
end
endmodule