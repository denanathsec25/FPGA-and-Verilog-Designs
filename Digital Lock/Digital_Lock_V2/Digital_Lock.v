`timescale 1ns / 1ps
module Digital_lock(
    output reg unlock,
    output reg [3:0]new_password_out,
    input clk,rst,ok,password_change,done,
    input [3:0]input_password,new_password
    );
    
    reg [3:0]current_password[0:1];
    reg [1:0]state,next_state;
    reg key_count;
    
    localparam s0 = 2'b00,
               s1 = 2'b01,
               s2 = 2'b10,
               s3 = 2'b11;
                              
    always @(posedge clk or posedge rst)
    begin
        if(rst)
        begin
            state <= s0;
            key_count <= 1'b1;
            current_password[1] <= 4'd0;
            current_password[0] <= 4'd8;
            new_password_out <= 4'b0000;
        end 
        else
        begin
            if(state == s3)
            begin
                if(key_count)
                begin
                    current_password[1]<=new_password;
                    key_count <=key_count - 1;
                end
                else if(!key_count)
                begin
                    current_password[0]<=new_password;
                end
            end
            state <= next_state;
        end
    end
    
    reg [3:0]temp; 
    always @(*)
    begin
        case(state)
            s0:
            begin
                temp = input_password;
                next_state = s1;
                unlock = 1'b0;
            end
            s1:
            begin
                next_state = ( current_password[1]==temp && current_password[0]==input_password)?s2:s0;
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
                    next_state = (ok) ? s0:s3;
                    unlock = 1'b0;
                 end  
              default:
                   begin
                      unlock = 1'b0;
                   end
        endcase
    end
endmodule
