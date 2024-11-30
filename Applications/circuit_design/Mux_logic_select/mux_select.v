module mux_select(
    input a_in, b_in, c_in, d_in,
    input [1:0] sel_in,
    output y_out
    );
    
    parameter sel=1;
    
    generate
    case(sel)
        1'b0 : mux_4x1_parallel m1(.a_in(a_in), .b_in(b_in), .c_in(c_in), .d_in(d_in), .sel_in(sel_in), .y_out(y_out));
        1'b1 : mux_4x1_priority m2(.a_in(a_in), .b_in(b_in), .c_in(c_in), .d_in(d_in), .sel_in(sel_in), .y_out(y_out));
    endcase
    endgenerate
endmodule
