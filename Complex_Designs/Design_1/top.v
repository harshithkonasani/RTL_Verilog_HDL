`timescale 1ns / 1ps

module top #
(
    parameter data_width = 8,
    parameter op_size = 4,
    parameter address = 4
)
(
    input [data_width-1:0] a_in,b_in,
    input clk, en0,cs0,rst,en1,cs1,
    input [op_size-1:0] opcode,
    output [data_width-1:0] q_out,
    output c_out
);
    wire [data_width-1:0] a_temp, b_temp;
   
    memory_data m1(.clk(clk), .en(en0), .cs(cs0), .d_in(a_in), .q_out(a_temp));
    memory_data m2(.clk(clk), .en(en1), .cs(cs1), .d_in(b_in), .q_out(b_temp));
    ALU a1(.clk(clk), .rst(rst), .a_in(a_temp), .b_in(b_temp), .q_out(q_out), .opcode(opcode), .c_out(c_out));
endmodule





