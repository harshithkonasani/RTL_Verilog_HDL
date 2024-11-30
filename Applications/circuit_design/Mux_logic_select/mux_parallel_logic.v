module mux_4x1_parallel(
    input a_in, b_in, c_in, d_in,
    input [1:0] sel_in,
    output reg y_out
    );
    
    always @(*)
    begin
        case(sel_in)
            2'b00 : y_out = a_in;
            2'b01 : y_out = b_in;
            2'b10 : y_out = c_in;
            2'b11 : y_out = d_in;
         endcase
    end
endmodule
