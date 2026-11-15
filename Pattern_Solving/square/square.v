`timescale 1ns / 1ps


module square;
wire [3:0] row = 5;
    integer i,j;
    initial begin
        for(i=0;i<row;i=i+1)
        begin
            for(j=0;j<row;j=j+1)
                $write("*");
            $display();
        end
    end
endmodule
