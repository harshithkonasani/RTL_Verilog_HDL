`timescale 1ns / 1ps

module top #
(
 parameter DATA_WIDTH = 8,
 parameter ADDR_WIDTH = 4
)
(
 input clk,
 input reset_n,
 input [ADDR_WIDTH-1:0]opcode_in,
 input CS_0,CS_1,
 input wr_en_0,wr_en_1,
 input [ADDR_WIDTH-1:0]addr_in_0,addr_in_1,
 input [DATA_WIDTH-1:0]a_in,
 input [DATA_WIDTH-1:0]b_in,

 output reg carry_out,
 output reg [DATA_WIDTH-1:0]result_out
);

 wire [DATA_WIDTH-1:0]data_out_0,data_out_1;
 wire [DATA_WIDTH-1:0]data_out_temp;
 wire carry_out_temp;


 reg [ADDR_WIDTH-1:0]opcode_temp;

 memory ram_0(
     .clk(clk),
     .CS(CS_0),
     .wr_en(wr_en_0),
     .data_in(a_in),
     .addr_in(addr_in_0),
     .data_out(data_out_0)
);
 memory ram_1(
     .clk(clk),
     .CS(CS_1),
     .wr_en(wr_en_1),
     .data_in(b_in),
     .addr_in(addr_in_1),
     .data_out(data_out_1)
);

 always@(posedge clk,negedge reset_n)
 begin
    if(!reset_n)
        opcode_temp <= 4'd0;
    else
        opcode_temp <= opcode_in;
 end

 alu alu0(
     .a_in_temp(data_out_0),
     .b_in_temp(data_out_1),
     .opcode_temp(opcode_temp),
     .data_out_temp(data_out_temp),
     .carry_out_temp(carry_out_temp)
);

always@(posedge clk,negedge reset_n)
 begin
    if(!reset_n)
        {carry_out,result_out} <= 0;
    else
        {carry_out,result_out} <= {carry_out_temp,data_out_temp};
 end 
endmodule
