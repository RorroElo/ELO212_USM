`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.04.2024 12:07:24
// Design Name: 
// Module Name: selector_anodo
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


module selector_anodo(
    input logic [1:0] entrada,
    output logic [3:0] salida
);
    always_comb begin
        case (entrada)
            2'b00: salida = 4'b0001; 
            2'b01: salida = 4'b0010; 
            2'b10: salida = 4'b0100; 
            2'b11: salida = 4'b1000; 
            default: salida = 4'b0000; 
        endcase
    end
endmodule
