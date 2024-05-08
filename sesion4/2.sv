module contadorNbits #(parameter N = 32)(
    input logic clock, reset, enable, dec, load,
    input logic [N-1:0]load_ref_value,
    output logic threshold,
    output logic [N-1:0] counterN
);
    
   always_comb begin
        if (counterN > load_ref_value) begin
            threshold = 1; // Si el contador es mayor que el valor de referencia, el umbral es alto
        end
        else begin
            threshold = 0; // De lo contrario, el umbral es bajo
        end
    end
    
    always_ff @(posedge clock) begin
        if (reset) begin
            counterN <= 'b0;
        end
        else begin
            if (enable) begin
                if(load)begin
                    counterN <= load_ref_value;
                end
                else begin
                    counterN <= counterN;
                end
            end
            else begin
                if (dec) begin
                    counterN <= counterN-1;
                end
                else begin
                    counterN <= counterN+1;
                end
            
            end
        end
    end
endmodule