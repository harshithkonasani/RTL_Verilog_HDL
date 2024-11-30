`timescale 1ns / 1ps

module design_nn (
  input a_in, b_in, 
  output y_out
  );
  
  parameter sel=1;
  
  generate 
    if(sel)
      nand1 n2(.a_in(a_in), .b_in(b_in), .y_out(y_out));
  else
    nor1 n2(.a_in(a_in), .b_in(b_in), .y_out(y_out));
  endgenerate
endmodule
