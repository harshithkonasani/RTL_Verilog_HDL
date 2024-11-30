// This state machine is designed to detect even number of toggles in serial data sequence
// NOTE : This does not work for infinite data sequence. 

`timescale 1ns / 1ps

typedef enum {
    RESET,
    DET_1,
    DET_0,
    DETECTED_0,
    DETECTED_1,
    DONE
}mstate;

module even_toggle(
    input wire d_in,
    input wire clk,
    input wire reset_n,
    output reg q_out
    );
    mstate state;
    always_ff @(posedge clk) begin
        if(!reset_n) begin
            state <= RESET;
            q_out <= 1'b1;
        end
        else begin
            case(state)
                RESET : begin
                    if(d_in) begin
                        state <= DET_1;
                        q_out <= q_out;
                    end
                    else begin
                        state <= DET_0;
                        q_out <= q_out;
                    end
                end
                DET_0 : begin
                    if(d_in) begin
                        state <= DETECTED_1;
                        q_out <= 1'b0;
                    end
                    else begin
                        state <= DET_0;
                        q_out <= 1'b0;
                    end
                end
                DET_1 : begin
                    if(d_in) begin
                        state <= DET_1;
                        q_out <= 1'b0;
                    end
                    else begin
                        state <= DETECTED_0;
                        q_out <= 1'b0;
                    end
                end
                DETECTED_0 : begin
                    if(d_in) begin
                        state <= DONE;
                        q_out <= 1;
                    end
                    else begin
                        state <= DETECTED_0;
                        q_out <= 1'b0;
                    end
                end
                DETECTED_1 : begin
                    if(d_in) begin
                        state <= DETECTED_1;
                        q_out <= 1'b0;
                    end
                    else begin
                        state <= DONE;
                        q_out <= 1'b1;
                    end
                end
                DONE : begin
                    if(d_in) begin
                        state <= DET_1;
                        q_out <= 1'b0;
                    end
                    else begin
                        state <= DETECTED_0;
                        q_out <= 1'b0;
                    end
                end
                default : begin 
                    state <= RESET;
                    q_out <= 1'b0;
                end
            endcase
        end
    end
endmodule

