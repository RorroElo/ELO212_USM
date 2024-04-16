`timescale 1ns / 1ps
module tbInstanciaNbc();
    logic clk; 
    logic reset;
    logic [3:0] count4;
    logic [4:0] count5;
    logic [7:0] count8;

    instancia_nbc DUT(
        .clk(clk), 
        .reset(reset), 
        .count4(count4),
        .count5(count5),
        .count8(count8)
    );

    always #2 clk = ~clk;

    initial begin
        clk = 0;
        #2
        reset = 1;
        #2
        reset = 0;
        #100
        $finish;
    end
endmodule