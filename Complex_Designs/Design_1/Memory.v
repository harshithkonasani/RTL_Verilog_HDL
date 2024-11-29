`timescale 1ns / 1ps

module memory #
(
 parameter DATA_WIDTH = 8,
 parameter ADDR_WIDTH = 4
)
(
 input clk,
 input CS,wr_en,
 input [DATA_WIDTH-1:0] data_in,
 input [ADDR_WIDTH-1:0] addr_in,

 output [DATA_WIDTH-1:0] data_out
);

 reg [DATA_WIDTH-1:0]memory[0:15];
 reg [DATA_WIDTH-1:0]temp_reg;

 always@(posedge clk)
 begin
     if(CS && wr_en)
         memory[addr_in]<=data_in;
end
    
 always@(posedge clk)
 begin
     if(CS && !wr_en)
         temp_reg<=memory[addr_in];
 end
    
 assign data_out = (CS&&!wr_en)?temp_reg:{DATA_WIDTH{1'b0}};

endmodule
