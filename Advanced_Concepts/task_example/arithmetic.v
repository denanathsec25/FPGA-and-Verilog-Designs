`timescale 1ns / 1ps

module arithmetic_calc(
    output reg [8:0]add,
    output reg [7:0]sub,
    input [7:0]a,b
    );
task arithmetic;
    input [7:0]x,y;
    output [8:0]s;
    output [7:0]d;
    begin
        s=x+y;
        d=x-y;    
    end
endtask
always @(*)
begin
    arithmetic(a,b,add,sub);
end
endmodule
