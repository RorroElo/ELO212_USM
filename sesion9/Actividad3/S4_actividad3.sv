`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// University: Universidad Tecnica Federico Santa Maria
// Course: ELO212
// Students: 
// 
// Create Date: 
// Design Name: Guia 4
// Module Name: S4_actividad3
// Project Name: 
// Target Devices: xc7a100tcsg324-1
// Tool Versions: Vivado 2021.1
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module S4_actividad3 #(parameter M = 16)(
   
	input logic [M-1:0] A,
	input logic [M-1:0] B,
	input logic [1:0] OpCode,

	output logic [M-1:0] Result,
	output logic [4:0] Flags
);
	logic N, Z, C, V, P;

	always_comb begin
		case(OpCode)
			2'b00: begin
			    //RESTA
			    {C, Result} = A - B;
				V = (Result[M-1] & ~A[M-1] & B[M-1]) | (~Result[M-1] & A[M-1] & ~B[M-1]);
			end

			2'b01: begin
			    //SUMA
			    {C, Result} = A + B;
				V = (Result[M-1] & ~A[M-1] & ~B[M-1]) | (~Result[M-1] & A[M-1] & B[M-1]);		
			end

			2'b10: begin
			    //OR 
				Result = (A | B);
				C = 1'b0;
				V = 1'b0;
			end

			2'b11: begin
			    //AND
				Result = (A & B);
				C = 1'b0;
				V = 1'b0;
			end

		endcase

		N = Result[M-1];
		Z = (Result == '0);
		P = ^Result;

		Flags = {N, Z, C, V, P};
	end
endmodule


