`timescale 1ns / 1ps

module number_of_ones_forloop(
    input [15:0] a,
    input clk,rst,
    output reg [5:0] q_out 
    );
integer i;
integer count;
always @(posedge clk, negedge rst)
begin
        if(!rst)
            q_out <= 0;
        
             else
             begin
             count=0;
                  for(i=0; i<16; i=i+1)
                  begin
                        if(a[i] == 1'b1)
                                count = count + 1;
                        else 
                            count = count;
                   end
                   q_out <= count;
             end
end
endmodule
