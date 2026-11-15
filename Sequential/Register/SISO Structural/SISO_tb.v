`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.05.2026 18:10:04
// Design Name: 
// Module Name: SISO_tb
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


module SISO_tb;
reg D,clk;
wire Q;

SISO uut(.Q(Q),.D(D),.clk(clk));
initial begin
clk=0;
forever #50000000 clk = ~clk;
end

always @(posedge clk)
begin
#1
$display("Q =  %b",Q);
end

initial begin
D=0;
#100000000 D=1;
#100000000 D=0;
#100000000 D=1;
#100000000 D=0;
#400000000 $finish;

end

endmodule