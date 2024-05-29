module tb_asincronico();
    logic A, B, clk, reset;
    logic C;

    asincronico DUT(
        .clk(clk),
        .reset(reset),
        .A(A),
        .B(B),
        .C(C)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;
        A = 1;
        B = 0;
        #22
        reset = 0;
    end
endmodule 
