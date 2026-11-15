`timescale 1ns / 1ps

module fork_join_diable_example;

initial begin

    fork : my_process

        begin
            #5;
            $display("Process A completed at %0t", $time);
        end

        begin
            #10;
            $display("Process B completed at %0t", $time);
        end
        disable my_process;
        begin
            #15;
            $display("Process C completed at %0t", $time);
        end

    join

    $display("All processes completed at %0t", $time);

end

endmodule
