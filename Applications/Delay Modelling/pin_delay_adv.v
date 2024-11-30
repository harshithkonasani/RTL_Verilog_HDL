`timescale 1ns / 1ps
module pin_full_parallel(
   input a_in,b_in,c_in,d_in,
   output y_out
        );  
 assign y_out = (a_in & b_in) | (c_in & d_in);
 
 specify
 
 // parellel delay
 if(a_in)
    (a_in => y_out) = 2;
 if(!a_in)
    (a_in =>y_out) = 1;
 if(b_in)
    (b_in => y_out) = 3;
 if(!b_in)
    (b_in =>y_out) = 3;
 if(c_in)
    (c_in => y_out) = 2;
 if(!c_in)
    (c_in =>y_out) = 1;
 if(d_in)
    (d_in => y_out) = 2;
 if(!d_in)
    (d_in =>y_out) = 1;  
 
 // full connection   
 if({a_in, b_in} == 2'b01)
    (a_in, b_in *> y_out) = 3;
 if({a_in, b_in} == 2'b10)
    (a_in, b_in *> y_out) = 2;
 if({a_in, b_in} == 2'b11)
    (a_in, b_in *> y_out) = 2;
  if({a_in, b_in} == 2'b00)
    (a_in, b_in *> y_out) = 2;
  
  // full connection c,d
  if({c_in, d_in} == 2'b11)
    (c_in, d_in *> y_out) = 4;
 if({c_in, d_in} == 2'b01)
    (c_in, d_in *> y_out) = 3;
 if({c_in, d_in} == 2'b10)
    (c_in, d_in *> y_out) = 3;
  if({c_in, d_in} == 2'b00)
    (c_in, d_in *> y_out) = 3;

 endspecify
endmodule
