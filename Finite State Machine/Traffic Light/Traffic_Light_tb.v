`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.07.2026 21:02:25
// Design Name: 
// Module Name: Traffic_Light_tb
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


module Traffic_Light_tb();

reg clk;
reg rst;

wire red;
wire yellow;
wire green;

Traffic_light uut(.red(red),.yellow(yellow),.green(green),.clk(clk),.rst(rst));
always #5 clk = ~clk;
initial
begin
clk=0;
rst=1;
#10;
rst = 0;
end

initial
begin
#500;
$finish;
end
endmodule
