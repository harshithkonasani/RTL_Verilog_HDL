`timescale 1ns / 1ps
module dff_pos_neg #
(
    parameter N = 8
)
(
    input clk, rst_n,
    input [N-1:0] d_in,
    output reg [N-1:0] q_out, qn_out,
    output [N-1:0] y_out
    );
    
    always @(posedge clk, negedge rst_n)
    begin
        if(~rst_n)
            q_out <= 0;
        else    
            q_out <= d_in;
    end 
    
    always @(negedge clk, negedge rst_n)
    begin
        if(~rst_n)
            qn_out <= 0;
        else    
            qn_out <= d_in;
    end  
    
    assign y_out = (clk)?q_out:qn_out; 
    
    specify
       
        specparam tr = 2;
        specparam tf = 3;
        specparam clktoq1 = 2;
        //specparam clktoq2 = 5;
         
       (posedge clk *> (y_out+:d_in)) = (tr, tf);
        (clk=>q_out) = clktoq1;
       (negedge clk *> (y_out+:d_in)) = (tr,tf);
        //(clk=>qn_out) = clktoq1;
    endspecify  
endmodule
