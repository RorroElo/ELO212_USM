`timescale 10ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.04.2024 15:34:49
// Design Name: 
// Module Name: Clock_divider
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


module Clock_divider
#(parameter COUNTER_MAX = 4)
( input logic clk_in,
  input logic reset,
  output logic clk_out
  
  );
  
  localparam DELAY_WIDTH = $clog2(COUNTER_MAX);
  logic [DELAY_WIDTH-1:0] counter = 'd0;
  
always_ff @(posedge clk_in) begin
    if (reset == 1'b1) begin
        counter <= 'd0;
        clk_out <= 0;
    end else if (counter == COUNTER_MAX-1) begin
        counter <= 'd0;
        clk_out <= ~clk_out;
    end else begin
        counter <= counter + 'd1;
        clk_out <= clk_out;
    end
    end
endmodule
