`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.06.2024 12:10:59
// Design Name: 
// Module Name: double_dabble
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


module unsigned_to_bcd_2
(
	input  logic 		clk, 	 // Reloj
				reset,   // Reset
	input  logic 		trigger, // Inicio de conversi�n
	input  logic [15:0] 	in,      // N�mero binario de entrada
	output logic  		idle,    // Si vale 0, indica una conversi�n en proceso
	output logic [15:0] 	bcd 	 // Resultado de la conversi�n
);

	/*
	 * Por "buenas pr�cticas" parametrizamos las constantes num�ricas de los estados
	 * del m�dulo y evitamos trabajar con n�meros "m�gicos" en el resto del c�digo.
	 *
	 * https://en.wikipedia.org/wiki/Magic_number_(programming)
	 * http://stackoverflow.com/questions/47882/what-is-a-magic-number-and-why-is-it-bad
	 */
	 
	 
	localparam COUNTER_MAX = 16;
	
	(* fsm_encoding = "one_hot" *) enum logic [2:0] {S_IDLE, S_SHIFT, S_ADD3} state, state_next;

	logic [15:0] shift, shift_next;
	logic [15:0] bcd_next;
	logic [5:0] counter, counter_next; /* Contador 6 bit para las iteraciones */

	always_comb begin
		/*
		 * Por defecto, los estados futuros mantienen el estado actual. Esto nos
		 * ayuda a no tener que ir definiendo cada uno de los valores de las se�ales
		 * en cada estado posible.
		 */
		
		{state_next, shift_next, bcd_next, counter_next} = {state, shift, bcd, counter};
		idle = 1'b0; /* LOW para todos los estados excepto S_IDLE */

		case (state)
		S_IDLE: begin
			counter_next = 'd1;
			shift_next = 'd0;
			idle = 1'b1;

			if (trigger) begin
				state_next = S_SHIFT;
			end
		end
		S_ADD3: begin
			/*
			 * Sumamos 3 a cada columna de 4 bits si el valor de esta es
			 * mayor o igual a 5
			 */

			if (shift[15:12] >= 5)
				shift_next[15:12] = shift[15:12] + 4'd3;

			if (shift[11:8] >= 5)
				shift_next[11:8] = shift[11:8] + 4'd3;

			if (shift[7:4] >= 5)
				shift_next[7:4] = shift[7:4] + 4'd3;

			if (shift[3:0] >= 5)
				shift_next[3:0] = shift[3:0] + 4'd3;

			state_next = S_SHIFT;
		end
		S_SHIFT: begin
			/* Desplazamos un bit de la entrada en el registro shift */
			shift_next = {shift[30:0], in[COUNTER_MAX - counter_next]};

			/*
			 * Si el contador actual alcanza la cuenta m�xima, actualizamos la salida y
			 * terminamos el proceso.
			 */
			if (counter == COUNTER_MAX) begin
				bcd_next = shift_next;
				state_next = S_IDLE;
			end else
				state_next = S_ADD3;

			/* Incrementamos el contador (siguiente) en una unidad */
			counter_next = counter + 'd1;
		end
		default: begin
			state_next = S_IDLE;
		end
		endcase
	end

	always @(posedge clk) begin
		if(reset) begin
			{shift, bcd, counter} <= 'd0;
			state <= S_IDLE;
		end
		else
			{state, shift, bcd, counter} <= {state_next, shift_next, bcd_next, counter_next};
	end

endmodule
