`timescale 1ns / 1ps
module tb_unsigned_to_bcd();
	logic 		clk;
	logic	reset;   
	logic 		trigger;
	logic [31:0] 	in;      
	logic idle;    
	logic [31:0] 	bcd;

unsigned_to_bcd u32_to_bcd_inst(
		.clk(clk),
		.reset(reset),
		.trigger(trigger),
		.in(in),
		.idle(idle),
		.bcd(bcd)
	);

always #1 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;
        trigger = 0;
        in = 32'b0000_0000_0000_0000_0000_0000_0010_1010;
        #14
        reset = 0;
        trigger = 1;
        #200
        in = 32'b1000_0000_0000_0000_0000_0000_1110_1011;
        #200
        $finish;
    end
endmodule
