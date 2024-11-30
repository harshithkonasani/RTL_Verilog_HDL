// the below circuit does not infer any latch because synopsys fulll_case keywod is used

module combo_logic(
    input [2:0] i,
    output reg y_out
    );
    
    always @(*)
    begin
        y_out = 0;
        casez(i)  //synopsys full_case
        3'b1?? : y_out = i[0];
        3'b?1? : y_out = i[1];
        3'b??1 : y_out = i[2];
        endcase
    end
endmodule
