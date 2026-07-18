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
    output reg out,new_pass,
    input clk,rst,ok,decision,
    input [3:0]input_password,new_password
    );
    reg [3:0]stored_password;
    reg state, next_state;
    localparam s0 = 2'b0,
               s1 = 2'b1;
                        
    always @(posedge clk or posedge rst)
    begin
            if(rst)
            begin
                   state <= s0;
                   stored_password <= 4'd12;
            end
            else
            begin
                    state <= next_state;
                    if ((state == s1) && decision)
                           stored_password <= new_password;
            end
    end
             
    always @(*)
    begin
            stored_password = new_password;
            state = s0;
            case (state)
            // ok = 1 => check password and 
            s0:
            if(stored_password == input_password && ok == 1)
            begin
                next_state = s1;
                
            end
            else 
                next_state <= s0;
            //decision = 1 change password
            s1:
            if(decision == 1)
            begin
                out = 1'b1;
                if (decision)
                begin
                    new_pass = 1'b1;
                    next_state = s0;
                end
             end             
             endcase
  end
endmodule
