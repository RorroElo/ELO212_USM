`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.06.2024 12:10:41
// Design Name: 
// Module Name: Display_selector
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


module Display_selector(
    input logic [15:0] DataIn, Alu_result,
    input logic ToDisplaySel,
    output logic [15:0] ToDisplay
    );
    always_comb begin
        case(ToDisplaySel)
         1'b0:  ToDisplay = DataIn;
         1'b1:  ToDisplay = Alu_result;
         default ToDisplay = DataIn;      
        endcase
        end
            
endmodule
