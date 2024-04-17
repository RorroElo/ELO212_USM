module tb_a_sincronico();
    logic A, B, clk, reset;
    logic C;

    sincronico DUT (
        .clk(clk),
        .reset(reset),
        .A(A),
        .B(B),
        .C(C)
    );

    always #5 clk = ~clk

    initial begin
        clk = 0;
        #10
        reset = 0;
        #10
        reset = 1;
    end
endmodule 
