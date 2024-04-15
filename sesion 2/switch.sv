module switch (
    input logic switch_in,
    input logic clk,
    output logic [6:0] switch_out
);

 always_ff @(posedge clk) begin
        if(switch_in)
            switch_out <= 7'b0000000;
        else
            switch_out <= 7'b1111110;
    end
endmodule
