`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.04.2024 21:27:03
// Design Name: 
// Module Name: BCD_to_sevenseg
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

module BCD_to_sevenseg(
    input logic [3:0] BCD_in, 
    output logic [6:0] sevenSeg
    );
    
    always_comb begin
        case (BCD_in)
            4'd0:   sevenSeg = 7'b0000_001; //en orden abcdefg segun nexys A7 hay q bajar para que quede activo
            4'd1:   sevenSeg = 7'b1001_111;
            4'd2:   sevenSeg = 7'b0010_010;
            4'd3:   sevenSeg = 7'b0000_110;
            4'd4:   sevenSeg = 7'b1001_100;
            4'd5:   sevenSeg = 7'b0100_100;
            4'd6:   sevenSeg = 7'b0100_000;
            4'd7:   sevenSeg = 7'b0001_111;
            4'd8:   sevenSeg = 7'b0000_000;
            4'd9:   sevenSeg = 7'b0001_100;
            4'd10:  sevenSeg = 7'b0001_000;
            4'd11:  sevenSeg = 7'b1100_000;
            4'd12:  sevenSeg = 7'b0110_001;
            4'd13:  sevenSeg = 7'b1000_010;
            4'd14:  sevenSeg = 7'b0110_000;
            4'd15:  sevenSeg = 7'b0111_000;
            default sevenSeg = 'b0;
        endcase
    end 
endmodule 