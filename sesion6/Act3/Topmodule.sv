module alufpgafin(
    input logic CLK100MHZ, BTNC,
    input logic [15:0] SW,
    output logic [4:0] LED,
    output logic CG, CF, CE, CD, CC, CB, CA,
    output logic [7:0] AN
);

    logic [6:0]A;
    logic [6:0]B;
    logic [1:0]op_code;
    logic [4:0]Flags;
    logic [6:0]Result;
    logic [6:0]Seg;
    
    assign LED = Flags;
    assign CA= Seg[6];
    assign CB= Seg[5];
    assign CC= Seg[4];
    assign CD= Seg[3];
    assign CE= Seg[2];
    assign CF= Seg[1];
    assign CG= Seg[0];
    
    assign A[0] = SW[9];
    assign A[1] = SW[10];
    assign A[2] = SW[11];
    assign A[3] = SW[12];
    assign A[4] = SW[13];
    assign A[5] = SW[14];
    assign A[6] = SW[15];
    
    assign B[0] = SW[2];
    assign B[1] = SW[3];
    assign B[2] = SW[4];
    assign B[3] = SW[5];
    assign B[4] = SW[6];
    assign B[5] = SW[7];
    assign B[6] = SW[8];
    
    assign op_code[0] = SW[0];
    assign op_code[1] = SW[1];
    
    logic clk_500hz;
    ClockDivider ClkFrec500 (
        .clk_in (CLK100MHZ),
        .reset (BTNC),
        .clk_out (clk_500hz)
    );

    logic [1:0]iteraciones;
    contador2bits twobitcount(
        .clk (clk_500hz), 
        .reset (BTNC),
        .count (iteraciones)
    );

    logic Anod;
    deco asignAnod(
        .sel (iteraciones),
        .Anod (AN)    
    );

    S4_actividad3 ALUX(
        .A (A),
        .B (B),
        .OpCode (op_code),  
        .Result (Result),
        .Flags (Flags)
    ); 

    logic [3:0]Result1 = Result[3:0];
    logic [2:0]Result2 = Result[6:4];

    logic [3:0]selectordelmux;
    Multiplex_temp Iteralo(
        .cifra1 (Result1), 
        .cifra2 (Result2), 
        .sel (iteraciones), 
        .out_data (selectordelmux) 
    );

    SevenSeg SevensegFinal(
        .BCD_in (selectordelmux),
        .sevenSeg (Seg)
    );
endmodule