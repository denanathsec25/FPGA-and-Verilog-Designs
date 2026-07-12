`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.07.2026 14:30:52
// Design Name: 
// Module Name: Traffic_light
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


module Traffic_light(red,yellow,green,rst,clk);
input rst,clk;
output reg red,yellow,green;
localparam  s0=2'b00,
            s1=2'b01,
            s2=2'b10;

reg [1:0]current_state,next_state;
reg [5:0]count;

always @(posedge clk or posedge rst)
if(rst)
begin
    current_state<=s0;
    count<=0;
end
else begin
    current_state<=next_state;
if(current_state != next_state)
    count<=0;
else
    count <= count + 1;
end

always @(*)
begin
case(current_state)

s0:
begin
if(count == 29)
    next_state = s1;
else
    next_state = s0;
end

s1:
begin
if(count == 4)
    next_state = s2;
else
    next_state = s1;
end

s2:
begin
if(count == 9)
    next_state = s0;
else
    next_state = s2;
end

default: next_state = s0;

endcase
end

always @(*)
begin
red = 0;
yellow = 0;
green = 0;

case(current_state)
s0: red = 1;
s1: yellow = 1;
s2: green=1;
endcase
end
endmodule
