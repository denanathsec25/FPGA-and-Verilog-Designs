`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.07.2026 13:11:47
// Design Name: 
// Module Name: BCD_to_7Segment
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


module BCD_to_7Segment(seg,bcd,dp);
output reg [7:0]seg;
input [3:0]bcd;
input dp;
always @(*)
begin
    // Active-low: 0 = ON, 1 = OFF

    case(bcd)
        4'd0: seg[6:0] = 7'b1000000;
        4'd1: seg[6:0] = 7'b1111001;
        4'd2: seg[6:0] = 7'b0100100;
        4'd3: seg[6:0] = 7'b0110000;
        4'd4: seg[6:0] = 7'b0011001;
        4'd5: seg[6:0] = 7'b0010010;
        4'd6: seg[6:0] = 7'b0000010;
        4'd7: seg[6:0] = 7'b1111000;
        4'd8: seg[6:0] = 7'b0000000;
        4'd9: seg[6:0] = 7'b0010000;

        default: seg[6:0] = 7'b1111111;
    endcase
    
    if(dp)
        seg[7] = 1'b0;
    else
        seg[7] = 1'b1;
    
end
endmodule
