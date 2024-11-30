`define SYN
module synth(
    input a_in,b_in,c_in,d_in,
    
    output y_out
    );
    
    `ifdef SYN
           
        assign y_out = (a_in & b_in) & (c_in & d_in);
     `else  
        assign y_out = a_in & b_in & c_in & d_in;
      `endif
   
endmodule
