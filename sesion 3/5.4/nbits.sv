`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.04.2024 11:16:55
// Design Name: 
// Module Name: nbits
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


module counter_Nbits #(parameter N=16)(
    input logic clk, reset,
    output logic [N-13:0] out1,
    output logic [N-13:0] out2,
    output logic [N-13:0] out3,
    output logic [N-13:0] out4
    );
    logic [N-1:0] count;
    always_ff @(posedge clk) begin
        if (reset)
            count <= 'b0; 
        else
            count <= count+1;
    end

    assign out1 = count[3:0];
    assign out2 = count[7:4];
    assign out3 = count[11:8];
    assign out4 = count[15:12];
endmodule
