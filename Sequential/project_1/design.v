module display(
    input  wire       clk,
    input  wire       reset,
    output reg  [7:0] seg,
    output reg  [7:0] AN
);

reg [17:0] clk_div;

always @(posedge clk or posedge reset)
begin
    if (reset)
        clk_div <= 18'd0;
    else
        clk_div <= clk_div + 1'b1;
end

// Select one of the four digits
wire [1:0] digit_select;

assign digit_select = clk_div[17:16];

always @(*)
begin
    // Initially disable all digits
    AN  = 8'b11111111;

    // Initially switch off all segments
    seg = 8'b11111111;

    case (digit_select)

        2'b00:
        begin
            // Display 1 on AN[4]
            AN  = 8'b11101111;
            seg = 8'b11111001;
        end

        2'b01:
        begin
            // Display 2 on AN[5]
            AN  = 8'b11011111;
            seg = 8'b10100100;
        end

        2'b10:
        begin
            // Display 1 on AN[6]
            AN  = 8'b10111111;
            seg = 8'b11111001;
        end

        2'b11:
        begin
            // Display 2 on AN[7]
            AN  = 8'b01111111;
            seg = 8'b10100100;
        end

        default:
        begin
            AN  = 8'b11111111;
            seg = 8'b11111111;
        end

    endcase
end

endmodule