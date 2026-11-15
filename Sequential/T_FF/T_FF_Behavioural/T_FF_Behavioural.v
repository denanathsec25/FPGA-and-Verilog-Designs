`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.06.2026 11:33:28
// Design Name: 
// Module Name: T_FF_Behavioural
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


module T_FF_Behavioural(q,qbar,t,clk,rst);
output q,qbar;
reg q;
input t,clk,rst;
always @(posedge clk)
begin
if(rst)
q<=0;
else
q<=q^t;
/*qbar<=q^~t;--> when use like this 2 regisrers are needed
if we use the below format only one register is required*/
end
assign qbar=~q;
endmodule
