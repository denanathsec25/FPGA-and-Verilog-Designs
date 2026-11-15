`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.06.2026 18:02:59
// Design Name: 
// Module Name: JK__FF_Behavioural
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


module JK_FF_Behavioural(q,qbar,clk,rst,j,k);
output q,qbar;
reg q,qbar;
input clk,rst,j,k;
always @(posedge clk,negedge rst)
begin
if(!rst)begin
q<=0;
qbar<=1;
end
else
begin
case({j,k})
2'b00:begin
q<=q;
qbar<=qbar;
end
2'b01:begin
q<=0;
qbar<=1;
end
2'b10:begin
q<=1;
qbar<=0;
end
2'b11:begin
q<=qbar;
qbar<=q;
end
endcase
end
end
endmodule
