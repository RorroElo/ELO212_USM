`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.04.2024 21:35:12
// Design Name: 
// Module Name: contador_parameter
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


module contador_parameter #(parameter N = 3)(
    input logic clk,reset,
    output logic [N-1:0] count
    );
    
    always_ff @(posedge clk) 
    begin
        if(reset)
            count <= 'b0;
        else 
            count <= count + 1'b1;
    end
endmodule


