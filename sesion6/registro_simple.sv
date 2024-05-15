module registro_simple(
    input logic clk, reset, D, load,
    output logic Q_fin
);

logic Q;

always_ff (@posedge clk) begin
    if(reset)
        Q_fin <= 0;
    else
        Q_fin <= Q;
end


always_comb begin
    if(load)
        D = Q;
    else
        Q_fin = Q;
end

endmodule

