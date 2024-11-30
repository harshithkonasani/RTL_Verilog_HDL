`timescale 1ns / 1ps

   integer i;
   task count(input [7:0] a,output [3:0] count1);
   begin
    count1 =0;
        for(i=0; i<8; i=i+1)
        begin
            if(a[i] == 1'b0)
                count1 = count1 + 1;
             else 
                count1 = count1;
        end
   end
   endtask
   
module number_of_zero_task(
input [7:0] a,
    output reg [3:0] c                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    );
    
   always @(*)
   begin
        count(a,c);
   end
endmodule
