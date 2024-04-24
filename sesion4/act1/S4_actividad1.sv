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

    
        always_ff @(posedge clock) begin
        if (reset) 
            segments <= 7'b1111111;
            anodes <= 8'b00000000;
        end 
            logic [2:0] cable_count; // cable para llevar los datos del contador a los otro modulos
            counter_Nbits counterDUT(
                .clock(clock),
                .reset(reset),
                .count(cable_count)
            );    

            logic [3:0] cable_HEX_in; // cable para llevar los digitos a los otro modulos
            mux_4 DUT1(
                .disp1(HEX_in[3:0]),
                .disp2(HEX_in[7:4]),
                .disp3(HEX_in[11:8]),
                .disp4(HEX_in[15:12]),
                .disp5(HEX_in[19:16]),
                .disp6(HEX_in[23:20]),
                .disp7(HEX_in[27:24]),
                .disp8(HEX_in[31:28]),
                .sel(cable_count),
                .out(cable_HEX_in)
            );

            deco_N2 deco(
                .A(cable_count),
                .one_hot(anodes)
            );
            
            BCD_to_sevenSeg BCD_to_sevenSegDUT(
                .BCD_in(cable_HEX_in),
                .sevenSeg(segments)
            );
endmodule