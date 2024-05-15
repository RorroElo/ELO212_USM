module BCD_to_sevenSeg (
    input logic clk, reset,
    input logic [3:0] BCD_in,
    output logic [15:0] sevenSeg,
    output  logic [7:0] anodes
);
 logic [1:0] count;
 logic [3:0] romper7seg;
    always_comb begin
        case(BCD_in)
            4'd0:   sevenSeg = 7'b0000001;
            4'd1:   sevenSeg = 7'b1001111;
            4'd2:   sevenSeg = 7'b0010010;
            4'd3:   sevenSeg = 7'b0000110;
            4'd4:   sevenSeg = 7'b1001100;
            4'd5:   sevenSeg = 7'b0100100;
            4'd6:   sevenSeg = 7'b0100000;
            4'd7:   sevenSeg = 7'b0001111;
            4'd8:   sevenSeg = 7'b0000000;
            4'd9:   sevenSeg = 7'b0000100;
            4'd10:   sevenSeg = 7'b0001000;
            4'd11:   sevenSeg = 7'b1100000;
            4'd12:   sevenSeg = 7'b0110001;
            4'd13:   sevenSeg = 7'b1000010;
            4'd14:   sevenSeg = 7'b0110000;
            4'd15:   sevenSeg = 7'b0111000;
            default: sevenSeg= 7'b1111111;
        endcase
    end
    always_ff @(posedge clk) begin
        if(reset)
            count <=0;
        else
            count<= count+1;
     end
     
     always_comb begin
        case(count)
            2'd0: begin anodes = 8'b11111110; romper7seg=sevenSeg [3:0]; end
            2'd1: begin anodes = 8'b11111101; romper7seg=sevenSeg [7:4]; end
            2'd2: begin anodes = 8'b11111011; romper7seg=sevenSeg [11:8];end
            2'd3: begin anodes = 8'b11110111; romper7seg=sevenSeg [15:12];end
        endcase
     end
                
endmodule