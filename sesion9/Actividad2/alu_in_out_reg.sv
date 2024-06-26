`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.06.2024 11:59:11
// Design Name: 
// Module Name: alu_in_out_reg
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


module alu_in_out_reg #(parameter N = 16)(
    input logic [N-1 : 0] data_in,
    input logic load_A, load_B, load_Op, clk, reset, updateRes,
    output logic [N-1 : 0] Result,
    output logic [4:0] Flags
    );
    logic [1:0] V_op;
    logic [N-1 : 0] V_a, V_b;
    logic [1:0] data_in_op;
    logic [N-1:0] Result_alu;
    logic [4:0] Flags_alu;
    assign  data_in_op = data_in[1:0];
    
    //instanciamos los registros de load_a, load_b y load_Op
    
    registro_param #(.N(N)) registro_a (.clk(clk), .reset(reset) , .load(load_A), .D(data_in),.Q(V_a));
    
    registro_param #(.N(N)) registro_b (.clk(clk), .reset(reset) , .load(load_B), .D(data_in),.Q(V_b));
    
    registro_param #(.N(2)) registro_op (.clk(clk), .reset(reset) , .load(load_Op), .D(data_in_op),.Q(V_op));
    
    // se conecta a la ALU
    S4_actividad3 #(.M(N)) alu (.A(V_a), .B(V_b), .OpCode(V_op), .Result(Result_alu), .Flags(Flags_alu));
    
   // registramos las salidas
    registro_param #(.N(N)) result_alu (.clk(clk), .reset(reset), .load(updateRes), .D(Result_alu),.Q(Result)); //cambiar seven_seg_imput por la entrada del modulo de seven seg
   
    registro_param #(.N(5)) result_flags (.clk(clk), .reset(reset), .load(updateRes), .D(Flags_alu),.Q(Flags));

    

    
endmodule


