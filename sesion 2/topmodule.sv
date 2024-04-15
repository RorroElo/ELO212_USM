module top_module(
    input logic clk, reset,
    input logic switch_in,
    output logic [6:0] switch_out,
    output logic [3:0] count,
    output logic [6:0] BCD7_out,
    output logic fib_out
);

    counter_4bit counter_inst (
        .clk(clk),
        .reset(reset),
        .count(count)
    );

    BCD_to_sevenSeg sevenseg_inst (
        .BCD_in(count), // Conecta la salida de counter_4bit a BCD_to_sevenSeg
        .sevenSeg(BCD7_out)
    );

    fib_rec fib_inst (
        .BCD_in(count), // Conecta la salida de counter_4bit a fib_rec
        .fib(fib_out)
    );

    switch switch_inst(
        .switch_in(switch_in),
        .switch_out(switch_out)  
    );

endmodule

