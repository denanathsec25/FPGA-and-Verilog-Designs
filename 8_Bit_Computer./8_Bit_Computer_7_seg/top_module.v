`timescale 1ns / 1ps

module cpu_top (
    input clk,rst,start,prog,
    input  [7:0] input_data,prog_data,
    input [3:0]prog_addr,
    output [7:0] output_data,
    output hlt,led_in,
    output [3:0] pc_value,
    output [7:0] instr_value
);

    tri [7:0] bus;

    wire mi, ri, ro, ii, io;
    wire co, cl, ce;
    wire ai, ao, al, fe, bi, oi;
    wire [7:0] instruction;
    wire [3:0] opcode;
    wire [3:0] address;

    assign opcode = instruction[7:4];
    
    wire [7:0] a_value;
    wire [7:0] b_value;
    wire alu_carry;
    wire alu_zero;

    reg flag_carry;
    reg flag_zero;

    control_unit CU (
        .mi(mi),
        .ri(ri),
        .ro(ro),
        .ii(ii),
        .io(io),
        .co(co),
        .cl(cl),
        .ce(ce),
        .ai(ai),
        .ao(ao),
        .al(al),
        .fe(fe),
        .bi(bi),
        .oi(oi),
        .hlt(hlt),
        .led_in(led_in),
        .opcode(opcode),
        .clk(clk),
        .rst(rst),
        .flag_carry(flag_carry),
        .flag_zero(flag_zero),
        .start(start),
        .prog(prog)
    );

    assign bus = (ai && opcode == 4'd6) ? input_data:8'bz;

    assign instr_value = instruction;

    pc PC (
        .clk(clk),
        .rst(rst),
        .co(co),
        .cl(cl),
        .ce(ce),
        .bus(bus),
        .pc_value(pc_value)
    );
    
    mar MAR (
        .clk(clk),
        .rst(rst),
        .mi(mi),
        .bus(bus),
        .address(address)
    );

    ram RAM (
        .clk(clk),
        .ri(ri),
        .ro(ro),
        .address(address),
        .bus(bus),
        .prog(prog),
        .prog_addr(prog_addr),
        .prog_data(prog_data)
    );

    ir IR (
        .clk(clk),
        .rst(rst),
        .ii(ii),
        .io(io),
        .bus(bus),
        .instruction(instruction)
    );

    a_reg A (
        .clk(clk),
        .rst(rst),
        .ai(ai),
        .ao(ao),
        .bus(bus),
        .a_value(a_value)
    );

    b_register B (
        .clk(clk),
        .rst(rst),
        .bi(bi),
        .bus(bus),
        .b_value(b_value)
    );

    alu ALU (
        .a(a_value),
        .b(b_value),
        .opcode(opcode),
        .al(al),
        .bus(bus),
        .carry(alu_carry),
        .zero(alu_zero)
    );

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            flag_carry <= 1'b0;
            flag_zero  <= 1'b0;
        end
        else if (fe) begin
            flag_carry <= alu_carry;
            flag_zero  <= alu_zero;
        end
    end

    out_reg OUT (
        .clk(clk),
        .rst(rst),
        .oi(oi),
        .bus(bus),
        .out(output_data)
    );

endmodule