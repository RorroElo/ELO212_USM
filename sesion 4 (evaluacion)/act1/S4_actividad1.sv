`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// University: Universidad Tecnica Federico Santa Maria
// Course: ELO212
// Students: 
// 
// Create Date: 
// Design Name: Guia 4
// Module Name: S4_actividad1
// Project Name: 
// Target Devices: xc7a100tcsg324-1
// Tool Versions: Vivado 2021.1
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module S4_actividad1(
    input  logic        clock,
    input  logic        reset,
    input  logic [31:0] HEX_in,
    output logic [6:0]  segments,
    output logic [7:0]  anodes
    );

    logic [3:0] digits [0:7];
    logic [7:0] count;

    // Asignación de ceros durante el reset
    always_ff @(posedge clk) begin
        if (reset) begin
            segments <= 7'b0000000;
            anodes <= 8'b00000000;
        end else begin
            // Contador para seleccionar el dígito actual
            counter_Nbits counter(
                .clk(clk),
                .reset(reset),
                .count(count)
            );

            DivNtoHexaDigits divNtoHexaDigits(
                .HEXA_in(HEX_in),
                .digit(digits)
            );

            // Decodificador para convertir el contador en selección de anodos
            deco_N2 deco(
                .A(count),
                .one_hot(anodes)
            );

            // Selección de un solo display de 7 segmentos
            Num_to_sevenSeg num_to_sevenSeg(
                .Num(digits[count]),
                .sevenSeg(segments)
            );
        end
    end
endmodule