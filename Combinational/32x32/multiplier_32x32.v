`timescale 1ns / 1ps

module multiplier_32x32(
    output [63:0] p,
    input [31:0]a,
    input [31:0]b
    );
    assign p =a*b;
endmodule
