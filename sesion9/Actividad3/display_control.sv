`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.06.2024 21:57:31
// Design Name: 
// Module Name: display_control
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


module display_control(
    input logic [2:0] r_counter,
    output logic [7:0] Anodo
    );
    always_comb 
        begin
            case (r_counter)
                3'b000: Anodo = 8'b1111_1110;
                3'b001: Anodo = 8'b1111_1101;
                3'b010: Anodo = 8'b1111_1011;
                3'b011: Anodo = 8'b1111_0111;
                3'b100: Anodo = 8'b1110_1111;
                3'b101: Anodo = 8'b1101_1111;
                3'b110: Anodo = 8'b1011_1111;
                3'b111: Anodo = 8'b0111_1111;
                default: Anodo = 'b0;
            endcase
        end
    
endmodule
