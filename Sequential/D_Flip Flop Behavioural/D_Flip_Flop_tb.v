`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.05.2026 09:01:07
// Design Name: 
// Module Name: D_Flip_Flop_tb
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


module D_Flip_Flop_tb;
reg d,clk;
wire q;

D_Flip_Flop uut(.q(q),.d(d),.clk(clk));

initial begin
clk=0;
forever #10 clk = ~clk;
end

initial begin
d=0;
#10 d=1;
#10 d=0;
#10 d=1;
#10 d=0;
#20 $finish;

end

initial begin
$monitor ("d=%b,clk=%b,q=%b\n",d,clk,q);
end

endmodule
