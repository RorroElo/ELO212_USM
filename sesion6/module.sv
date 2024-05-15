`timescale 1ns / 1ps

module Topmodule(
    input logic [15:0] SW,
    input logic clk_in, reset,
    input logic BTNU,
    output logic [7:0] AN,
    output logic CA, CB, CC, CD, CE, CF, CG,
    output logic [3:0]    counterN,
    output logic LED[15:0]
);
    logic [6:0]aux;
    logic [7:0]aux2;
    
    Clock_divider2 #(.clk_in_f(100000000), .clk_out_f(4)) DivisorReloj1seg(
        .clk_in(clk_in),
        .resetf(reset),
       .clk_out(clkLento)
   ); 
    Clock_divider2 #(.clk_in_f(100000000), .clk_out_f(300)) DivisorRelojfast(
        .clk_in(clk_in),
        .resetf(reset),
       .clk_out(clkfast)
   );
   
   S4_actividad2 Contador4Bits(
        .clock(clkLento),
       .reset(reset),
       .dec(dec),
       .enable(enable),
       .load(load),
       .load_ref_value(load_ref_value),
       .counterN(counterN),
       .threshold(threshold)
   );
   
   
   BCD_to_sevenSeg showdisplay(
       .BCD_in(counterN),
       .sevenSeg(aux),
       .clk(clkfast),
       .reset(reset),
       .anodes(aux2)
   );


    assign  SW[0]=dec;
    assign  SW[1]=enable;
    assign  SW[2]=load;
    assign  SW[15:12]=load_ref_value;
    assign  LED[15]=threshold;
    assign CA = aux[6];
    assign CB = aux[5];
    assign CC = aux[4];
    assign CD = aux[3];
    assign CE = aux[2];
    assign CF = aux[1];
    assign CG = aux[0];
    assign AN[7] = aux2[7];
    assign AN[6] = aux2[6];
    assign AN[5] = aux2[5];
    assign AN[4] = aux2[4];
    assign AN[3] = aux2[3];
    assign AN[2] = aux2[2];
    assign AN[1] = aux2[1];
    assign AN[0] = aux2[0];
    assign BTNU = reset;
endmodule
