`timescale 1ns / 1ps

module cmos_s(
    output y_out,
    input a_in,
    input s,
    input sbar
    );
    
    supply1 vdd;
    supply0 gnd;
    
    pmos p1(y_out, a_in, sbar);
    nmos n1(y_out, a_in, s);
endmodule
