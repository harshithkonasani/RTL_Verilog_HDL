// verilog code to check wheter the given number is of odd parity or even parity using generate block

`timescale 1ns / 1ps


`define N 16
module even_parity(
    input [`N-1:0] d_in,
    output y_out
    );
    
    parameter eo=1;
    
    generate 
    if(eo)
        even_N e1(.y_out(y_out), .d_in(d_in));
    else
        odd_N o1(.y_out(y_out), .d_in(d_in));
    endgenerate
   
endmodule
