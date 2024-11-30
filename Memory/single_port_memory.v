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




//TESTBENCH FOR ABOVE MEMORY 

module tb_memory_io();
parameter data_size = 8, address = 4;
reg clk;
reg [address-1:0] address_in;
reg write_en, read_en,cs;
wire [data_size-1:0] data_io;

memory_inout #(.data_size(8), .address(4)) DUT (
.clk(clk), .address_in(address_in), .write_en(write_en),
.read_en(read_en), .cs(cs), .data_io(data_io) );

reg [data_size-1:0] temp;
assign data_io = (cs && write_en && read_en)?temp:8'bzzzz_zzzz;
always #5 clk = ~clk;
always #10 address_in = address_in +1;
always #160 write_en = ~write_en;
always #400 cs = ~cs;
always #160 read_en = ~read_en;
//always #10 data_io = data_io + 1;
always #10 temp = $random();  // used to generate randpm data

initial 
begin
    temp = 0;
    write_en = 1;
    address_in =0;
    read_en = 0;
    clk = 0;
    cs = 1;
#500 $finish();
end
endmodule
