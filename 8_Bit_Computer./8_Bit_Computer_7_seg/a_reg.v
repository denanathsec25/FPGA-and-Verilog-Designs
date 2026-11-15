`timescale 1ns / 1ps

module a_reg(
    output reg [7:0] a_value,
    input clk,rst,ai,ao,
    inout  [7:0]bus
    
);

always @(posedge clk or posedge rst) begin
    if (rst)
        a_value <= 8'h00;
    else if (ai)
        a_value <= bus;
end
assign bus = ao ? a_value : 8'bz;
endmodule
