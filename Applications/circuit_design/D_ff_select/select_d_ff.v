module select_dff(
    output q_out,
  input d_in,
  input clk,rst 
  );
  
  parameter rst_sel =1;
    generate
      case(rst_sel)
        1'b0 : dff_asynchronous d(.q_out(q_out), .clk(clk), .rst(rst), .d_in(d_in));
        1'b1 : dff_synchronous d1(.q_out(q_out), .clk(clk), .rst(rst), .d_in(d_in));
      endcase
    endgenerate
  
endmodule
