`timescale 1ns / 1ps

module alu_4bit(
    input clk,rst,
    input [3:0] a_in, b_in,
    input c_in,
    input [2:0] opcode,
    output reg [3:0] out_not_reg, out_and_reg, out_xor_reg,
    output reg [3:0] sum_out_reg,
    output reg carry_out_reg
    );
    
    wire c1,c2,c3;
    
    reg [3:0] a_reg, b_reg;
    reg c_reg;
    reg [2:0] opcode_reg;
    
    wire [3:0] out_not, out_and, out_xor;
    wire [3:0] sum_out;
    wire carry_out;
    
    
    //////////////////////////////////////////////////////////////////////////////
    always @(posedge clk, negedge rst)
    begin
        if(!rst)
            a_reg <= 0;
        else
            a_reg <= a_in;
    end
    
    //////////////////////////////////////////////////////////////////////////
    always @(posedge clk, negedge rst)
    begin
        if(!rst)
            b_reg <= 0;
        else
            b_reg <= b_in;
    end
    
    ///////////////////////////////////////////////////////////////////////////////
    always @(posedge clk, negedge rst)
    begin
        if(!rst)
            c_reg <= 0;
        else
            c_reg <= c_in;
    end
    
    /////////////////////////////////////////////////////////////////////////////
    always @(posedge clk, negedge rst)
    begin
        if(!rst)
            opcode_reg <= 0;
        else
            opcode_reg <= opcode;
    end
    
    ////////////////////////////////////////////////////////////////////////////
    always @(posedge clk, negedge rst)
    begin
        if(!rst)
            out_not_reg <= 0;
        else
            out_not_reg <= out_not;
    end
    
    ////////////////////////////////////////////////////////////////////////////////
    always @(posedge clk, negedge rst)
    begin
        if(!rst)
            out_and_reg <= 0;
        else
            out_and_reg <= out_and;
    end
    
    ///////////////////////////////////////////////////////////////////////////////
    always @(posedge clk, negedge rst)
    begin
        if(!rst)
            out_xor_reg <= 0;
        else
            out_xor_reg <= out_xor;
    end
    
    ///////////////////////////////////////////////////////////////////////////////
    always @(posedge clk, negedge rst)
    begin
        if(!rst)
            sum_out_reg <= 0;
        else
            sum_out_reg <= sum_out;
    end
    
    //////////////////////////////////////////////////////////////////////////////
    always @(posedge clk, negedge rst)
    begin
        if(!rst)
            carry_out_reg <= 0;
        else
            carry_out_reg <= carry_out;
    end
    
    alu_1bit a1(.a_in(a_reg[0]), .b_in(b_reg[0]),.c_in(c_reg), 
                 .opcode(opcode_reg), .out_not(out_not[0]), .out_and(out_and[0]),
                 .out_xor(out_xor[0]), .sum_out(sum_out[0]), .carry_out(c1));
    
    alu_1bit a2(.a_in(a_reg[1]), .b_in(b_reg[1]),.c_in(c1), 
                 .opcode(opcode_reg), .out_not(out_not[1]), .out_and(out_and[1]),
                 .out_xor(out_xor[1]), .sum_out(sum_out[1]), .carry_out(c2));
    
    alu_1bit a3(.a_in(a_reg[2]), .b_in(b_reg[2]),.c_in(c2), 
                 .opcode(opcode_reg), .out_not(out_not[2]), .out_and(out_and[2]),
                 .out_xor(out_xor[2]), .sum_out(sum_out[2]), .carry_out(c3));
            
    alu_1bit a4(.a_in(a_reg[3]), .b_in(b_reg[3]),.c_in(c3), 
                 .opcode(opcode_reg), .out_not(out_not[3]), .out_and(out_and[3]),
                 .out_xor(out_xor[3]), .sum_out(sum_out[3]), .carry_out(carry_out)); 
endmodule
