`timescale 1ns / 1ps

module moore_10101_onehot(
     input d_in,
    input clk,rst,
    output reg y_out
    );
    
    parameter s0 = 6'b000001;
    parameter s1 = 6'b000010;
    parameter s2 = 6'b000100;
    parameter s3 = 6'b001000;
    parameter s4 = 6'b010000;
    parameter s5 = 6'b100000;
    
    reg [5:0] ps,ns;
    // state logic
    always @(posedge clk, negedge rst)
    begin
    if(~rst)
        ps <= s0;
    else
        ps <= ns;
     end
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
                    if(~d_in)
                        ns = s2;
                    else
                        ns = s1;
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
                            ns = s1;
                      end
               s4   : begin
                        if(d_in)
                            ns = s5;
                        else
                            ns = s0;
                      end
               s5   : begin
                        if(d_in)
                            ns = s2;
                        else
                            ns = s1;
                      end
              default : ns = s0;
           endcase
       end
       
   //output logic
 always @(ps)
 begin
    case(ps)
        s0 : y_out = 0;
        s1 : y_out = 0;
        s2 : y_out = 0;
        s3 : y_out = 0;
        s4 : y_out = 0;
        s5 : y_out = 1;
        default : y_out = 0;
     endcase
 end  
endmodule
