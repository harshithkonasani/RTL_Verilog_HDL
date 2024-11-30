`timescale 1ns / 1ps

module left_shift (
    input [7:0]d_in,
    input clk,load,rst,
    output reg [7:0] q_out
    );
 integer i;
always @(posedge clk, negedge rst)
begin
        if(!rst)
            q_out <= 0;
        else
        begin
            if(load)
                q_out <= d_in;
             else
             begin
                //q_out <= {q_out[6:0], q_out[7]};
                for (i=0;i<7;i=i+1)
                begin
                    q_out[i+1] <= q_out[i];
                end
                    q_out[0] <= q_out[7];
             end
        end
end
endmodule
