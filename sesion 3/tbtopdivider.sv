module tb_clkdivider2();
    logic clk_in;
    logic reset;
    logic clk_out50;
    logic clk_out30;
    logic clk_out10;
    logic clk_out1;
    
    top_divider2 top_divider2DUT( 
    .clk_in(clk_in), 
    .reset(reset),
    .clk_out50(clk_out50),
    .clk_out30(clk_out30),
    .clk_out10(clk_out10),
    .clk_out1(clk_out1)
    );

  
    always #5 clk_in = ~clk_in;

    initial begin
        clk_in = 0;
        reset=0;
        #10
        reset = 1;
        #10
        reset=0;
     end 
endmodule