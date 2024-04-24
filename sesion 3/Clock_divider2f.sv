`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.04.2024 15:41:57
// Design Name: 
// Module Name: Clock_divider2
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


module Clock_divider2#(
    parameter  clk_in_f_mhz = 100,
    parameter  clk_out_f_mhz = 50
)
(
    input logic clk_in,
    input logic reset,
    output logic clk_out
);

localparam real  clk_in_period_ns = 1.0 / clk_in_f_mhz;// real hace que se usen los decimales otorgados
localparam real  clk_out_period_ns = 1.0 / clk_out_f_mhz;

localparam real cycles_per_output_pulse = clk_in_f_mhz / clk_out_f_mhz / 2.0; //Aca pusimos 2.0 ya que sino, no trabajaba en real

logic [31:0] counter_reg = 0;

always_ff @(posedge clk_in) begin
    if (reset == 1'b1) begin
        counter_reg <= 'd0;
        clk_out <= 0;
    end else if (counter_reg >= cycles_per_output_pulse - 1) begin
        counter_reg <= 0;
        clk_out <= ~clk_out;
    
    end else begin
        counter_reg <= counter_reg + 1;
    end
end

endmodule



    

