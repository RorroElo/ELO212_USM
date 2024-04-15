module switch (
    input logic switch_in,
    output logic switch_out
);

 always_comb begin
        if(switch_in)
            switch_out = 1'b0;
        else
            switch_out = 1'b1;
    end
endmodule
