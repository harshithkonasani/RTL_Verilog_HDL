`timescale 1ns / 1ps

primitive sum_pre(output sum_out,
                    input a_in, b_in);

   table 
        // a_in   b_in  : sum_out
             0     0    :  0;
             0     1    :  1;
             1     0    :  1;
             1     1    :  0;
   endtable
 endprimitive

primitive carry_pre(output carry_out,
                    input a_in, b_in);

   table 
        // a_in   b_in  : carry_out
             0     0    :  0;
             0     1    :  0;
             1     0    :  0;
             1     1    :  1;
   endtable
 endprimitive
module ha(
    input a_in,b_in,
    output sum_out, carry_out
    );
    
    sum_pre s1(sum_out,a_in,b_in);
    carry_pre c1(carry_out, a_in, b_in);
endmodule
