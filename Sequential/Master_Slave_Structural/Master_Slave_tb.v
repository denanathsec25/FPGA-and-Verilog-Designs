`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.05.2026 15:53:27
// Design Name: 
// Module Name: Master_Slave_tb
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


module Master_Slave_tb;
reg j,k,clk;
wire q,qbar;

Master_Slave uut(.q(q),.qbar(qbar),.j(j),.k(k),.clk(clk));

initial begin
force uut.G1.q = 0;
force uut.G1.qbar = 1;
force uut.G2.q = 0;
force uut.G2.qbar = 1;
force uut.G3.q = 0;
force uut.G3.qbar = 1;
#6;
release uut.G1.q;
release uut.G1.qbar;
release uut.G2.q;
release uut.G2.qbar;
release uut.G3.q;
release uut.G3.qbar;
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
