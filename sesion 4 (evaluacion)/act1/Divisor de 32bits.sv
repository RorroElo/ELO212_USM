module Div32toHexaDigits(
    input logic [31:0] HEXA_in,
    output logic [3:0] digit [0:7]
);

    // Dividir el número de 32 bits en dígitos individuales
    always_comb begin
        for (int i = 0; i < 8; i++) begin
            digit[i] = HEXA_in[4*i +: 4];
        end
    end

endmodule