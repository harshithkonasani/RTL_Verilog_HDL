module design_case (
  input a_in, b_in, 
  output y_out
  );
  
  parameter sel=1;
  
  generate 
    case(sel)
     1'b1: nand1 n2(.a_in(a_in), .b_in(b_in), .y_out(y_out));
     1'b0: nor1 n2(.a_in(a_in), .b_in(b_in), .y_out(y_out));
     endcase
  endgenerate
endmodule
