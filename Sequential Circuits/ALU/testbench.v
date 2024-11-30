`timescale 1ns / 1ps


module tb_alu();
reg clk,rst;
reg [3:0] a_in, b_in;
reg c_in;
reg [2:0] opcode;
wire [3:0] out_not_reg, out_and_reg, out_xor_reg;
wire [3:0] sum_out_reg;
wire carry_out_reg;

alu_4bit DUT(
 clk,rst,
 a_in, b_in,
 c_in,
opcode,
out_not_reg, out_and_reg, out_xor_reg,
 sum_out_reg,
 carry_out_reg
);

always #5 clk = ~clk;
always #20 opcode = opcode + 1;
always #5 a_in = $random;
always #10 b_in = $random;
initial begin
    a_in = 4'b0101; b_in = 4'b0010;
    c_in = 0;
    opcode = 0;
    clk=0;
end
endmodule
