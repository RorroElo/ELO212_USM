module deco_N2 (
    input logic [2:0] A,
    output logic [7:0]one_hot
);

    always_comb begin
        one_hot = 8'b11111111;
        one_hot[A] = 0;
    end
endmodule