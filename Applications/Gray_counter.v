module gray_counter(
    input clk, rst,
    output reg [3:0] b_out,
    output reg [3:0] g_out
    );
    
    reg [3:0] data;
    
    always @(posedge clk, negedge rst)
    begin
        if(~rst)
        begin
            data <= 4'b0000;
            g_out <= 4'b0000;
            b_out <= 4'b0000;
        end
        else
        begin
                b_out <= data;
                g_out[3] <= data[3];
                g_out[2] <= data[3] ^ data[2];
                g_out[1] <= data[2] ^ data[1];
                g_out[0] <= data[1] ^ data[0];
                data <= data + 1;
       end
   end
endmodule
