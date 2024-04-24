`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.04.2024 16:18:46
// Design Name: 
// Module Name: tb_clkdivider2
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


module tb_clkdivider2();
    logic clk_in;
    logic reset;
    logic clk_out50;
    logic clk_out30;
    logic clk_out10;
    logic clk_out1;
    
    top_divider2 top_divider2DUT( 
    .clk_in(clk_in), 
    .reset(reset),
    .clk_out50(clk_out50),
    .clk_out30(clk_out30),
    .clk_out10(clk_out10),
    .clk_out1(clk_out1)
    );

  
    always #5 clk_in = ~clk_in;

    initial begin
        clk_in = 0;
        reset=0;
        #10
        reset = 1;
        #10
        reset=0;
     end 
endmodule

