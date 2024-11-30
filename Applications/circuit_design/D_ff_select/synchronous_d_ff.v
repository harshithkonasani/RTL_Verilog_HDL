
module dff_synchronous(
    output reg q_out,
  input clk,rst,
  input d_in );
  
  always @(posedge clk, negedge rst)
  begin
    if(!rst)
      q_out <= 0;
  else
    q_out <= d_in;
  end
endmodule
