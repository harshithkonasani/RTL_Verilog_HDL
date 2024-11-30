`timescale 1ns / 1ps

`define N 16
module tb_even_parity();
reg [`N-1:0] d_in;
wire y_out;

even_parity DUT (
    .d_in(d_in),
    .y_out(y_out)
    );
    
    always #10 d_in = $random();
    initial 
    begin
    d_in = 0;
    end
endmodule
