`timescale 1ns / 1ps

module freq_div_2(
        input clk,rst,
        output reg q_out
    );
    
always @(posedge clk, negedge rst)
begin   
    if(!rst)
    begin
        q_out <= 0;
    end
    else
    begin    
        q_out <= ~q_out;
    end
end    

endmodule
