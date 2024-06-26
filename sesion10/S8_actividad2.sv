`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.06.2024 12:06:53
// Design Name: 
// Module Name: S8_actividad2
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


module S8_actividad2 #(parameter N_DEBOUNCER = 10)(
    input logic clk,
    input logic resetN,
    input logic Enter,Undo, DisplayFormat,                
    input logic [15:0] DataIn,

    
    output logic [6:0] Segments,
    output logic [4:0] Flags,
    output logic [2:0] Status,
    output logic [7:0] Anodes 
    );
    logic reset;
    assign reset = ~resetN;
    logic EnterPulse;
    logic UndoPulse;
    logic LoadOpA,LoadOpB,LoadOpCode;
    logic updateRes, ToDisplaySel;
    logic [15:0] Alu_Result;
    logic [15:0] ToDisplay;
    
    Debouncer_FSM #(.DELAY(N_DEBOUNCER))debouncer_enterpulse (
        .clk(clk),
        .rst (reset),
        .PB(Enter),
        .PB_pressed_status(),
        .PB_pressed_pulse(EnterPulse),
        .PB_released_pulse()
        );
    
    Debouncer_FSM #(.DELAY(N_DEBOUNCER)) debouncer_undopulse (
        .clk(clk),
        .rst (reset),
        .PB(Undo),
        .PB_pressed_status(),
        .PB_pressed_pulse(UndoPulse),
        .PB_released_pulse()
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

    logic [31:0] in_double_dabble;
    logic [31:0] bcd_out;
    assign in_double_dabble = {16'b0,ToDisplay};
    
    unsigned_to_bcd_2 double_dabble (
        .clk(clk),
    	.reset(reset),
		.trigger(1'b1),
		.in(in_double_dabble),
		.idle(idle),
		.bcd(bcd_out)
	);

    logic [31:0] in_sevenSeg;
        
    always_comb begin 
        case (DisplayFormat)
            1'b0: in_sevenSeg = {16'b0,ToDisplay};
            1'b1: in_sevenSeg = {bcd_out};
        endcase
        end
        

    S4_actividad1 Hex_to_sevenSeg (
        .clock(clk),
        .reset(reset),
        .HEX_in(in_sevenSeg),
        .segments(Segments),
        .anodes(Anodes)
        );
    
endmodule
