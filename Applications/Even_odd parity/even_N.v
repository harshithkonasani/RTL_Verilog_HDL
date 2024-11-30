//for even number of ones xnor output will be high

`timescale 1ns / 1ps

`define N 16
module even_N(
    input [`N-1:0] d_in,
    output y_out
    );
    
    assign y_out = ~(^d_in);
endmodule
