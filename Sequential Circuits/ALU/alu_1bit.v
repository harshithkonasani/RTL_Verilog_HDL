`timescale 1ns / 1ps

module alu_1bit(
    input a_in,b_in,c_in,
    input [2:0] opcode,
    output reg out_not, out_and, out_xor,
    output  reg sum_out, carry_out
    );
    
    wire temp = opcode[2]?(~b_in):(b_in);
    wire temp1 = opcode[2]?(~c_in):(c_in);
    always @(*)
    begin
        case(opcode)
            3'b000: begin
                out_not = ~a_in;
                out_and = 1'b0;
                out_xor = 1'b0;
                {carry_out, sum_out} = 1'b0;
            end
            3'b001: begin
                out_and = a_in & b_in;
                out_not = 1'b0;
                out_xor = 1'b0;
                {carry_out, sum_out} = 1'b0;
            end
            3'b010: begin
                out_xor = a_in ^ b_in;
                out_and = 1'b0;
                out_not = 1'b0;
                {carry_out, sum_out} = 1'b0;
            end
            3'b011: begin
                {carry_out, sum_out} = a_in + temp + temp1 + opcode[2];
                out_and = 1'b0;
                out_xor = 1'b0;
                out_not = 1'b0;
            end 
            3'b100: begin
                {carry_out, sum_out} = a_in + temp + temp1 + opcode[2];
                out_and = 1'b0;
                out_xor = 1'b0;
                out_not = 1'b0;
            end 
            default : begin
                out_not = 1'b0;
                out_and = 1'b0;
                out_xor = 1'b0;
                {carry_out, sum_out} = 2'b0;
            end
        endcase
    end 
endmodule

