module deco (
    input logic [1:0] sel,
    output logic [7:0] Anod
);
    always_comb begin

        case (sel)
            3'd0: Anod = 8'b11111110;
            3'd1: Anod = 8'b11111101;
            default: Anod = 8'b11111111;
        endcase
    end
endmodule
            
