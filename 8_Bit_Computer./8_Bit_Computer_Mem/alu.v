`timescale 1ns / 1ps

module alu (
    input [7:0] a,b,
    input [3:0] opcode,
    input al,
    inout [7:0]bus,
    output reg zero,
    output reg carry
);
reg [7:0] result;
reg [8:0] temp;
always @(*) begin
    result = 8'b00000000;
    zero   = 1'b0;
    carry  = 1'b0;
    temp   = 9'b000000000;
    case (opcode)
        4'b0010:
        begin
            temp = {1'b0,a} + {1'b0,b};
            result = temp[7:0];
            carry = temp [8];
        end
        4'b0011:
        begin
            temp = {1'b0,a} + {1'b0,~b}+9'b1;
            result = temp[7:0];
            carry = temp [8];
        end
        4'b1000:
        begin
            result = a<<1;
            carry = a[7];
        end
        4'b1010:
        begin
            result = a>>1;
            carry = a[0];
        end
        4'b1001:
        begin
            result = a&b;
        end
        4'b1011:
        begin
            result = a^b;
        end
        default: begin
            result = 8'b00000000;
        end

    endcase
    if (result == 8'b00000000)
        zero = 1'b1;
    else
        zero = 1'b0;

end
assign bus = al ? result : 8'bz;
endmodule