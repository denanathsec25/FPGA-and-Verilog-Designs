`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.07.2026 21:34:20
// Design Name: 
// Module Name: Digital_lock
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Digital_lock(
    output reg unlock,
    output reg[3:0]new_password_out,
    input clk,rst,ok,password_change,done,
    input [3:0]input_password,new_password
    );
    reg [3:0]current_password;
    reg [1:0]state, next_state;
    localparam s0 = 2'b00,
               s1 = 2'b01,
               s2 = 2'b10;               
    always @(posedge clk or posedge rst)
    begin
            if(rst)
            begin
                   state <= s0;
                   current_password <= 4'd12;
                   new_password_out <= 4'b0000;
            end
            else
            begin
                    if(state == s2)
                    begin
                        current_password <= new_password;
                        new_password_out[3:0] <= new_password[3:0];
                    end
                    else if(state != s2)
                    begin
                        new_password_out <= 4'b0000;
                    end
                    state <= next_state;
            end
    end
             
    always @(*)
    begin
            case (state)
             s0:
                begin
                    next_state = ((current_password == input_password) && ok) ? s1:s0 ;
                    unlock = 1'b0;
                end
             s1:
                begin
                    unlock = 1'b1;
                    if(done)
                        next_state = s0;
                    else if(password_change)
                        next_state = s2;
                    else
                        next_state = s1;
                 end
             s2:
                 begin
                    next_state = (ok) ? s0:s2;
                    unlock = 1'b0;

                 end  
              default:
                   begin
                      unlock = 1'b0;
                   end 
            endcase
  end
endmodule
