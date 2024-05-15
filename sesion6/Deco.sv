module SelectorAnodo(
    input logic [1:0]selector,
    output logic [7:0]one_hot
);

    always_comb begin
        case(selector)
            2'b11: one_hot = 8'b11110111;
            2'b10: one_hot = 8'b11111011;
            2'b01: one_hot = 8'b11111101;
            2'b00: one_hot = 8'b11111110;
        endcase
    end
endmodule