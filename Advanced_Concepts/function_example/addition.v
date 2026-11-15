`timescale 1ns / 1ps

module addition_calc(
    output [8:0]add,
    input [7:0]a,b
    );
    
function [8:0]addition;
    input [7:0]x,y;
    begin
        addition = x+y;
    end
endfunction
   assign add = addition(a,b);
endmodule
