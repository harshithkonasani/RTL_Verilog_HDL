`timescale 1ns / 1ps

module dual_port_memory #(parameter data_size = 8, address = 4)(
    input clk,
    input [address-1:0] address_in0, address_in1,
    input write_en0, read_en0,cs0,write_en1, read_en1,cs1,
    inout [data_size-1:0] data_io0,
    inout [data_size-1:0] data_io1
    );
    reg [data_size-1:0]memory[0:15];
    reg [data_size-1:0] temp1;
    reg [data_size-1:0] temp2;
    
 always @(posedge clk)
 begin  
        if(cs0 && write_en0)
            memory[address_in0] <= data_io0;
end
always @(posedge clk)
begin
        if (cs0 && ~write_en0 && ~read_en0) 
             temp1  <= memory[address_in0];
end
       assign data_io0  = (cs0 && ~write_en0 && read_en0)?temp1:8'bzzzz_zzzz;
       
always @(posedge clk)
 begin  
        if(cs1 && write_en1)
            memory[address_in1] <= data_io1;
end
always @(posedge clk)
begin
        if (cs1 && ~write_en1 && ~read_en1) 
             temp2  <= memory[address_in1];
end
       assign data_io1  = (cs1 && ~write_en1 && read_en1)?temp2:8'bzzzz_zzzz;
endmodule

  
