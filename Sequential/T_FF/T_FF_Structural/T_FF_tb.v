`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.05.2026 10:52:07
// Design Name: 
// Module Name: T_Flip_Flop_tb
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


module T_Flip_Flop_tb;
reg t,clk;
wire q,qbar;

T_Flip_Flop uut(.q(q),.qbar(qbar),.t(t),.clk(clk));

initial begin
force uut.q=0;
force uut.qbar=1;
#1;
release q;
release qbar;
end

initial begin
clk=0;
forever #5 clk = ~clk;
end

initial begin
t=0;
#10 t=1;
#10 $finish;

end

initial begin
$monitor ("t=%b,clk=%b,q=%b,qbar=%b\n",t,clk,q,qbar);
end

endmodule
