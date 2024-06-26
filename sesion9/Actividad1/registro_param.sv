`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.05.2023 16:51:43
// Design Name: 
// Module Name: registro_param
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


module registro_param #(parameter N = 16)(
    input logic clk, reset, load,
    input logic [N-1 :0] D,
    output logic [N-1 :0] Q
    );
    
    always_ff@(posedge clk)
        if (reset)
            begin
                Q <= 'b0;
            end
        else if (load)
            Q <= D;   
        else 
            Q <= Q;   
endmodule
