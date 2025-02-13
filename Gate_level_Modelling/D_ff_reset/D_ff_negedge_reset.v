`timescale 1ns / 1ps

module dff_reset_negedge (
    input d_in,
    input clk,
    input reset_n,
    output q_out
    );
    
    wire y1,ybar,y1_nand,qbar,q1_nand,q1;
    
    cmos_s c1(y1,d_in,clk,~clk);
    nand u1(y1_nand, reset_n, y1);
    cmos_s c2(y1, ybar, ~clk, clk);
    
    assign ybar = ~y1_nand;
    
    cmos_s c3(q1, y1_nand, ~clk, clk);
    cmos_s c4(q1,q1_nand,clk, ~clk);
    assign q_out = ~q1;
    
    nand u2(q1_nand,q_out,reset_n);
endmodule
