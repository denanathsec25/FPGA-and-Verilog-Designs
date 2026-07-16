`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.07.2026 14:48:21
// Design Name: 
// Module Name: Sequence_Detector_101
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


module Sequence_Detector_101(
input clk,rst,x,
output reg y
);

reg [1:0]state,next_state;

localparam s0 = 2'b00,
           s1 = 2'b01,
           s2 = 2'b10;

always @(posedge clk or posedge rst)
begin
        if(rst)
            state <= 0;
         else
            state <= next_state;
end

always @(*)
begin
    case(state)
        s0: next_state = (x) ? s1 : s0;      
        s1: next_state = (!x) ? s2 : s1;
        s2: next_state = (x) ? s1:s0;
        default:next_state = s0;
    endcase
end

always @(*)
begin
    if(state == s2 && x == 1)
    begin
        y = 1'b1;
    end  
    else
    begin
        y = 1'b0;
    end
end

endmodule
