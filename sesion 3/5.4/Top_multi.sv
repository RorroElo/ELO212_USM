`timescale 1ns / 1ps

module Top_multi(
input logic clk_in, reset, reset2,
output logic [6:0]sevenSeg,
output logic [3:0]salida

    );
    logic clk_out_20;
    Clock_divider2 #(100000000, 2000000) clk_divider_20Hz 
        (.clk_in(clk_in), 
        .resetf(reset2),
        .clk_out(clk_out_20Hz));
        
        
    counter_Nbits #(16) contador_16_bits (
        .clk(clk_in),
        .reset(reset),
        .out1(out1),
        .out2(out2),
        .out3(out3),
        .out4(out4));
          
    contador2bits contador_2_bits(
        .clk(clk_out_20),
        .reset(reset2),
        .count(count));
      
    Multiplex_temp Selector_cifra(
        .cifra1(out1),
        .cifra2(out2),
        .cifra3(out3),
        .cifra4(out4),
        .sel(count),
        .out_data(out_data));
        
    BCD_to_sevenSeg Seven_seg(
        .BCD_in(out_data),
        .sevenSeg(sevenSeg));
        
    selector_anodo Selector_Anodo(
        .entrada(count),
        .salida(salida));
        
        
      
endmodule
