`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.06.2024 14:39:12
// Design Name: 
// Module Name: Level_to_pulse
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
/////////////////////////////////////////////////////////////////////////////////


module Level_to_pulse(
    input logic clk, reset, L,     //In: signal of imput to analize
    output logic P               //Out: signal of output like response
    );
    
    enum logic [2:0] {S0, S1, S2} state, next_state;
    
    always_ff @ (posedge clk) begin
        if(reset)
            state <= S0;
        else
            state <= next_state;
    end
    
    always_comb begin
        case (state)
            S0: begin
                if(L)
                    next_state = S1;
                else
                    next_state = S0;
            end
            S1: begin
                if(L)
                    next_state = S2;
                else
                    next_state = S0;           
            end            
            S2: begin
                if(L)
                    next_state = S2;
                else
                    next_state = S0;  
                end  
            default: next_state = S0;
        endcase
    end
    
    always_comb  begin
        case(state)
            S0 : P = 0;
            S1 : P = 1;
            S2 : P = 0;
            default : P = 0;
        endcase
    end
endmodule