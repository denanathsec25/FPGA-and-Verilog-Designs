`timescale 1ns / 1ps

module board_top (
    input clk,         
    output [7:0] led,        
    output led_hlt,led_in     
);

    wire       slow_pulse;    
    wire       cpu_clk;        
    wire       rst;
    wire       start;
    wire       prog;
    wire [3:0] prog_addr;
    wire [7:0] prog_data;
    wire [7:0] input_data;

    wire [7:0] output_data;
    wire       hlt;

    clk_div DIV (
    .clk_in(clk),
    .clk_out(slow_pulse)
    );

    vio_0 VIO (
        .clk(clk),
        .probe_out0(rst),          
        .probe_out1(start),        
        .probe_out2(prog),         
        .probe_out3(prog_addr),    
        .probe_out4(prog_data),    
        .probe_out5(input_data)    
    );

    cpu_top CPU (
        .clk(slow_pulse),
        .rst(rst),
        .start(start),
        .prog(prog),
        .prog_addr(prog_addr),
        .prog_data(prog_data),
        .input_data(input_data),
        .output_data(output_data),
        .hlt(hlt),
        .led_in(led_in)
    );

    assign led     = output_data;
    assign led_hlt = hlt;

endmodule