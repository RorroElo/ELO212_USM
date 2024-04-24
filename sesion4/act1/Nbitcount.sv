module counter_Nbits (
    input logic clock, reset,
    output logic [2:0] count
    );
    always_ff @(posedge clock) begin
        if (reset)
            count <= 'b0; 
        else
            count <= count+1;
    end
endmodule