`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.06.2024 12:18:05
// Design Name: 
// Module Name: ReversePolishFSM
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


module ReversePolishFSM(
    input logic Enter_pulse,reset,clock,
    output logic [2:0] Status,
    output logic LoadOpA,LoadOpB,LoadOpCode,
    output logic updateRes, ToDisplaySel
    );
    
    enum logic [7:0] {Entering_OpA, Load_OpA, Entering_OpB, Load_OpB, 
    Entering_OpCode, Load_OpCode, Show_Result } state, next_state;

    always_comb begin 
    //defaults
    next_state = Entering_OpA;
    Status = 3'b000;
    LoadOpA = 1'b0;
    LoadOpB = 1'b0;
    LoadOpCode = 1'b0;
    updateRes = 1'b0;
    ToDisplaySel = 1'b0;
    
    
        case (state)
            Entering_OpA:   begin
                                if (Enter_pulse) begin
                                    next_state = Load_OpA;
                                    end
                                else
                                    next_state = Entering_OpA;

                                Status = 3'd0;
                                LoadOpA = 1'b0;
                                LoadOpB = 1'b0;
                                LoadOpCode = 1'b0;
                                updateRes = 1'b0;
                                ToDisplaySel = 1'b0;
                            end
            Load_OpA:   begin
                            next_state = Entering_OpB;
                            Status = 3'd1;
                            LoadOpA = 1'b1;
                            LoadOpB = 1'b0;
                            LoadOpCode = 1'b0;
                            updateRes = 1'b0;
                            ToDisplaySel = 1'b0;
                        end
            Entering_OpB:   begin
                                if (Enter_pulse)
                                    next_state = Load_OpB;
                                else
                                    next_state = Entering_OpB;

                            Status = 3'd2;
                            LoadOpA = 1'b0;
                            LoadOpB = 1'b0;
                            LoadOpCode = 1'b0;
                            updateRes = 1'b0;
                            ToDisplaySel = 1'b0;
                        end
            Load_OpB:   begin
                            next_state = Entering_OpCode;
                            Status = 3'd3;
                            LoadOpA = 1'b0;
                            LoadOpB = 1'b1;
                            LoadOpCode = 1'b0;
                            updateRes = 1'b0;
                            ToDisplaySel = 1'b0;
                        end

            Entering_OpCode:   begin
                                if (Enter_pulse)
                                    next_state = Load_OpCode;
                                else
                                    next_state = Entering_OpCode;

                            Status = 3'd4;
                            LoadOpA = 1'b0;
                            LoadOpB = 1'b0;
                            LoadOpCode = 1'b0;
                            updateRes = 1'b0;
                            ToDisplaySel = 1'b0;
                        end
                        
            Load_OpCode:   begin
                            next_state = Show_Result;
                            Status = 3'd5;
                            LoadOpA = 1'b0;
                            LoadOpB = 1'b0;
                            LoadOpCode = 1'b1;
                            updateRes = 1'b0;
                            ToDisplaySel = 1'b0;
                        end
                        
            Show_Result:   begin
                                if (Enter_pulse)
                                    next_state = Entering_OpA;
                                else
                                    next_state = Show_Result;

                            Status = 3'd6;
                            LoadOpA = 1'b0;
                            LoadOpB = 1'b0;
                            LoadOpCode = 1'b0;
                            updateRes = 1'b1;
                            ToDisplaySel = 1'b1;
                        end                        

        endcase
        end
        
    always_ff @(posedge clock) begin
        if(reset) 
            state <= Entering_OpA;
        else 
            state <= next_state;
    end
        
        
endmodule
