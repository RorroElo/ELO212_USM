`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.05.2024 23:33:58
// Design Name: 
// Module Name: contadorn
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module S4_actividad2 #(parameter N = 4)(
    input  logic            clock, reset,
    input  logic            dec, enable, load,
    input  logic [N-1:0]    load_ref_value,
    output logic [N-1:0]    counterN,
    output logic            threshold
    );
    always_comb begin
        if (counterN > load_ref_value) begin
            threshold = 1; // Si el contador es mayor que el valor de referencia, el umbral es alto
        end
        else begin
            threshold = 0; // De lo contrario, el umbral es bajo
        end
    end
    
    // Proceso sincronizado al flanco de subida del reloj
    always_ff @(posedge clock) begin
        if (reset) begin
            counterN <= {N{1'b0}}; // Si la se al de reset es alta, se reinicia el contador a cero
        end
        else begin
            if(enable) begin

                 if (dec) begin
                    counterN <= counterN - 1; // Si la se al de habilitaci n es alta y la de decremento tambi n, se decrementa el contador
                 end
                 else begin
                    counterN <= counterN + 1; // Si la se al de habilitaci n es alta y la de decremento es baja, se incrementa el contador
                 end
                
                 
            end
            else begin 
                if (load) begin
                    counterN <= load_ref_value; // Si la se al de carga es alta, se carga el valor de referencia en el contador
                end
            end    
            
        end
    end
endmodule
