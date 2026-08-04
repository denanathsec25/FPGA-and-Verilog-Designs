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
    output reg out,
    output reg new_pass,
    input clk,rst,ok,pass_change,
    input [3:0]input_password,new_password
    );
    reg [3:0]stored_password;
    reg [1:0]state, next_state;
    localparam s0 = 2'b00,
               s1 = 2'b01,
               s2 = 2'b10;
                        
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
            end
    end
             
    always @(*)
    begin
            case (state)
            // ok = 1 => check password and 
            s0:
            next_state = (stored_password == input_password && ok && pass_change)? s1 : s2;
            //pass_change = 1 change password
            s1:
            begin
                 stored_password <= new_password; 
                 new_pass = 1'b1;
                 #20;
                 next_state = s0;  
            end       
            s2:
            begin
                 out = 1'b1;
                 #20;
                 next_state = s0;
            end      
            endcase
  end
endmodule
