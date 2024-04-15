module switch (
    input logic switch_in,
    output logic [6:0] switch_out
);

 always_comb begin
        if(switch_in)
            switch_out = 7'b0000000;
        else
            switch_out = 7'b1111111;
    end
endmodule
