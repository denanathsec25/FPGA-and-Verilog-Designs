`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.07.2026 14:42:20
// Design Name: 
// Module Name: Display_controller
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


module Display_controler(
    input clk,
    input [3:0]sec_ones,sec_tens,min_ones,min_tens,hr_ones,hr_tens,day,
    output reg [7:0]AN //activation of display
     );
    reg [2:0]display_selection;
    reg [3:0]display_bcd;
    wire [7:0]seg;
    reg dp;
    
    always @(posedge clk)
    begin
        display_selection <= display_selection + 1;
    end 
 
    always @(*)
    begin
        case (display_selection)
        3'd0:
        begin
            display_bcd = sec_ones;
            dp = 1'b1;
            AN = 8'b11111110;
        end
        3'd1:
        begin
            display_bcd = sec_tens;
            dp = 1'b0;
            AN = 8'b11111101;
        end
        3'd2:
        begin
            display_bcd = sec_ones;
            dp = 1'b1;
            AN = 8'b11111011;
        end
        3'd3:
        begin
            display_bcd = min_ones;
            dp = 1'b0;
            AN = 8'b11110111;
        end
        3'd4:
        begin
            display_bcd = min_tens;
            dp = 1'b1;
            AN = 8'b11101111;
        end
        3'd5:
        begin
            display_bcd = hr_ones;
            dp = 1'b0;
            AN = 8'b11011111;
        end
        3'd6:
        begin
            display_bcd = hr_tens;
            dp = 1'b1;
            AN = 8'b10111111;
        end
        3'd7:
        begin
            display_bcd = day;
            dp = 1'b0;
            AN = 8'b0111111;
        end
        endcase
    end
    
    BCD_to_7Segment decoder(
    .seg(seg),
    .bcd(display_bcd),
    .dp(dp)
    );
endmodule
