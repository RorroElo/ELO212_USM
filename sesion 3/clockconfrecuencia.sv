module Clock_Dividercf #(parameter frec_out = 30, parameter frec_in = 100_000_000 )( 
    input logic clk_in,
    input logic reset,
    output logic clk_out
    );
  
    localparam COUNTER_MAX = (((frec_in)/(frec_out) )*(1000000000));
    localparam DELAY_WIDTH = $clog2(COUNTER_MAX);
    logic [DELAY_WIDTH-1:0] counter = 'd0;
  
always_ff @(posedge clk_in) begin
    if (reset == 1'b1) begin
        counter <= 'd0;
        clk_out <= 0;
    end 
    else if (counter == COUNTER_MAX-1) begin
        counter <= 'd0;
        clk_out <= ~clk_out;
    end 
    else begin
        counter <= counter + 'd1;
        clk_out <= clk_out;
    end
   end
endmodule
