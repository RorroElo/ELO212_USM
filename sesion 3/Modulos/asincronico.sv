module asincronico (
    input logic clk, reset, A, B,
    output logic C
);
    
    always_ff @( posedge clk or negedge reset ) begin
        if (~ reset)
            C = 0 ;
        else
            C = A + B;
    end

endmodule