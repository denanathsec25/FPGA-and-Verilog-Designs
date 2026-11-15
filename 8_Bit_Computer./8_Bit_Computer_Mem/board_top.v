`timescale 1ns / 1ps

module board_top (
    input  clk,start,rst,
    input  [2:0] sw, 
    output [2:0] led,      // SW2..SW0 = program select
    output led_hlt, led_in,
    output [7:0] AN,       // digit enables, active low
    output [7:0] seg,      // segments a..g + dp, active low
    output flag_zero,flag_carry
);
    
    assign led = sw;
    
    wire slow_pulse;
    wire prog;
    wire [3:0] prog_addr;
    wire [7:0] prog_data;
    wire [7:0] input_data;

    // 0 custom, 1 fib, 2 ADD, 3 SUB, 4 AND, 5 XOR, 6 MUL, 7 DIV
    wire [2:0] prog_sel = sw;

    wire [7:0] output_data;
    wire       hlt;

    clk_div DIV (
        .clk_in(clk),
        .rst(rst),
        .clk_out(slow_pulse)
    );

    vio_0 VIO (
        .clk(clk),
        .probe_out0(prog_addr),
        .probe_out1(prog_data),
        .probe_out2(input_data),
        .probe_out3(prog)
        
    );

    cpu_top CPU (
        .clk(slow_pulse),
        .rst(rst),
        .start(start),
        .prog(prog),
        .prog_sel(prog_sel),
        .prog_addr(prog_addr),
        .prog_data(prog_data),
        .input_data(input_data),
        .output_data(output_data),
        .hlt(hlt),
        .led_in(led_in),
        .pc_value(),
        .instr_value(),
        .flag_zero(flag_zero),
        .flag_carry(flag_carry)
    );
    
    assign led_hlt = hlt;
        
    output_display DISP (
        .clk(clk),
        .value(output_data),
        .AN(AN),
        .seg(seg)
    );

endmodule