`timescale 1ns / 1ps

module rt_lft_shift_register #(parameter n=4)(
    input clk,rst,load,dir_in,
    input [n-1:0] d_in,
    output reg [n-1:0] q_out
    );
    always @(posedge clk, negedge rst)
    begin
        if(!rst)
            begin   
                
                q_out <= 0;
            end
        else
        begin    
            if(load)
                q_out <= d_in;
            else if(dir_in)
                q_out <= {1'b0, q_out[n-1:1]};
            else    
                q_out <= {q_out[n-2:0],1'b0};
         end
     end
endmodule
