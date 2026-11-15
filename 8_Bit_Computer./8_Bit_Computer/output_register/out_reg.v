`timescale 1ns / 1ps


module out_reg(
    output reg [7:0]out,
    input clk,rst,oi,
    input [7:0] bus
    );
    
    always @(posedge clk or posedge rst)
    begin
        if(rst)
            out <= 8'b0;
        else if(oi)
            out <= bus;
    end
endmodule
