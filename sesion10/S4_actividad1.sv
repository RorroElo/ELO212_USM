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
    
    logic [2:0]refresh_counter;
    logic [3:0] elegido;
    
    contador_parameter #(.N(3)) R_counter (.clk(clock), .reset(reset) , .count(refresh_counter));
    
    bcd_4bit bcd_selector (.HEX(HEX_in), .r_counter(refresh_counter), .digito_elegido(elegido));    
    
    BCD_to_sevenseg bcd_seg(.BCD_in(elegido), .sevenSeg(segments));
    
    display_control control_anodo (.r_counter(refresh_counter), .Anodo (anodes));
    
endmodule
