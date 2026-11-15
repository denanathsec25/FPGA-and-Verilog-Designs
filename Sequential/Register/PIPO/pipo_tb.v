`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.08.2026 13:59:18
// Design Name: 
// Module Name: pipo_tb
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


module tb_pipo;
    reg [3:0] a;
    reg clk, rst;
    wire [3:0] y;

    pipo_behavioural uut (.y(y), .a(a), .clk(clk), .rst(rst));

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        rst = 1;
        a = 4'b0000;
        #10 rst = 0;
        #1;
        a = 4'b1001;
        #20
        a = 4'b0110;
        #20 $finish;
    end
endmodule