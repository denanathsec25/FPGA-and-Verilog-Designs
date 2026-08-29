`timescale 1ns / 1ps
module Digital_lock(
    output reg unlock,
    output reg [3:0] row, key_bin,
    output reg key_valid,
    input [3:0] col,
    input clk,rst
    );
    wire password_change,done;
        
    reg [3:0]current_password[0:1];
    reg [2:0]state,next_state;
    reg [3:0]first_digit;
    
    assign password_change = key_valid && (key_bin == 4'hC);
    assign  done = key_valid && (key_bin == 4'hD);
    
    localparam s0 = 3'b000,
               s1 = 3'b001,
               s2 = 3'b010,
               s3 = 3'b011,
               s4 = 3'b100;
                              
    always @(posedge clk or posedge rst)
    begin
        if(rst)
        begin
            state <= s0;
            current_password[1] <= 4'd0;
            current_password[0] <= 4'd8;
        end 
        else
        begin
            if(state == s0 && key_valid)
                first_digit <= key_bin;
            if(state == s3 && key_valid)
                    current_password[1] <= key_bin;
            if(state == s4 && key_valid)
                    current_password[0] <= key_bin;
            state <= next_state;
        end
    end
    
 
    always @(*)
    begin
        case(state)
            s0:
            begin
                next_state = (key_valid)?s1:s0;
                unlock = 1'b0;
            end
            s1:
            begin
                unlock = 1'b0;
                if(key_valid)begin
                    next_state = ( current_password[1] == first_digit && current_password[0]== key_bin)?s2:s0;
                end
            end
            s2:
            begin
                  unlock = 1'b1;
                  if(done)
                        next_state = s0;
                  else if(password_change)
                        next_state = s3;
                  else
                        next_state = s2;      
            end
            s3:
            begin
                    unlock = 1'b0;
                    next_state = (done) ? s4:s3;
                    
             end
             s4:
             begin
                    unlock = 1'b0;
                    next_state = (done) ? s0:s4;
                    
             end  
             default:
                   begin
                      unlock = 1'b0;
                      next_state = s0;
                   end
        endcase
    end
    
    keypad_4x4 pmod(.row(row),.key_bin(key_bin),.key_valid(key_valid),.clk(clk),.rst(rst),.col(col));
endmodule
