`timescale 1ns / 1ps



module ram(
    input [3:0]address,prog_addr,
    input [7:0] prog_data,
    input ri,ro,clk,prog,
    inout [7:0]bus
    );
    
    reg [7:0]memory[15:0];
    
    always @(posedge clk)
    begin
        if(prog)
            memory[prog_addr] <= prog_data;
        else if(ri)
        begin
            memory[address] <= bus;
        end
        
    end
    
    assign bus = (ro) ? memory[address] : 8'bz;
    
endmodule
