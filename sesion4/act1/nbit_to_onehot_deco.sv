module deco_N2 (
    input logic [2:0] A,
    output logic [7:0]one_hot
);

    always_comb begin
        one_hot = 'b0;
        one_hot[A] = 1;
    end
endmodule