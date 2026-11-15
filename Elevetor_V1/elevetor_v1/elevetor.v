`timescale 1ns / 1ps

module elevetor(
    output reg [1:0] current_floor,
    output reg door_open,
    input [1:0] destination,
    input rst,
    input clk
);

    localparam clk_freq = 100000000;

    reg [31:0] clock_count;
    reg one_second_enable;

    // 1 second clock enable
    always @(posedge clk or posedge rst)
    begin
        if(rst)
        begin
            clock_count <= 0;
            one_second_enable <= 0;
        end
        else
        begin
            if(clock_count == clk_freq - 1)
            begin
                clock_count <= 0;
                one_second_enable <= 1;
            end
            else
            begin
                clock_count <= clock_count + 1;
                one_second_enable <= 0;
            end
        end
    end

    reg [2:0] state, next_state;

    localparam s0 = 2'b00,   // idle
               s1 = 2'b01,   // move up
               s2 = 2'b10;   // move down

    // Elevator FSM
    always @(posedge clk or posedge rst)
    begin
        if(rst)
        begin
            state <= s0;
            next_state <= s0;
            current_floor <= 2'b00;
            door_open <= 0;
        end

        else if(one_second_enable)
        begin
            case(state)

                // IDLE
                s0:
                begin
                    if(current_floor == destination)
                    begin
                        door_open <= 1;
                        next_state <= s0;
                    end

                    else if(destination < current_floor)
                    begin
                        door_open <= 0;
                        next_state <= s2;
                    end

                    else if(destination > current_floor)
                    begin
                        door_open <= 0;
                        next_state <= s1;
                    end
                end

                // MOVE UP
                s1:
                begin
                    current_floor <= current_floor + 1;

                    if(current_floor == destination - 1)
                        next_state <= s0;
                    else
                        next_state <= s1;
                end

                // MOVE DOWN
                s2:
                begin
                    current_floor <= current_floor - 1;

                    if(current_floor == destination + 1)
                        next_state <= s0;
                    else
                        next_state <= s2;
                end

                default:
                begin
                    next_state <= s0;
                end

            endcase

            state <= next_state;
        end
    end

endmodule