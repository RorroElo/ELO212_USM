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
        .ToDisplay(ToDisplay,)
        .Flags(Flags),
        .Status(Status)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        #5
        reset = 1;
        Enter = 0;
        #5
        reset = 0;
        DataIn = 16'h3F;
        Enter = 1;
        #5 Enter = 0;
        #5
        DataIn = 16'h12;
        Enter = 1;
        #5 Enter = 0;
        DataIn = b'00;
        Enter = 1;
        #5 Enter = 0;
        #40
        Enter = 1;
        #5 Enter = 0;
        DataIn = 16'h2A;
        Enter = 1;
        #5 Enter = 0;
        #5
        DataIn = 16'h7B;
        Enter = 1;
        #5 Enter = 0;
        DataIn = b'00;
        Enter = 1;
        #5 Enter = 0;
        #40        
        $finish;
    end
endmodule