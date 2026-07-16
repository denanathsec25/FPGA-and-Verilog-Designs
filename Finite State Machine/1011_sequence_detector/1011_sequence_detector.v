`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.07.2026 20:18:28
// Design Name: 
// Module Name: 1011_sequence_detector
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


module sequence_detector_1011(
    output reg y,
    input clk,rst,x
    );
    reg [1:0] next_state, state;
    localparam s0 = 2'b00,
               s1 = 2'b01,
               s2 = 2'b10,
               s3 = 2'b11;
               
   always @(posedge clk or  posedge rst)
   begin
   if(rst)
           state <= s0;
    else 
            state <= next_state;
   end
   
   always @(*)
   begin
   
         next_state = state;
         
        case(state)
        
        s0: next_state = (x) ? s1 :  s0;
        s1: next_state = (!x) ? s2: s1;//1
        s2: next_state = (x) ? s3 : s0;//10
        s3: next_state = (x) ? s1 : s2;//101
        default: next_state = s0;
        
        endcase
   end
   
   always @(*)
   begin
    y = (state == s3 && x == 1) ? 1'b1: 1'b0;//1011
   end
endmodule
