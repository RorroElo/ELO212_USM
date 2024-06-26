`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.06.2024 00:15:15
// Design Name: 
// Module Name: S9_actividad3
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


module S9_actividad3(
    input logic clk,
    input logic reset,
    input logic Enter,
                Undo,                
    input logic [15:0] DataIn,

    
    output logic [6:0] Segments,
    output logic [4:0] Flags,
    output logic [2:0] Status,
    output logic [7:0] Anodes 
    );
    
    logic EnterPulse;
    logic UndoPulse;
    logic LoadOpA,LoadOpB,LoadOpCode;
    logic updateRes, ToDisplaySel;
    logic [15:0] Alu_Result;
    logic [15:0] ToDisplay;
    
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
        .ToDisplay({ToDisplay})
        );     
    
    logic [31:0] in_sevenSeg;
    assign in_sevenSeg = {16'b0,ToDisplay};
    
    S4_actividad1 Hex_to_sevenSeg (
        .clock(clk),
        .reset(reset),
        .HEX_in(in_sevenSeg),
        .segments(Segments),
        .anodes(Anodes)
        );
    
endmodule
