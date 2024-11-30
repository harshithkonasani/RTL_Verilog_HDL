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


//TESTBENCH /////////////////////////////////////////////////////////////////////////////////////////////////////////////


module tb_memory_basics();
parameter data_size = 8;
parameter address = 2;
reg [address-1:0] address_in;
reg clk;
reg write_en, read_en,cs;
reg [data_size-1:0] data_in;
wire [data_size-1:0] data_out;

 memory_operation_basic #(.data_size(8), .address(2)) DUT (
    .clk(clk), .write_en(write_en), .read_en(read_en),
    .cs(cs), .data_in(data_in), 
    .address_in(address_in), .data_out(data_out)
 );
 
 always #20 clk = ~clk;
 initial 
 begin
     clk = 0;
     data_in = 0;
     address_in =0;
     cs = 0;
     write_en = 0;
     read_en = 0;
     
#20  cs = 1; 
#20  write_en = 1; address_in = 4'b00;  data_in = 8'b1000_1010;
#20  write_en = 1; address_in = 4'b01;  data_in = 8'b1110_1010;
#20  write_en = 1; address_in = 4'b10;  data_in = 8'b1100_1110;
#20  write_en = 1; address_in = 4'b11;  data_in = 8'b1010_1010;

#20  write_en = 0; address_in = 4'b00;  read_en = 1;
#20  write_en = 0; address_in = 4'b01;  read_en = 1;
#20  write_en = 0; address_in = 4'b10;  read_en = 1;
#20  write_en = 0; address_in = 4'b11;  read_en = 1;


#200 $finish();
     
    
 end
endmodule
