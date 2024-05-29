`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.04.2024 17:42:01
// Design Name: 
// Module Name: Multiplex_temp
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


module Multiplex_temp(
    input logic [3:0] cifra1, 
    input logic [3:0] cifra2, 
    input logic [3:0] cifra3, 
    input logic [3:0] cifra4, 
    input logic [1:0] sel, 
    output logic [3:0] out_data 
);

always_comb begin
    case(sel)
        2'b00: out_data = cifra1; 
        2'b01: out_data = cifra2; 
        2'b10: out_data = cifra3; 
        2'b11: out_data = cifra4;
    endcase
end

endmodule
 

