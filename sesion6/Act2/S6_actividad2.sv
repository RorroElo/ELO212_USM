`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/12/2024 01:19:29 PM
// Design Name: 
// Module Name: S6_actividad2
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


module S6_actividad2(
    input logic CLK100MHZ,
    input logic SW[15:0],
    input logic BTNR,
    output logic AN[7:0],
    
    output logic CA, CB, CC, CD, CE, CF, CG,DP
  
);
    logic clkLento;
    logic [6:0] ledsDisplay;
    logic reset;
    logic dec;  
    logic enable;  
    logic load;
    logic [3:0] counterN;
   
    logic [3:0] counterN_next;
    logic [3:0] load_ref_value;
    logic threshold;
    assign Counter = counterN;
    assign reset = BTNR;
    assign dec = SW[0];
    assign enable = SW[1];
    assign load = SW[2];
    assign load_ref_value[3] = SW[15];
    assign load_ref_value[2] = SW[14];
    assign load_ref_value[1] = SW[13];
    assign load_ref_value[0] = SW[12];
    assign AN[0] = 1'b0;
    assign AN[1] = 1'b1;
    assign AN[2] = 1'b1;
    assign AN[3] = 1'b1;
    assign AN[4] = 1'b1;
    assign AN[5] = 1'b1;
    assign AN[6] = 1'b1;
    assign AN[7] = 1'b1;
    
    assign CA = ledsDisplay[6];
    assign CB = ledsDisplay[5];
    assign CC = ledsDisplay[4];
    assign CD = ledsDisplay[3];
    assign CE = ledsDisplay[2];
    assign CF = ledsDisplay[1];
    assign CG = ledsDisplay[0];
    assign DP = ~threshold;
    
    
    ClockDivider ClockDivider(
    .clk_in(CLK100MHZ),
    .clk_out(clkLento)
    
    );
    
    SevenSeg SevenSeg(
    .BCD_in(counterN),
    .sevenSeg(ledsDisplay)
    
    );
    
    
    
    
    always_comb begin
        if (reset) begin
            counterN_next = 0;
            //threshold <= 0;
        end else begin
            if (enable) begin
                if (dec) begin
                    counterN_next = counterN - 1;
                end else begin 
                    counterN_next = counterN + 1;
                end
            end else begin
          
                if (load) begin
                    counterN_next = load_ref_value;
                end else begin 
                 counterN_next =  counterN;
                end
            end
        end
    end
    
    always_ff @(posedge clkLento)
        counterN <= counterN_next;
    
    assign threshold = (counterN > load_ref_value);
endmodule