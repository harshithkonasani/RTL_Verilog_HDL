`timescale 1ns / 1ps

module updown_counter #(parameter n=4)(
    input control,clk,rst,
    output reg [n-1:0]q_out
    );
    
    always @(posedge clk,negedge rst)
    begin   
        if(!rst)
            q_out <= 0;
        else if(control)
        begin
            q_out <= q_out + 1;
        end
        else 
        begin   
            
            q_out <= q_out - 1;
        end
    end 
endmodule
