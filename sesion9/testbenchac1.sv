`timescale 1ns / 1ps
module tbact1();
    logic clk; 
    logic reset;
    logic Enter;
    logic [15:0] DataIn;
    logic [15:0] ToDisplay;
    logic [4:0] Flags;
    logic [2:0] Status;

    S9_actividad1 DUT(
        .clk(clk), 
        .reset(reset),
        .Enter(Enter), 
        .DataIn(DataIn),
        .ToDisplay(ToDisplay),
        .Flags(Flags),
        .Status(Status)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;
        Enter = 0;
        #25
        reset = 0;
        DataIn = 16'b1111111111111111;
        Enter = 1;
        #25 
        Enter = 0;
        #25
        DataIn = 16'b1111111111111110;
        Enter = 1;
        #25 
        Enter = 0;
        DataIn = 2'b01;
        Enter = 1;
        #25 
        Enter = 0;
        #60
        $finish;
    end
endmodule