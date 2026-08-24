module pmod_kypd_4x4 (
    input  clk,        // 100 MHz
    input  rst,        // active high
    input  [3:0]  col, // keypad columns
    output reg  [3:0]  row,        // keypad rows (active low)
    output reg  [3:0]  key_bin     // detected key
);
    // -----------------------------------------
    // Clock divider (~1 kHz scan rate)
    // -----------------------------------------
    localparam integer DIV = 100_000; // 100 MHz / 100k = 1 kHz
    reg [16:0] div_cnt;
    reg        scan_tick;
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            div_cnt   <= 0;
            scan_tick <= 1'b0;
        end else if (div_cnt == DIV-1) begin
            div_cnt   <= 0;
            scan_tick <= 1'b1;
        end else begin
            div_cnt   <= div_cnt + 1;
            scan_tick <= 1'b0;
        end
    end
    // -----------------------------------------
    // Row scan counter
    // -----------------------------------------
    reg [1:0] scan_row;
    always @(posedge clk or posedge rst) begin
        if (rst)
            scan_row <= 0;
        else if (scan_tick)
            scan_row <= scan_row + 1;
    end
    // -----------------------------------------
    // Drive rows (active-low)
    // -----------------------------------------
    always @(*) begin
        case (scan_row)
            2'd0: row = 4'b1110;
            2'd1: row = 4'b1101;
            2'd2: row = 4'b1011;
            2'd3: row = 4'b0111;
            default: row = 4'b1111;
        endcase
    end
    // -----------------------------------------
    // Synchronize column inputs (CRITICAL)
    // -----------------------------------------
    reg [3:0] col_sync;
    always @(posedge clk) begin
        col_sync <= col;
    end
    // -----------------------------------------
    // Latch columns after row is stable
    // -----------------------------------------
    reg [3:0] col_latched;
    always @(posedge clk) begin
        if (scan_tick)
            col_latched <= col_sync;
    end
    // -----------------------------------------
    // Key detection + debounce
    // -----------------------------------------
    reg key_held;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            key_bin  <= 4'h0;
            key_held <= 1'b0;
        end 
        else if (scan_tick) begin
            if (!key_held && col_latched != 4'b1111) begin
                key_held <= 1'b1;
                case ({scan_row, col_latched})
                    // Row 0
                    6'b00_1110: key_bin <= 4'h0;
                    6'b00_1101: key_bin <= 4'hF;
                    6'b00_1011: key_bin <= 4'hE;
                    6'b00_0111: key_bin <= 4'hD;
                    // Row 1
                    6'b01_1110: key_bin <= 4'h1;
                    6'b01_1101: key_bin <= 4'h2;
                    6'b01_1011: key_bin <= 4'h3;
                    6'b01_0111: key_bin <= 4'hA;
                    // Row 2
                    6'b10_1110: key_bin <= 4'h4;
                    6'b10_1101: key_bin <= 4'h5;
                    6'b10_1011: key_bin <= 4'h6;
                    6'b10_0111: key_bin <= 4'hB;
                    // Row 3
                    6'b11_1110: key_bin <= 4'h7;
                    6'b11_1101: key_bin <= 4'h8;
                    6'b11_1011: key_bin <= 4'h9;
                    6'b11_0111: key_bin <= 4'hC;
                    default: key_bin <= 4'h0;
                endcase
            end
            // release detection
            if (col_latched == 4'b1111)
                key_held <= 1'b0;
        end
    end

endmodule
