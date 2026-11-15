`timescale 1ns / 1ps
// Shows an 8-bit value (0-255) in decimal on the RIGHT 3 digits.
// AN[0] = ones, AN[1] = tens, AN[2] = hundreds. Everything ACTIVE LOW.
// Uses BCD_to_7Segment (bcd 4'hF -> all segments off = blank digit).
module output_display (
    input            clk,      // 100 MHz board clock
    input      [7:0] value,    // output_data from the CPU
    output reg [7:0] AN,
    output     [7:0] seg
);

    // refresh counter: 100 MHz / 2^15 = ~3 kHz per digit slot
    reg [16:0] refresh;
    initial refresh = 17'd0;

    always @(posedge clk)
        refresh <= refresh + 1'b1;

    wire [1:0] sel = refresh[16:15];

    // binary -> decimal
    wire [7:0] hund8 = value / 8'd100;
    wire [7:0] tens8 = (value / 8'd10) % 8'd10;
    wire [7:0] ones8 = value % 8'd10;

    wire [3:0] hund = hund8[3:0];
    wire [3:0] tens = tens8[3:0];
    wire [3:0] ones = ones8[3:0];

    reg [3:0] digit;

    always @(*) begin
        case (sel)
            2'd0: begin                          // rightmost: ones
                digit = ones;
                AN    = 8'b11111110;
            end
            2'd1: begin                          // tens (blank if leading zero)
                digit = (hund == 4'd0 && tens == 4'd0) ? 4'hF : tens;
                AN    = 8'b11111101;
            end
            2'd2: begin                          // hundreds (blank if zero)
                digit = (hund == 4'd0) ? 4'hF : hund;
                AN    = 8'b11111011;
            end
            default: begin                       // idle slot, all off
                digit = 4'hF;
                AN    = 8'b11111111;
            end
        endcase
    end

    BCD_to_7Segment decoder (
        .seg(seg),
        .bcd(digit),
        .dp(1'b0)
    );

endmodule