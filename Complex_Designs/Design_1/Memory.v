`timescale 1ns / 1ps

module memory_data #
(
    parameter address = 4,
    parameter data_width = 8
)
(
     input [data_width-1:0] d_in,
     input clk, en,cs,
     input [address-1:0] address_in,
     output [data_width-1:0] q_out
 );
 
 reg [data_width-1:0] memory[0:15];
 reg [data_width-1:0] temp;
 
 
 //memory storage logic
 always @(posedge clk)
    begin
        if(cs && en)
            memory[address_in] <= d_in;
    end  
              
// temp storage
  always @(posedge clk)
    begin
        if(cs && !en)
            temp <= memory[address_in];
    end
 

assign q_out = (cs&&!en)?temp:{data_width{1'b0}};
                
endmodule




