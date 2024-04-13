
module tb_sevenseg();
    logic [3:0] BCD_in;
    logic [6:0] sevenSeg;

    BCD_to_sevenSeg DUT(
        .BCD_in (BCD_in),
        .sevenSeg (sevenSeg)
        );
    initial begin
        BCD_in = 4'd0;
        #4
        BCD_in = 4'd1;
        #4
        BCD_in = 4'd2;
        #4
        BCD_in = 4'd3;
        #4
        BCD_in = 4'd4;
        #4
        BCD_in = 4'd5;
        #4
        BCD_in = 4'd6;
        #4
        BCD_in = 4'd7;
        #4
        BCD_in = 4'd8;
        #4
        BCD_in = 4'd9;
        #4
        BCD_in = 4'd10;
        #4  
        BCD_in = 4'd14;
    end
endmodule



