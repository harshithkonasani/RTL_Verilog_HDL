`timescale 1ns / 1ps

task addition (input a,b,c, output s,co);
begin   
    {co,s} = a+b+c;
end
endtask

module fa_task2(
    input a_in,b_in,c_in,
    output reg sum_out, carry_out
    );
    
    always @(*)
    begin
        addition(a_in,b_in,c_in,sum_out,carry_out);
    end
endmodule
