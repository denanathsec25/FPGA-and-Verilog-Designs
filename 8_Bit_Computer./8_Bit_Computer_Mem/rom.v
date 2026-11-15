`timescale 1ns / 1ps

module program_rom (
    input      [2:0]   sel,
    output reg [127:0] image
);

    reg [7:0] p [0:15];
    integer i;

    task two_input;
        input [7:0] op_byte;
        begin
            p[0] = 8'h60;  // IN: read x
            p[1] = 8'h4E;  // STA 14: store x
            p[2] = 8'h60;  // IN: read y
            p[3] = 8'h4F;  // STA 15: store y
            p[4] = 8'h1E;  // LDA 14: load x
            p[5] = op_byte; // Perform operation with y
            p[6] = 8'hE0;  // OUT: display result
            p[7] = 8'hF0;  // HLT
        end
    endtask

    always @(*) begin

        for (i = 0; i < 16; i = i + 1)
            p[i] = 8'h00;

        case (sel)

            // 0: Custom program
            3'd0: begin
                // RAM can be programmed through VIO.
            end

            3'd1: begin
                p[0]  = 8'h1E; // LDA 14: A = a
                p[1]  = 8'h2F; // ADD 15: A = a+b
                p[2]  = 8'h4D; // STA 13: save sum
                p[3]  = 8'h1F; // LDA 15: A = old b
                p[4]  = 8'h4E; // STA 14: a = old b
                p[5]  = 8'h1D; // LDA 13: A = sum
                p[6]  = 8'h4F; // STA 15: b = sum
                p[7]  = 8'hE0; // OUT
                p[8]  = 8'h50; // JMP 0

                p[13] = 8'd0;  // Initial temporary value
                p[14] = 8'd0;  // a
                p[15] = 8'd1;  // b
            end

            // 2: Addition x+y
            3'd2: two_input(8'h2F);

            // 3: Subtraction x-y
            3'd3: two_input(8'h3F);

            // 4: Bitwise AND
            3'd4: two_input(8'h9F);

            // 5: Bitwise XOR
            3'd5: two_input(8'hBF);

            3'd6: begin
                p[0] = 8'hF0; 
            end

            3'd7: begin
                p[0] = 8'hF0; 
            end

            default: begin
                p[0] = 8'hF0;
            end

        endcase

        for (i = 0; i < 16; i = i + 1)
            image[i*8 +: 8] = p[i];

    end

endmodule