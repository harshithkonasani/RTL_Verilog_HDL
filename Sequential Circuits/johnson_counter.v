`timescale 1ns / 1ps

module johnson_counter #(parameter n=4)(
        input [n-1:0] d_in,
        input clk,load,rst,
        output reg [n-1:0] q_out
    );
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
                q_out <= {~q_out[0], q_out[3:1]};
            end
                
        end      
    end
endmodule

