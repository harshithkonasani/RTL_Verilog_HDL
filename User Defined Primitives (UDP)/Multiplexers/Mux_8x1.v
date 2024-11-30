`timescale 1ns / 1ps

primitive mux2(output y1,
input  sel_in,
input  a_in, b_in);

table 
    // sel_in  a_in  b_in    :  y1
        0       0     ?       :  0;
        0       1     ?       :  1;
        1       ?     0       :  0;
        1       ?     1       :  1;
 endtable
 endprimitive
module mux_8x1(
output y1,
input [7:0] a_in,
input [2:0] sel_in
    );
    
    wire w1,w2,w3,w4,w5,w6;
    mux2 m1(w1, sel_in[0], a_in[0], a_in[1]);
    mux2 m2(w2, sel_in[0], a_in[2], a_in[3]);
    mux2 m3(w3, sel_in[0], a_in[4], a_in[5]);
    mux2 m4(w4, sel_in[0], a_in[6], a_in[7]);
    mux2 m5(w5, sel_in[1], w1, w2);
    mux2 m6(w6, sel_in[1], w3, w4);
    mux2 m7(y1, sel_in[2], w5, w6);
    
    
endmodule
