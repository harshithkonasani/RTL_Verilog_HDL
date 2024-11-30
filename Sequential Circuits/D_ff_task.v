`timescale 1ns / 1ps

module d_ff_task(
   input d_in,clk,rst,
   output reg q_out
);
task d_flipflop (input d_in,rst, output q_out);
begin 
        if(!rst)
            q_out = 0; 
        else
            q_out = d_in;
end
endtask
 
    always @(posedge clk)
    begin  
            d_flipflop(d_in,rst,q_out);
    end  
    
endmodule


