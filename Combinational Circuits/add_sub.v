//opcode = 1 --> subtraction; else addition
`timescale 1ns / 1ps

module add_sub_1bit(
    input a_in,b_in,opcode,
    output sum_out,carry_out
    );
    reg temp;
    always @(*)
    begin
        if(opcode)
           temp = (~b_in);
        else
           temp =  b_in;
     end
     assign {carry_out, sum_out}    = a_in + temp + opcode;
     
     
endmodule
