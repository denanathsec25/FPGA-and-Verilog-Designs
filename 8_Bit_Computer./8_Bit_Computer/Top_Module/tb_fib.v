`timescale 1ns / 1ps

module tb_fibonacci;

    localparam NOP = 4'd0,  LDA = 4'd1,  ADD = 4'd2,  SUB = 4'd3,
               STA = 4'd4,  JMP = 4'd5,  IN  = 4'd6,  LDI = 4'd7,
               SHL = 4'd8,  AND = 4'd9,  SHR = 4'd10, XOR = 4'd11,
               JZ  = 4'd12, JNZ = 4'd13, OUT = 4'd14, HLT = 4'd15;

    reg clk;
    reg rst;
    reg start;
    reg prog;
    reg [3:0] prog_addr;
    reg [7:0] prog_data;
    reg [7:0] input_data;

    wire [7:0] output_data;
    wire halted;

    cpu_top uut (
        .clk(clk),
        .rst(rst),
        .start(start),
        .prog(prog),
        .prog_addr(prog_addr),
        .prog_data(prog_data),
        .input_data(input_data),
        .output_data(output_data),
        .hlt(halted)
    );

    initial clk = 1'b0;
    always #5 clk = ~clk;

    task load_instruction;
        input [3:0] address;
        input [7:0] instruction;
        begin
            @(negedge clk);
            prog_addr = address;
            prog_data = instruction;
            prog      = 1'b1;
            @(negedge clk);
            prog      = 1'b0;
        end
    endtask

    always @(posedge clk)
        if (uut.oi)
            $display("Time=%0t ns | OUT = %0d (0x%h)", $time, uut.bus, uut.bus);

    initial begin
        rst        = 1'b1;
        start      = 1'b0;
        prog       = 1'b0;
        prog_addr  = 4'h0;
        prog_data  = 8'h00;
        input_data = 8'h00;

        $display("--------------------------------------");
        $display(" Starting Fibonacci CPU Testbench");
        $display("--------------------------------------");

       
        load_instruction(4'h0, {LDA, 4'd12});   // A = x
        load_instruction(4'h1, {OUT, 4'd0});    // output x
        load_instruction(4'h2, {ADD, 4'd13});   // A = x + y
        load_instruction(4'h3, {STA, 4'd13});   // y = x + y
        load_instruction(4'h4, {SUB, 4'd12});   // A = y - x  (old y)
        load_instruction(4'h5, {STA, 4'd12});   // x = old y
        load_instruction(4'h6, {LDA, 4'd14});   // A = counter
        load_instruction(4'h7, {SUB, 4'd15});   // counter - 1
        load_instruction(4'h8, {STA, 4'd14});   // store counter
        load_instruction(4'h9, {JNZ, 4'd0});    // loop if not zero
        load_instruction(4'hA, {HLT, 4'd0});    // stop
        load_instruction(4'hB, {NOP, 4'd0});    // unused
        load_instruction(4'hC, 8'd0);           // x = 0
        load_instruction(4'hD, 8'd1);           // y = 1
        load_instruction(4'hE, 8'd14);          // counter = 14 terms
        load_instruction(4'hF, 8'd1);           // constant 1         

        $display("Program loaded into RAM.");

        repeat (2) @(negedge clk);
        rst = 1'b0;

        @(negedge clk);
        start = 1'b1;
        @(negedge clk);
        start = 1'b0;

        $display("CPU execution started.");

        repeat (2000) begin
            @(negedge clk);
            if (halted === 1'b1) begin
                $display("--------------------------------------");
                $display("CPU halted at %0t ns.", $time);
                $display("Final output = %0d", output_data);
                
                
        if (output_data == 8'd233)        
            $display("PASS: expected 233");        
        else        
            $display("FAIL: expected 233");        
                $display("--------------------------------------");
                $finish;
            end 
        end

        $display("ERROR: Simulation timeout.");
        $finish;
    end

endmodule