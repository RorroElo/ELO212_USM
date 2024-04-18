
module tbclkdiv();
    logic clk_in;
    logic reset;
    logic clk_out;

    Clock_Dividercf DUT(
        .clk_in(clk_in),
        .reset(reset),
        .clk_out(clk_out)
    );
    
    always #5 clk_in = ~clk_in;

    initial begin
        clk_in = 0;
        reset = 0;
        #5
        reset = 1;
        #5
        reset = 0;
        
    end
endmodule
