`timescale 1ns / 1ps

module d_FF_pos_clk(
    input d, clk,
    output q,qbar 
    );
    
    wire s1;
    wire qb;
    neg_latch p1(d, clk, s1, qb);
    pos_latch n1(s1, clk, q, qbar);

endmodule
