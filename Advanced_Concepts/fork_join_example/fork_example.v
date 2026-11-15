`timescale 1ns / 1ps


module fork_example;
initial begin
    fork
        begin
            #5;
            $display("Process A at %0t",$time);
        end
        begin
            #10;
            $display("Process B at %0t",$time);
        end
        begin
            #15;
            $display("Process C at %0t",$time);
        end
    join
    
    $display("All process is Completed %0t",$time);
end
endmodule
