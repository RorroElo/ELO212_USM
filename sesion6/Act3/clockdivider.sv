module ClockDivider#(parameter FrequenciaDeseada = 500)
                     (
                      input logic clk_in,
                      input logic reset,
                      output logic clk_out
                     );

    localparam COUNTERMAX = (100_000_000 / FrequenciaDeseada);

    // Define la anchura necesaria para representar COUNTERMAX
    localparam DELAYWIDTH = $clog2(COUNTERMAX);
  
    // Registro para contar el n�mero de ciclos de reloj
    logic [DELAYWIDTH-1:0] countere = 0;

    // Comportamiento del m�dulo
    always_ff @(posedge clk_in) begin
        if (reset == 1'b1) begin
            // Reset s�ncrono, se reinicia el contador y la salida del reloj
            countere <= 0;
            clk_out <= 0;
        end else if (countere == COUNTERMAX - 1) begin
            // Se reinicia el contador y se invierte la salida del reloj
            countere <= 0;
            clk_out <= ~clk_out;
        end else begin
            // Se incrementa el contador y se mantiene la salida del reloj
            countere <= countere + 1;
            clk_out <= clk_out;
        end
    end

endmodule