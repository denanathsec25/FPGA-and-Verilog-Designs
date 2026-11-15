`timescale 1ns / 1ps

module clk_div #(parameter DIV = 6_250_000) (
    input  clk_in,rst,
    output reg clk_out
);
    reg [25:0] count = 0;

    always @(posedge clk_in or posedge rst) begin
        if(rst)
            count <= 0;
        else if (count == DIV - 1) begin
            count   <= 0;
            clk_out <= ~clk_out;
        end
        else
            count <= count + 1;
    end
endmodule