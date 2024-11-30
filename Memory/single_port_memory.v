`timescale 1ns / 1ps

module memory_inout #(parameter data_size = 8, address = 4)(
    input clk,
    input [address-1:0] address_in,
    input write_en, read_en,cs,
    inout [data_size-1:0] data_io
    );
    reg [data_size-1:0]memory[0:15];
    reg [data_size-1:0] temp;
    
 always @(posedge clk)
 begin  
        if(cs && write_en)
            memory[address_in] <= data_io;
end
always @(posedge clk)
begin
        if (cs && ~write_en && ~read_en) 
             temp  <= memory[address_in];
end
       assign data_io  = (cs && ~write_en && read_en)?temp:8'bzzzz_zzzz;
endmodule
