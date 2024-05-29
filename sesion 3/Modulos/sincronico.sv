module sincronico (
    input logic clk, reset, A, B,
    output logic C
);
    
    always_ff @( posedge clk ) begin
        if (reset) 
            C = 0; 
        else
            C = A + B;
    end

endmodule