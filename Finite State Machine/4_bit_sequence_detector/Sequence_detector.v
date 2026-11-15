`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.07.2026 15:50:58
// Design Name: 
// Module Name: Sequence_detector
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

// Non Overlapping

module Sequence_detector(
input clk,rst,x,
input [3:0]seq,
output reg y
    );
    
// 1010 => 1 - seq[3] , 0 - seq[2], 1 - seq[1], 0 - seq[0]

 reg [1:0]state,next_state; 
 localparam s0 = 2'b00,
            s1 = 2'b01,
            s2 = 2'b10,
            s3 = 2'b11;
            
always @(posedge clk or posedge rst)
begin
     if(rst)
         state <= s0;
     else
        state <= next_state;
end

always @(*)
begin
    case(state)
         s0: next_state = (x == seq[3]) ? s1 : s0;
         s1: next_state = (x == seq[2]) ? s2 : s0;
         s2: next_state = (x == seq[1]) ? s3 : s0;
         s3: next_state = s0; 
         default: next_state <= s0;         
       endcase
             
end

always @(*)
begin
    if(state == s3 && x == seq [0])
    begin
        y = 1'b1;
     end
     else
     begin
        y = 1'b0;
     end
 end
        
endmodule
