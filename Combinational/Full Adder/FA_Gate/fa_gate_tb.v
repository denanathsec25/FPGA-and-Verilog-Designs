`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.05.2026 17:02:08
// Design Name: 
// Module Name: fa_gate_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module fa_gate_tb;

reg a,b,c;
wire sum, carry;

fa_gate uut(.sum(sum),.carry(carry),.a(a),.b(b),.c(c));
initial begin
c=0;b=0;a=0;
#10 $display("a=%b, b=%b, c=%b,sum=%b,carry=%b\n",a,b,c,sum,carry);
c=0;b=0;a=1;
#10 $display("a=%b, b=%b, c=%b,sum=%b,carry=%b\n",a,b,c,sum,carry);
c=0;b=1;a=0;
#10 $display("a=%b, b=%b, c=%b,sum=%b,carry=%b\n",a,b,c,sum,carry);
c=0;b=1;a=1;
#10 $display("a=%b, b=%b, c=%b,sum=%b,carry=%b\n",a,b,c,sum,carry);
c=1;b=0;a=0;
#10 $display("a=%b, b=%b, c=%b,sum=%b,carry=%b\n",a,b,c,sum,carry);
c=1;b=0;a=1;
#10 $display("a=%b, b=%b, c=%b,sum=%b,carry=%b\n",a,b,c,sum,carry);
c=1;b=1;a=0;
#10 $display("a=%b, b=%b, c=%b,sum=%b,carry=%b\n",a,b,c,sum,carry);
c=1;b=1;a=1;
#10 $display("a=%b, b=%b, c=%b,sum=%b,carry=%b\n",a,b,c,sum,carry);
end
endmodule
