module deco_N2 #(parameter N = 3)(
    input logic [N-1:0] A,
    output logic [2**N -1:0]one_hot
);

    always_comb begin
        one_hot = 'b0;
        one_hot[A] = 1;
    end
endmodule