module tbact1();
    logic [31:0] HEX_in;
    logic reset; 
    logic clock;
    logic [6:0] segments;
    logic [7:0] anodes;

    S4_actividad1 act1DUT(
        .HEX_in(HEX_in),
        .reset(reset),
        .clock(clock),
        .segments(segments),
        .anodes(anodes)
    );

    always #5 clock = ~clock;

    initial begin
        clock = 0;
        reset = 1;
        HEX_in = 32'd123456;
        #12
        reset = 0;
        #200
        $finish
    end
endmodule