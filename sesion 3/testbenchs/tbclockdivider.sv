module tb_counter(

    );
    logic clk_in;
    logic reset;
    logic clk_out;

    clock_freq_def DUT(
        .clk_in(clk_in),
        .reset(reset),
        .clk_out(clk_out)
        
        
    );   
    always #5 clk_in = ~clk_in;

    initial begin
        clk_in = 0;
        reset=0;
        #10
        reset = 1;
        #10
        reset=0;
    end 
    
   
    
        
endmodule
