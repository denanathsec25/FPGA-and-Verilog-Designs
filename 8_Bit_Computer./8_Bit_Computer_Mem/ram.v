`timescale 1ns / 1ps

module ram(
    input  [3:0]   address, prog_addr,
    input  [7:0]   prog_data,
    input  [127:0] image,
    input          ri, ro, clk, prog, load,
    inout  [7:0]   bus
    );

    reg [7:0] memory [15:0];
    integer i;

    always @(posedge clk)
    begin
        if (load)
        begin
            for (i = 0; i < 16; i = i + 1)
                memory[i] <= image[i*8 +: 8];
        end
        else if (prog)
            memory[prog_addr] <= prog_data;
        else if (ri)
            memory[address] <= bus;
    end

    assign bus = (ro) ? memory[address] : 8'bz;

endmodule