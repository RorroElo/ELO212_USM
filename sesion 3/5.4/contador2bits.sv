`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.04.2024 11:43:48
// Design Name: 
// Module Name: contador2bits
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


module contador2bits(
    input logic clk, reset,
    output logic [1:0] count
);

    always_ff @(posedge clk) begin
        if (reset)
            count <= 'b0;
        else
            count <= count + 1;
    end
endmodule
