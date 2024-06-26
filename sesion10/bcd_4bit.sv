`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.04.2024 16:22:43
// Design Name: 
// Module Name: bcd_4bit
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


module bcd_4bit(
    input logic [31:0] HEX,
    input logic [2:0] r_counter,
    output logic [3:0] digito_elegido
    );
    
    always_comb 
        begin
            case (r_counter)
                3'b000: digito_elegido = HEX[3:0];
                3'b001: digito_elegido = HEX[7:4];
                3'b010: digito_elegido = HEX[11:8];
                3'b011: digito_elegido = HEX[15:12];
                3'b100: digito_elegido = HEX[19:16];
                3'b101: digito_elegido = HEX[23:20];
                3'b110: digito_elegido = HEX[27:24];
                3'b111: digito_elegido = HEX[31:28];
                default: digito_elegido = 'b0;
            endcase
        end
endmodule

