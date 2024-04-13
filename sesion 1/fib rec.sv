module fib_rec (
    input logic [3:0] BCD_in,
    output logic fib
);

always_comb begin
    if( BCD_in==4'd0 || BCD_in==4'd1 || BCD_in==4'd2 || BCD_in==4'd4 ||
    BCD_in==4'd5 || BCD_in==4'd8 || BCD_in==4'd9 || BCD_in==4'd10)
        fib = 1;
    else
        fib = 0;
 end
endmodule