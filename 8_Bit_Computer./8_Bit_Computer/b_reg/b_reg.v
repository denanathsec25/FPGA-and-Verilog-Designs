`timescale 1ns / 1ps

module b_register (
    output reg [7:0] b_value,
    input clk,rst,bi,
    input [7:0] bus
    
);

always @(posedge clk or posedge rst) begin
    if (rst)
        b_value <= 8'h00;
    else if (bi)
        b_value <= bus;
end

endmodule
