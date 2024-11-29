`timescale 1ns / 1ps

module tb_top #
(
 parameter DATA_WIDTH = 8,
 parameter ADDR_WIDTH = 4
)
();

 reg clk;
 reg reset_n;
 reg [ADDR_WIDTH-1:0]opcode_in;
 reg CS_0,CS_1;
 reg wr_en_0,wr_en_1;
 reg [ADDR_WIDTH-1:0]addr_in_0,addr_in_1;
 reg [DATA_WIDTH-1:0]a_in;
 reg [DATA_WIDTH-1:0]b_in;

 wire carry_out;
 wire [DATA_WIDTH-1:0]result_out;
 
 
 top #(
     .DATA_WIDTH(8),
     .ADDR_WIDTH(4)
 )
    DUT
 (
     .clk(clk),
     .reset_n(reset_n),
     .opcode_in(opcode_in),
     .CS_0(CS_0),.CS_1(CS_1),
     .wr_en_0(wr_en_0),.wr_en_1(wr_en_1),
     .addr_in_0(addr_in_0),.addr_in_1(addr_in_1),
     .a_in(a_in),
     .b_in(b_in),
     .carry_out(carry_out),
     .result_out(result_out)
 );
 initial begin
    clk = 1'b0;
 forever #5 clk = ~clk;
 end

 always #10 addr_in_0 = addr_in_0 + 1;
 always #10 addr_in_1 = addr_in_1 + 1;
 always #10 a_in = $random();
 always #10 b_in = $random();
 always #500 CS_0 = ~CS_0;
 always #500 CS_1 = ~CS_1;

 initial begin
     reset_n = 0; addr_in_0 = 0; addr_in_1 = 0; a_in = 0; b_in = 0; wr_en_0 = 0;
     #5 reset_n = 1; wr_en_0 = 1; wr_en_1 = 1; CS_0 = 1; CS_1 = 1;
     #160 wr_en_0 = 0; wr_en_1 = 0;
     #1000 $finish();
 end

 initial begin
     #160; opcode_in = 0;
 forever #10 opcode_in = opcode_in + 1;
 end

endmodule
