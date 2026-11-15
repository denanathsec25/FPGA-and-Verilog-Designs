`timescale 1ns / 1ps

module number_triangle;
wire [3:0] row = 5;
    integer i,j;
    initial begin
        for(i=1;i<=row;i=i+1)
        begin
            for(j=1;j<=i;j=j+1)
                $write("%d",j);
            $display();
        end
    end
endmodule
