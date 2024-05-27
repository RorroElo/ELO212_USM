module contador2bits(
    input logic clk, reset,
    output logic [1:0] count
);

    always_ff @(posedge clk) begin
        if (reset)
            count <= 'b0;
        else
            count <= count + 1;
    end
endmodule