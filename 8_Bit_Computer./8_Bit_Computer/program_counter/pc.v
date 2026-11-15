`timescale 1ns / 1ps


module pc(
    inout [7:0]bus,
    input co,cl,ce,clk,rst
    );
    reg [3:0] p_count;
    always @(posedge clk or posedge rst)
    begin
        if(rst)
        begin
            p_count <= 0;
        end
        else if(cl)
        begin
            p_count <= bus[3:0];
        end
        else if(ce)
        begin
            p_count <= p_count + 4'd1;
        end
        
    end
    
    assign bus = co ? {4'b0000,p_count}:8'bz;
endmodule
