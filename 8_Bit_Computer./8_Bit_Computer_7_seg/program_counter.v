`timescale 1ns / 1ps

module pc(
    inout [7:0] bus,
    input co, cl, ce, clk, rst,
    output [3:0] pc_value
    );

    reg [3:0] p_count;

    always @(posedge clk or posedge rst)
    begin
        if (rst)
            p_count <= 4'd0;
        else if (cl)
            p_count <= bus[3:0];
        else if (ce)
            p_count <= p_count + 4'd1;
    end

    assign bus      = co ? {4'b0000, p_count} : 8'bz;
    assign pc_value = p_count;

endmodule