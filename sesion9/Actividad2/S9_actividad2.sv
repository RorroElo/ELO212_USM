`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.06.2024 23:32:40
// Design Name: 
// Module Name: S9_actividad2
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


module S9_actividad2 #(parameter N_DEBOUNCER = 10)
    (
    input logic clk,
    input logic reset,
    input logic Enter,Undo,                
    input logic [15:0] DataIn,

    
    output logic [15:0] ToDisplay,
    output logic [4:0] Flags,
    output logic [2:0] Status 
    );
    
    logic EnterPulse;
    logic UndoPulse;
    logic LoadOpA,LoadOpB,LoadOpCode;
    logic updateRes, ToDisplaySel;
    logic [15:0] Alu_Result;
    
    Level_to_pulse pulso_entrada (
        .clk(clk), 
        .reset(reset),
        .L(Enter),
        .P(EnterPulse)
        );

    Level_to_pulse undo (
        .clk(clk), 
        .reset(reset),
        .L(Undo),
        .P(UndoPulse)
        );
        
    ReversePolishFSM Maquina_estados (
        .Enter_pulse(EnterPulse),
	    .Undo_pulse (UndoPulse),
        .reset(reset),
        .clock(clk),
        .Status(Status),
        .LoadOpA(LoadOpA),
        .LoadOpB(LoadOpB),
        .LoadOpCode(LoadOpCode),
        .updateRes(updateRes),
        .ToDisplaySel(ToDisplaySel)
        );
        
    alu_in_out_reg #(.N(16)) Alu (
        .data_in(DataIn),
        .load_A(LoadOpA),
        .load_B(LoadOpB),
        .load_Op(LoadOpCode),
        .clk(clk),
        .reset(reset),
        .updateRes(updateRes),
        .Result(Alu_Result),
        .Flags(Flags)
        );
        
    Display_selector valor_a_display(
        .DataIn(DataIn),
        .Alu_result(Alu_Result),
        .ToDisplaySel(ToDisplaySel),
        .ToDisplay(ToDisplay)
        );     
    
    
endmodule