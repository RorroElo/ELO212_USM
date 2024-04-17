module tb_sincronico();
    logic A, B, clk, reset;
    logic C;

    sincronico DUT(
        .clk(clk),
        .reset(reset),
        .A(A),
        .B(B),
        .C(C)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 10;
        A = 1;
        B = 0;
        #8
        reset = 1;
        #12
        reset = 0;
    end
endmodule 