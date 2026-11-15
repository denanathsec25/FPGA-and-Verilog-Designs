`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.07.2026 20:30:25
// Design Name: 
// Module Name: 1011_tb
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


module seq_detect_1011_tb();

    reg clk,rst,x;
    wire y;
    
    sequence_detector_1011 uut(y,clk,rst,x);
    
initial
begin
    clk = 0;
    #5;
    forever #10 clk = ~clk;
end
initial
begin
     rst = 1;
     #10;
     rst = 0;
     #1;
    x = 1; #20;
    x = 0; #20;
    x = 1; #20;
    x = 1; #20;
    x = 0; #20;
    x = 1; #20;
    x = 1; #20;
    x = 0; #20;
    x = 1; #20;
    x = 1; #20;
    x = 0; #20;
    x = 1; #20;
    x = 1; #20;
    x = 0; #20;
    x = 1; #20;
    #20;
    $finish;
end

initial
begin
$monitor("stimulation time = %0t | x = %b | y = %b", $time,x,y);
end
endmodule
