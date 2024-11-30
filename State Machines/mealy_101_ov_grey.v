`timescale 1ns / 1ps

module mealy_101_ov_grey(
     input d_in,
    input clk,rst,
    output reg y_out
    );
    
    parameter s0 = 2'b00;
    parameter s1 = 2'b01;
    parameter s2 = 2'b11;
     
    reg [1:0] ps,ns;
    // state logic
    always @(posedge clk, negedge rst)
    begin
    if(~rst)
        ps <= s0;
    else
        ps <= ns;
     end
      
     //state register logic
     always @(ps,d_in)
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
        s2 : y_out = (d_in)?1'b1:1'b0;
        default : y_out = 0;
     endcase
 end
endmodule
