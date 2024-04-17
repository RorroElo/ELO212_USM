module tbdeco();
    logic A;
    logic [3:0] one_hot;

    deco_N2 DUT(
        .A(A),
        .B(B),
        .one_hot(one_hot)
    );
    initial begin
 
    end
endmodule