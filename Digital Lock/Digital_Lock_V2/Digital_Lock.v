`timescale 1ns / 1ps
module Digital_lock(
    output reg unlock,
    output reg [3:0]new_password_out,
    input clk,rst,ok,password_change,done,
    input [3:0]input_password
    );
    
    reg [3:0]current_password[0:1];
    reg [2:0]state,next_state;
    reg [3:0]first_digit;
    
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
            new_password_out <= 4'b0000;
        end 
        else
        begin
            if(state == s0)
            begin
                first_digit <= input_password;
            end
            if(state == s3 && ok)
            begin
                    current_password[1] <= input_password;
                    new_password_out <= input_password;
            end
            if(state == s4 && ok)
            begin
                    current_password[0] <= input_password;
                    new_password_out <= input_password;
            end
            state <= next_state;
        end
    end
    
 
    always @(*)
    begin
        case(state)
            s0:
            begin
                next_state = s1;
                unlock = 1'b0;
            end
            s1:
            begin
                next_state = ( current_password[1]==first_digit && current_password[0]==input_password)?s2:s0;
                unlock = 1'b0;
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
                    next_state = (ok) ? s4:s3;
                    
             end
             s4:
             begin
                    unlock = 1'b0;
                    next_state = (ok) ? s0:s4;
                    
             end  
             default:
                   begin
                      unlock = 1'b0;
                   end
        endcase
    end
endmodule
