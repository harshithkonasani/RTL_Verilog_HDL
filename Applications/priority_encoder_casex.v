module priority_encoder_casx(
    input [3:0] i,
    output reg [1:0] y_out
    );
    
    always @(*)
    begin
        casex(i)
            4'b1xxx : y_out = 2'b11;
            4'b01xx : y_out = 2'b10;
            4'b001x : y_out = 2'b01;
            4'b0001 : y_out = 2'b00;
            default : y_out = 2'bxx;
        endcase
    end
    
endmodule
