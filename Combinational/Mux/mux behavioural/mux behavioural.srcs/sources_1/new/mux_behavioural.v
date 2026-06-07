`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.05.2026 06:33:41
// Design Name: 
// Module Name: mux_behavioural
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


module mux_behavioural(y,a,b,s);
output y;
reg y;
input a,b,s;
always @(a or b or s)
begin
if (s)
y=b;
else
y=a;
end
endmodule
