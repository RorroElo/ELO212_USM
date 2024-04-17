module tbdeco();
    logic [1:0] A;
    logic [3:0] one_hot;

    deco_N2 DUT(
        .A(A),
        .one_hot(one_hot)
    );
    initial begin
        A = 2'd0;
        #2
        A = 2'd1;
        #2
        A = 2'd2;
        #2
        A = 2'd3;
    end
endmodule