`timescale 1ns / 1ps

module alu #
(
     parameter DATA_WIDTH = 8,
     parameter ADDR_WIDTH = 4
)
(
     input [DATA_WIDTH-1:0]a_in_temp,
     input [DATA_WIDTH-1:0]b_in_temp,
     input [ADDR_WIDTH-1:0]opcode_temp,
    
     input clk, rst,
     
     output [DATA_WIDTH-1:0]data_out_temp,
     output carry_out_temp
);


 reg [DATA_WIDTH:0]res_temp;

 always@(*)
 begin
    case(opcode_temp)
         4'b0000 : res_temp = a_in_temp;
         4'b0001 : res_temp = a_in_temp + b_in_temp;
         4'b0010 : res_temp = a_in_temp + b_in_temp + 1;
         4'b0011 : res_temp = a_in_temp - b_in_temp;
         4'b0100 : res_temp = a_in_temp - b_in_temp - 1;
         4'b0101 : res_temp = a_in_temp + 1;
         4'b0110 : res_temp = a_in_temp - 1;
         4'b0111 : res_temp = b_in_temp;
        
         4'b1000 : res_temp = a_in_temp | b_in_temp;
         4'b1001 : res_temp = a_in_temp ^ b_in_temp;
         4'b1010 : res_temp = a_in_temp & b_in_temp;
         4'b1011 : res_temp = ~a_in_temp;
         default : res_temp = 0;
    endcase
 end
 
 assign {carry_out_temp,data_out_temp} = res_temp;
endmodule
