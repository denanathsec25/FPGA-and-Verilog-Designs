`timescale 1ns / 1ps

module named_block_example;

initial begin : process_A
    $display("Process started at %0t", $time);

    #5;
    $display("Operation 1 at %0t", $time);

    #5;
    $display("Operation 2 at %0t", $time);

    #5;
    $display("Operation 3 at %0t", $time);
end

endmodule
