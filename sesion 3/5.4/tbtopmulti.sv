module tb_top_multi();
    logic clk_in, reset, reset2;
    logic [6:0]sevenSeg;
    logic [3:0]salida;

    Top_multi DUT(
        .clk_in(clk_in),
        .reset(reset),
        .reset2(reset2),
        .sevenSeg(sevenSeg),
        .salida(salida)
    );

    always #5 clk_in = ~clk_in;

    initial begin
        clk_in = 0;
        reset = 1;
        reset2 = 1;
        #200
        reset = 0;
        reset2 = 0 
    end
endmodule