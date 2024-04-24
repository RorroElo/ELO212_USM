module mux_4 (
    input logic [3:0] disp1,
    input logic [3:0] disp2,
    input logic [3:0] disp3,
    input logic [3:0] disp4,
    input logic [3:0] disp5,
    input logic [3:0] disp6,
    input logic [3:0] disp7,
    input logic [3:0] disp8,
    input logic [2:0] sel,
    output logic [3:0] out

    );
    always_comb begin
        case(sel)
            3'b000: out = disp1;
            3'b001: out = disp2;
            3'b010: out = disp3;
            3'b011: out = disp4;
            3'b100: out = disp5;
            3'b101: out = disp6;
            3'b110: out = disp7;
            3'b111: out = disp8;
        endcase
     end        
endmodule