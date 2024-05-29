module test_counter();
    logic clk, reset;
    logic [3:0] count;

    counter_4bit DUT(
        .clk (clk),
        .reset (reset),
        .count (count)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;
        #10
        reset = 0;
    end
endmodule 