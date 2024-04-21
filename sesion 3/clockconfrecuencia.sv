module Clock_Dividercf #(parameter frec_out = 30, parameter frec_in = 100000000 )( 
    input logic clk_in,
    input logic reset,
    output logic clk_out
    );
    
    localparam DELAY_WIDTH = $clog2((frec_in)/(2*(frec_out)));
    logic [DELAY_WIDTH-1:0] counter = 'd0;
  
always_ff @(posedge clk_in) begin
    if (reset == 1'b1) begin
        counter <= 'd0;
        clk_out <= 0;
    end 
    else if (counter == integer((frec_in)/(2*(frec_out)))-1) begin
        counter <= 'd0;
        clk_out <= ~clk_out;
    end 
    else begin
        counter <= counter + 'd1;
        clk_out <= clk_out;
    end
   end
endmodule
/*hacer un modulo que haga la division y otro mas que llame ambos, el de la division y el divisor*/