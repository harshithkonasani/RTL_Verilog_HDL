`timescale 1ns / 1ps


primitive sum_pre(output sum_out,
input a_in,b_in,c_in);

  table 
   // a_in  b_in  c_in  : sum_out
        0     0     0   :  0;
        0     0     1   :  1;
        0     1     0   :  1;
        0     1     1   :  0;
        1     0     0   :  1;
        1     0     1   :  0;
        1     1     0   :  0;
        1     1     1   :  1;
   endtable
   endprimitive
          
          
primitive carry_pre(output carry_out,
input a_in,b_in,c_in);

  table 
   // a_in  b_in  c_in  : carry_out
        0     0     0   :  0;
        0     0     1   :  0;
        0     1     0   :  0;
        0     1     1   :  1;
        1     0     0   :  0;
        1     0     1   :  1;
        1     1     0   :  1;
        1     1     1   :  1;
   endtable
   endprimitive
          
module FA(output sum_out,carry_out,
input a_in,b_in,c_in 
);

    sum_pre s1 (sum_out,a_in,b_in,c_in);
    carry_pre c2(carry_out,a_in,b_in,c_in); 
endmodule
