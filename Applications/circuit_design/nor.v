module nor1 (
  input a_in, b_in,
  output y_out
  );
  
  assign y_out = ~(a_in | b_in);
  
endmodule
