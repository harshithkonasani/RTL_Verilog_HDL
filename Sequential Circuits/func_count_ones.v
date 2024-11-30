`timescale 1ns / 1ps

module number_of_ones(
    input [7:0] a,
    output [2:0] c                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    );
   integer i;
   assign c = count(a);
   
   function [2:0] count(input [7:0] a);
   begin
    count =0;
        for(i=0; i<8; i=i+1)
        begin
            if(a[i] == 1'b1)
                count = count + 1;
             else 
                count = count;
        end
   end
   endfunction
endmodule
