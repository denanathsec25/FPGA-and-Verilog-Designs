`timescale 1ns / 1ps


module mar(
    output reg [3:0] address,
    input [7:0]bus,
    input clk,rst,mi
    );
    
    always @(posedge clk or posedge rst)
    begin
        if(rst)
            address <= 4'b0;
        else if(mi)
            address <= bus[3:0];
    end
    
endmodule
