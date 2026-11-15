`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.06.2026 11:54:36
// Design Name: 
// Module Name: T_FF_Behavioural_tb
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


module T_FF_Behavioural_tb;
reg t,rst,clk;
wire q,qbar;

T_FF_Behavioural uut(.q(q),.qbar(qbar),.clk(clk),.rst(rst),.t(t));

initial begin
$monitor ("t=%b,clk=%b,q=%b,qbar=%b\n",t,clk,q,qbar);
end

initial begin
clk=0;
forever #5 clk=~clk;
end

initial begin
rst=1;
#10
rst=0;
end 

initial begin
t=0;
#10 t=1;
#10 $finish;
end

endmodule
