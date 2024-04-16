module instancia_nbc(
    input logic clk, reset,
    output logic [3:0] count4,
    output logic [4:0] count5,
    output logic [7:0] count8    
    );

    counter_Nbits #(.N(4)) inst4(
        .clk(clk), 
        .reset(reset), 
        .count(count4)
    );

    counter_Nbits #(.N(5)) inst5(
        .clk(clk), 
        .reset(reset), 
        .count(count5)
    );

    counter_Nbits #(.N(8)) inst8(
        .clk(clk), 
        .reset(reset), 
        .count(count8)
    );
endmodule