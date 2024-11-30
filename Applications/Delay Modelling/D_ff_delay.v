module d_ff_delay_modelling #
(
    parameter N = 8
)
(
    input clk, rst_n,
    input [N-1:0] d_in,
    output reg [N-1:0] q_out
    );
    
    always @(posedge clk, negedge rst_n)
    begin
        if(~rst_n)
            q_out <= 0;
        else    
            q_out <= d_in;
    end  
    specify
      
       // specparam tr = 3;       // rising edge delay
        // specparam tf = 2;      // falling edge delay
      // specify any one delay at a time
      
        specparam delay = 3;
        //specparam clktoq = 1;
        
       (posedge clk => (q_out+:d_in)) = delay;
        //(clk=>q_out) = clktoq;
    endspecify
    
endmodule
