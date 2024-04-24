module DivNtoHexaDigits #(parameter N = 32)(
    input logic [N-1:0] HEXA_in,
    output logic [3:0] digit [0:((N/4)-1)]
);

    // Dividir el número de 32 bits en dígitos individuales
    always_comb begin
        for (int i = 0; i < (N/4); i++) begin
            digit[i] = HEXA_in[4*i +: 4];
        end
    end

endmodule