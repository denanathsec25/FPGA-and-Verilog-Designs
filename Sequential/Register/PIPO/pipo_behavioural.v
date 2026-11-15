`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.08.2026 13:29:43
// Design Name: 
// Module Name: pipo_behavioural
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


module pipo_behavioural(
    output reg [3:0]y,
    input [3:0]a,
    input clk,rst
    );
    always @(posedge clk or posedge rst)
    begin
        if(rst)
        begin
            y <= 4'b0000;
        end
        else
        begin
            y <= a;
        end
    end
endmodule
