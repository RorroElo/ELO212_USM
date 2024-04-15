`timescale 1ns / 1ps

module tb_top_module;

    // Definici�n de se�ales de entrada
    logic clk, reset, switch_in;

    // Definici�n de se�ales de salida
    logic [3:0] count;
    logic [6:0] BCD7_out;
    logic fib_out;
    logic switch_out;

    // Instancias de los m�dulos bajo test (DUT)
    top_module topmoduleDUT (
        .clk (clk),
        .reset (reset),
        .switch_in (switch_in),
        .count (count),
        .switch_out (switch_out),
        .fib_out (fib_out)
    );

    always #5 clk = ~clk;
    
    initial begin
        clk = 0;
        #4
        switch_in = 1'b1;
        #6
        switch_in = 1'b0;
        #1
        reset = 1;
        #30
        reset = 0;
    end
endmodule