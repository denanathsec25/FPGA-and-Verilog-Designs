`timescale 1ns / 1ps


module control_unit(
    output reg mi,ri,ro,ii,io,co,cl,ce,ai,ao,al,fe,bi,oi,hlt,
    output led_in,
    input [3:0]opcode,
    input clk,rst,flag_carry,flag_zero,start
    );
    parameter NOP = 4'd0,
              LDA = 4'd1,
              ADD = 4'd2,
              SUB = 4'd3,
              STA = 4'd4,
              JMP = 4'd5,
              IN  = 4'd6,
              LDI = 4'd7,
              SHL = 4'd8,
              AND = 4'd9,
              SHR = 4'd10,
              XOR = 4'd11,
              JZ  = 4'd12,
              JNZ = 4'd13,
              OUT = 4'd14,
              HLT = 4'd15;
              
   localparam IDLE = 3'd0,
              T1 = 3'd1,
              T2 = 3'd2,
              T3 = 3'd3,
              T4 = 3'd4,
              T5 = 3'd5,
              T6 = 3'd6,
              HALT = 3'd7;
              
    reg [2:0]state,next_state;
    always @(posedge clk or posedge rst)
    begin
        if(rst)
        begin
            state <= IDLE;
        end
        else
            state <= next_state;
    end
           
    always @(*)
    begin
    {mi,ri,ro,ii,io,co,cl,ce,ai,ao,al,fe,bi,oi,hlt} = 15'd0;
    next_state = state;
    case (state)
        IDLE:
        begin
            next_state = (start) ? T1: IDLE;
        end
        T1:
        begin
            mi=1'b1;
            co=1'b1;
            next_state = T2;
        end
        T2:
        begin
            ii = 1'b1;
            ro = 1'b1;
            next_state = T3;
        end
        T3:
        begin
            ce = 1'b1;
            next_state = T4;
        end
        T4:
        begin
        case(opcode)
                NOP:
                begin
                    next_state = T1;
                end
                LDA:
                begin
                    io = 1'b1;
                    mi = 1'b1;
                    next_state = T5;
                end
                ADD:
                begin
                    io = 1'b1;
                    mi = 1'b1;
                    next_state = T5;
                end
                SUB:
                begin
                    io = 1'b1;
                    mi = 1'b1;
                    next_state = T5;
                end
                STA:
                begin
                    io = 1'b1;
                    mi = 1'b1;
                    next_state = T5;
                end
                JMP:
                begin
                    io = 1'b1;
                    cl = 1'b1;
                    next_state = T1;
                end
                IN:
                begin
                   if(start)
                   begin
                        ai = 1'b1;
                        next_state = T1;
                   end
                   else
                   begin
                        ai = 1'b0;
                        next_state = T4;
                   end
                end
                LDI:
                begin
                    io = 1'b1;
                    ai = 1'b1;
                    next_state = T1;
                end
                SHL:
                begin
                    al = 1'b1;
                    ai = 1'b1;
                    fe = 1'b1;
                    next_state = T1;
                end
                AND:
                begin
                    io = 1'b1;
                    mi = 1'b1;
                    next_state = T5;
                end
                SHR:
                begin
                    al=1'b1;
                    ai = 1'b1;
                    fe = 1'b1;
                    next_state = T1;
                end
                XOR:
                begin
                    io = 1'b1;
                    mi = 1'b1;
                    next_state = T5;
                end
                JZ:
                begin
                   if(flag_zero)begin
                        io = 1'b1;
                    cl = 1'b1;
                    
                   end
                   next_state = T1;
                end
                JNZ:
                begin
                    if(!flag_zero)begin
                        io = 1'b1;
                    cl = 1'b1;
                   end 
                   next_state = T1;
                end
                OUT:
                begin
                    ao = 1'b1;
                    oi = 1'b1;
                    next_state = T1;
                end
                HLT:
                begin
                    hlt = 1'b1;
                    next_state = HALT;
                end
                default: begin
                    next_state = T1;
                end
            endcase
        end
        T5:
        begin
        case(opcode)
            AND:
            begin
                ro = 1'b1;
                bi = 1'b1;
                next_state = T6;
            end
            XOR:
            begin
                ro = 1'b1;
                bi =1'b1;
                next_state = T6;
            end
            ADD:
            begin
                ro = 1'b1;
                bi = 1'b1;
                next_state = T6;
            end
            SUB:
            begin
                ro = 1'b1;
                bi = 1'b1;
                next_state = T6;
            end
            LDA:
            begin
                ai = 1'b1;
                ro = 1'b1;
                next_state = T1;
            end
            STA:
            begin
                ao = 1'b1;
                ri = 1'b1;
                next_state = T1;
            end
            default: begin
                next_state = T1;
            end
            endcase
        end
        T6:
        begin
        case(opcode)

        ADD:
        begin
            al = 1'b1;
            ai = 1'b1;
            fe = 1'b1;
            next_state = T1;
        end

        SUB:
        begin
            al = 1'b1;
            ai = 1'b1;
            fe = 1'b1;
            next_state = T1;
        end

        AND:
        begin
            al = 1'b1;
            ai = 1'b1;
            fe = 1'b1;
            next_state = T1;
        end

        XOR:
        begin
            al = 1'b1;
            ai = 1'b1;
            fe = 1'b1;
            next_state = T1;
        end
        
        default: begin
            next_state = T1;
         end
        
        endcase
        
        end
     HALT:
        begin
            hlt = 1'b1;
            next_state = HALT;
        end
    endcase 
    end
    
    assign led_in = (opcode == IN) ? 1:0;
              
endmodule
