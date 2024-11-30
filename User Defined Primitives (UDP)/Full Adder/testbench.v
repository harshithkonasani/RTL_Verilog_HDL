`timescale 1ns / 1ps


module fa_tb();
reg a_in, b_in, c_in;
wire sum_out, carry_out;

FA DUT (.sum_out(sum_out), .carry_out(carry_out), 
        .a_in(a_in), .b_in(b_in), .c_in(c_in) );
        
always #8 a_in = ~a_in;
always #4 b_in = ~b_in;
always #2 c_in = ~c_in;
initial 
begin
    a_in = 0;
    b_in = 0;
    c_in = 0;
    
#100 $finish();
end
endmodule
