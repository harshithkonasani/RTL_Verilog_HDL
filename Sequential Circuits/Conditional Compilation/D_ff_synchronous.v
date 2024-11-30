`timescale 1ns / 1ps


`define INCLUDE_RST
module dff_synchronous(
    input clk,
    `ifdef INCLUDE_RST
        input rst,
    `endif
    input [7:0] d_in,
    output reg [7:0] d_out
    );
    
    always @(posedge clk)
    begin   
    `ifdef INCLUDE_RST
        if(!rst)
        begin
            d_out <= 8'b0;
        end
     `endif
        else
        begin
            d_out <= d_in;
         end 
    end
endmodule
