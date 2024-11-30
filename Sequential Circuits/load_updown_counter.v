`timescale 1ns / 1ps

module load_updown_counter #(parameter n=4)(
    input up_down,clk,rst,load,
    input [n-1:0] d_in,
    output reg [n-1:0]q_out
    );
    
    always @(posedge clk,negedge rst)
    begin   
        if(!rst)
            q_out <= 0;
        else 
        begin
                if(load)
                    q_out <= d_in;
                else if(up_down)
                begin    
                    q_out <= q_out + 1;
                end
                else 
                begin    
                    q_out <= q_out - 1;
                end
        end
        
        
    end 
endmodule
