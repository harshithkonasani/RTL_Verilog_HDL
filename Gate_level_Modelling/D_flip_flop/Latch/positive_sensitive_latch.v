`timescale 1ns / 1ps

module pos_latch(
    input d, en,
    output q,qbar 
    );
    
    wire e, nen;
    not n1(nen, en);
    
    cmos_s c1(e,d,en, nen);
    not n2(qbar,e);
    not n3(q, qbar);
    
    cmos_s c2(e,q,nen,en);

endmodule
