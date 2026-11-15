`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.05.2026 17:21:21
// Design Name: 
// Module Name: BCD_tb
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


module BCD_tb;
reg [3:0]a,b;
reg cin;
wire [3:0]s;
wire c;
integer i;
BCD uut(.s(s),.c(c),.a(a),.b(b),.cin(cin));
initial begin
for(i=0;i<10;i=i+1) begin
    a={$random}%10;
    b={$random}%10;
    cin={$random}%2;
    #10 $display("a=%b, b=%b, cin=%b,s=%b,c=%b\n",a,b,cin,s,c);
    end
    
    $finish;
end
endmodule
