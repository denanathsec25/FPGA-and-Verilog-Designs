`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.05.2026 06:14:14
// Design Name: 
// Module Name: fa_behavioural
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


module fa_behavioural(sum,carry,a,b,c);
output sum,carry;
reg sum,carry;
input a,b,c;
always @(a,b,c)
begin
case ({a,b,c})
3'b000:sum=0;
3'b000:carry=0;
3'b001:sum=1;
3'b001:carry=0;
3'b010:sum=1;
3'b010:carry=0;
3'b011:sum=0;
3'b011:carry=1;
3'b100:sum=1;
3'b100:carry=0;
3'b101:sum=0;
3'b101:carry=1;
3'b110:sum=0;
3'b110:carry=1;
3'b111:sum=1;
3'b111:carry=1;
endcase
end
endmodule
