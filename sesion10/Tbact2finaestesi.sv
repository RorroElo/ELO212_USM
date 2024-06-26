`timescale 1ns / 1ps
module test_1();

    // Entradas
    logic clk;
    logic resetN;
    logic Enter,Undo,DisplayFormat;
    logic [15:0] DataIn;

    // Salidas
     logic [6:0] Segments;
     logic [4:0] Flags;
     logic [2:0] Status;
     logic [7:0] Anodes;

    // Instancia del m�dulo
   S8_actividad2 #(.N_DEBOUNCER(1)) dut1 (.*); 

   always #1 clk=~clk;

   initial begin
   resetN=0;
   Undo = 0;
   DisplayFormat = 0;
   clk=1;
   Enter=0;
   DataIn=0;
   #8
   resetN=1;
   DataIn=16'd20;    //insertamos A
   Enter=1;
   #20
   Enter=0;
   #37

   DataIn=16'd22;    //insertamos b
   #27

   Enter=1;
   #27
   Enter=0;
   #35
   DataIn=16'b01;   //insertamos el op code
   #35
   Enter=1;
   #27
   Enter=0;
   #70
   DisplayFormat = 1;



   end
endmodule