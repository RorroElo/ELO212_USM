module Multiplex_temp(
    input logic [3:0] cifra1, 
    input logic [3:0] cifra2, 
    input logic [1:0] sel, 
    output logic [3:0] out_data 
);

always_comb begin
    case(sel)
        2'b00: out_data = cifra1; 
        2'b01: out_data = cifra2;
        default: out_data = 'd0;
    endcase
end
endmodule
