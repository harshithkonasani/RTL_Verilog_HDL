module comparator_1bit(
input a_in,b_in,
output g_out,e_out,l_out

    );
    
    assign g_out = a_in & (~b_in);
    assign e_out = a_in ~^ b_in;
    assign l_out = (~a_in) & b_in;
endmodule
