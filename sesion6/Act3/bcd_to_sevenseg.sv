module SevenSeg(
input logic [3:0] BCD_in,
    output logic [6:0] sevenSeg
);

always_comb begin
    // Asignar la configuraci�n del display de siete segmentos seg�n el valor del BCD
    case (BCD_in)
        4'd0 : sevenSeg = ~7'b1111110; // 0
        4'd1 : sevenSeg = ~7'b0110000; // 1   1001111
        4'd2 : sevenSeg = ~7'b1101101; // 2   0010010
        4'd3 : sevenSeg = ~7'b1111001; // 3
        4'd4 : sevenSeg = ~7'b0110011; // 4
        4'd5 : sevenSeg = ~7'b1011011; // 5 // 0100100
        4'd6 : sevenSeg = ~7'b1011111; // 6    0100000
        4'd7 : sevenSeg = ~7'b1110000; // 7
        4'd8 : sevenSeg = ~7'b1111111; // 8
        4'd9 : sevenSeg = ~7'b1111011; // 9
        4'd10 : sevenSeg = ~7'b1110111; // A /0001000
        4'd11 : sevenSeg = ~7'b0011111; // B
        4'd12 : sevenSeg = ~7'b1001110; // C
        4'd13 : sevenSeg = ~7'b0111101; // D
        4'd14 : sevenSeg = ~7'b1001111; // E
        4'd15 : sevenSeg = ~7'b1000111; // F
        default: sevenSeg = ~7'b0000000; // Apagar todos los segmentos si no hay coincidencia
    endcase
end

endmodule