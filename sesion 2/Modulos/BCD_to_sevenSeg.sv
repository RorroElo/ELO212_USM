module BCD_to_sevenSeg (
    input logic [3:0] BCD_in,
    output logic [6:0] sevenSeg
);
    always_comb begin
        case(BCD_in)
            4'd0:   sevenSeg = 7'b1111110;
            4'd1:   sevenSeg = 7'b1110000;
            4'd2:   sevenSeg = 7'b0010010;
            4'd3:   sevenSeg = 7'b0000110;
            4'd4:   sevenSeg = 7'b1001100;
            4'd5:   sevenSeg = 7'b0100100;
            4'd6:   sevenSeg = 7'b0100000;
            4'd7:   sevenSeg = 7'b0001111;
            4'd8:   sevenSeg = 7'b0000000;
            4'd9:   sevenSeg = 7'b0000100;
            default: sevenSeg= 7'b1111111;
        endcase
    end
endmodule