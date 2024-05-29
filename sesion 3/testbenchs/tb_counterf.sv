`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.04.2024 15:53:43
// Design Name: 
// Module Name: tb_counter
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


module tb_counter(

    );
    logic clk_in;
    logic reset;
    logic clk_out;
    
    Clock_divider #(.COUNTER_MAX(1250000)) DUT(
        .clk_in(clk_in),
        .reset(reset),
        .clk_out(clk_out)
        
        
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
