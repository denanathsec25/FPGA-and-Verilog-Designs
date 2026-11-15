`timescale 1ns / 1ps

module replication_operator;
wire [7:0]data;
assign data = {4{2'b10}};
initial begin
    $display("Data = %b",data);
end
endmodule
