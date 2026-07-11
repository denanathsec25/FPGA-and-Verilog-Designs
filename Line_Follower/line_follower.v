`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.06.2026 12:19:01
// Design Name: 
// Module Name: line_follower
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


module line_follower(LMP,LMN,RMP,RMN,D);
output wire LMP,LMN,RMP,RMN;
reg LMP,LMN,RMP,RMN;
input wire [5:1]D;
always @(D)
begin
case({D[1],D[2],D[3],D[4],D[5]})
5'b00100: begin
LMP<=1;
LMN<=0;
RMP<=1;
RMN<=0;
end
5'b01100: begin
LMP<=0;
LMN<=0;
RMP<=1;
RMN<=0;
end
5'b01000:
begin
LMP<=0;
LMN<=0;
RMP<=1;
RMN<=0;
end
5'b11000: begin
LMP<=0;
LMN<=1;
RMP<=1;
RMN<=0;
end
5'b11100: begin
LMP<=0;
LMN<=1;
RMP<=1;
RMN<=0;
end
5'b00110: begin
LMP<=1;
LMN<=0;
RMP<=0;
RMN<=0;
end
5'b00010: begin
LMP<=1;
LMN<=0;
RMP<=0;
RMN<=0;
end
5'b00011: begin
LMP<=1;
LMN<=0;
RMP<=0;
RMN<=1;
end
5'b00111: begin
LMP<=1;
LMN<=0;
RMP<=0;
RMN<=1;
end
5'b11111: begin
LMP<=1;
LMN<=0;
RMP<=1;
RMN<=0;
end
5'b00000: begin
LMP<=0;
LMN<=0;
RMP<=0;
RMN<=0;
end
endcase
end
endmodule
