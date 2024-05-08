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
    parameter  clk_in_f = 100000000,
    parameter  clk_out_f = 50000000
)
(
    input logic clk_in,
    input logic resetf,
    output logic clk_out
);

localparam DELAY_WIDTH = $clog2(cycles_per_output_pulse);

localparam  cycles_per_output_pulse = clk_in_f / (clk_out_f * 2); //Aca pusimos 2.0 ya que sino, no trabajaba en real

logic [DELAY_WIDTH - 1:0] counter_reg = 'd0;

always_ff @(posedge clk_in) begin
    if (resetf == 1'b1) begin
        counter_reg <= 'd0;
        clk_out <= 0;
    end else if (counter_reg == cycles_per_output_pulse - 1) begin
        counter_reg <= 'd0;
        clk_out <= ~clk_out;
    
    end else begin
        counter_reg <= counter_reg + 'd1;
        clk_out <= clk_out;
    end
end

endmodule



    

