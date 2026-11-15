`timescale 1ns / 1ps

module keypad_4x4(
    output reg [3:0] row,
    output reg [3:0] key_bin,
    output reg key_valid,
    input clk,
    input rst,
    input [3:0] col
);
    localparam integer divider = 100000;

    reg [16:0] count;
    reg        tick;

    always @(posedge clk or posedge rst)
    begin
        if (rst)
        begin
            count <= 17'd0;
            tick  <= 1'b0;
        end
        else if (count == divider - 1)
        begin
            count <= 17'd0;
            tick  <= 1'b1;
        end
        else
        begin
            count <= count + 1'b1;
            tick  <= 1'b0;
        end
    end

    reg [1:0] row_scan;

    always @(posedge clk or posedge rst)
    begin
        if (rst)
        begin
            row_scan <= 2'd0;
        end
        else if (tick)
        begin
            row_scan <= row_scan + 1'b1;
        end
    end
//Active-low
    always @(*)
    begin
        case (row_scan)

            2'd0:
                row = 4'b1110;
            2'd1:
                row = 4'b1101;
            2'd2:
                row = 4'b1011;
            2'd3:
                row = 4'b0111;
            default:
                row = 4'b1111;
        endcase
    end
    
    reg [3:0] col_syn;
    
    always @(posedge clk or posedge rst)
    begin
        if (rst)
        begin
            col_syn <= 4'b1111;
        end
        else
        begin
            col_syn <= col;
        end
    end

    reg key_held;
    reg scan_key_found;

    always @(posedge clk or posedge rst)
    begin
        if (rst)
        begin
            key_bin        <= 4'h0;
            key_valid      <= 1'b0;
            key_held       <= 1'b0;
            scan_key_found <= 1'b0;
        end
        else
        begin
            key_valid <= 1'b0;
            if (tick)
            begin
                if (col_syn != 4'b1111)
                begin
                    scan_key_found <= 1'b1;
                    if (!key_held)
                    begin
                        key_held  <= 1'b1;
                        key_valid <= 1'b1;
                        case ({row_scan, col_syn})
                            6'b00_1110:
                                key_bin <= 4'h1;
                            6'b00_1101:
                                key_bin <= 4'h2;
                            6'b00_1011:
                                key_bin <= 4'h3;
                            6'b00_0111:
                                key_bin <= 4'hA;
                            6'b01_1110:
                                key_bin <= 4'h4;
                            6'b01_1101:
                                key_bin <= 4'h5;
                            6'b01_1011:
                                key_bin <= 4'h6;
                            6'b01_0111:
                                key_bin <= 4'hB;
                            6'b10_1110:
                                key_bin <= 4'h7;
                            6'b10_1101:
                                key_bin <= 4'h8;
                            6'b10_1011:
                                key_bin <= 4'h9;
                            6'b10_0111:
                                key_bin <= 4'hC;
                            6'b11_1110:
                                key_bin <= 4'h0;
                            6'b11_1101:
                                key_bin <= 4'hF;
                            6'b11_1011:
                                key_bin <= 4'hE;
                            6'b11_0111:
                                key_bin <= 4'hD;
                            default:
                                key_bin <= 4'h0;
                        endcase
                    end
                end
                else if (row_scan == 2'd3)
                begin
                    if (!scan_key_found)
                    begin
                        key_held <= 1'b0;
                    end
                    scan_key_found <= 1'b0;
                end
            end
        end
    end
endmodule