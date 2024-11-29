`timescale 1ns / 1ps

module ALU #
(
    parameter data_width = 8,
    parameter op_size = 4
)
(
    input [data_width-1:0] a_in,
    input [data_width-1:0] b_in,
    input [op_size-1:0] opcode,
    input clk, rst,
    output [data_width-1:0] q_out,
    output c_out
    );
    
    reg [op_size-1:0] op_out;
    reg [data_width:0] result;
    
    //opcode register
    always @(posedge clk, negedge rst)
   begin
        if(~rst)
            op_out <= 0;
        else
            op_out <= opcode;
  end
  
    always @(*)
    begin
        case(op_out)
            4'b0000 : result = a_in;
            4'b0001 : result = a_in + b_in;
            4'b0010 : result = a_in + b_in + 1;
            4'b0011 : result = a_in - b_in;
            4'b0100 : result = a_in - b_in -1;
            4'b0101 : result = a_in + 1;
            4'b0110 : result = a_in - 1;
            4'b0111 : result = b_in;
            4'b1000 : result = a_in | b_in;
            4'b1001 : result = a_in ^ b_in;
            4'b1010 : result = a_in & b_in;
            4'b1011 : result = ~a_in;
          default : result = {data_width+1{1'b0}};
         endcase
   end
   
   assign q_out = result[data_width-1:0];
   assign c_out = result[data_width];
   
endmodule

