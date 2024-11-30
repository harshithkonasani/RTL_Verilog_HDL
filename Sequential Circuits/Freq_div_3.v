`timescale 1ns / 1ps


module freq_div_3(
        input clk,rst,
        output   q_out
    );
    reg [1:0] count;
always @(posedge clk, negedge rst)
begin   
    if(!rst)
    begin
        count <= 2'b00;
    end
    else if( count == 2'b10)
    begin    
        count <= 2'b00;
    end
    else  
    begin  
        count <= count + 1'b1;
    end

end 
 
 assign        q_out = count[1];

endmodule
