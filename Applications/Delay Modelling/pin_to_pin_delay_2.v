module pin_delay_2(
    input a_in,b_in,c_in,d_in,
        output y_out
        );  
 assign y_out = (a_in & b_in) | (c_in & d_in);
 
 specify
 specparam delay1 = 2;
 specparam delay2 = 1;
 
 if({a_in, b_in} == 2'b10)
    (a_in, b_in *> y_out) = delay1;
 if({a_in, b_in} == 2'b11)
    (a_in, b_in *> y_out) = delay2;
  if({c_in, d_in} == 2'b11)
    (c_in, d_in *> y_out) = 5;
    
 endspecify
endmodule
