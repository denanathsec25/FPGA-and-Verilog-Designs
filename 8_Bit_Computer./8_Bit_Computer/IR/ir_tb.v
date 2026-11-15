`timescale 1ns / 1ps

module tb_ir;

    reg clk;
    reg rst;
    reg en;
    reg ir_in;
    reg [7:0]bus_in;

    wire [7:0]ir;

    integer errors;

    ir uut (
        .clk(clk),
        .rst(rst),
        .en(en),
        .ir_in(ir_in),
        .bus_in(bus_in),
        .ir(ir)
    );

    always #5 clk = ~clk;

    initial begin

        clk    = 1'b0;
        rst    = 1'b0;
        en     = 1'b0;
        ir_in  = 1'b0;
        bus_in = 8'b00000000;

        errors = 0;

        rst = 1'b1;

        @(posedge clk);
        #1;

        if (ir == 8'b00000000) begin
            $display("TEST 1 RESET: PASS");
        end
        else begin
            $display("TEST 1 RESET: FAIL");
            $display("Expected = 00000000");
            $display("Got      = %b", ir);
            errors = errors + 1;
        end

        rst = 1'b0;

        en     = 1'b1;
        ir_in  = 1'b1;
        bus_in = 8'b01110001;

        @(posedge clk);
        #1;

        if (ir == 8'b01110001) begin
            $display("TEST 2 LOAD LDI 1: PASS");
        end
        else begin
            $display("TEST 2 LOAD LDI 1: FAIL");
            $display("Expected = 01110001");
            $display("Got      = %b", ir);
            errors = errors + 1;
        end

        bus_in = 8'b11100000;

        @(posedge clk);
        #1;

        if (ir == 8'b11100000) begin
            $display("TEST 3 LOAD OUT: PASS");
        end
        else begin
            $display("TEST 3 LOAD OUT: FAIL");
            $display("Expected = 11100000");
            $display("Got      = %b", ir);
            errors = errors + 1;
        end

        ir_in  = 1'b0;
        bus_in = 8'b00100010;

        @(posedge clk);
        #1;

        if (ir == 8'b11100000) begin
            $display("TEST 4 HOLD WHEN ir_in=0: PASS");
        end
        else begin
            $display("TEST 4 HOLD WHEN ir_in=0: FAIL");
            $display("Expected = 11100000");
            $display("Got      = %b", ir);
            errors = errors + 1;
        end

        en     = 1'b0;
        ir_in  = 1'b1;
        bus_in = 8'b00010010;

        @(posedge clk);
        #1;

        if (ir == 8'b11100000) begin
            $display("TEST 5 HOLD WHEN en=0: PASS");
        end
        else begin
            $display("TEST 5 HOLD WHEN en=0: FAIL");
            $display("Expected = 11100000");
            $display("Got      = %b", ir);
            errors = errors + 1;
        end


        en     = 1'b1;
        ir_in  = 1'b1;
        bus_in = 8'b00100110;

        @(posedge clk);
        #1;

        if (ir == 8'b00100110) begin
            $display("TEST 6 LOAD ADD 6: PASS");
        end
        else begin
            $display("TEST 6 LOAD ADD 6: FAIL");
            $display("Expected = 00100110");
            $display("Got      = %b", ir);
            errors = errors + 1;
        end

        if (errors == 0) begin
            $display("================================");
            $display("IR TESTBENCH: PASS");
            $display("================================");
        end
        else begin
            $display("================================");
            $display("IR TESTBENCH: FAIL");
            $display("Number of errors = %0d", errors);
            $display("================================");
        end

        $finish;

    end

endmodule