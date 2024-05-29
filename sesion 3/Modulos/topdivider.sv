module top_divider2( 
input logic clk_in, reset,
output logic clk_out50,clk_out30,clk_out10,clk_out1
);

Clock_divider2 #(100, 50) clk_divider_50MHz 
(.clk_in(clk_in), 
.reset(reset),
.clk_out(clk_out50));

Clock_divider2 #(100, 30) clk_divider_30MHz 
(.clk_in(clk_in),
.reset(reset),
 .clk_out(clk_out30));
 
 Clock_divider2 #(100, 10) clk_divider_10MHz 
 (.clk_in(clk_in), 
 .reset(reset),
 .clk_out(clk_out10));
 
 Clock_divider2 #(100, 1) clk_divider_1MHz 
 (.clk_in(clk_in),
 .reset(reset),
  .clk_out(clk_out1));
endmodule