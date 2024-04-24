`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.04.2024 15:45:08
// Design Name: 
// Module Name: top_divider2
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


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

