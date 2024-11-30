`timescale 1ns / 1ps


module tb_mux_8x1();
  reg [7:0] a_in;
  reg [2:0] sel_in;
wire y1;

mux_8x1 DUT (.y1(y1),
             .a_in(a_in),
             .sel_in(sel_in));
    always #10 a_in = $random();
    always #5  sel_in = $random();

initial
begin
a_in = 0;
sel_in = 0;

#500 $finish();
end
endmodule
