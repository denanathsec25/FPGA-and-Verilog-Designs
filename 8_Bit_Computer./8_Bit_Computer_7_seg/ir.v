`timescale 1ns / 1ps
    
module ir(
    output reg  [7:0] instruction,
    input  clk,rst,ii,io,
    inout [7:0] bus
    
);

always @(posedge clk or posedge rst) 
begin
    if (rst)
        instruction <= 8'b00000000;

    else if (ii)
        instruction <= bus;

end
assign bus = io ? {4'b0000, instruction[3:0]} : 8'bz;
endmodule
