module counter_4bit(
    input logic clk, reset,
    output logic [3:0] count
);

    always_ff @(posedge clk) begin
        if (reset)
            count <= 4'b0;
        else
            count <= count + 1;
    end
endmodule