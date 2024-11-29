/* RTL design to detect the pattern, 1110. If the sequence is detected, push the 32-bit
data from input to output, otherwise, hold the previous data.*/



`timescale 1ns / 1ps

`define N 32
  module moore_1110_fsmd(
    input d_in,
    input clk,rst,
    output reg y_out,
    input [`N-1:0] bit_in,
    output reg [`N-1:0] bit_out
    );
      
    parameter s0 = 3'b000;
    parameter s1 = 3'b001;
    parameter s2 = 3'b010;
    parameter s3 = 3'b011;
    parameter s4 = 3'b100;
    
    reg [2:0] ps,ns;
    
    // state logic
    always @(posedge clk, negedge rst)
    begin
    if(~rst)
        ps <= s0;
    else
        ps <= ns;
     end
     
     //transfer logic
     always @(*)
     begin
        case(ps)
            s0 : begin
                    if(d_in)
                      ns = s1;
                    else
                       ns = s0;
                  end
             s1 : begin
                    if(d_in)
                        ns = s2;
                    else
                        ns = s0;
                   end
             s2 : begin
                    if(d_in)
                        ns = s3;
                    else
                        ns = s0;
                    end
              s3   : begin
                        if(~d_in)
                            ns = s4;
                        else
                            ns = s3;
                     end
              s4   : begin
                        if(d_in)
                            ns = s1;
                        else
                            ns = s0;
                     end
               
              default : ns = s0;
           endcase
       end
       
   //output logic
 always @(*)
 begin
    case(ps)
        s0 : y_out = 0;
        s1 : y_out = 0;
        s2 : y_out = 0;
        s3 : y_out = 0;
        s4 : y_out = 1;
        default : y_out = 0;
     endcase
 end  
 
 //pipo logic
 always @(posedge clk, negedge rst)
 begin
    if(~rst)
        bit_out <= 0;
    else if(y_out)
            bit_out <= bit_in;
  end
endmodule
