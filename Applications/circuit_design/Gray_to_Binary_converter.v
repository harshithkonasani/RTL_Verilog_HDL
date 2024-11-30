module g2b_converter #(parameter WIDTH=4) 
(input [WIDTH-1:0] gray, 
output [WIDTH-1:0] binary
);
  genvar i;
  generate
    for(i=0;i<WIDTH;i=i+1) begin
      assign binary[i] = ^(gray >> i);
    end
  endgenerate
endmodule
