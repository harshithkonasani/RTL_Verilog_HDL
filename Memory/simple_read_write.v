`timescale 1ns / 1ps

module memory_operation_basic #(parameter data_size = 8, address = 4)(
    input clk,
    input [address-1:0] address_in,
    input write_en, read_en,cs,
    input [data_size-1:0] data_in,
    output [data_size-1:0] data_out
    );
  reg [data_size-1:0]memory[0:15];        // depth = 16
    
    reg [data_size-1:0] temp;
    
 always @(posedge clk)
 begin  
        if(cs && write_en)
            memory[address_in] <= data_in;
end
always @(posedge clk)
begin
        if (cs && ~write_en && ~read_en) 
             temp  <= memory[address_in];
end
       assign data_out  = (cs && ~write_en && read_en)?temp:8'bzzzz_zzzz;
endmodule
